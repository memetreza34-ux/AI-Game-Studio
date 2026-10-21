# Übergabe an Antigravity – Roblox Runner V2 (21.10.2026)

## Dein Auftrag

Der Eigentümer will **sein bereits lokal existierendes Roblox-Spiel im Subway-Surfers-Stil** verbessern, **nicht** ein neues Genre, einen neuen Tower oder eine andere Map entwickeln. Der Runner ist ihm bislang **zu einfach und schnell langweilig**. Halte bestehende Steuerung (automatisch laufen, Lane-Wechsel, Sprung, Slide), Kameragefühl und passende Assets grundsätzlich bei, sofern der Playtest nicht konkrete Probleme zeigt.

### Hier liegt die Vorarbeit

- Branch `main`, Pfad `games/roblox/lava-tower/runner-v2/`
- `src/shared/Config.luau`: Schwierigkeitsstufen und zeitliche Balance.
- `src/shared/PatternDirector.luau`: Hinderniswellen und garantierter erreichbarer freier Korridor auf Planer-Ebene.
- `src/shared/RushMeter.luau`: Combo/Energie/Rush/Cooldown als serverseitige Zustandsmaschine.
- `src/shared/RunnerSession.luau`: Adapter je Session.
- `tests/RunnerV2Spec.server.luau`: Tests für 25 Seeds × 300 Wellen plus Rush-Logik.
- `README.md` in diesem Ordner: vollständige Integrationsanleitung.

**Wichtig:** Die bestehende lokale Roblox-Place/Steuerung war nicht über GitHub zugänglich. Die Module sind nicht integriert und wurden bislang nicht in Roblox Studio ausgeführt. Der neue Code kann in Details an den aktuellen Live-Runner angepasst werden, nicht umgekehrt.

## Aufgabenfolge (in dieser Reihenfolge und ohne blindes Überschreiben)

1. Vor allem anderen lokales Projekt und Place als **datierte Backups** sichern. Im lokalen Repository `git status` prüfen. Bei ungesicherten Änderungen weder `git reset --hard` noch unbedachtes `git pull` ausführen.
2. Neuestes GitHub-`main` nach Sicherung holen; den Branch mit den Runner-V2-Modulen lesen. Den aktuellen Runner in Roblox Studio und sämtliche vorhandenen Scripts/Assets ansehen und die wirkliche Architektur festhalten. Ggf. die vorhandene Roblox-Place bzw. reproduzierbare Quellen versionieren, falls erlaubt/sinnvoll.
3. Zuerst `test.project.json` in einem **separaten Test-Place** mit Rojo synchronisieren (oder Module/Script manuell kopieren), Roblox Studio Play ausführen, Output auf Assertions prüfen. Nicht ausgeführte Tests als offen kennzeichnen.
4. Bestehende Bewegungs-/Kollisionslogik **nicht doppelt implementieren**. Stattdessen Wave-Payload in den vorhandenen Spawner integrieren: reale Positionen aus den Lane-IDs ableiten, Spawn-Abstand und Sichtbarkeit auf Spieltempo ausrichten, echte Hitboxen und Reaktionszeit beachten.
5. 20+ reale Wellen durchspielen und sicherstellen, dass ein erreichbarer Weg bleibt. Besonders Übergänge nach Slide/Jump und nach Sonderereignissen prüfen. Zufallsereignisse dürfen keine ungünstige, unsichtbare Sackgasse schaffen.
6. Rush-/Combo-Ereignisse mit serverseitigen Prüfungen für Coins, Near-Misses und perfekte Manöver verbinden. Keine clientseitig behaupteten Belohnungen akzeptieren. Rush-HUD nur mit vom Server gelieferter Energie/Combo aktualisieren.
7. 1–2 besonders interessante, vorher angekündigte Ereignisse wirklich umsetzen (etwa gesicherte Alternativroute und sichtbarer Coin-Sturm). Nur vorhandene Ästhetik erweitern; keine wahllosen fremden Models.
8. Desktop/Mobil-Steuerung, zwei parallele Spieler, Tod/Restart, Lag, Rendering-Performance und Anti-Exploit prüfen. Echte Ergebnisse notieren, Fehler korrigieren und danach **selbst bewerten, ob das Spiel jetzt weniger repetitiv ist**.
9. Commits mit tatsächlichem Spiel-Code, aktualisierte `docs/STATUS.md`, Testprotokolle und realistische Restaufgaben erstellen. Keine Veröffentlichung oder kostenpflichtigen Tools ohne ausdrückliche Freigabe.

## Qualitätsmaßstab

- Die ersten Sekunden sind leicht verständlich; nach etwa 30–60 Sekunden ist ein neues Muster erkennbar.
- Neue Schwierigkeit kommt aus **Musterwechsel, Timing und Entscheidungen**, nicht ausschließlich aus immer höherer Geschwindigkeit.
- Es gibt Entlastungswellen, besondere Momente und wiederholt spielbare Variationen.
- Tod fühlt sich fair und nachvollziehbar an.
- Kein funktionsloses HUD/Power-up als „fertig“ bezeichnen.
- Jede Aussage „getestet“ erfordert reale Roblox-Studio-Outputdaten oder dokumentierten Playtest.

## Meldeformat nach Abschluss

**Geänderte Dateien**, **Tests wirklich ausgeführt**, **Gameplay-Änderungen tatsächlich sichtbar**, **offene Bugs**, **GitHub-Commit(s)** und **konkreter nächster Schritt**.

Issue zur tatsächlichen Integration und für Studio-Tests: [#7](https://github.com/memetreza34-ux/AI-Game-Studio/issues/7).
