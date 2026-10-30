#requires -Version 5.1
<#
Rebuilds only the verified 2/3-commit histories of two historical labs.
Requires Git and an authenticated GitHub CLI on the operator's computer.
No old service data is downloaded or decrypted. Commit messages and author/
committer metadata are retained; unsafe trees are replaced with sanitized trees.
Old commit hashes/signatures cannot be retained after a history rewrite.
#>
[CmdletBinding()]
param([switch]$VerifyOnly)

$ErrorActionPreference = 'Stop'
foreach ($tool in @('git', 'gh')) {
    if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) {
        throw "Required command is missing: $tool"
    }
}
& gh auth status --hostname github.com
if ($LASTEXITCODE -ne 0) { throw 'Authenticate GitHub CLI before running this script.' }
& gh auth setup-git --hostname github.com
if ($LASTEXITCODE -ne 0) { throw 'Cannot configure Git to use GitHub CLI authentication.' }

$workspace = Join-Path ([IO.Path]::GetTempPath()) ('pandaenv-clean-history-' + [guid]::NewGuid().ToString('N'))
[IO.Directory]::CreateDirectory($workspace) | Out-Null
$utf8 = New-Object Text.UTF8Encoding($false)

function Invoke-GitHubJson {
    param([string]$Endpoint, [string]$Method = 'GET', [object]$Body = $null)
    $payloadFile = Join-Path $workspace ([guid]::NewGuid().ToString('N') + '.json')
    try {
        if ($null -eq $Body) {
            $response = & gh api $Endpoint --method $Method
        } else {
            [IO.File]::WriteAllText($payloadFile, ($Body | ConvertTo-Json -Depth 30), $utf8)
            $response = & gh api $Endpoint --method $Method --input $payloadFile
        }
        if ($LASTEXITCODE -ne 0) { throw "GitHub request failed: $Method $Endpoint" }
        return (($response -join "`n") | ConvertFrom-Json)
    } finally {
        if (Test-Path -LiteralPath $payloadFile) { Remove-Item -LiteralPath $payloadFile -Force }
    }
}

$commonTree = '3e341deb1202a4909755a6baecec5aee4d8cc4d2'
$awsTree = 'c3d3861ded794cfa7ad9704b9892f4188e3391bf'
$plans = @(
    @{
        Repo = 'JeanneBM/jb_pandaenv'
        ExpectedHead = '423791e5fe9b8ae3ec3029bec06b4b1b811692cf'
        ExpectedTree = $commonTree
        Commits = @(
            @{ Old = '3ea447cf8c6142c6e7390c6696a2b84aa2551b69'; Tree = $commonTree },
            @{ Old = '423791e5fe9b8ae3ec3029bec06b4b1b811692cf'; Tree = $commonTree }
        )
    },
    @{
        Repo = 'JeanneBM/jb_pandaenvAWS'
        ExpectedHead = 'dcc7b57204d147b9ab8603c049e65e37d5cf9a6e'
        ExpectedTree = $awsTree
        Commits = @(
            @{ Old = '3ea447cf8c6142c6e7390c6696a2b84aa2551b69'; Tree = $commonTree },
            @{ Old = '6c942b17e876714513b66bbda430cd69693e0ce8'; Tree = $awsTree },
            @{ Old = 'dcc7b57204d147b9ab8603c049e65e37d5cf9a6e'; Tree = $awsTree }
        )
    }
)
$allowedFiles = @(
    '.env.example', '.gitignore', 'README.md', 'agent.jar',
    'compose/docker-compose.yml', 'dockerfiles/slave/Dockerfile',
    'dockerfiles/slave/agent.jar', 'start.sh'
)

try {
    # Preflight BOTH repositories before publishing any replacement history.
    foreach ($plan in $plans) {
        $repo = $plan.Repo
        $branches = @(Invoke-GitHubJson "repos/$repo/branches?per_page=100")
        $tags = @(Invoke-GitHubJson "repos/$repo/git/matching-refs/tags")
        if ($branches.Count -ne 1 -or $branches[0].name -ne 'final' -or $tags.Count -ne 0) {
            throw "Unexpected refs in $repo. Stop and review; no refs have been removed."
        }
        if ($branches[0].commit.sha -ne $plan.ExpectedHead) {
            throw "The final branch changed in $repo. Stop; request a refreshed cleanup plan."
        }
        $head = Invoke-GitHubJson "repos/$repo/git/commits/$($plan.ExpectedHead)"
        if ($head.tree.sha -ne $plan.ExpectedTree) { throw "Unexpected current tree in $repo." }

        foreach ($treeSha in (@($commonTree, $plan.ExpectedTree) | Select-Object -Unique)) {
            $tree = Invoke-GitHubJson "repos/$repo/git/trees/$($treeSha)?recursive=1"
            if ($tree.truncated) { throw "Truncated tree in $repo." }
            foreach ($entry in $tree.tree) {
                if ($entry.type -eq 'blob' -and $entry.path -notin $allowedFiles) {
                    throw "Unexpected file in approved tree: $repo/$($entry.path)"
                }
            }
        }
        $previousOld = $null
        foreach ($item in $plan.Commits) {
            $original = Invoke-GitHubJson "repos/$repo/git/commits/$($item.Old)"
            $parents = @($original.parents)
            if ($null -eq $previousOld) {
                if ($parents.Count -ne 0) { throw "Expected a root commit in $repo." }
            } elseif ($parents.Count -ne 1 -or $parents[0].sha -ne $previousOld) {
                throw "Unexpected parent graph in $repo."
            }
            $item.Original = $original
            $previousOld = $item.Old
        }
        Write-Host "Preflight OK: $repo (only final, no tags, approved sanitized snapshots)"
    }

    if ($VerifyOnly) {
        Write-Host 'Verification only: no commits or branch updates were made.'
        return
    }

    # Create candidate commits before moving either branch.
    foreach ($plan in $plans) {
        $parent = $null
        $mapping = @()
        foreach ($item in $plan.Commits) {
            $original = $item.Original
            $newParents = @()
            if ($null -ne $parent) { $newParents = @($parent) }
            $body = @{
                message = $original.message
                tree = $item.Tree
                parents = $newParents
                author = @{
                    name = $original.author.name
                    email = $original.author.email
                    date = $original.author.date
                }
                committer = @{
                    name = $original.committer.name
                    email = $original.committer.email
                    date = $original.committer.date
                }
            }
            $created = Invoke-GitHubJson "repos/$($plan.Repo)/git/commits" 'POST' $body
            if (-not $created.sha) { throw 'GitHub did not return a new commit SHA.' }
            $parent = $created.sha
            $mapping += @{ old = $item.Old; new = $parent; tree = $item.Tree }
        }
        $plan.NewHead = $parent
        $plan.Mapping = $mapping

        # Fetch ONLY the NEW sanitized graph, never the old service snapshots.
        $barePath = Join-Path $workspace ($plan.Repo.Split('/')[1] + '.git')
        & git init --bare $barePath
        if ($LASTEXITCODE -ne 0) { throw 'Cannot create temporary bare repository.' }
        & git -C $barePath remote add origin "https://github.com/$($plan.Repo).git"
        if ($LASTEXITCODE -ne 0) { throw 'Cannot configure temporary origin.' }
        & git -C $barePath fetch --no-tags origin $plan.NewHead
        if ($LASTEXITCODE -ne 0) { throw 'Cannot fetch the new sanitized history.' }
        $allPaths = & git -C $barePath log --all --pretty=format: --name-only $plan.NewHead
        if ($LASTEXITCODE -ne 0) { throw 'Cannot verify candidate history paths.' }
        foreach ($path in $allPaths) {
            if ($path -and $path -notin $allowedFiles) { throw "Unsafe/unexpected candidate history path: $path" }
        }
        $count = & git -C $barePath rev-list --count $plan.NewHead
        if ($LASTEXITCODE -ne 0 -or [int]$count -ne $plan.Commits.Count) {
            throw 'Unexpected candidate history length.'
        }
        $plan.BarePath = $barePath
    }

    foreach ($plan in $plans) {
        $current = Invoke-GitHubJson "repos/$($plan.Repo)/git/ref/heads/final"
        if ($current.object.sha -ne $plan.ExpectedHead) {
            throw "The branch moved in $($plan.Repo). No forced overwrite will be attempted."
        }
        # Atomic compare-and-swap at the Git server, not a blind API force update.
        & git -C $plan.BarePath push "--force-with-lease=refs/heads/final:$($plan.ExpectedHead)" origin "$($plan.NewHead):refs/heads/final"
        if ($LASTEXITCODE -ne 0) { throw "History push failed for $($plan.Repo). Check per-repository status." }
        $after = Invoke-GitHubJson "repos/$($plan.Repo)/git/ref/heads/final"
        if ($after.object.sha -ne $plan.NewHead) { throw 'Post-push branch verification failed.' }
        Write-Host "HISTORY REWRITTEN AND VERIFIED: $($plan.Repo) final $($plan.NewHead)"
    }

    Write-Host ''
    Write-Host 'Both final branches now reference only sanitized histories.'
    Write-Host 'Still required: revoke/rotate used credentials; request GitHub cached/dangling-object cleanup.'
    Write-Host 'Do not merge or push old clones/branches back. Use fresh clones after cleanup.'
    Write-Host 'This script does not revoke credentials, purge GitHub caches, or modify forks.'
} finally {
    # This directory was created by this invocation and contains only sanitized Git objects.
    if (Test-Path -LiteralPath $workspace) { Remove-Item -LiteralPath $workspace -Recurse -Force }
}
