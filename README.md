# Hi, I’m Joanna — JeanneBM 👋

**DevSecOps Engineer | Azure | Kubernetes | AI Agent Engineering**

I build secure, cloud-native systems with a strong focus on automation, policy enforcement and AI-assisted operations. My work combines DevSecOps and platform engineering with AI agents for operations, CI repair and retrieval-based workflows.

**The model proposes; deterministic policy authorizes; execution is verified.**

## Core strengths

- **Cloud & platforms:** Azure, Kubernetes, AKS, Linux, Docker and Ansible.
- **Secure delivery:** DevSecOps practices, workload identities, least privilege and policy enforcement.
- **CI/CD:** GitHub Actions, Azure DevOps, Jenkins, GitLab, Harbor and Argo CD.
- **Automation & integration:** Python, Groovy, Bash, PowerShell and YAML pipelines.
- **AI agent engineering:** LangChain, LangGraph, retrieval workflows, validation gates, human approval and evaluation.

## Featured project

### [Azure Kubernetes Agentic Ops & Evaluation](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-eval)

My main project explores AI agents beyond incident tagging: LLM-assisted diagnosis of AKS image-pull failures, followed by deterministic authorization, bounded image-reference repair and rollout verification.

- Separate diagnostic and remediation workloads, Kubernetes permissions and Azure Workload Identities.
- Repairs constrained by Kubernetes evidence, ACR validation, same-registry checks and drift detection; out-of-scope cases escalate for human review.
- Scenario runners, automated checks and captured evidence assess correct recovery, safe abstention and policy enforcement.

**Live evaluation:** All ten scenarios (S01–S10) were run on Azure AKS. The latest recorded batch has **9 passed and 1 inconclusive (S05)**. S05 safely escalated without executing a repair, but its refusal reason did not satisfy the scenario criterion. S06 uses a scripted proposal; S07–S10 are controlled security trials. These observations are preliminary and do not establish repeatability. See the [recorded batch and screenshot](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-eval/tree/main/eval/evidence/S01-S10) and [scenario descriptions](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-eval/blob/main/eval/README.md).

**Python · AKS · Azure Workload Identity · ACR · Azure OpenAI · pytest · PowerShell**

The [earlier PoC](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-poc) documents the preceding stage.

## Supporting projects

| Project | What it demonstrates | Scope |
| --- | --- | --- |
| [Agents Platform — Bicep](https://github.com/JeanneBM/agents-platform-bicep) | Shared Azure infrastructure and application adapters for AKS Ops, RAG, CI Repair and monitoring; independent repo scripts remain available. | One-command lab orchestration with offline checks; integrated Azure deployment validation is pending. |
| [Azure Foundry RAG Agent](https://github.com/JeanneBM/azure-foundry-rag-agent) | Versioned Foundry agent with AI Search retrieval over MCP, required retrieval and citation checks against current results. | Provenance checks establish source membership; they do not establish answer truth. |
| [LangGraph CI Repair Agent](https://github.com/JeanneBM/langgraph-ci-repair-agent) | Stateful proposals, deterministic policy, static validation, bounded retries and SQLite checkpoints. | Human approval exports a local patch and draft PR text; no automatic PR creation. |
| [Agent Observability Monitor](https://github.com/JeanneBM/observability-monitor-agent) | Read-only Kubernetes/JSONL collection, deterministic anomaly rules, persistent cursors and deduplicated findings. | Collector runs on the platform host; detection depends on available telemetry. |
| [Agent Anomaly ML](https://github.com/JeanneBM/agent-anomaly-ml) | Comparison of threshold rules, robust statistics, Mahalanobis distance and Isolation Forest, including hybrid detectors. | Separate experiment on synthetic telemetry; real-agent integration is pending. |

## Current focus

I’m developing toward AI Engineering roles through secure workflows for operations, cloud automation and retrieval. My next priorities are investigating the inconclusive S05 result, checking repeatability and comparing the agent workflow with a deterministic baseline.

I keep implementation, automated checks and live Azure evidence separate so the limits of each result are visible.

## AI assistants

My main AI assistants are **GPT, Claude and Grok**.

## Connect

[LinkedIn](https://www.linkedin.com/in/joanna-bojko-486561224/) · [GitLab](https://gitlab.com/JeanneBM) · [Microsoft Learn](https://learn.microsoft.com/en-us/users/joannabojko-5711/) · [Credly](https://www.credly.com/users/joanna-bojko/badges)

My favorite AI pet is **AIBI**.
