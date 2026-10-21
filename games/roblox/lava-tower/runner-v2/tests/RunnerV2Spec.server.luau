-- Run ONLY with test.project.json, in a separate Roblox Studio test place.
-- Automated, in-engine assertions (not a substitute for visual playtesting).
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local folder = ReplicatedStorage:WaitForChild("RunnerV2")
local PatternDirector = require(folder.PatternDirector)
local RushMeter = require(folder.RushMeter)
local RunnerSession = require(folder.RunnerSession)
local Config = require(folder.Config)

local totalWaves = 0
local encountered = {}
for seed = 1, 25 do
    local director = PatternDirector.new(seed)
    local priorSafe = 0
    for index = 1, 300 do
        local elapsed = (index - 1) * 1.9
        local wave = director:nextWave(elapsed)
        local valid, reason = PatternDirector.validate(wave)
        assert(valid, reason)
        assert(wave.number == index, "unexpected wave index")
        assert(wave.previousSafeLane == priorSafe, "broken continuity")
        assert(math.abs(wave.safeLane - priorSafe) <= 1, "unreachable lane switch")
        assert(wave.spacingStuds / wave.speedStudsPerSecond >= 1.7, "insufficient time gap")
        if index % Config.BreatherEvery == 0 then
            assert(wave.pattern == "breather", "missing relaxation wave")
        end
        if wave.special then
            assert(wave.special.warningSeconds >= 2, "special event cannot be untelegraphed")
        end
        priorSafe = wave.safeLane
        encountered[wave.pattern] = true
        totalWaves += 1
    end
end
assert(encountered.single and encountered.double and encountered.jump and encountered.slide and encountered.mixed, "insufficient variety")

local meter = RushMeter.new()
local ok = meter:activate(0)
assert(not ok, "rush should start uncharged")
local accepted, reason = meter:registerVerifiedAction("not_an_action", 1)
assert(not accepted and reason == "unknown action", "unvalidated action rewarded")
assert(meter:registerVerifiedAction("perfectJump", 1))
local denied = meter:registerVerifiedAction("nearMiss", 1.05)
assert(not denied, "rapid action should be rate limited")
for i = 2, 14 do
    assert(meter:registerVerifiedAction("nearMiss", i))
end
assert(meter:snapshot(14).energy == 100, "meter should cap energy")
assert(meter:activate(15), "fully charged rush should activate")
assert(meter:snapshot(15).active, "active window missing")
assert(not meter:activate(16), "double activation accepted")
assert(not meter:activate(21), "cooldown bypassed")
assert(not meter:snapshot(21).active, "rush should have expired")
assert(meter:snapshot(21).energy == 0, "rush should consume energy")

local session = RunnerSession.new(101)
session:start(100)
local first = session:nextWave(100)
assert(first.number == 1, "session planner not initialized")
assert(session:getRushSnapshot(100).combo == 0, "unexpected starting combo")

print(string.format("Runner V2: PASS %d generated waves, pattern variety, safe transitions, breathers and Rush state", totalWaves))
