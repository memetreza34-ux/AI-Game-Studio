# Roblox Runner V2 – gameplay foundation (integration required)

**Purpose:** Improve the EXISTING Roblox endless runner that feels like Subway Surfers. Preserve its recognizable run / lane-change / jump / slide loop. Do not replace it with a tower game, a different map concept, or unrelated visuals.

**State as of 2026-10-21:** Real Luau modules committed; **not connected** to the locally saved `.rbxlx` place. The GitHub repository still does not contain that place or its current scripts. No Roblox Studio test has been performed from this chat. This is an integration package, **not** a claim that the game is already upgraded.

## Included

| File | Responsibility |
| --- | --- |
| `src/shared/Config.luau` | Tunable speed, waves, breather cadence, Rush settings |
| `src/shared/PatternDirector.luau` | Seeded procedural wave planning; at least one reachable clear lane |
| `src/shared/RushMeter.luau` | Server-side combo / earned energy / timed Rush / cooldown |
| `src/shared/RunnerSession.luau` | Minimal per-run adapter for planner and meter |
| `tests/RunnerV2Spec.server.luau` | Assertions across 7,500 generated waves + meter behavior |
| `default.project.json` | Rojo mapping of the shared modules into ReplicatedStorage |
| `test.project.json` | Separate Rojo test-place mapping (includes test script) |

## 1. Start by preserving the local game

1. In Roblox Studio, duplicate the existing place and save a dated `.rbxlx` backup.
2. Inspect Explorer/scripts and identify current runner movement, obstacle spawning, coins, scoring, camera, round start/end, and client/server boundaries.
3. Compare the actual runner with the wish list; **do not duplicate movement or replace working scripts blindly**.
4. Save or sync the current source/project to the repository in a dedicated task/branch. Exclude passwords, personal data and forbidden third-party assets.
5. Until those files exist, integration remains blocked.

## 2. Test modules in a disposable place

Install a compatible Rojo CLI / Roblox Studio plugin using its official documentation; open a **new empty Studio place**. From this directory, serve `test.project.json` and sync it to Studio (or copy the Luau modules into `ReplicatedStorage/RunnerV2` and place the test Script under `ServerScriptService`). Press **Play**, then inspect **Output** for the `Runner V2: PASS` message or assertion errors. Record actual outcome and Studio version.

`default.project.json` contains only modules: using it by itself **does not change gameplay**. Do not add the test Script to a published game.

## 3. Integrate into the actual runner

Require the modules from **server-owned** game logic:

~~~luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunnerSession = require(ReplicatedStorage.RunnerV2.RunnerSession)
local session = RunnerSession.new(12345) -- choose and record seed for each actual run
session:start(workspace:GetServerTimeNow())
local wave = session:nextWave(workspace:GetServerTimeNow())
-- EXISTING server obstacle spawner must render wave.obstacles / wave.coinLanes.
-- BEFORE spawning, enforce that wave.safeLane is free all the way through.
~~~

Wave payload: `pattern`, `tier`, `number`, `speedStudsPerSecond`, `spacingStuds`, `safeLane`, `previousSafeLane`, `obstacles` (lane = -1, 0, 1; kind = block / jump / slide), `coinLanes`, and optional `special` metadata.

Important adapter rules:
- Spawn ahead of the runner using the existing map coordinates. **Never** assume the sample lane IDs equal world X positions; map them to existing lane centers.
- Each wave needs real approach distance and reaction time, matched to avatar speed and lane switching duration. `spacingStuds` is only a starting parameter.
- `safeLane` must remain geometrically traversable even when hazards animate. No decoration or moving hitbox can block it. Collision volumes and camera visibility must be tested.
- `jump` and `slide` are types for the **existing** jump/slide checks; do not add a second independent character controller.
- `special` is **advisory metadata**. Implement telegraphed, visually clear effects **without adding unavoidable hazards**. Never label events as live if there is no renderer.
- Rush meter lives on the server. Only call `registerServerVerifiedAction("perfectJump" | "perfectSlide" | "nearMiss" | "coinStreak", serverTime)` AFTER the server has checked the maneuver against actual obstacle/coin geometry and its run state. A RemoteEvent claim from the client is not proof.
- Calling `activateRush(serverTime)` returns success only for a charged meter outside cooldown. Existing collision/scoring logic must enforce what Rush changes. Do not let the client decide invulnerability or score.
- Reset and discard the session for each new run/player; avoid global state across players.
- Send **sanitized** score / Rush UI snapshots from the server; never trust client scoring.
- Limit active obstacle count, pool assets when needed, despawn old parts, handle disconnect/restart, and test two or more concurrent players.

## 4. Features to add after safe integration

1. Real animated obstacle variants: moving beams, moving trains, timed gates. Add these to a *server-reviewed* collision planner; never animate an obstacle into the guaranteed safe lane.
2. Special moments: warned speed surge, bonus coin storm, alternate route. Their visual/gameplay effects are not implemented in these modules yet.
3. Visible combo / Rush HUD and responsive audio/feedback.
4. Simple missions, best-time records and optional cosmetic progression **after** the core playtest passes.

## Acceptance criteria before calling the upgrade complete

- [ ] The actual original runner place has been backed up and source synced.
- [ ] All Luau module tests run in Roblox Studio with logged results.
- [ ] One full playable session has been recorded with procedural waves and correct hitboxes.
- [ ] Every path in at least 20 observed waves has a clear reachable safe corridor.
- [ ] Speed/movement/jump/slide coexist with old controller; no duplicate bindings.
- [ ] Rush charge comes only from server-verified maneuvers and stops at its cap.
- [ ] Rush activates/expires/cools down, and **actual** collision/scoring respects this state.
- [ ] Mobile/desktop and two-player Studio tests pass without critical errors.
- [ ] No unlicensed/free-model scripts, invasive UI, or monetization were added.
- [ ] Status updated with tests actually executed, known bugs, and current release files.

Do not mark any checkbox complete without evidence. Quality and playability take precedence over adding more systems.
