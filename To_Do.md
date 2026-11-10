# Kolejka prac nad repozytoriami JeanneBM

Aktualizacja: 10 listopada 2026.

Wiersze wskazują kolejność pracy. Po zakończeniu zadania usuń je z tej listy. Zadania zależne rozpoczynaj po spełnieniu warunku w tabeli.

## P1 — najbliższa praca

Najbliższe zadanie to pilot niezależnego monitoringu. Po pilocie przygotować demo Java CI Triage, a w Readiness zebrać nagrania z ubogimi logami i przypadkami niejednoznacznymi oraz uwzględnić czas dowodów. Uruchomienie DevOps Platform Lab w Azure jest odłożone na późniejszą sesję i nie blokuje Readiness.

| Kolejność | Repozytorium | Do zrobienia |
|---|---|---|
| 1 | [observability-monitor-agent](https://github.com/JeanneBM/observability-monitor-agent) | Pilot niezależnego obserwatora w trybie odczytu (shadow monitoring). Podłączyć `watch` do JSONL emitowanego przez LangGraph CI Repair (`AGENT_TELEMETRY_FILE`). Na lokalnych scenariuszach sprawdzić poprawny przebieg, kontrolowaną anomalię i utratę źródła. Pilot zaliczony, gdy poprawny przebieg nie alarmuje, anomalia daje oczekiwany alert, utrata źródła jest widoczna w `health.json`, a restart nie duplikuje alertów. Zapisać wyniki; potem sprawdzić jedno źródło logów lub zdarzeń środowiska Kubernetes w trybie odczytu. |
| 2 | [java-ci-triage-agent](https://github.com/JeanneBM/java-ci-triage-agent) | Przygotować krótkie demo PoC Spring Boot + LangChain4j + Langfuse. Uruchomić lokalnie `mvn -B -ntp verify` i sprawdzić oba przykłady Maven przez `POST /triage`: `DIAGNOSED` z cytatem z logu oraz `NEEDS_MORE_EVIDENCE` przy braku danych. Pokazać ślad w Langfuse bez surowych logów. Test z rzeczywistym modelem wykonać na danych syntetycznych po zgodzie Joanny na płatne wywołanie. |
| 3 | [aks-readiness-diagnostic-agent](https://github.com/JeanneBM/aks-readiness-diagnostic-agent) | Rozbudować recorder o ubogie/domyślne logi i przypadki niejednoznaczne; etykietować tylko przyczyny rozpoznawalne z dowodów. Przetestować fallback H offline. Zachować czasy/count zdarzeń i przejścia Ready, ograniczyć duplikowanie logów. Dodać Entra ID do modelu. Kolejne płatne wywołania dopiero po zgodzie Joanny; zamrozić implementację przed niezależnym held-out. |
| 4 | [azure-foundry-rag-assistant](https://github.com/JeanneBM/azure-foundry-rag-assistant) | **Zweryfikować [draft PR #18](https://github.com/JeanneBM/azure-foundry-rag-assistant/pull/18).** Na gałęzi `hardening/entra-only-search` wykonać świeży setup, potwierdzić `disableLocalAuth=true` i `authOptions=null` komendą z PR, następnie `python scripts/lab.py smoke`. Po PASS zachować w repo przejrzany, zanonimizowany raport i wyniki kontroli; po zielonym CI i CodeQL oznaczyć PR jako gotowy i scalić. Przy błędzie pozostawić draft i zapisać przyczynę. Na koniec, także po nieudanej weryfikacji, wykonać `python scripts/lab.py delete --confirm rg-foundry-rag-demo` i potwierdzić usunięcie grupy. |
| 5 | [JeanneBM](https://github.com/JeanneBM/JeanneBM) | Uzupełnić README profilu o link do wydania Eval v0.2.0 oraz krótkie odnośniki do azure-kubernetes-agentic-ops-lab i offline-environment-auditor. |

## P2 — integracje i walidacja kluczowych PoC

| Kolejność | Repozytorium | Do zrobienia |
|---|---|---|
| 1 | [agent-policy-guard](https://github.com/JeanneBM/agent-policy-guard) | Podłączyć jeden rzeczywisty przepływ CI lub labu. Testem wykazać, że decyzja deny uniemożliwia wywołanie executora. |
| 2 | [langgraph-ci-repair-agent](https://github.com/JeanneBM/langgraph-ci-repair-agent) | Sprawdzić live model na S01. Następnie dołączyć rzeczywiste logi Actions i izolowaną walidację patcha. |
| 3 | [offline-environment-auditor](https://github.com/JeanneBM/offline-environment-auditor) | Zweryfikować Trivy na rzeczywistym lokalnym archiwum obrazu z wyłączoną siecią. Ocenić fałszywe alarmy na reprezentatywnych snapshotach. |

## P3 — kolejne aktywne projekty

| Kolejność | Repozytorium | Do zrobienia |
|---|---|---|
| 1 | [regulatory-rag-assistant](https://github.com/JeanneBM/regulatory-rag-assistant) | Porównać domyślny TF-IDF z LangChain + FAISS na tych samych 10 pytaniach z pilota, z tym samym modelem czatu Azure OpenAI i filtrem aktu. Zacząć od pytania o ramy zarządzania ryzykiem ICT (DORA, art. 6). Zapisać dla obu ścieżek trafienie we właściwy artykuł, pełne poparcie odpowiedzi cytatem i poprawność odmów na pytaniach kontrolnych. Aby ocenić samo wyszukiwanie, porównać wyniki przed generowaniem na identycznych fragmentach korpusu. Płatne embeddingi i wywołania modelu uruchomić po zgodzie Joanny. Następnie rozszerzyć zbiór do 30–50 ocenionych pytań. |
| 2 | [dual-agent-code-workbench](https://github.com/JeanneBM/dual-agent-code-workbench) | Uruchomić demo, potem kontrolowane zadanie na rzeczywistych API obu modeli. Ocenić propozycję i recenzję. |
| 3 | [reusable-github-actions](https://github.com/JeanneBM/reusable-github-actions) | Dodać workflow konsumenta, który uruchamia akcje i sprawdza ich rezultaty oraz obsługę błędów. |
| 4 | [devops-platform-lab-local](https://github.com/JeanneBM/devops-platform-lab-local) | Sprawdzić świeży pełny start na kind i smoke test. Zachować dowód działania demo. |

## P4 — zadania zależne od wcześniejszych wyników

| Kolejność | Repozytorium | Warunek rozpoczęcia | Do zrobienia |
|---|---|---|---|
| 1 | [azure-kubernetes-agentic-ops-lab](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-lab) | Pierwszy pilot Readiness | Napisać kontrakt nagrania i deterministyczny replay jednego S01, następnie pętlę eksperymentu na kind. |
| 2 | [agent-anomaly-ml](https://github.com/JeanneBM/agent-anomaly-ml) | Rzeczywista telemetria z monitora | Dodać CI istniejących testów oraz adapter telemetrii; skalibrować detektory na osobnych, ocenionych poprawnych runach. |
| 3 | [agents-platform-bicep](https://github.com/JeanneBM/agents-platform-bicep) | Niezależna walidacja aplikacji | Wykonać pełny up → smoke → status → down z raportami i potwierdzonym usunięciem zasobów. |
| 4 | [devops-platform-lab-azure](https://github.com/JeanneBM/devops-platform-lab-azure) | Powrót do uruchamiania labu w Azure w osobnej sesji | Wykonać start → test aplikacji i Jenkinsa → backup → destroy, potwierdzić usunięcie zasobów i opublikować zanonimizowany raport z aktualizacją README. |

## P5 — opcjonalnie, przy powrocie do projektu

| Repozytorium | Do zrobienia |
|---|---|
| [archive](https://github.com/JeanneBM/archive) | Przygotować czytelny indeks zawartości i pochodzenia materiałów. |
| [azure-kubernetes-agentic-ops](https://github.com/JeanneBM/azure-kubernetes-agentic-ops), [PoC](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-poc) | Wskazać w README podział: końcowe wyniki w Eval, dalszy rozwój w Lab. |
| [jb_DevoteeDistro](https://github.com/JeanneBM/jb_DevoteeDistro) | Uzgodnić README z plikami i sprawdzić checker oddzielnie od instalacji systemu. |
| [jb_ImageMatcher](https://github.com/JeanneBM/jb_ImageMatcher) | Zmierzyć trafność i błędne dopasowania na opisanym zbiorze zdjęć. |
| [jb_IoT](https://github.com/JeanneBM/jb_IoT) | Opisać sprzęt i jedno odtwarzalne demo. |
| [jb_OrderBook](https://github.com/JeanneBM/jb_OrderBook) | Dodać komendę build/run i testy podstawowych operacji. |
| [jb_StrideMate](https://github.com/JeanneBM/jb_StrideMate) | Doprowadzić jedno zdjęcie do poprawnego rekordu danych; ocenić ekstrakcję przed modelowaniem planu. |
| [Symfony](https://github.com/JeanneBM/jb_symfony-roadrunner-task-api-devops) | Skonfigurować lokalne sekrety, odtworzyć uruchomienie i wykonać testy. |
| [n8n-self-hosted-lab](https://github.com/JeanneBM/n8n-self-hosted-lab) | Przetestować odtworzenie workflow z backupu; dodać osobny backup i restore PostgreSQL. |
| [Chat Server](https://github.com/JeanneBM/Online-Chat-Server-Contest-Requirements) | Z nowymi lokalnymi sekretami przejść smoke dwóch użytkowników na PostgreSQL/Compose i zweryfikować pozostałe luki wymagań. |

## P6 — pomysły do świadomego wyboru

| Repozytorium | Pierwsza czynność po wyborze |
|---|---|
| [jb_pyAWS](https://github.com/JeanneBM/jb_pyAWS) | Wybrać jedno konkretne zastosowanie i określić minimalny rezultat do implementacji. |
| [LLM-as-a-judge-multi-agent](https://github.com/JeanneBM/LLM-as-a-judge-multi-agent) | Zdefiniować rubrykę oceny, ludzkie etykiety i punkt odniesienia przed implementacją. |
