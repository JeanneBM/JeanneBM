# Domknięcie P0 — historyczne laby Panda

Stan na 30 października 2026.

## Wykonane

- Bieżące gałęzie `final` obu repo zawierają oczyszczone snapshoty: bez zapisanych wolumenów Jenkins/Artifactory i bez literalnych sekretów agenta.
- Zweryfikowano po jednej gałęzi i brak tagów. Historie mają odpowiednio 2 i 3 commity; można zachować ich kolejność, opisy i autorstwo, zastępując niebezpieczne drzewa oczyszczonymi snapshotami.
- Przygotowano [skrypt PowerShell](../scripts/clear-pandaenv-history.ps1). Przepisanie zmienia hashe commitów i nie zachowuje ich starych podpisów kryptograficznych.

## Nadal niewykonane

1. **Rotacja/unieważnienie.** W ustawieniach GitHub sprawdzić tokeny powiązane z historycznymi poświadczeniami „personal github” i „Github JoannaDemo”. Odwołać używane ujawnione tokeny; jeśli poświadczenia były hasłami i są nadal używane, zmienić je. Nie wklejać ich do czatu ani raportu. Dla działających instancji Jenkins/Artifactory zmienić odpowiednie dane administratora, tokeny, sekrety agentów i klucze zgodnie z procedurą usługi. Jeżeli stare instancje nie istnieją i dane nie są ponownie używane, zapisać ten fakt jako „nie dotyczy”; nie tworzyć ich ponownie tylko do rotacji.
2. **Historia gałęzi.** Uruchomić poniższy skrypt z komputera z Git, PowerShell i zalogowanym GitHub CLI.
3. **Pozostałe kopie GitHuba.** Po przepisaniu historii skontaktować się z GitHub Support w sprawie danych w nieosiągalnych commitach/cache/refach PR. Zmiana gałęzi nie daje gwarancji usunięcia ich z infrastruktury GitHuba, forków i cudzych klonów.

## Uruchomienie historii

Z aktualnego lokalnego checkoutu `JeanneBM/JeanneBM`, w PowerShell:

```powershell
git pull --ff-only
powershell -NoProfile -File .\scripts\clear-pandaenv-history.ps1 -VerifyOnly
```

Po poprawnym preflight uruchomić zapis:

```powershell
powershell -NoProfile -File .\scripts\clear-pandaenv-history.ps1
```

Skrypt ma zakres ograniczony do `JeanneBM/jb_pandaenv` i `JeanneBM/jb_pandaenvAWS`, gałęzi `final` oraz zapisanych, zweryfikowanych headów. Odmawia pracy po zmianie gałęzi lub pojawieniu się nowych branchy/tagów. Nie pobiera dawnych danych usług ani nie odszyfrowuje poświadczeń. Pobiera wyłącznie nowy, oczyszczony graf Git i stosuje `--force-with-lease`, więc nie nadpisze późniejszych zmian. Przed publikacją przygotowuje i weryfikuje oba grafy. Publikacja dwóch repo nie jest atomowa; komunikaty wskazują status każdego z nich.

Po udanym wykonaniu używać świeżych klonów. Nie scalać ani nie wypychać starej historii z dawnych kopii. Zachować wynik polecenia do weryfikacji raportu, bez żadnych wartości sekretów.

## Granica wykonania w tej sesji

Plugin GitHub obsługuje commity z rodzicem, ale nie utworzenie nowego commita początkowego. Lokalny runtime nie ma uwierzytelnionego GitHub CLI. Próba jednorazowego workflow nie utworzyła żadnego runu Actions; jego commit wycofano z `final`. Nie pozostawiono aktywnego workflow zapisującego historię. Dlatego skrypt jest przygotowany do wykonania przez właścicielkę, a przepisanie historii i rotacja nie są oznaczone jako wykonane.
