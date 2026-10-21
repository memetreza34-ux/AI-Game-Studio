# AI Game Studio

> **Update 21.10.2026:** Der Nutzer priorisiert inzwischen die Verbesserung seines **bestehenden Roblox-Runners im Subway-Surfers-Stil**. Auf dem Branch `feature/roblox-runner-gameplay-v2` werden erste Luau-Systeme für faire Wellen, Combo und Rush entwickelt. **Die lokale Roblox-Place wurde nicht eingesehen, nicht verändert und nicht getestet.** Siehe [Integrationsanleitung](games/roblox/lava-tower/runner-v2/README.md) und [aktuellen Status](docs/STATUS.md). Die nachstehende Grundlagenbeschreibung bezieht sich auf den Stand vom 13.10.2026.

**KI-gestützte Entwicklung von Spielen, Maps und virtuellen Welten – mit Fokus auf spielerischen Mehrwert und überprüfbare Monetarisierung.**

> **Projektstatus (13.10.2026):** Grundlagenphase. Es existiert noch kein fertiges Spiel, kein verbindlich ausgewähltes Spielkonzept und kein getesteter Editor-Workflow. **Roblox ist vorläufig die bevorzugte Plattform für den ersten Versuch**, Fortnite UEFN bleibt eine Alternative. Das ist keine Zusage über künftige Einnahmen.

## Einstieg: Wo steht was?

| Frage | Verbindliche Quelle |
| --- | --- |
| Was ist das Ziel? | [Projektauftrag](docs/PROJECT_CHARTER.md) |
| Was ist jetzt erledigt / was fehlt? | [Aktueller Status](docs/STATUS.md) |
| Was ist als Nächstes dran? | [Roadmap](docs/ROADMAP.md) und [GitHub Issues](https://github.com/memetreza34-ux/AI-Game-Studio/issues) |
| Welche Plattform und warum? | [Plattformvergleich](docs/PLATFORM_STRATEGY.md) |
| Welche Spielidee zuerst? | [Bewertung von Spielideen](docs/IDEA_SELECTION.md) |
| Wie arbeiten Codex, Claude und andere Agents? | **[AGENTS.md](AGENTS.md)** und [KI-Arbeitsablauf](docs/AI_WORKFLOW.md) |
| Wie verbinden wir die Editoren? | [Entwicklungsumgebung](docs/SETUP.md) |
| Wie speichern wir Projekte/Code? | [Technische Struktur](docs/TECHNICAL_ARCHITECTURE.md) |
| Wann gilt eine Änderung als fertig? | [Qualität & Sicherheit](docs/QUALITY_GATES.md) |
| Wie wird Geld verdient, ohne sich etwas vorzumachen? | [Monetarisierung und Kennzahlen](docs/MONETIZATION.md) |
| Was wurde entschieden? | [Entscheidungsprotokoll](docs/DECISIONS.md) |
| Welche Quellen sind offiziell? | [Quellen und Aktualitätskontrolle](docs/SOURCES.md) |
| Wie übergibt man die Arbeit? | [Übergabevorlage](docs/HANDOFF.md) |

## Leitprinzipien

1. **KI-first, aber nicht blind:** KI schreibt und bearbeitet möglichst viel; Funktion, Spielspaß, Rechte, Zahlungen und Veröffentlichung werden geprüft.
2. **Erst ein kleines, spielbares MVP:** Nicht zehn beliebige KI-Maps produzieren, sondern eine gute Spielschleife aufbauen und testen.
3. **Keine erfundenen Ergebnisse:** „In Planung“, „Implementiert“, „lokal getestet“ und „veröffentlicht“ sind unterschiedliche Zustände.
4. **Spieler vor Monetarisierung:** Wiederkehrende Spieler, gute Bedienbarkeit und faire Käufe sind wichtiger als viele Features.
5. **Niedriges Risiko:** Keine kostenpflichtigen Dienste, Käufe, Kontoverknüpfungen oder Veröffentlichungen ohne Freigabe durch den Eigentümer.
6. **Plattformregeln beachten:** Keine unrechtmäßig kopierten Assets, keine irreführenden Käufe, keine automatisierten Spam-Veröffentlichungen.

## Sofort starten

1. **[AGENTS.md](AGENTS.md)** vollständig lesen (gilt auch für Claude Code, Codex und andere Mitwirkende).
2. **[STATUS.md](docs/STATUS.md)** und **[DECISIONS.md](docs/DECISIONS.md)** lesen. Keine offenen Fragen als beschlossen behandeln.
3. Aus [Issues](../../issues) den nächsten klar abgegrenzten Arbeitsschritt wählen oder ein Issue mit Akzeptanzkriterien anlegen.
4. Änderung durchführen und nachweisbar prüfen; bei Studio-Arbeit die tatsächlich ausgeführten Tests dokumentieren.
5. **Status, Entscheidungen und Übergabe** aktualisieren, damit die nächste KI sofort anschließen kann.

## Projektaufteilung (vorgesehen)

- `docs/` – dauerhafte Projektentscheidungen, Anleitungen, Checklisten und Status.
- `games/roblox/<spielname>/` – später Quellcode und Spielprojekt für Roblox (noch **nicht** angelegt).
- `games/fortnite/<spielname>/` – später Verse-Quellen und projektbegleitende Infos für UEFN (noch **nicht** angelegt).
- `.github/` – Vorlagen für Aufgaben und Pull Requests.

**Wichtig:** Dieses Repository ist öffentlich. Keine Passwörter, API-Schlüssel, Tokens, privaten Identitäts- oder Zahlungsdaten committen. Es wird derzeit **keine Lizenz für eine freie Weiterverwendung** eingeräumt; mögliche Open-Source-Lizenzen erst bewusst auswählen.

## Konkrete nächsten Aufgaben

- [Issue #1: Plattform und erstes Spiel auswählen](https://github.com/memetreza34-ux/AI-Game-Studio/issues/1)
- [Issue #2: Codex-/Claude-Anbindung an Roblox Studio testen](https://github.com/memetreza34-ux/AI-Game-Studio/issues/2)
- [Alle sechs geplanten Arbeitspakete](https://github.com/memetreza34-ux/AI-Game-Studio/issues)

## Aktueller nächster Meilenstein

Ein konkretes erstes Spielkonzept auswählen, den passenden Editor einrichten und in einem kleinen Test nachweisen, welche Arbeit Codex oder Claude dort tatsächlich erledigen kann.

---
*Dokumentationsstand: 13.10.2026. Bei widersprüchlichen Angaben gelten zuerst jüngere dokumentierte Entscheidungen und der aktuelle Status, danach diese README.*
