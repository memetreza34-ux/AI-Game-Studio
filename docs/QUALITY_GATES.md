# Qualitäts- und Sicherheitsgates

Keine Veröffentlichung nur deshalb, weil die KI einen „fertigen“ Prototyp meldet.

## Gate A – Basis-Spielbarkeit
- [ ] Der Einstieg ist ohne Erklärung durch Entwickler nachvollziehbar.
- [ ] Es gibt eine kurze, vollständige Runde: Start -> Aktion -> sichtbares Ergebnis -> Neustart.
- [ ] Klare Rückmeldung bei Sieg, Niederlage, Fehler und Verbindungsausfall.
- [ ] Kein wiederholt auslösbarer Belohnungs-/Countdown-Exploit.
- [ ] Steuerung auf den tatsächlich unterstützten Geräten getestet.

## Gate B – Technische Stabilität
- [ ] Mindestens ein echter Editor-Playtest mit reproduzierbaren Schritten.
- [ ] Fehlerlogs geprüft und kritische Fehler behoben.
- [ ] Server prüft Spielregeln/Belohnungen; Clients gelten als nicht vertrauenswürdig.
- [ ] Race Conditions, Doppelklicks, gleichzeitige Spieler und Verbindungsabbrüche bedacht.
- [ ] Speicher- und Netzwerkzugriffe unter realistischen Fehlern überprüft, falls vorhanden.
- [ ] Ressourcennutzung und Ladezeit auf Zielgeräten geprüft.

## Gate C – Recht, Sicherheit, Vertrauen
- [ ] Herkunft und Lizenz sämtlicher Assets dokumentiert, auch KI-generierter Assets.
- [ ] Keine fremden Marken/Figuren/Maps/Musik ohne Nutzungsrecht.
- [ ] Plattformregeln, Jugendschutz, ggf. Altersfreigaben und Inhaltsregeln geprüft.
- [ ] Keine Secrets oder personenbezogenen Informationen im öffentlichen Repo.
- [ ] Keine manipulativen Kaufsignale, „Fake Scarcity“ oder falschen Belohnungsversprechen.
- [ ] Keine schädlichen oder unkontrollierten externen Scripts/Plugins.
- [ ] Nutzer-/Spielerdaten nur nach notwendiger Datenschutz- und Plattformprüfung.

## Gate D – Faire Monetarisierung (falls vorgesehen)
- [ ] Käufe sind freiwillig, verständlich und ohne irreführende Aussagen.
- [ ] Preise und Leistungsumfang werden korrekt angezeigt.
- [ ] Plattformseitige Kaufbestätigungen serverseitig validiert, doppelte Verarbeitung verhindert.
- [ ] Zahlungen, Spielerrechte und Testkäufe sind mit den offiziellen Plattformwerkzeugen überprüft.
- [ ] Creator-/Auszahlungsbedingungen mit Datum erneut geprüft.

## Gate E – Veröffentlichung
- [ ] Produkteigentümer hat Veröffentlichung ausdrücklich freigegeben.
- [ ] Release-Beschreibung und Werbematerial sind korrekt; kein fremdes geistiges Eigentum.
- [ ] Öffentlich sichtbarer Link und Version nach erfolgreicher Veröffentlichung festgehalten.
- [ ] Rückroll-/Hotfixplan vorhanden.

## Testprotokoll für Issues/PR
- **Datum, Build/Commit und Editor-Version:**
- **Umgebung und Geräte:**
- **Akzeptanzkriterium / Testfall:**
- **Aktionen und erwartetes Ergebnis:**
- **Tatsächliches Ergebnis:**
- **Bestanden / Fehlgeschlagen / Nicht ausgeführt:**
- **Fehler-/Screenshot-Referenz (ohne Geheimnisse):**

Wichtig: Nicht ausgeführte Tests dürfen nie als „grün“ markiert werden.
