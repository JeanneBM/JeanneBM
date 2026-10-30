# Przegląd techniczny repozytoriów JeanneBM — 30 października 2026

Zakres: 137 publicznych repozytoriów: 66 niebędących forkami i 71 forków. „Własne” w tym raporcie oznacza wyłącznie GitHub fork=false, nie audyt autorstwa.

Metoda: aktualne metadane wszystkich repo; README, struktura plików i do pięciu ostatnich runów Actions dla repo niebędących forkami. Nie uruchamiano aplikacji, testów, modeli ani Azure. Dla forków oceniono wyłącznie metadane i rolę referencyjną; nie porównywano ich kodu z upstream. To przegląd techniczny i rekomendacje, nie audyt bezpieczeństwa ani certyfikat gotowości. Brak runów Actions nie dowodzi braku testów lokalnych/Travis/Jenkins. Zielony ostatni run nie dowodzi live integracji ani zgodności z najnowszym commitem; odsyłacze prowadzą do konkretnych przebiegów.

## Kolejność działań według pilności

| Priorytet | Kiedy działać | Cel |
|---|---|---|
| P0 | Pilnie: ujawnienie poświadczeń | Unieważnić używane poświadczenia i oczyścić historię pandaenv; bieżące pliki są już oczyszczone. |
| P1 | Najpierw w rozwoju | Uruchomić pilot AKS Readiness Diagnostic Agent; następnie sprawdzić CI Foundry RAG i poprawić status na profilu. |
| P2 | Następny etap | Zebrać dowody działania najważniejszych PoC i jednej integracji. |
| P3 | Po P1/P2 lub dla wybranego demo | Zweryfikować pozostałe aktywne projekty i narzędzia. |
| P4 | Po spełnieniu zależności | Rozbudować Lab, ML oraz wspólną platformę na sprawdzonych komponentach. |
| P5 | Przy powrocie do projektu | Utrzymanie i drobne usprawnienia. |
| P6 | Dopiero po wyborze pomysłu | Backlog bez zaplanowanego wykonania. |
| P7 | W miarę korzystania | Materiały referencyjne i historia. |

Priorytet dotyczy **następnej czynności**, a nie wartości repozytorium. Przy kolejnych aktualizacjach zachować Readiness na pierwszym miejscu do zakończenia pilota lub zmiany priorytetu przez Joannę. Zamknięte etapy bez konkretnego otwartego zadania mają osobną sekcję i nie otrzymują priorytetu działania. Samo zachowanie repo jako punktu odniesienia nie jest zadaniem. W ramach sekcji P1–P4 wiersze są ułożone w zalecanej kolejności; pozostałe sekcje zachowują porządek alfabetyczny. Nie wyznaczono terminów ani nie wykonano ponownej walidacji technicznej repozytoriów przy tej zmianie raportu.

## Projekty niebędące forkami — 66 repo według pilności

### P0 — ujawnienie poświadczeń: rotacja i historia

Usunięcie plików z bieżącej gałęzi jest wykonane. Nie unieważnia wcześniej opublikowanych danych ani nie usuwa ich ze starych commitów, klonów i cache. Rotacja oraz oczyszczenie historii nie zostały potwierdzone. P0 ma pierwszeństwo przed planem rozwoju; Readiness pozostaje pierwszym projektem rozwojowym P1.

| Repozytorium | Stan | Co potwierdza stan / ograniczenie | Ostatni dostępny CI | Następny krok | Priorytet |
|---|---|---|---|---|---|
| [jb_pandaenv](https://github.com/JeanneBM/jb_pandaenv) | Ujawnione poświadczenia — bieżąca gałąź oczyszczona | Potwierdzono zapisany stan Jenkins/Artifactory oraz sekret agenta w skryptach. Usunięto runtime, klucze i sekrety z final; historia Git nadal je zawiera. | Brak zapisanych runów Actions | Odwołać/zmienić wszystkie używane ujawnione poświadczenia. Oczyścić historię Git i kopie/cache; potem ponownie przeskanować. Nie przywracać dawnych wolumenów. | P0 |
| [jb_pandaenvAWS](https://github.com/JeanneBM/jb_pandaenvAWS) | Ujawnione poświadczenia — bieżąca gałąź oczyszczona | Potwierdzono zapisany stan Jenkins/Artifactory oraz sekret agenta w skryptach. Usunięto runtime, klucze i sekrety z final; historia Git nadal je zawiera. | Brak zapisanych runów Actions | Odwołać/zmienić wszystkie używane ujawnione poświadczenia. Oczyścić historię Git i kopie/cache; potem ponownie przeskanować. Nie przywracać dawnych wolumenów. | P0 |

### P1 — najpierw: pilot Readiness i bieżące sprawdzenia

**Pierwszy projekt do pracy: AKS Readiness Diagnostic Agent — zgodnie z priorytetem wskazanym przez Joannę.** Najbliższy rezultat to nagranie rzeczywistych przypadków na kind i pilot A1/C1/H. Sprawdzenie Foundry RAG i aktualizacja profilu są kolejnymi czynnościami; nie blokują rozpoczęcia Readiness. P1 nie oznacza potwierdzonego incydentu ani awarii produkcyjnej.

| Repozytorium | Stan | Co potwierdza stan / ograniczenie | Ostatni dostępny CI | Następny krok | Priorytet |
|---|---|---|---|---|---|
| [aks-readiness-diagnostic-agent](https://github.com/JeanneBM/aks-readiness-diagnostic-agent) | Implementacja / przed pilotem | A1/C1/H, kolektor, replay i lokalny lab Uvicorn/Go; CI zielone. Pełny kind i model czekają na walidację. | [offline-checks: success](https://github.com/JeanneBM/aks-readiness-diagnostic-agent/actions/runs/40382145081) | Nagrać osiem realnych przypadków na kind, uruchomić A1, potem powtarzany pilot C1/H. | P1 |
| [azure-foundry-rag-agent](https://github.com/JeanneBM/azure-foundry-rag-agent) | Implementacja / niepotwierdzona integracja | Foundry + Search/MCP, walidacja cytowań i lab lifecycle. Ostatni zapisany CI czerwony, z 20.08; późniejszy kod wymaga nowego sprawdzenia. | [.github/workflows/ci.yml: failure](https://github.com/JeanneBM/azure-foundry-rag-agent/actions/runs/32368674184) | Uruchomić CI na obecnym main i usunąć przyczynę niepowodzenia; potem setup → known/unknown smoke → delete. | P1 |
| [JeanneBM](https://github.com/JeanneBM/JeanneBM) | Profil / dokumentacja | README prezentuje 9 projektów; nadal mówi „Evaluation is ongoing”. | Brak zapisanych runów Actions | Zaktualizować status Eval na zamknięte v0.2.0; dodać Readiness, Lab i Auditor bez przeładowania profilu. | P1 |

### P2 — następny etap: walidacja kluczowych PoC

Po pilocie Readiness z P1 sprawdzić Guard i Monitor na jednym wybranym przepływie, a następnie pozostałe PoC z tej sekcji.

| Repozytorium | Stan | Co potwierdza stan / ograniczenie | Ostatni dostępny CI | Następny krok | Priorytet |
|---|---|---|---|---|---|
| [agent-policy-guard](https://github.com/JeanneBM/agent-policy-guard) | PoC biblioteki | Silnik YAML, allow/deny/escalate/require_human, wrapper i audyt; CI zielone. Brak migracji pozostałych repo. | [tests: success](https://github.com/JeanneBM/agent-policy-guard/actions/runs/39468858553) | Podłączyć jeden rzeczywisty przepływ CI lub labu; dowieść testem, że deny uniemożliwia wywołanie executora. | P2 |
| [observability-monitor-agent](https://github.com/JeanneBM/observability-monitor-agent) | PoC monitoringu | Reguły, JSONL/Kubernetes, watch, SQLite i health; CI zielone. Emitery są opisane jako zintegrowane, brak tu dowodu pełnego live cyklu. | [Test monitor: success](https://github.com/JeanneBM/observability-monitor-agent/actions/runs/38720770387) | Zebrać prawdziwe zdarzenia z jednego agenta; sprawdzić alarm, restart i przerwę źródła. | P2 |
| [langgraph-ci-repair-agent](https://github.com/JeanneBM/langgraph-ci-repair-agent) | PoC na scenariuszach | LangGraph, 4 scenariusze, polityka, checkpointy i zgoda człowieka; CI zielone. Brak realnego PR i zdalnego CI. | [Tests: success](https://github.com/JeanneBM/langgraph-ci-repair-agent/actions/runs/38720793161) | Sprawdzić live model na S01; następnie adapter rzeczywistych logów Actions i izolowana walidacja patcha. | P2 |
| [offline-environment-auditor](https://github.com/JeanneBM/offline-environment-auditor) | Deterministyczny PoC | Audyt snapshotów K8s, import Trivy, offline scanner adapter i raport HTML/JSON; CI zielone. | [offline-python-checks: success](https://github.com/JeanneBM/offline-environment-auditor/actions/runs/40488555390) | Zweryfikować Trivy na realnym lokalnym archiwum z siecią wyłączoną i ocenić fałszywe alarmy snapshotów. | P2 |

### P3 — dalsze walidacje i usprawnienia

Po podstawowych zadaniach P1/P2 albo po świadomym wybraniu danego projektu do najbliższego demo.

| Repozytorium | Stan | Co potwierdza stan / ograniczenie | Ostatni dostępny CI | Następny krok | Priorytet |
|---|---|---|---|---|---|
| [regulatory-rag-assistant](https://github.com/JeanneBM/regulatory-rag-assistant) | PoC / offline | TF-IDF, parser AI Act/DORA, cytowania, CLI i Streamlit; CI zielone. Live ingestion i Azure niezweryfikowane. | [Tests: success](https://github.com/JeanneBM/regulatory-rag-assistant/actions/runs/39464300600) | Wykonać ingestion EUR-Lex, sprawdzić granice artykułów, potem 30–50 ocenionych pytań i pomiary retrieval/odmowy. | P3 |
| [dual-agent-code-workbench](https://github.com/JeanneBM/dual-agent-code-workbench) | Lokalny PoC | Streamlit, autor/recenzent GPT–Claude, import PR, historia; CI zielone. Demo skryptowane, API testowane mockami. | [Tests: success](https://github.com/JeanneBM/dual-agent-code-workbench/actions/runs/39328615064) | Uruchomić demo, potem jeden kontrolowany live run obu modeli i ocenić propozycję oraz recenzję. | P3 |
| [reusable-github-actions](https://github.com/JeanneBM/reusable-github-actions) | Starter | Katalogi setup-terraform/trivy/cosign i security-scan; brak własnych zapisanych runów CI. | Brak zapisanych runów Actions | Dodać workflow konsumenta, który wywoła akcje i sprawdzi faktyczne efekty oraz błędy. | P3 |
| [jb_myKubeApp](https://github.com/JeanneBM/jb_myKubeApp) | Lab implementowany | Python + Java + Jenkins, kind, skrypty i testy; CI zielone. | [CI: success](https://github.com/JeanneBM/jb_myKubeApp/actions/runs/38600264559) | Potwierdzić świeży pełny start oraz smoke na lokalnym kind i zachować krótki dowód demo. | P3 |

### P4 — rozwój zależny od wcześniejszych wyników

To zależności techniczne, nie terminy. Lab po pierwszym pilocie Readiness; Anomaly ML po zebraniu telemetrii; wspólna platforma po niezależnym sprawdzeniu jej aplikacji.

| Repozytorium | Stan | Co potwierdza stan / ograniczenie | Ostatni dostępny CI | Następny krok | Priorytet |
|---|---|---|---|---|---|
| [azure-kubernetes-agentic-ops-lab](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-lab) | Koncepcja | Tylko README; cztery role i roadmapa, brak implementacji. | Brak zapisanych runów Actions | Napisać kontrakt nagrania i deterministyczny replay jednego S01; potem pętla na kind. | P4 |
| [agent-anomaly-ml](https://github.com/JeanneBM/agent-anomaly-ml) | Eksperyment syntetyczny | Reguły, robust-z, Mahalanobis, Isolation Forest i wyniki wielu seedów; brak zapisanych runów Actions. | Brak zapisanych runów Actions | Dodać CI istniejących testów i adapter realnej telemetrii monitora; skalibrować na osobnych znanych dobrych runach. | P4 |
| [agents-platform-bicep](https://github.com/JeanneBM/agents-platform-bicep) | Implementacja / przed live Azure | Bicep, up/status/down, przypięte repo i adaptery; ostatni validate zielony. Dokumentacja nie potwierdza live wdrożenia. | [validate: success](https://github.com/JeanneBM/agents-platform-bicep/actions/runs/38721114721) | Po niezależnej walidacji aplikacji wykonać jeden pełny up → smoke → status → down z raportami. | P4 |

### P5 — utrzymanie i zadania o niskiej pilności

Wykonywać przy powrocie do projektu lub przygotowywaniu demonstracji. Starsze etapy Agentic Ops zachować jako historię; nie rozwijać wszystkich równolegle.

| Repozytorium | Stan | Co potwierdza stan / ograniczenie | Ostatni dostępny CI | Następny krok | Priorytet |
|---|---|---|---|---|---|
| [archive](https://github.com/JeanneBM/archive) | Zbiór historyczny | Kopie materiałów i kodu; README zawiera skrypt archiwizacji/usuwania zamiast katalogu zasobów. | Brak zapisanych runów Actions | Zastąpić stronę główną czytelnym indeksem pochodzenia; zachować materiały i historię. | P5 |
| [azure-kubernetes-agentic-ops](https://github.com/JeanneBM/azure-kubernetes-agentic-ops) | Wcześniejsza implementacja | Kod, manifesty i testy; ostatni Security zielony. Poprzednik PoC/Eval. | [pip in /. - Update #1660987589: success](https://github.com/JeanneBM/azure-kubernetes-agentic-ops/actions/runs/40727324467) | Oznaczyć rolę historyczną i wskazać Eval v0.2.0/Lab; nie rozwijać równoległej wersji bez potrzeby. | P5 |
| [azure-kubernetes-agentic-ops-poc](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-poc) | Poprzedni etap | Kod dwóch agentów, dokumentacja i demo; Test/Security zielone. | [Security: success](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-poc/actions/runs/40848537187) | Zachować demo i historię; jasno wskazać, że wyniki końcowe są w Eval, a nowy rozwój w Lab. | P5 |
| [jb_DevoteeDistro](https://github.com/JeanneBM/jb_DevoteeDistro) | Częściowy prototyp | README ze strukturą planowanej dystrybucji, materiały i pojedynczy skrypt; pełna struktura nieobecna. | Brak zapisanych runów Actions | Uzgodnić README z plikami; jeśli wraca do rozwoju, uruchomić checker oddzielnie od instalacji systemu. | P5 |
| [jb_ImageMatcher](https://github.com/JeanneBM/jb_ImageMatcher) | Mały prototyp | image_matcher.py, requirements i opis użycia; brak CI. | Brak zapisanych runów Actions | Sprawdzić na opisanym zbiorze zdjęć i zmierzyć trafność oraz błędne dopasowania. | P5 |
| [jb_IoT](https://github.com/JeanneBM/jb_IoT) | Prototypy / warsztaty | Szkice Arduino, katalogi warsztatów i zdjęcia. | Brak zapisanych runów Actions | Opisać sprzęt oraz jedno odtwarzalne demo, jeśli ma pozostać w portfolio. | P5 |
| [jb_OrderBook](https://github.com/JeanneBM/jb_OrderBook) | Mała aplikacja Java | Kod App.java i opis operacji order book; brak CI. | Brak zapisanych runów Actions | Dodać komendę build/run i testy podstawowych operacji przed rozwojem. | P5 |
| [jb_StrideMate](https://github.com/JeanneBM/jb_StrideMate) | Częściowy prototyp | Skrypty przetwarzania zdjęć i danych; README opisuje szerszą wizję bez pełnego dowodu działania. | Brak zapisanych runów Actions | Doprowadzić jedno zdjęcie do poprawnie odczytanego rekordu; ocenić jakość ekstrakcji przed modelowaniem planu. | P5 |
| [jb_symfony-roadrunner-task-api-devops](https://github.com/JeanneBM/jb_symfony-roadrunner-task-api-devops) | Implementacja / wyczyszczono APP_SECRET | PHP/Symfony, Compose, PostgreSQL/Redis, konfiguracje testów; brak zapisanych runów Actions. | Brak zapisanych runów Actions | Ustawić NOWY APP_SECRET i hasło bazy lokalnie; zmienić stare, jeśli używane. Odtworzyć uruchomienie, wykonać testy i opisać wyniki; traktować jako oddzielny przykład DevOps. | P5 |
| [n8n-self-hosted-lab](https://github.com/JeanneBM/n8n-self-hosted-lab) | Konfiguracja labu | Compose SQLite/PostgreSQL oraz backup/restore; brak zapisanych runów Actions. | Brak zapisanych runów Actions | Zweryfikować odtworzenie workflow z backupu; dla PostgreSQL dodać i przetestować osobny backup bazy. | P5 |
| [Online-Chat-Server-Contest-Requirements](https://github.com/JeanneBM/Online-Chat-Server-Contest-Requirements) | Aplikacja / usunięto śledzony .env | Spring Boot, frontend, Compose, testy i mapa wymagań; CI regresji backend/frontend po sanitizacji zielone; testowy JWT jest generowany losowo. | [Chat regression tests: success](https://github.com/JeanneBM/Online-Chat-Server-Contest-Requirements/actions/runs/41056965260) | Ustawić NOWE lokalne sekrety; odwołać stare, jeżeli były używane. Następnie wykonać smoke dwóch użytkowników na PostgreSQL/Compose i zestawić z pozostałymi lukami wymagań. | P5 |

### P6 — backlog: bez aktywnego zobowiązania

Pomysły do ponownego wyboru po zakończeniu bieżących eksperymentów.

| Repozytorium | Stan | Co potwierdza stan / ograniczenie | Ostatni dostępny CI | Następny krok | Priorytet |
|---|---|---|---|---|---|
| [jb_pyAWS](https://github.com/JeanneBM/jb_pyAWS) | Pomysł / opis | Tylko README o automatyzacji AWS; brak skryptów implementujących opis. | Brak zapisanych runów Actions | Oznaczyć jako koncepcję; implementować tylko po wybraniu konkretnego zastosowania. | P6 |
| [LLM-as-a-judge-multi-agent](https://github.com/JeanneBM/LLM-as-a-judge-multi-agent) | Pomysł | Tylko nagłówek README, brak kodu. | Brak zapisanych runów Actions | Zostawić w backlogu; najpierw zdefiniować rubrykę, ludzkie etykiety i punkt odniesienia. | P6 |

### P7 — materiały referencyjne i historia

Brak pilnej pracy wdrożeniowej. Porządkowanie dokumentacji jest opcjonalne i wykonywane przy korzystaniu z materiałów; zachowanie nie oznacza usunięcia ani archiwizacji repo.

| Repozytorium | Stan | Co potwierdza stan / ograniczenie | Ostatni dostępny CI | Następny krok | Priorytet |
|---|---|---|---|---|---|
| [ai-knowledge-base](https://github.com/JeanneBM/ai-knowledge-base) | Baza wiedzy | Materiały kursów, agentów i AI; lokalną konfigurację Foundry zastąpiono anonimowym .env.example. | Brak zapisanych runów Actions | Dodać mapę wejścia: podstawy, agenci, ewaluacja, bezpieczeństwo i projekty praktyczne. | P7 |
| [ai-security](https://github.com/JeanneBM/ai-security) | Materiały koncepcyjne | Dokumenty control-management, DORA i AI Act; brak aplikacji. | Brak zapisanych runów Actions | Uporządkować indeks i wskazać źródła oraz daty; wybrać jeden praktyczny przykład kontroli. | P7 |
| [aideas-ai-agents](https://github.com/JeanneBM/aideas-ai-agents) | Materiały szkoleniowe | Zrzuty, materiały genAI i prompt; nie jest to gotowy system agentowy. | Brak zapisanych runów Actions | Opisać jedno ćwiczenie: wejście, rozwiązanie i rezultat; zachować jako materiały. | P7 |
| [azure-knowledge-base](https://github.com/JeanneBM/azure-knowledge-base) | Baza wiedzy | Materiały certyfikacyjne AB-100/AB-620/AZ-104/GH-500; skromny główny README. | Brak zapisanych runów Actions | Dodać indeks egzaminów i oznaczyć daty aktualności materiałów. | P7 |
| [containers-knowledge-base](https://github.com/JeanneBM/containers-knowledge-base) | Baza wiedzy | Materiały Docker/K8s/Istio/Operators i środowiska. | Brak zapisanych runów Actions | Dodać mapę materiałów i wskazać aktualne działające laby. | P7 |
| [IBMi-knowledge-base](https://github.com/JeanneBM/IBMi-knowledge-base) | Zarchiwizowana baza wiedzy (archived) | Repo archived; README z materiałami IBM i. | Brak zapisanych runów Actions | Zachować jako referencję; brak potrzeby dalszej pracy przy obecnym kierunku AI. | P7 |
| [International-Business-Machines](https://github.com/JeanneBM/International-Business-Machines) | Materiały historyczne | Katalogi IBM Cloud, Containers, Python i DevOps; brak README. | Brak zapisanych runów Actions | Dodać krótki opis źródeł i zakresu; zachować. | P7 |
| [java-knowledge-base](https://github.com/JeanneBM/java-knowledge-base) | Baza wiedzy | Duży zbiór ćwiczeń i notatek Java. | Brak zapisanych runów Actions | Uporządkować indeks; rozwijać jedynie przy potrzebie powtórek Java. | P7 |
| [jb_Ansible](https://github.com/JeanneBM/jb_Ansible) | Materiały | Notatki i materiały Ansible/RHCE. | Brak zapisanych runów Actions | Zachować; nie nadawać priorytetu względem projektów AI. | P7 |
| [jb_CPP](https://github.com/JeanneBM/jb_CPP) | Ćwiczenia historyczne | Kod i materiały C++; brak głównego README.md. | Brak zapisanych runów Actions | Dodać krótki opis historycznego zbioru; bez rozbudowy w obecnej ścieżce. | P7 |
| [jb_DataBase](https://github.com/JeanneBM/jb_DataBase) | Materiały | SQL, PostgreSQL, MySQL i ćwiczenia; brak głównego README.md. | Brak zapisanych runów Actions | Dodać indeks oraz jeden przykład uruchomienia SQL na testowej bazie. | P7 |
| [jb_Dev_PyCalculator](https://github.com/JeanneBM/jb_Dev_PyCalculator) | Historyczny projekt | Kalkulator Python, testy i konfiguracja Travis. | Brak zapisanych runów Actions | Oznaczyć historyczny zakres i sposób uruchomienia; bez równoległej rozbudowy. | P7 |
| [jb_DevSecOps](https://github.com/JeanneBM/jb_DevSecOps) | Materiały | Katalogi CI/CD, Security, SDLC, DORA i kursów; brak głównego README.md. | Brak zapisanych runów Actions | Dodać indeks i linki do nowszych baz wiedzy bez kopiowania całej treści. | P7 |
| [jb_Dictionary](https://github.com/JeanneBM/jb_Dictionary) | Słownik | Pliki terminologii programowania, języków i SQL. | Brak zapisanych runów Actions | Dodać prosty indeks; rozwój wyłącznie w miarę potrzeb. | P7 |
| [jb_FlywayNewRepo](https://github.com/JeanneBM/jb_FlywayNewRepo) | Historyczny lab | Materiały/kod pod katalogiem branch - release-1; brak README. | Brak zapisanych runów Actions | Opisać scenariusz migracji i kolejność wykonania, jeśli przykład ma być używany. | P7 |
| [jb_Groovy](https://github.com/JeanneBM/jb_Groovy) | Zbiór skryptów | Przykłady Jenkinsfile/Groovy; prawie pusty README. | Brak zapisanych runów Actions | Opisać cel, wejścia i wymagane pluginy każdego przykładu. | P7 |
| [jb_Helper](https://github.com/JeanneBM/jb_Helper) | Notatki / przykłady | Materiały Vault i katalogi erste/zweite. | Brak zapisanych runów Actions | Opisać zakres katalogów; zachować jako referencję. | P7 |
| [jb_moj_projekt_panda](https://github.com/JeanneBM/jb_moj_projekt_panda) | Historyczna aplikacja | Spring Boot/Thymeleaf, Maven i testy. | Brak zapisanych runów Actions | Zachować; uzupełnić opis build/run tylko jeśli ma być pokazywana. | P7 |
| [jb_projektowe](https://github.com/JeanneBM/jb_projektowe) | Historyczny lab | Java/Maven, Jenkinsfile, Dockerfile i testy; powiązanie z pandaenv. | Brak zapisanych runów Actions | Opisać powiązanie z repo środowiska i zachować jako dawny lab CI/CD. | P7 |
| [jb_projektoweAWS](https://github.com/JeanneBM/jb_projektoweAWS) | Historyczny lab AWS | Java/Maven, Jenkins, Terraform i Ansible. | Brak zapisanych runów Actions | Zachować; przed jakimkolwiek uruchomieniem sprawdzić konfigurację i koszty infrastruktury. | P7 |
| [jb_pytest_env](https://github.com/JeanneBM/jb_pytest_env) | Historyczne ćwiczenia | Python i testy, w tym Selenium; README szczątkowe. | Brak zapisanych runów Actions | Dodać opis środowiska i zakresu ćwiczeń; uruchamiać dopiero przy potrzebie. | P7 |
| [jb_Rubi](https://github.com/JeanneBM/jb_Rubi) | Ćwiczenia Ruby | Skrypty Ruby i katalog RubyOnRails; brak README. | Brak zapisanych runów Actions | Krótko opisać zbiór i zachować. | P7 |
| [jb_Saffron](https://github.com/JeanneBM/jb_Saffron) | Materiały osobiste / edukacyjne | Zbiór tematów, wzorców, języków i notatek; brak README. | Brak zapisanych runów Actions | Nadać prosty opis przeznaczenia; bez obowiązku rozwoju. | P7 |
| [jb_sample](https://github.com/JeanneBM/jb_sample) | Historyczny przykład Java | Maven/Jetty, README wskazuje JDK 7, są artefakty target. | Brak zapisanych runów Actions | Oznaczyć stary runtime i status referencyjny; modernizować tylko jako osobny cel. | P7 |
| [jb_Terraform](https://github.com/JeanneBM/jb_Terraform) | Materiały / przykład | README instalacyjne, Summary.tf i materiały egzaminacyjne. | Brak zapisanych runów Actions | Oddzielić notatki od przykładu IaC; opisać wymagania, jeśli przykład ma być uruchamiany. | P7 |
| [jb_TheList](https://github.com/JeanneBM/jb_TheList) | Materiały / konfiguracje | Katalogi Centos7, Template, tomcat i inne; pusty README. | Brak zapisanych runów Actions | Wyjaśnić przeznaczenie i historyczny zakres; bez rozszerzania teraz. | P7 |
| [jb_Tools](https://github.com/JeanneBM/jb_Tools) | Zbiór narzędzi | Komendy i przykłady AWS/Docker/Jenkins/Maven; brak README. | Brak zapisanych runów Actions | Dodać mapę zawartości i wskazać bezpieczne środowisko testowe skryptów. | P7 |
| [jb_VariousDemos](https://github.com/JeanneBM/jb_VariousDemos) | Ćwiczenia | Przykłady CSS/Groovy/HTML/JavaScript; brak README. | Brak zapisanych runów Actions | Dodać indeks przykładów, zachować jako materiał. | P7 |
| [jb_WelcomesApplication](https://github.com/JeanneBM/jb_WelcomesApplication) | Mały projekt Java | Kod aplikacji i katalog test; brak README. | Brak zapisanych runów Actions | Dodać krótki opis i komendę uruchomienia; bez priorytetu rozwoju. | P7 |
| [jb_Workshops](https://github.com/JeanneBM/jb_Workshops) | Lista źródeł | Tylko README z linkami do wyszukiwania wydarzeń. | Brak zapisanych runów Actions | Zostawić jako prywatny punkt odniesienia lub uporządkować linki; nie traktować jako projekt kodowy. | P7 |
| [linux-knowledge-base](https://github.com/JeanneBM/linux-knowledge-base) | Baza wiedzy | Notatki, komendy, skrypty i materiały Linux. | Brak zapisanych runów Actions | Dodać prosty indeks tematów i osobno oznaczyć przykłady oraz rzeczywiste notatki operacyjne. | P7 |
| [multicould-knowledge-base](https://github.com/JeanneBM/multicould-knowledge-base) | Baza wiedzy | Katalogi AWS, Azure, GCP, IBM i Notes; brak głównego README.md. | Brak zapisanych runów Actions | Dodać krótki indeks katalogów i ich zakresu. | P7 |
| [PyCalculator-python-ibm-mentoring](https://github.com/JeanneBM/PyCalculator-python-ibm-mentoring) | Zarchiwizowany projekt (archived) | Kod kalkulatora, testy i stare badge; archived. | Brak zapisanych runów Actions | Zachować jako historię mentoringu; nie wracać do utrzymania bez konkretnej potrzeby. | P7 |
| [python-knowledge-base](https://github.com/JeanneBM/python-knowledge-base) | Baza wiedzy | Obszerna powtórka PL i przykłady; brak runów Actions. | Brak zapisanych runów Actions | Używać do powtórek; wybrane wykonywalne przykłady weryfikować przed dopisywaniem. | P7 |
| [quantum-progamming](https://github.com/JeanneBM/quantum-progamming) | Notatki / materiały | README ze zrzutami; brak programu do uruchomienia. | Brak zapisanych runów Actions | Dodać jeden odtwarzalny notebook/eksperyment tylko gdy wracasz do Qiskit. | P7 |
| [security-knowledge-base](https://github.com/JeanneBM/security-knowledge-base) | Baza wiedzy | Powtórka DevSecOps/SAST/SCA/Trivy/SBOM i materiały; brak runów Actions. | Brak zapisanych runów Actions | Powiązać pojęcia z przykładami z własnych projektów; aktualizować w miarę nauki. | P7 |

### Zamknięte etapy — brak działań

Repozytoria ukończone w ustalonym zakresie; nie są częścią aktywnej kolejki. Historyczne ograniczenia wyników pozostają opisane w dokumentacji projektu. Niepotwierdzony w dawnym closeout cleanup nie jest tu ponownie otwierany jako zadanie; raport nie stanowi niezależnego potwierdzenia stanu Azure.

| Repozytorium | Stan | Co potwierdza stan / ograniczenie | Ostatni dostępny CI | Następny krok | Priorytet |
|---|---|---|---|---|---|
| [azure-kubernetes-agentic-ops-eval](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-eval) | Zamknięty eksperyment | v0.2.0 opublikowane; wyniki i ograniczenia zachowane, ostatnie Test/Security zielone. | [Security: success](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-eval/actions/runs/40859006483) | Brak dalszych działań w zamkniętym etapie. Nowe eksperymenty prowadzić w Lab. | — (zamknięte) |

## Forki — P7, pełna tabela 71 repo

Priorytet P7: zachować jako referencje; nie są częścią aktywnej kolejki wdrożeniowej.

Nie przypisuję tym repo statusu własnego produktu. Każde może mieć wartość edukacyjną; bez porównania commitów nie stwierdzam, czy zawiera własne zmiany.

| Repozytorium | Stan | Następny krok |
|---|---|---|
| [alexa-skill-watson-assistant](https://github.com/JeanneBM/alexa-skill-watson-assistant) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [ansible-1](https://github.com/JeanneBM/ansible-1) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [apache-groovy-course](https://github.com/JeanneBM/apache-groovy-course) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [APE](https://github.com/JeanneBM/APE) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [Apollo](https://github.com/JeanneBM/Apollo) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [app-modernization-plants-by-websphere-jee6](https://github.com/JeanneBM/app-modernization-plants-by-websphere-jee6) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [aws-deepracer-for-cloud](https://github.com/JeanneBM/aws-deepracer-for-cloud) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [aws-eks](https://github.com/JeanneBM/aws-eks) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [aws-lambda-developer-guide](https://github.com/JeanneBM/aws-lambda-developer-guide) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [AZ-303-Microsoft-Azure-Architect-Technologies](https://github.com/JeanneBM/AZ-303-Microsoft-Azure-Architect-Technologies) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [azure-devops-docs](https://github.com/JeanneBM/azure-devops-docs) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [cloud-native-starter](https://github.com/JeanneBM/cloud-native-starter) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [cluster-bootstrap](https://github.com/JeanneBM/cluster-bootstrap) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [content-aks-basics](https://github.com/JeanneBM/content-aks-basics) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [cookiecutter-pytest-plugin](https://github.com/JeanneBM/cookiecutter-pytest-plugin) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [course-material](https://github.com/JeanneBM/course-material) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [coursera-deep-learning-specialization](https://github.com/JeanneBM/coursera-deep-learning-specialization) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [Credit-Suisse-Coding-Challenge-2019](https://github.com/JeanneBM/Credit-Suisse-Coding-Challenge-2019) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [CreditSuisse](https://github.com/JeanneBM/CreditSuisse) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [creditSuisse-1](https://github.com/JeanneBM/creditSuisse-1) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [Deep-Learning-Explained](https://github.com/JeanneBM/Deep-Learning-Explained) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [demo](https://github.com/JeanneBM/demo) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [DevOps-Python-tools](https://github.com/JeanneBM/DevOps-Python-tools) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [devsecops-workshop.github.io](https://github.com/JeanneBM/devsecops-workshop.github.io) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [docker](https://github.com/JeanneBM/docker) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [docker-flask](https://github.com/JeanneBM/docker-flask) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [docker-python](https://github.com/JeanneBM/docker-python) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [dockerfiles](https://github.com/JeanneBM/dockerfiles) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [docs](https://github.com/JeanneBM/docs) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [eShopOnWeb](https://github.com/JeanneBM/eShopOnWeb) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [fhe-toolkit-linux](https://github.com/JeanneBM/fhe-toolkit-linux) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [flask_calculator_basic](https://github.com/JeanneBM/flask_calculator_basic) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [flask-on-docker](https://github.com/JeanneBM/flask-on-docker) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [flask-restful](https://github.com/JeanneBM/flask-restful) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [FrontierWeekHack](https://github.com/JeanneBM/FrontierWeekHack) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [HackZurich2019](https://github.com/JeanneBM/HackZurich2019) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [Hands-On-Docker-for-Microservices-with-Python](https://github.com/JeanneBM/Hands-On-Docker-for-Microservices-with-Python) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [introduction-to-postman-course](https://github.com/JeanneBM/introduction-to-postman-course) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [ipython](https://github.com/JeanneBM/ipython) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [jenkins-tutorial](https://github.com/JeanneBM/jenkins-tutorial) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [jwst](https://github.com/JeanneBM/jwst) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [K8S_taco-fleet](https://github.com/JeanneBM/K8S_taco-fleet) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [KubeArmor](https://github.com/JeanneBM/KubeArmor) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [kubectl](https://github.com/JeanneBM/kubectl) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [kubernetes-the-hard-way](https://github.com/JeanneBM/kubernetes-the-hard-way) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [kubetools](https://github.com/JeanneBM/kubetools) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [kubeview](https://github.com/JeanneBM/kubeview) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [lightweight-rest-tester](https://github.com/JeanneBM/lightweight-rest-tester) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [mcp-agent](https://github.com/JeanneBM/mcp-agent) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [meinheld-gunicorn-flask-docker](https://github.com/JeanneBM/meinheld-gunicorn-flask-docker) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [microservices-demo](https://github.com/JeanneBM/microservices-demo) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [microservices-demo-1](https://github.com/JeanneBM/microservices-demo-1) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [open-mercato](https://github.com/JeanneBM/open-mercato) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [pipeline](https://github.com/JeanneBM/pipeline) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [pipeline-examples](https://github.com/JeanneBM/pipeline-examples) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [Projects](https://github.com/JeanneBM/Projects) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [pytest](https://github.com/JeanneBM/pytest) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [pytest-docker](https://github.com/JeanneBM/pytest-docker) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [python-flask-app](https://github.com/JeanneBM/python-flask-app) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [python-project-structure](https://github.com/JeanneBM/python-project-structure) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [Python-Pytest-Selenium](https://github.com/JeanneBM/Python-Pytest-Selenium) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [python-testing-101](https://github.com/JeanneBM/python-testing-101) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [python-unittest-tutorial](https://github.com/JeanneBM/python-unittest-tutorial) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [REST_API_Test_Framework_Python](https://github.com/JeanneBM/REST_API_Test_Framework_Python) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [sonar-project](https://github.com/JeanneBM/sonar-project) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [spring-boot-microservices-on-kubernetes](https://github.com/JeanneBM/spring-boot-microservices-on-kubernetes) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [Terraform_version_manager_repo](https://github.com/JeanneBM/Terraform_version_manager_repo) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [terraform-provider-aws](https://github.com/JeanneBM/terraform-provider-aws) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [tjbot](https://github.com/JeanneBM/tjbot) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [Vagrant](https://github.com/JeanneBM/Vagrant) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |
| [workshops](https://github.com/JeanneBM/workshops) | Fork; referencja upstream | Zachować. W razie prezentowania własnego wkładu wskazać swoje commity/PR; rozwijać tylko przy konkretnej potrzebie. |

## Konkretne uwagi

- Profil nadal zawiera „Evaluation is ongoing”; Eval ma już opublikowane v0.2.0. Warto dodać link do wydania i krótki wynik, z ograniczeniem zakresu.
- Foundry RAG: ostatni dostępny run Actions to failure z 20 sierpnia 2026, podczas gdy repo było później zmieniane. Odpowiedź jobs dla tego runu była pusta: przyczyny nie ustalono. Najpierw ponowne CI na aktualnym main, potem diagnoza na podstawie komunikatów.
- Lab i LLM-as-a-judge-multi-agent: w drzewie tylko README. jb_pyAWS również ma wyłącznie README.
- Readiness ma działającą implementację i offline/native-Go checks, ale dokumentacja pozostawia pełny kind pipeline i model pilot do lokalnej walidacji.
- Agent Policy Guard nie jest jeszcze wspólną biblioteką używaną przez pozostałe repo — to konkretna luka integracyjna, nie powód do pisania kolejnego silnika.
- Monitor ma emitery i collector; Anomaly ML ma wyniki syntetyczne, a nie dowód skuteczności na realnym strumieniu.
- Aktualizacja bezpieczeństwa: w obu pandaenv potwierdzono credentials.xml z opisami poświadczeń GitHub, zapisany stan usług i literalny sekret agenta. Bieżące gałęzie final oczyszczono bez odszyfrowywania poświadczeń; rotacja i usunięcie historii pozostają niepotwierdzone. Poprzednia kwalifikacja P7 była błędna.
- Dodatkowo usunięto śledzony .env z Chat Servera, usunięto jego współdzielone domyślne sekrety runtime, wyczyszczono APP_SECRET w Symfony i zastąpiono konkretną konfigurację Foundry szablonem w ai-knowledge-base. Nie ustalono aktywności dawnych wartości.
- Weryfikacja zmian: brak rozpoznanych starych wartości w zmienionych plikach, brak usuniętych ścieżek w bieżących drzewach, poprawna składnia pięciu plików YAML. Chat Server: Maven verify i testy frontendowe przeszły po dodaniu losowego JWT wyłącznie w profilu testowym. Nie uruchamiano dawnych usług Jenkins/Artifactory ani Symfony.
- Zakres dodatkowego sprawdzenia: nazwy plików w 66 własnych repo, 76 wybranych plików konfiguracyjnych i 236 plików tekstowych w sześciu powiązanych repo. Część plików nakłada się; nie jest to pełny skan historii, archiwów, plików binarnych ani wszystkich branchy.
- Pierwotny przegląd był tylko odczytem. Po zgłoszeniu ujawnienia wprowadzono opisane wyżej zmiany sanitizujące w pięciu repo. Repozytoriów nie usuwano ani nie archiwizowano; historii Git nie przepisano.

