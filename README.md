# Hi, I’m Joanna — JeanneBM 👋

**DevSecOps Engineer · Azure · Kubernetes · AI Agent Engineering**

I combine infrastructure, CI/CD and automation experience with hands-on work on AI agents for cloud operations and retrieval-based applications.

My approach: **the model proposes, deterministic policy authorizes, and execution is verified.**

## Featured projects

### [Azure Kubernetes Agentic Ops — PoC](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-poc)

My exploration of AI agents beyond incident tagging: LLM-assisted diagnosis followed by policy-controlled remediation and rollout verification on AKS.

- Separate diagnostic and remediation workloads, identities and permissions.
- Automatic image-reference correction constrained by Kubernetes evidence, deterministic policy and ACR validation.
- Human-review escalation when checks fail or recovery cannot be verified.

**Python · AKS · Azure Workload Identity · ACR · Azure OpenAI**

### [Azure Kubernetes Agentic Ops — Evaluation](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-eval)

A dedicated evaluation project for the two-agent workflow: scenario checks, live AKS trial scripts and evidence records.

- S01–S06 cover typo repair, sidecar preservation, missing images, pull authentication failures, multiple failing containers and stale proposals.
- Evaluation focuses on correct recovery, safe abstention and response time.
- Mocked checks and live trial verdicts are recorded separately; a successful demo does not establish a speed advantage.

**Python · pytest · PowerShell · Kubernetes · Scenario-based evaluation**

### [Azure Foundry RAG Agent](https://github.com/JeanneBM/azure-foundry-rag-agent)

A versioned Microsoft Foundry agent connected to an Azure AI Search Knowledge Base through MCP.

- The CLI client requires retrieval for each question and validates citations against the current results.
- Explicit agent-version selection, bounded conversation history and offline CI checks.
- Source validation establishes provenance; answer faithfulness requires separate evaluation.

**Python · Microsoft Foundry · Azure AI Search · MCP**

### [LangGraph CI Repair Agent — PoC](https://github.com/JeanneBM/langgraph-ci-repair-agent)

A bounded CI repair workflow exploring LangChain and LangGraph for diagnosis, policy-controlled repair proposals and human approval.

- Stateful orchestration with conditional routing, up to two proposal attempts and history carried between attempts.
- Deterministic repair rules, static validation and SQLite checkpoints for pause-and-resume approval.
- Four synthetic scenarios with reproducible offline evidence; approval exports a local patch and draft PR text.
- Scripted demo mode and an Azure OpenAI adapter; live model evaluation and GitHub PR creation remain next steps.

**Python · LangChain · LangGraph · Azure OpenAI · SQLite · pytest**

## Engineering background

- **Cloud & infrastructure:** Azure, Linux, Docker, Kubernetes, Ansible.
- **Software delivery:** GitHub Actions, Azure DevOps, Jenkins, GitLab, Harbor, Argo CD.
- **Automation:** Python, Groovy, Bash, PowerShell, YAML pipelines.
- **AI engineering focus:** agent orchestration with LangChain and LangGraph, retrieval, least privilege, policy gates, human approval and evaluation.

I’m developing toward AI Engineering, building on my DevSecOps background to create systems with clear boundaries and verifiable outcomes.

## Connect

[LinkedIn](https://www.linkedin.com/in/joanna-bojko-486561224/) · [GitLab](https://gitlab.com/JeanneBM) · [Microsoft Learn](https://learn.microsoft.com/en-us/users/joannabojko-5711/) · [Credly](https://www.credly.com/users/joanna-bojko/badges)
