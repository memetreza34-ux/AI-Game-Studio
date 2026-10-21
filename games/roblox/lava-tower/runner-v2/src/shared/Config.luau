-- Shared configuration for an optional, non-destructive Roblox runner V2 integration.
-- Values are starting hypotheses. Calibrate them using real Roblox Studio playtests.
local Config = {}

Config.Lanes = {-1, 0, 1}
Config.MaxLaneShiftPerWave = 1 -- never force an instant left-to-right double switch
Config.BreatherEvery = 6
Config.SpecialEvery = 8

-- Elapsed-time difficulty: challenge grows through variety, not just speed.
Config.Tiers = {
    {afterSeconds = 0,   speed = 18, gapSeconds = 2.5, patterns = {"single", "coins"}},
    {afterSeconds = 30,  speed = 21, gapSeconds = 2.2, patterns = {"single", "double", "coins"}},
    {afterSeconds = 65,  speed = 24, gapSeconds = 2.0, patterns = {"single", "double", "jump", "slide", "coins"}},
    {afterSeconds = 110, speed = 27, gapSeconds = 1.85, patterns = {"single", "double", "jump", "slide", "mixed", "coins"}},
    {afterSeconds = 170, speed = 29, gapSeconds = 1.75, patterns = {"single", "double", "jump", "slide", "mixed", "coins"}},
}

Config.Rush = {
    maximumEnergy = 100,
    durationSeconds = 5,
    cooldownSeconds = 12,
    comboTimeoutSeconds = 3.5,
    minVerifiedActionIntervalSeconds = 0.25,
    maximumCombo = 8,
    energyByAction = {perfectJump = 12, perfectSlide = 12, nearMiss = 16, coinStreak = 6},
}

Config.Specials = {"warning_surge", "coin_storm", "alternate_route"}
Config.WarningSeconds = 2.25
return Config
