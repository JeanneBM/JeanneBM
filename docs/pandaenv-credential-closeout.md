# Domknięcie P0 — historyczne laby Panda

Stan na 30 października 2026 po wykonaniu skryptu przez Joannę.

## Wykonane i zweryfikowane

- Bieżące pliki obu repo są oczyszczone z zapisanego stanu Jenkins/Artifactory, kluczy i literalnych sekretów agenta.
- Historia obu gałęzi `final` została przepisana. Zweryfikowano bezpośrednio przez API wszystkie osiągalne commity: 2 w `jb_pandaenv`, 3 w `jb_pandaenvAWS`. W żadnym snapshotcie nie ma dawnych wolumenów i wskazanych plików poświadczeń.
- W obu repo istnieje jedna gałąź `final` i brak tagów.

| Repo | Zweryfikowany head po przepisaniu |
|---|---|
| `JeanneBM/jb_pandaenv` | `568363eed8d94e089139e5107d55df545ce49206` |
| `JeanneBM/jb_pandaenvAWS` | `034728e57ded9925bb340dae8ef9f1e369bb8d14` |

[Skrypt](../scripts/clear-pandaenv-history.ps1) pozostaje zapisem wykonanej operacji. Nie uruchamiać go ponownie: jego zapisane stare heady celowo już nie pasują. Zachowano oczyszczony układ historii; stare hashe i podpisy nie mogą pozostać po przepisaniu.

## Pozostałe czynności — niepotwierdzone

1. W ustawieniach odpowiednich kont GitHub odwołać nadal używane tokeny powiązane z historycznymi poświadczeniami „personal github” i „Github JoannaDemo”. Zmienić nadal używane ujawnione hasła. Nie wklejać wartości do czatu ani raportu.
2. Dla istniejących instancji Jenkins/Artifactory zmienić odpowiednie dane administratora, tokeny, sekrety agentów i klucze zgodnie z procedurą usługi. Jeśli stare instancje nie istnieją i dane nie są ponownie używane, zapisać to jako „nie dotyczy”; nie odtwarzać dawnych wolumenów w celu rotacji.
3. Zgłosić do GitHub Support usunięcie nieosiągalnych commitów/cache/refów PR z ujawnionymi danymi. Przepisanie gałęzi nie dowodzi usunięcia obiektów z infrastruktury GitHuba, forków ani cudzych klonów.

Używać świeżych klonów obu repo. Nie scalać ani nie wypychać starej historii z dawnych kopii. Sam brak sekretów w obecnych gałęziach nie potwierdza unieważnienia dawnych poświadczeń ani usunięcia kopii zewnętrznych.
