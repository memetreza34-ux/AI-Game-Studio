# Einrichtung der Entwicklungsumgebung

**Status:** Anleitung; keine der nachfolgenden lokalen Verbindungen wurde in diesem Repository bereits nachgewiesen.

## Voraussetzungen
- Git und ein Editor mit Text-/Projektdateien.
- GitHub-Zugriff auf dieses Repository.
- Für Roblox: Roblox Studio, geeigneter MCP-Client (z. B. Codex CLI oder Claude Code).
- Für Fortnite: UEFN und Fortnite-Umgebung auf einem unterstützten Windows-PC; geeigneter MCP-Client.
- Aktuelle Herstellerdokumentation auf Kompatibilität prüfen.

## A. Roblox Studio (vorläufiger erster Proof)
1. Roblox Studio über den offiziellen Creator Hub installieren.
2. Ein **neues lokales Testprojekt** öffnen, nicht eine wertvolle bestehende Map.
3. Studio Assistant öffnen, MCP-Server-Einstellungen aufrufen und Studio als MCP-Server aktivieren.
4. Die vom Studio angezeigte Schnellverbindung für den installierten Client (u. a. Codex CLI oder Claude Code) nutzen, sofern verfügbar.
5. Nur der **offiziellen lokalen Konfiguration** folgen – keine unbestätigten Ports oder Tokens von Dritten übernehmen.
6. Test: Agent soll Objekte abfragen, einen eindeutig benannten Test-Part/ein kurzes Luau-Script erzeugen, die Szene starten und das Ergebnis beschreiben.
7. Dateistand sichern, Änderung im Editor verifizieren, Ergebnisse mit Datum in docs/STATUS.md eintragen.
8. Danach prüfen, wie Quellcode und Spieleprojekt reproduzierbar versioniert werden (z. B. Rojo/Projektdatei nur falls sinnvoll).

**Originalanleitung:** https://create.roblox.com/docs/studio/mcp

## B. Fortnite UEFN (Alternative)
1. Offizielle UEFN-Voraussetzungen, Windows-/Editor-Version und Lizenzbedingungen prüfen.
2. Neues Testprojekt in UEFN anlegen.
3. UEFN MCP nach Epic-Dokumentation aktivieren und lokalen MCP-Endpunkt im Client konfigurieren.
4. Nur sichere Testoperationen: ein Verse-Script lesen/ändern, ein Gerät/Entity anlegen, Play-Session starten und beobachten.
5. Vor Änderungen Projektbackup/Quellstand anlegen; Verse-Dateien und notwendige Projektinformationen nachvollziehbar sichern.
6. Technische Grenzen und Editor-Probleme protokollieren; **nicht** automatisch veröffentlichen.

**Originalanleitung:** https://dev.epicgames.com/documentation/fortnite/uefn-mcp?lang=en-US

## Klare Erfolgskriterien des Proofs
- Der Client verbindet sich mit der **tatsächlich geöffneten** Studio-/UEFN-Sitzung.
- Eine Änderung wird gespeichert und ist im Editor sichtbar.
- Ein Playtest läuft, und tatsächliche Beobachtungen werden festgehalten.
- Das Projekt kann nach Schließen/Öffnen reproduziert werden.
- Agent-Rechte können wieder getrennt/deaktiviert werden.

## Falls es nicht funktioniert
Erfasse: Datum, OS, Editor-Version, KI-Client-Version, offizieller Installationsweg, genaue Fehlermeldung, welche Schritte bereits versucht wurden. Zugangsdaten und private Dateipfade entfernen. Ein technisches Issue eröffnen.

## Sicherheit
MCP kann Schreibzugriff auf Projekte ermöglichen. Nur vertrauenswürdige lokale Clients nutzen und Berechtigungen vor dem Einschalten verstehen. Secrets nicht ins Repository, in Prompts, Screenshot-Beispiele oder Issues schreiben.
