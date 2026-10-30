# Kolejka prac nad repozytoriami JeanneBM

Aktualizacja: 30 października 2026.

Wiersze wskazują kolejność pracy. Po zakończeniu zadania usuń je z tej listy. Zadania zależne rozpoczynaj po spełnieniu warunku w tabeli.

## P1 — najbliższa praca

Readiness jest pierwszym projektem rozwojowym do zakończenia pilota lub zmiany priorytetu przez Joannę.

| Kolejność | Repozytorium | Do zrobienia |
|---|---|---|
| 1 | [aks-readiness-diagnostic-agent](https://github.com/JeanneBM/aks-readiness-diagnostic-agent) | Sprawdzić lokalne wymagania, nagrać osiem przypadków Uvicorn/Go na kind, uruchomić A1 i powtarzany pilot C1/H na tych samych nagraniach. |
| 2 | [azure-foundry-rag-agent](https://github.com/JeanneBM/azure-foundry-rag-agent) | Uruchomić CI na aktualnym main i naprawić ewentualne błędy. Następnie wykonać setup → pytanie znane/nieznane → zweryfikowane usunięcie labu. |
| 3 | [JeanneBM](https://github.com/JeanneBM/JeanneBM) | Zaktualizować README profilu: status Eval i link do v0.2.0; uwzględnić Readiness, Lab i Auditor w krótkiej formie. |

## P2 — integracje i walidacja kluczowych PoC

| Kolejność | Repozytorium | Do zrobienia |
|---|---|---|
| 1 | [agent-policy-guard](https://github.com/JeanneBM/agent-policy-guard) | Podłączyć jeden rzeczywisty przepływ CI lub labu. Testem wykazać, że decyzja deny uniemożliwia wywołanie executora. |
| 2 | [observability-monitor-agent](https://github.com/JeanneBM/observability-monitor-agent) | Zebrać prawdziwe zdarzenia wybranego agenta. Sprawdzić alarm, restart kolektora i utratę źródła. |
| 3 | [langgraph-ci-repair-agent](https://github.com/JeanneBM/langgraph-ci-repair-agent) | Sprawdzić live model na S01. Następnie dołączyć rzeczywiste logi Actions i izolowaną walidację patcha. |
| 4 | [offline-environment-auditor](https://github.com/JeanneBM/offline-environment-auditor) | Zweryfikować Trivy na rzeczywistym lokalnym archiwum obrazu z wyłączoną siecią. Ocenić fałszywe alarmy na reprezentatywnych snapshotach. |

## P3 — kolejne aktywne projekty

| Kolejność | Repozytorium | Do zrobienia |
|---|---|---|
| 1 | [regulatory-rag-assistant](https://github.com/JeanneBM/regulatory-rag-assistant) | Wykonać import EUR-Lex i sprawdzić granice artykułów. Przygotować 30–50 ocenionych pytań oraz zmierzyć retrieval, cytowania, odmowy i odpowiedzi. |
| 2 | [dual-agent-code-workbench](https://github.com/JeanneBM/dual-agent-code-workbench) | Uruchomić demo, potem kontrolowane zadanie na rzeczywistych API obu modeli. Ocenić propozycję i recenzję. |
| 3 | [reusable-github-actions](https://github.com/JeanneBM/reusable-github-actions) | Dodać workflow konsumenta, który uruchamia akcje i sprawdza ich rezultaty oraz obsługę błędów. |
| 4 | [jb_myKubeApp](https://github.com/JeanneBM/jb_myKubeApp) | Sprawdzić świeży pełny start na kind i smoke test. Zachować dowód działania demo. |

## P4 — zadania zależne od wcześniejszych wyników

| Kolejność | Repozytorium | Warunek rozpoczęcia | Do zrobienia |
|---|---|---|---|
| 1 | [azure-kubernetes-agentic-ops-lab](https://github.com/JeanneBM/azure-kubernetes-agentic-ops-lab) | Pierwszy pilot Readiness | Napisać kontrakt nagrania i deterministyczny replay jednego S01, następnie pętlę eksperymentu na kind. |
| 2 | [agent-anomaly-ml](https://github.com/JeanneBM/agent-anomaly-ml) | Rzeczywista telemetria z monitora | Dodać CI istniejących testów oraz adapter telemetrii; skalibrować detektory na osobnych, ocenionych poprawnych runach. |
| 3 | [agents-platform-bicep](https://github.com/JeanneBM/agents-platform-bicep) | Niezależna walidacja aplikacji | Wykonać pełny up → smoke → status → down z raportami i potwierdzonym usunięciem zasobów. |

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
