-- Game-specific server scripts may instantiate one RunnerSession per active run.
-- This library intentionally does NOT modify the existing Roblox map or touch client remotes.
local PatternDirector = require(script.Parent.PatternDirector)
local RushMeter = require(script.Parent.RushMeter)

local RunnerSession = {}
RunnerSession.__index = RunnerSession

function RunnerSession.new(seed)
    local self = setmetatable({}, RunnerSession)
    self.startedAt = nil
    self.planner = PatternDirector.new(seed)
    self.rush = RushMeter.new()
    return self
end

function RunnerSession:start(serverTime)
    assert(self.startedAt == nil, "session already started")
    assert(type(serverTime) == "number" and serverTime >= 0, "invalid time")
    self.startedAt = serverTime
end

function RunnerSession:nextWave(serverTime)
    assert(self.startedAt ~= nil, "start session first")
    assert(serverTime >= self.startedAt, "time predates session")
    return self.planner:nextWave(serverTime - self.startedAt)
end

function RunnerSession:registerServerVerifiedAction(kind, serverTime)
    assert(self.startedAt ~= nil, "start session first")
    return self.rush:registerVerifiedAction(kind, serverTime)
end

function RunnerSession:activateRush(serverTime)
    assert(self.startedAt ~= nil, "start session first")
    return self.rush:activate(serverTime)
end

function RunnerSession:getRushSnapshot(serverTime)
    assert(self.startedAt ~= nil, "start session first")
    return self.rush:snapshot(serverTime)
end

return RunnerSession
