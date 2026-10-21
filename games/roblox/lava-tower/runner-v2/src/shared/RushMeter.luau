-- Server-side state machine. Only call registerVerifiedAction AFTER server-side gameplay verification.
-- Never award Rush energy just because a client RemoteEvent claims a near miss.
local Config = require(script.Parent.Config)
local RushMeter = {}
RushMeter.__index = RushMeter

function RushMeter.new()
    return setmetatable({
        energy = 0,
        combo = 0,
        lastActionAt = -math.huge,
        lastComboAt = -math.huge,
        activeUntil = -math.huge,
        cooldownUntil = -math.huge,
    }, RushMeter)
end

local function validTime(now)
    return type(now) == "number" and now == now and now >= 0 and now < math.huge
end

function RushMeter:tick(now)
    assert(validTime(now), "tick requires a nonnegative timestamp")
    if now - self.lastComboAt > Config.Rush.comboTimeoutSeconds then
        self.combo = 0
    end
end

function RushMeter:registerVerifiedAction(kind, now)
    if not validTime(now) then return false, "invalid timestamp" end
    local baseEnergy = Config.Rush.energyByAction[kind]
    if not baseEnergy then return false, "unknown action" end
    if now < self.lastActionAt then return false, "time reversed" end
    if now - self.lastActionAt < Config.Rush.minVerifiedActionIntervalSeconds then
        return false, "action too frequent"
    end

    self:tick(now)
    self.combo = math.min(Config.Rush.maximumCombo, self.combo + 1)
    local bonus = math.min(self.combo - 1, 4) * 2
    local earned = baseEnergy + bonus
    if now < self.activeUntil then
        earned = 0 -- cannot recharge indefinitely during overdrive
    end
    self.energy = math.min(Config.Rush.maximumEnergy, self.energy + earned)
    self.lastActionAt = now
    self.lastComboAt = now
    return true, earned
end

function RushMeter:activate(now)
    if not validTime(now) then return false, "invalid timestamp" end
    self:tick(now)
    if now < self.activeUntil then return false, "already active" end
    if now < self.cooldownUntil then return false, "cooldown" end
    if self.energy < Config.Rush.maximumEnergy then return false, "insufficient energy" end
    self.energy = 0
    self.activeUntil = now + Config.Rush.durationSeconds
    self.cooldownUntil = self.activeUntil + Config.Rush.cooldownSeconds
    return true, nil
end

function RushMeter:snapshot(now)
    self:tick(now)
    return {
        energy = self.energy,
        combo = self.combo,
        multiplier = 1 + math.min(self.combo, Config.Rush.maximumCombo) * 0.15,
        active = now < self.activeUntil,
        activeSecondsLeft = math.max(0, self.activeUntil - now),
        cooldownSecondsLeft = math.max(0, self.cooldownUntil - now),
    }
end

return RushMeter
