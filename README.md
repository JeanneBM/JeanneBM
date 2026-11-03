# Hi, I’m Joanna — JeanneBM 👋

**DevSecOps Engineer | Azure | Kubernetes | AI Agent Engineering**

I have 6+ years of experience across Linux administration, DevOps and DevSecOps. I build secure cloud platforms and delivery automation, and apply that engineering background to AI agents for infrastructure operations.

My focus is practical: reproducible environments, least-privilege access, verified execution and evidence that shows when an agent adds value.

**The model proposes; deterministic policy authorizes; execution is verified.**

## Core strengths

- **Cloud & platforms:** Azure, Kubernetes, AKS, Linux and Docker.
- **Secure delivery:** DevSecOps, workload identities, least privilege and policy enforcement.
- **CI/CD:** GitHub Actions, Azure DevOps, Jenkins, GitLab, Harbor and Argo CD.
- **Automation:** Python, Groovy, Bash, PowerShell and YAML.
- **AI agents:** LangChain, LangGraph, RAG, human review and evaluation against deterministic baselines.

## Featured projects

### [Azure Kubernetes Agentic Ops & Evaluation](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-eval)

Two agents for a bounded AKS recovery task: LLM-assisted diagnosis, deterministic authorization of container image-reference corrections and rollout verification. Separate identities and permissions keep diagnosis and execution apart.

The evaluation closed on **29 October 2026**, with **98 recorded outcomes** across the campaign. Excluding S04 setup failures, the deterministic baseline achieved **35/35 PASS**, compared with **31/35 PASS** for the LLM-assisted variant. The model did not improve outcomes in this narrow task. Published evidence documents setup failures and limitations; human review was not completed.

**Python · AKS · Azure OpenAI · Azure Workload Identity · ACR**

### [DevOps Platform Lab — Local](https://github.com/JeanneBM/devops-platform-lab-local)

A reproducible kind lab running Python and Java applications alongside Jenkins. GitHub Actions tests the applications, builds images, deploys the full lab and checks HTTP behavior. Successful main-branch runs publish the exact tested application images to GHCR.

**Kubernetes · kind · Docker · Jenkins · GitHub Actions · Python · Java**

### [DevOps Platform Lab — Azure](https://github.com/JeanneBM/devops-platform-lab-azure)

An ephemeral Azure lab with Terraform for AKS and ACR, Helm deployments, Jenkins dynamic agents, encrypted backup and recovery, and metrics, logs and alerts. PowerShell scripts prepare the complete start, test, backup and destroy lifecycle.

**Status:** implemented in code, with local kind checks for Jenkins recovery and observability. Live Azure deployment and lifecycle validation are pending.

**Azure · Terraform · AKS · Helm · Jenkins · PowerShell · Prometheus · Grafana · Loki**

### [AKS Readiness Diagnostic Agent](https://github.com/JeanneBM/aks-readiness-diagnostic-agent)

A read-only diagnostic experiment comparing explicit rules, an optional LLM and a rules-to-model cascade on the same Kubernetes evidence. Diagnoses include evidence references and uncertainty; recommendations are never executed.

**Status:** development implementation with synthetic fixtures and a local recording workflow. Live AKS validation and held-out model advantage are not established.

**Python · Kubernetes · Diagnostic evaluation · Evidence replay**

## More AI engineering projects

Maturity and validation status are documented in each repository.

| Project | Focus |
| --- | --- |
| [Agent Policy Guard](https://github.com/JeanneBM/agent-policy-guard) | Early PoC of reusable, deterministic authorization for agent actions. |
| [Regulatory RAG Assistant](https://github.com/JeanneBM/regulatory-rag-assistant) | Research PoC for AI Act and DORA retrieval with source and quote checks. |
| [LangGraph CI Repair Agent](https://github.com/JeanneBM/langgraph-ci-repair-agent) | CI repair proposals with policy checks and human review. |
| [Dual Agent Code Workbench](https://github.com/JeanneBM/dual-agent-code-workbench) | Local GPT–Claude code proposals and peer review, with human decisions. |

## AI assistants

My main AI assistants are **GPT, Claude and Grok**.

## Connect

[LinkedIn](https://www.linkedin.com/in/joanna-bojko-486561224/) · [GitLab](https://gitlab.com/JeanneBM) · [Microsoft Learn](https://learn.microsoft.com/en-us/users/joannabojko-5711/) · [Credly](https://www.credly.com/users/joanna-bojko/badges)
