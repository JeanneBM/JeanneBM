# Hi, I’m Joanna Bojko 👋

**AI Agent Engineering · DevSecOps · Azure · Kubernetes**

I have 6+ years of experience across Linux administration, DevOps and DevSecOps. I build and evaluate AI agents for infrastructure operations, secure delivery and research. My projects focus on reproducible environments, least-privilege access and measurable results.

**The model proposes. Deterministic policy authorizes. Execution is verified.**

## Featured projects

### [Azure Kubernetes Agentic Ops & Evaluation](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-eval)

Two agents handle a bounded AKS recovery task: diagnosis and policy-controlled remediation, with separate identities and rollout verification. The evaluation recorded **98 outcomes**. On the comparable trials, the rules baseline passed **35/35** and the LLM-assisted variant **31/35**. [Evaluation snapshot v0.2.0](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-eval/tree/v0.2.0)

### [Regulatory RAG Assistant](https://github.com/JeanneBM/regulatory-rag-assistant)

**Stack:** Python · Azure OpenAI · [Optional LangChain + FAISS semantic search](https://github.com/JeanneBM/regulatory-rag-assistant/blob/main/langchain_rag.py)

Imports the AI Act and DORA from official EU sources and generates cited answers with Azure OpenAI. In a **10-question pilot**, the system cited the expected article for **8/8 answerable questions** and abstained on **2/2 controls**. Manual review identified cases where a real quotation supported only part of a claim. [Validation report](https://github.com/JeanneBM/regulatory-rag-assistant/blob/main/evidence/regulatory-rag-validation-2026-11-09.md)

### [LangGraph CI Repair Agent](https://github.com/JeanneBM/langgraph-ci-repair-agent)

**Stack:** Python · LangGraph (workflow orchestration) · LangChain (structured model calls) · Azure OpenAI

The workflow proposes CI repairs, checks them against deterministic policy and pauses for human approval before exporting a patch. In live Azure tests with synthetic CI failures, S01 reached patch export and S05 escalated after policy rejected a proposed change. [S01 evidence](https://github.com/JeanneBM/langgraph-ci-repair-agent/blob/main/evidence/live-azure-s01-2026-11-09.md) · [S05 evidence](https://github.com/JeanneBM/langgraph-ci-repair-agent/blob/main/evidence/live-azure-s05-2026-11-09.md)

### [Azure Foundry RAG Agent](https://github.com/JeanneBM/azure-foundry-rag-agent)

Microsoft Foundry agent backed by Azure AI Search through MCP. The Python client validates citation provenance and supports abstention on questions outside the knowledge base. Retrieval and refusal were exercised in the Foundry playground. [Validation notes](https://github.com/JeanneBM/azure-foundry-rag-agent#validation-and-current-evidence)

### [AKS Readiness Diagnostic Agent](https://github.com/JeanneBM/aks-readiness-diagnostic-agent)

Read-only diagnosis with explicit rules, an LLM and a rules-first cascade. The development pilot replayed **eight scenarios recorded on kind**. The rules baseline passed **24/24 attempts**. Live AKS and independent held-out validation are pending. [Pilot evidence](https://github.com/JeanneBM/aks-readiness-diagnostic-agent/blob/main/docs/status.md)

### [DevOps Platform Lab — Local](https://github.com/JeanneBM/devops-platform-lab-local)

Reproducible Kubernetes lab on kind with Python and Java services and Jenkins. GitHub Actions tests the apps, builds images, deploys the lab and checks HTTP behavior. Successful main-branch runs publish the tested images to GHCR.

## More projects

| Project | Focus |
| --- | --- |
| [DevOps Platform Lab — Azure](https://github.com/JeanneBM/devops-platform-lab-azure) | Terraform for AKS and ACR, Helm, Jenkins recovery and observability. Recovery and observability were checked on kind. Live Azure lifecycle validation is pending. |
| [Agent Policy Guard](https://github.com/JeanneBM/agent-policy-guard) | Reusable deterministic authorization for agent actions. |
| [Dual Agent Code Workbench](https://github.com/JeanneBM/dual-agent-code-workbench) | GPT and Claude propose and review code changes, with a human decision. |

## Core strengths

- **AI engineering:** Python, LangChain, LangGraph, RAG, Azure OpenAI and evaluation against deterministic baselines.
- **Cloud and platforms:** Azure, Kubernetes, AKS, Terraform, Helm, Linux and Docker.
- **Secure delivery:** GitHub Actions, Azure DevOps, Jenkins, Argo CD, workload identities and policy enforcement.

My main AI assistants are **GPT, Claude and Grok**.

## Connect

[LinkedIn](https://www.linkedin.com/in/joanna-bojko-486561224/) · [GitLab](https://gitlab.com/JeanneBM) · [Microsoft Learn](https://learn.microsoft.com/en-us/users/joannabojko-5711/) · [Credly](https://www.credly.com/users/joannabojko/badges)
