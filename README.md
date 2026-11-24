# Hi, I’m JeanneBM 👋

**AI Agent Engineering · DevSecOps · Azure · Kubernetes**

I have 6+ years of experience across Linux administration, DevOps and DevSecOps. I build and evaluate AI agents for infrastructure operations, secure delivery and research. My projects focus on reproducible environments, least-privilege access and measurable results.

**The model proposes. Deterministic policy authorizes. Execution is verified.**

## Published

### [code-bloat-review](https://github.com/JeanneBM/code-bloat-review)

**Stack:** Python · GitHub Actions

A GitHub Action that reviews the whole codebase for complexity disproportionate to what the project does. It returns a **YES / PARTLY / NO** verdict, a **0–100 score** and findings tied to Clean Code heuristics. Two implementations of the same to-do app scored **0/100** and **73.7/100**. Version **v1.0.0** is published on GitHub Marketplace, and the post-release smoke test verified the report and outputs using `@v1`. [Marketplace listing](https://github.com/marketplace/actions/code-bloat-review) · [Smoke test](https://github.com/JeanneBM/code-bloat-review/actions/runs/44341098059)

## Featured

### [Azure Kubernetes Agentic Ops & Evaluation](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-eval)

**Stack:** Python · FastAPI · Kubernetes (AKS) · Azure OpenAI · Azure Workload Identity

Two agents handle a bounded AKS recovery task: diagnosis and policy-controlled remediation, with separate identities and rollout verification. The evaluation recorded **98 outcomes**. On the comparable trials, the rules baseline passed **35/35** and the LLM-assisted variant **31/35**. [Evaluation snapshot v0.2.0](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-eval/tree/v0.2.0)

### [Regulatory RAG Assistant](https://github.com/JeanneBM/regulatory-rag-assistant)

**Stack:** Python · Azure OpenAI · [Optional LangChain + FAISS semantic search](https://github.com/JeanneBM/regulatory-rag-assistant/blob/main/langchain_rag.py)

Imports the AI Act and DORA from official EU sources and generates cited answers with Azure OpenAI. In a **10-question pilot**, the system cited the expected article for **8/8 answerable questions** and abstained on **2/2 controls**. Manual review identified cases where a real quotation supported only part of a claim. [Validation report](https://github.com/JeanneBM/regulatory-rag-assistant/blob/main/evidence/regulatory-rag-validation-2026-11-09.md)

[Regulatory RAG Assistant v2](https://github.com/JeanneBM/regulatory-rag-assistant-v2) is an Azure redesign with point-level quotations and claim-support verification. It also imports NIST AI RMF 1.0, the NIST Generative AI Profile and all three EU GPAI Code of Practice chapters. [Local guidance retrieval](https://github.com/JeanneBM/regulatory-rag-assistant-v2/blob/main/evidence/ai-guidance-validation-2026-11-24.md) found **9/10 expected source locators**. Model and Azure validation of the expanded corpus is pending. A [10-question pilot with local retrieval and Azure OpenAI](https://github.com/JeanneBM/regulatory-rag-assistant-v2/blob/main/evidence/eval-20261113T130444Z.md) cited the expected article for **7/8 answerable questions** and abstained on **2/2 controls**. Evaluation of the full Azure deployment is pending.

### [LangGraph CI Repair Agent](https://github.com/JeanneBM/langgraph-ci-repair-agent)

**Stack:** Python · LangGraph (workflow orchestration) · LangChain (structured model calls) · Azure OpenAI

The v1.0 proof of concept proposes CI repairs, checks them against deterministic policy, validates candidates in isolation and requires human approval before exporting a patch. With scripted model responses and logs from real GitHub Actions fixture jobs, five scenarios reached patch export and one escalated. A separate Azure OpenAI run reached patch export for S01. [CI fixture evidence](https://github.com/JeanneBM/langgraph-ci-repair-agent/blob/main/evidence/real-actions-logs-2026-11-17.md) · [Azure S01 evidence](https://github.com/JeanneBM/langgraph-ci-repair-agent/blob/main/evidence/live-azure-s01-2026-11-17.md)

### [Azure Foundry RAG Assistant](https://github.com/JeanneBM/azure-foundry-rag-assistant)

**Stack:** Python · Microsoft Foundry SDK · Microsoft Foundry prompt agent · Azure AI Search (knowledge base) · MCP (retrieval)

A RAG assistant for document Q&A. The Python client checks citations against the sources retrieved for each answer. The assistant is configured to abstain when the knowledge base does not support an answer. Retrieval and refusal were exercised in the Foundry playground. [Validation notes](https://github.com/JeanneBM/azure-foundry-rag-assistant#validation-and-current-evidence)

### [AKS Readiness Diagnostic Agent](https://github.com/JeanneBM/aks-readiness-diagnostic-agent)

**Stack:** Python · kubectl (read-only evidence collection) · kind (test cluster) · Azure OpenAI / OpenAI (optional LLM mode)

Read-only diagnosis with explicit rules, an LLM and a rules-first cascade. The development pilot replayed **eight scenarios recorded on kind**. The rules baseline passed **24/24 attempts**. Live AKS and independent held-out validation are pending. [Pilot evidence](https://github.com/JeanneBM/aks-readiness-diagnostic-agent/blob/main/docs/status.md) The [preregistered second phase](https://github.com/JeanneBM/aks-readiness-diagnostic-agent/blob/main/docs/phase-2-protocol.md) defines 13 cases for testing when the LLM adds value. The evaluation gate and fallback were checked offline with scripted models.

### [DevOps Platform Lab — Local](https://github.com/JeanneBM/devops-platform-lab-local)

**Stack:** Kubernetes (kind) · Docker · Kustomize · Flask · Java 21 · Jenkins · GitHub Actions

Reproducible Kubernetes lab on kind with Python and Java services and Jenkins. GitHub Actions tests the apps, builds images, deploys the lab and checks HTTP behavior. Successful main-branch runs publish the tested images to GHCR.

## More projects

| Project | Focus |
| --- | --- |
| [DevOps Platform Lab — Azure](https://github.com/JeanneBM/devops-platform-lab-azure) | Terraform for AKS and ACR, Helm, Jenkins recovery and observability. [CI on kind](https://github.com/JeanneBM/devops-platform-lab-azure/blob/main/evidence/2026-11-17-L1.md) verified app deployments, Jenkins dynamic agents and backup/restore, and alert firing and recovery. Live Azure lifecycle validation is pending. |
| [Agent Monitor v2](https://github.com/JeanneBM/observability-monitor-agent-v2) | Read-only monitoring of AI-agent telemetry for policy violations. A [kind smoke test](https://github.com/JeanneBM/observability-monitor-agent-v2/blob/main/evidence/kubernetes-smoke-2026-11-12.md#kind-smoke-real-pod-logs--pass) detected the injected violation in pod logs. |
| [Agent Policy Guard](https://github.com/JeanneBM/agent-policy-guard) | Reusable deterministic authorization for agent actions. |
| [Dual Agent Code Workbench](https://github.com/JeanneBM/dual-agent-code-workbench) | GPT and Claude propose and review code changes, with a human decision. |

## Core strengths

- **AI engineering:** Python, LangChain, LangGraph, RAG, Azure OpenAI and evaluation against deterministic baselines.
- **Cloud and platforms:** Azure, Kubernetes, AKS, Terraform, Helm, Linux and Docker.
- **Secure delivery:** GitHub Actions, Azure DevOps, Jenkins, Argo CD, workload identities and policy enforcement.

My main AI assistants are **GPT, Claude and Grok**.

## Connect

[LinkedIn](https://www.linkedin.com/in/joanna-bojko-486561224/) · [GitLab](https://gitlab.com/JeanneBM) · [Microsoft Learn](https://learn.microsoft.com/en-us/users/joannabojko-5711/) · [Credly](https://www.credly.com/users/joannabojko/badges)
