# KI-Workflow für Codex, Claude und andere Agents

**Ziel:** Möglichst viel echte Entwicklungsarbeit delegieren, ohne zu behaupten, dass ein Agent zuverlässig alle Editor- und Veröffentlichungsschritte autonom erledigt.

## Arbeitszyklus
1. **Kontext laden:** README -> AGENTS.md -> STATUS -> DECISIONS -> aktuelles Issue -> betroffene Quelltexte.
2. **Ziel definieren:** Ein konkretes sichtbares Verhalten samt Akzeptanzkriterien; keine unbestimmte Bitte „baue alles“.
3. **Vorgehen festlegen:** Welche Dateien, Editor-Objekte, Skripte, Assets und Tests werden benötigt?
4. **Kleine Änderung umsetzen:** Versionsstand und Backups beachten. Keine unkontrollierten großflächigen Editor-Operationen.
5. **Prüfen:** Syntax/Unit-Checks, sofern vorhanden, dann Playtest **im tatsächlichen Editor**. Scheitert der Editorzugriff, klar dokumentieren.
6. **Review:** Spielbarkeit, Onboarding, Performanz, Benutzerfreundlichkeit, Assets, Plattformrichtlinien.
7. **Übergabe:** Änderungen, Beweise, Risiken und nächster konkreter Task in Issue/PR und STATUS dokumentieren.

## Editor-Agenten – Berechtigung und Grenzen
- **Roblox Studio MCP:** Der offizielle MCP-Server erlaubt KI-Clients Interaktion mit einer geöffneten Studio-Sitzung. Agents können Datenmodell abfragen, Skripte bearbeiten, Luau ausführen und den Testmodus nutzen. Vorher lokale Originaldatei sichern.
- **Fortnite UEFN MCP:** Erlaubt unter anderem Verse-/Scene-Graph-Operationen, Creative-Device-Einstellungen und Play-Sessions. Nicht alle Details der Map-Erstellung, des Asset-Managements und der Veröffentlichung sind damit vollständig automatisiert.
- Ein Agent mit Editorzugriff kann sehr viel verändern. Kein unkontrollierter Zugriff auf bestehende produktive Maps; erst Testprojekt verwenden.
- MCP-Verbindung ist **noch nicht** für dieses konkrete Repository erprobt; docs/STATUS.md erst nach echtem Nachweis aktualisieren.

## Empfohlener Prompt für einen neuen KI-Agenten
> Lies das gesamte AGENTS.md, README.md, docs/STATUS.md, docs/DECISIONS.md und das für deine Aufgabe relevante Issue. Nenne kurz gesicherten Ist-Zustand und offene Fragen. Bearbeite dann **nur** das nächste klar abgegrenzte, überprüfbare Problem. Prüfe den Code und teste im Editor nur, wenn du echten Editorzugriff hast. Dokumentiere exakt, was du getan und getestet hast, und aktualisiere Status/Übergabe. Keine Ausgaben oder Publikationen ohne Freigabe.

## Aufgaben besser zuschneiden
**Schlecht:** „Erstelle ein vollständiges Roblox-Geldspiel.“
**Besser:** „Implementiere den Start-Countdown und die Übergänge Lobby -> Runde -> Ergebnis, vermeide doppelte Starts, dokumentiere 5 Tests und ändere sonst nichts.“

## Parallelarbeit
- Verschiedene Agents dürfen **getrennte Aufgaben/Branches** bearbeiten.
- Nur ein Agent gleichzeitig in derselben Editor-Sitzung oder an denselben Dateien, außer Änderungen werden abgesprochen.
- Merge-Konflikte bewusst lösen; keine Massen-Reverts oder erzwungene Überschreibungen.
- Nach Merge aktualisierten main-Stand laden, bevor weitere Arbeit beginnt.

## Umgang mit Fehlern
- Reproduktionsschritte, Umgebung und Logauszüge ohne private Informationen festhalten.
- Falls Spiel im Editor nicht prüfbar: keine „Fertig“-Behauptung; eindeutig in ungetestet/statisch geprüft unterscheiden.
- Blocker als Issue mit minimalem nächsten Prüfschritt melden.

Siehe [Setup](SETUP.md), [Qualitätsgates](QUALITY_GATES.md), [Übergabe](HANDOFF.md).
