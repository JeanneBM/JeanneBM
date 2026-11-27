# Kolejka prac nad repozytoriami JeanneBM

Aktualizacja: 27 listopada 2026.

Po zakończeniu zadania usuń je z listy. W częściowo wykonanych zadaniach pozostaw tylko otwarte kroki.

## P1 — Readiness

| Kolejność | Repozytorium | Do zrobienia |
|---|---|---|
| 1 | [aks-readiness-diagnostic-agent](https://github.com/JeanneBM/aks-readiness-diagnostic-agent) | Nagrać 13 przypadków fazy 2 i przejrzeć etykiety. Wykonać bezpłatny baseline A1, następnie po zgodzie Joanny kontrolowane C1/H na tych samych danych i uruchomić phase2_gate. Oddzielić błędy dostawcy od diagnoz. Wdrożyć Entra ID. Po zamrożeniu reguł i konfiguracji modelu ocenić niezależne przypadki oraz docelowy scenariusz AKS. |

## P2 — domknięcie integracji

| Kolejność | Repozytorium | Do zrobienia |
|---|---|---|
| 1 | [java-ci-triage-agent](https://github.com/JeanneBM/java-ci-triage-agent) | Uruchomić aplikację lokalnie i potwierdzić dostępność POST /triage. Potwierdzić ślad w prawdziwym projekcie Langfuse bez surowych logów. Po zgodzie na płatne wywołania wykonać małą ewaluację syntetycznych przypadków z prawdziwym modelem. |
| 2 | [azure-foundry-rag-assistant](https://github.com/JeanneBM/azure-foundry-rag-assistant) | Na gałęzi PR #18 wykonać świeży setup, potwierdzić disableLocalAuth=true i authOptions=null oraz guarded CLI smoke z cytowaną odpowiedzią i odmową. Zachować oczyszczony raport. Po wymaganych kontrolach scalić PR i usunąć lab z potwierdzeniem. |

## P3 — jakość odpowiedzi i próby modeli

| Kolejność | Repozytorium | Warunek rozpoczęcia | Do zrobienia |
|---|---|---|---|
| 1 | [regulatory-rag-assistant-v2](https://github.com/JeanneBM/regulatory-rag-assistant-v2) | Dostęp do środowiska lub wyniku jego usunięcia | Potwierdzić cleanup Azure. Poprawić wierność odpowiedzi, w szczególności podmiot obowiązku w GPAI02 oraz zachowanie wyjątków, warunków i alternatyw. Dodać regresje i po poprawce sprawdzić dotknięte przypadki. Kolejną pełną płatną kampanię poprzedzić zmianą kodu. |
| 2 | [dual-agent-code-workbench](https://github.com/JeanneBM/dual-agent-code-workbench) | Powrót 30.11.2026 zgodnie z decyzją Joanny | Potwierdzić dostęp do OpenAI API i Anthropic API. Wykonać małą próbę autor → recenzent → poprawka, także po zamianie ról. Ocenić wynik i zapisać oczyszczony dowód. |

## P4 — walidacja platform Azure

| Kolejność | Repozytorium | Warunek rozpoczęcia | Do zrobienia |
|---|---|---|---|
| 1 | [devops-platform-lab-azure](https://github.com/JeanneBM/devops-platform-lab-azure) | Osobna sesja Azure | Wykonać pierwszy cykl start → aplikacje i build Jenkins → backup/restore na nowym PVC → monitoring/alert → destroy. Zapisać wyniki i potwierdzić usunięcie zasobów oraz grupy węzłów AKS. |
| 2 | [agents-platform-bicep](https://github.com/JeanneBM/agents-platform-bicep) | Przygotowanie zależnych aplikacji | Wykonać wspólny cykl up → smoke/status czterech komponentów → kontrola uprawnień → down. Zachować raport i potwierdzenie usunięcia RG oraz grupy węzłów AKS. |

## P5 — alternatywna implementacja Readiness

| Repozytorium | Warunek rozpoczęcia | Do zrobienia |
|---|---|---|
| [aks-readiness-diagnostic-agent-v2](https://github.com/JeanneBM/aks-readiness-diagnostic-agent-v2) | Zakończenie pilota głównego Readiness lub decyzja Joanny o zmianie projektu | Uruchomić lab, sprawdzić nagrania i etykiety, porównać reguły, LLM i kaskadę w powtórzeniach. Dodać Entra ID. Po zamrożeniu konfiguracji wykonać held-out i ograniczoną próbę AKS. |

## P6 — rozwój pętli agentowej

| Repozytorium | Warunek rozpoczęcia | Do zrobienia |
|---|---|---|
| [azure-kubernetes-agentic-ops-lab](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-lab) | Pierwszy pilot Readiness | Zaimplementować nagranie i bezpieczny replay incydentu S01 oraz test kompletności obserwacji i resetu. Następnie uruchomić ograniczoną pętlę agentów, a po jej walidacji przygotować próbę AKS. |
