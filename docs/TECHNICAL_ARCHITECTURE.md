# Technische Architektur – zunächst plattformneutral

**Wichtig:** Noch kein Spiel-Source-Code vorhanden. Diese Struktur ist ein **Vorschlag**, der nach Auswahl der Plattform angepasst werden darf.

## Zielstruktur

~~~
/
  README.md, AGENTS.md, CLAUDE.md, CONTRIBUTING.md
  docs/                   Entscheidungen, Plan, Tests und Übergaben
  .github/                Issue-/PR-Vorlagen
  games/
    roblox/
      <spielname>/         eigenes Projekt, Scripts, UI, Assets/Manifeste, Tests
    fortnite/
      <spielname>/         Verse, Konfigurationen, Asset-Referenzen, Tests
  shared/                 nur wenn nachweislich mehrfach benötigt
~~~

**Leere Zielordner werden noch nicht angelegt.** Erst das ausgewählte Spiel erhält einen eigenen Ordner.

## Architekturprinzipien
- Eine klare Trennung von **Spielmechanik**, **UI**, **Konfiguration**, **Daten/Persistenz** und **Monetarisierung**.
- Klein anfangen; kein Framework bauen, bevor es ein reales Problem löst.
- Plattformtypisches Coding bevorzugen (Roblox: Luau; UEFN: Verse).
- Dokumentierte und versionierte Änderungen; kritische Editor-Objekte nicht nur in unsichtbarem Chat-Kontext speichern.
- Für Roblox nach Plattformauswahl entscheiden, ob Rojo und ein textbasierter Workflow den Aufwand rechtfertigen.
- Für UEFN Asset- und Binärdateien gesondert behandeln, bei großen Dateien ggf. Git LFS verwenden. Nicht pauschal wichtige Spieldateien ignorieren.
- Keine Secrets im Repo. Konfiguration über lokale Variablen oder separate, nicht committete Dateien.
- Datenmodelle und Remote-Events niemals ungeprüft dem Client vertrauen.

## Beispiel für das kleinste Spielmodul
- Runden-Zustandsmaschine: Lobby, Running, Ended.
- Eindeutiger Timer mit Start-/Stop-/Reset-Semantik.
- Regel für Sieg/Niederlage auf dem Server.
- UI für die aktuelle Phase und Feedback.
- Testfälle für wiederholte Starts, Spielerwechsel, Abbrüche und Lag.

## Schnittstellen und Dokumentation
- Jedes Spiel erhält eine eigene Game-Spec aus docs/GAME_SPEC_TEMPLATE.md.
- Für jede persistierte Spielvariable: Herkunft, Besitzer (Server/Client), Schema und Migration beschreiben.
- Für bezahlte Funktionen: Kaufvalidierung, doppelte Events, Rückerstattung/Fehlerfälle und Plattformregeln prüfen.
- Alles vor dem ersten Produkt nur als Vorlage behandeln, nicht als bereits implementierte Architektur.

## Definition der technischen Wahrheit
**Repository-Quellstand + tatsächliche Editor-Dateien + protokollierte Tests.** Ein Screenshot oder eine Chat-Aussage allein ist kein Beweis für Reproduzierbarkeit.
