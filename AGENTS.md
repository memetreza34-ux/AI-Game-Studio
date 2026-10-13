# Verbindliche Arbeitsanweisung für alle KI-Agents

**Gilt für Codex, Claude Code, Cursor, ChatGPT, GitHub-Agents und menschliche Mitwirkende.**

## Reihenfolge vor jeder Änderung
1. README.md, docs/STATUS.md und docs/DECISIONS.md lesen.
2. Projektauftrag, Roadmap und einschlägige technische Dokumente prüfen.
3. Vorhandenen Code, Git-Status und offene Issues ansehen. Niemals blind überschreiben.
4. Kurz feststellen: Was ist bestätigt, was ist eine Annahme, was ist noch offen?
5. Kleinsten sinnvollen nächsten Schritt umsetzen, testen und dokumentieren.

## Ziel und Grenzen
- Wir entwickeln mit KI-Unterstützung **originale**, qualitativ gute Spiele/Maps mit potenzieller Monetarisierung.
- **Roblox ist eine vorläufige Erstoption, nicht final beschlossen.** Fortnite und andere Plattformen dürfen untersucht werden; ohne Entscheidung nicht parallel mehrere vollwertige Spiele beginnen.
- **Es gibt noch kein beschlossenes erstes Spiel**, keine belegten Einnahmen und keinen validierten Studio-Workflow.
- Betrachte Aussagen aus älteren Chats oder Marketingmaterial nie als Ersatz für den überprüfbaren Repository-Stand.
- Erst spielbaren Kern fertigstellen, danach optional Shops, Werbung, Social-Media-Kampagnen.

## Agenten-Verhalten
- Mache sinnvolle, überprüfbare Änderungen statt nur theoretischer Vorschläge.
- Verwende vorhandene Projektstruktur, keine unnötigen Frameworks/Abhängigkeiten.
- Halte Code lesbar, modular, kommentiere ungewöhnliche Entscheidungen und vermeide unkontrollierte Massenänderungen.
- Keine erfundenen Testergebnisse, Erfolgsaussichten, Spielerzahlen, Einnahmen oder Veröffentlichungen.
- Kritische Entscheidungen mit Status **Vorgeschlagen / Angenommen / Verworfen** in docs/DECISIONS.md ablegen.
- Für größere Aufgaben GitHub Issue und ggf. PR verwenden; Akzeptanzkriterien angeben.
- Nach Änderungen docs/STATUS.md und bei Bedarf docs/HANDOFF.md pflegen.
- Ergänze Quellen und Prüfdatum, wenn die Entscheidung von aktuellen Plattformregeln abhängt.
- Schreibe Dokumentation bevorzugt **auf Deutsch**; Quellcode-Namen/API-Bezeichnungen entsprechend Plattformstandard auf Englisch.
- Markiere ungeprüfte Informationen ausdrücklich als Hypothese.

## Schutzmaßnahmen: niemals eigenmächtig
- **Keine Veröffentlichung**, Uploads, externen Account-Verknüpfungen, Käufe, Verträge, Werbeausgaben oder bezahlten APIs ohne ausdrückliche Eigentümerfreigabe.
- Kein Zugriff auf Konten, Zahlungen oder Auszahlungsdaten, sofern nicht für einen konkret freigegebenen Schritt nötig.
- Keine Passwörter, Tokens, Secrets, Account-E-Mails, Zahlungs-/Steuerdaten oder privaten Spielerdaten im Repo, Code, Issues oder Logs.
- Keine markenrechtlich geschützten Figuren, fremden Maps, urheberrechtlich geschützte Musik/Modelle oder unlizenzierte KI-Assets einfügen.
- Kein Fake-Engagement, keine Bots, kein Spamming, keine irreführende oder manipulative Monetarisierung.
- Bevor MCP/Editor-Agents fremde Projekte ändern: Daten sichern, nur nötige Berechtigungen erteilen und geplanten Umfang bestätigen.

## Definition of Done
Eine Aufgabe gilt nur als fertig, wenn:
1. Akzeptanzkriterien erfüllt und Änderungen nachvollziehbar sind;
2. relevante Tests wirklich ausgeführt sind, mit Ergebnis;
3. bekannte Restfehler und Grenzen vermerkt sind;
4. keine privaten Daten/secrets eingebaut wurden;
5. relevante Status-/Entscheidungsdokumente angepasst sind.

**Teststufen klar unterscheiden:**
- *Ungetestet*: Code/Dokumentation geschrieben.
- *Statisch geprüft*: Dateien/Format/Logik inspiziert; kein Editor-Playtest.
- *Im Editor getestet*: Studio/UEFN wirklich gestartet, Ablauf reproduzierbar beschrieben.
- *Extern getestet*: reale Tester/Spieler; Methode und Feedback festgehalten.
- *Veröffentlicht*: nur mit tatsächlicher öffentlicher Freigabe/Spiel-Link.

## Verantwortlichkeiten
- **Eigentümer:** Wählt Spielidee, genehmigt Ausgaben, Accounts, Assets und Veröffentlichung.
- **KI-Agent:** Recherche, Plan, Quellcode, Änderungen, Vorschläge, Qualitätssicherung und dokumentierte Übergabe im Rahmen vorhandener Tools.
- **Menschlicher Playtest:** Spielspaß, Verständlichkeit, Fairness und Echtgeldkauf-Flows überprüfen.

## Gemeinsames Übergabeformat
Jede größere Arbeit beendet mit: **Ziel – Änderungen/Dateien – Tests (mit tatsächlich ausgeführten Befehlen/Schritten) – Risiken – nächste Schritte – GitHub-Link/Commit**.
Vorlagen: docs/HANDOFF.md und .github/pull_request_template.md.

Wenn sich README, Agent-Anweisung und Status widersprechen: **jüngste angenommene Entscheidung + nachgewiesener Ist-Zustand** schlagen ältere Absichten. Änderungen an diesen Regeln kurz begründen.
