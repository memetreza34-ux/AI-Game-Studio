-- Deterministic, fair obstacle-wave planner. NOT an obstacle renderer.
-- A game-specific adapter must turn wave.obstacles into Parts and preserve clear corridors.
local Config = require(script.Parent.Config)
local PatternDirector = {}
PatternDirector.__index = PatternDirector

local allowedTypes = {block = true, jump = true, slide = true, moving = true}
local allowedPatterns = {single = true, double = true, jump = true, slide = true, mixed = true, coins = true, breather = true}

local function tierAt(seconds)
    local chosen, index = Config.Tiers[1], 1
    for i, tier in ipairs(Config.Tiers) do
        if seconds >= tier.afterSeconds then
            chosen, index = tier, i
        end
    end
    return chosen, index
end

local function isLane(value)
    return value == -1 or value == 0 or value == 1
end

function PatternDirector.new(seed)
    local self = setmetatable({}, PatternDirector)
    self.random = Random.new(seed or 12345)
    self.waveCount = 0
    self.lastPattern = nil
    self.lastSafeLane = 0
    return self
end

function PatternDirector:_pickSafe()
    local reachable = {}
    for _, lane in ipairs(Config.Lanes) do
        if math.abs(lane - self.lastSafeLane) <= Config.MaxLaneShiftPerWave then
            table.insert(reachable, lane)
        end
    end
    -- Prefer a different reachable lane sometimes: skill progression without impossible switches.
    if #reachable > 1 and self.random:NextNumber() < 0.62 then
        local changed = {}
        for _, lane in ipairs(reachable) do
            if lane ~= self.lastSafeLane then
                table.insert(changed, lane)
            end
        end
        if #changed > 0 then
            reachable = changed
        end
    end
    return reachable[self.random:NextInteger(1, #reachable)]
end

function PatternDirector:_pickPattern(tier)
    if self.waveCount % Config.BreatherEvery == 0 then
        return "breather"
    end
    local eligible = {}
    for _, name in ipairs(tier.patterns) do
        if name ~= self.lastPattern then
            table.insert(eligible, name)
        end
    end
    if #eligible == 0 then
        eligible = tier.patterns
    end
    return eligible[self.random:NextInteger(1, #eligible)]
end

function PatternDirector:nextWave(elapsedSeconds)
    assert(type(elapsedSeconds) == "number" and elapsedSeconds >= 0, "elapsedSeconds must be >= 0")
    self.waveCount += 1
    local tier, tierIndex = tierAt(elapsedSeconds)
    local pattern = self:_pickPattern(tier)
    local safeLane = pattern == "breather" and self.lastSafeLane or self:_pickSafe()
    local obstacles = {}
    local coinLanes = {}
    local occupied = {}

    local function addObstacle(lane, kind)
        table.insert(obstacles, {lane = lane, kind = kind})
        occupied[lane] = true
    end
    local function otherLanes(excluded)
        local result = {}
        for _, lane in ipairs(Config.Lanes) do
            if lane ~= excluded then
                table.insert(result, lane)
            end
        end
        return result
    end

    local alternatives = otherLanes(safeLane)
    if pattern == "single" then
        addObstacle(alternatives[self.random:NextInteger(1, #alternatives)], "block")
    elseif pattern == "double" then
        for _, lane in ipairs(alternatives) do addObstacle(lane, "block") end
    elseif pattern == "jump" or pattern == "slide" then
        -- A free corridor ALWAYS exists; skill moves reward additional lane options.
        for _, lane in ipairs(alternatives) do addObstacle(lane, pattern) end
    elseif pattern == "mixed" then
        addObstacle(alternatives[1], "jump")
        addObstacle(alternatives[2], "slide")
    end
    -- Coins never occupy a blocked corridor. The clean path always offers a reward.
    table.insert(coinLanes, safeLane)
    if #obstacles == 0 and self.random:NextNumber() < 0.5 then
        local bonus = alternatives[self.random:NextInteger(1, #alternatives)]
        table.insert(coinLanes, bonus)
    end

    local special = nil
    if tierIndex >= 2 and self.waveCount % Config.SpecialEvery == 0 then
        local kind = Config.Specials[self.random:NextInteger(1, #Config.Specials)]
        -- These are display/adapter intents, NOT extra unchecked hazards.
        special = {kind = kind, warningSeconds = Config.WarningSeconds}
    end

    local wave = {
        number = self.waveCount,
        pattern = pattern,
        tier = tierIndex,
        speedStudsPerSecond = tier.speed,
        spacingStuds = tier.speed * tier.gapSeconds,
        safeLane = safeLane,
        previousSafeLane = self.lastSafeLane,
        obstacles = obstacles,
        coinLanes = coinLanes,
        special = special,
    }
    local ok, reason = PatternDirector.validate(wave)
    assert(ok, "Planner produced invalid wave: " .. tostring(reason))
    self.lastSafeLane = safeLane
    self.lastPattern = pattern
    return wave
end

function PatternDirector.validate(wave)
    if type(wave) ~= "table" or not allowedPatterns[wave.pattern] then return false, "unknown pattern" end
    if not isLane(wave.safeLane) or not isLane(wave.previousSafeLane) then return false, "invalid safe lane" end
    if math.abs(wave.safeLane - wave.previousSafeLane) > Config.MaxLaneShiftPerWave then
        return false, "unreachable lane transition"
    end
    if type(wave.spacingStuds) ~= "number" or wave.spacingStuds <= 0 then
        return false, "invalid spacing"
    end
    if type(wave.obstacles) ~= "table" or type(wave.coinLanes) ~= "table" then
        return false, "invalid wave payload"
    end
    local seen = {}
    for _, obstacle in ipairs(wave.obstacles) do
        if not isLane(obstacle.lane) or not allowedTypes[obstacle.kind] then
            return false, "invalid obstacle"
        end
        if seen[obstacle.lane] then return false, "duplicate occupied lane" end
        if obstacle.lane == wave.safeLane then return false, "safe corridor blocked" end
        seen[obstacle.lane] = true
    end
    if #wave.obstacles > 2 then return false, "all lanes blocked" end
    for _, lane in ipairs(wave.coinLanes) do
        if not isLane(lane) or seen[lane] then return false, "coin inside obstacle" end
    end
    if wave.special then
        if type(wave.special.warningSeconds) ~= "number" or wave.special.warningSeconds <= 0 then
            return false, "special has no valid warning"
        end
    end
    return true, nil
end

return PatternDirector
