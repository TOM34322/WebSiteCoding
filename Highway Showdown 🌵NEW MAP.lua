local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "🌵 Highway Showdown | INF STATS",
    LoadingTitle = "Bypassing Server Security...",
    Theme = "DarkBlue",
})

-- VARIABLES
local LP = game:GetService("Players").LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local LStats = LP:WaitForChild("leaderstats", 10)

local MoneyVal = LStats and LStats:FindFirstChild("Money")
local LevelVal = LStats and LStats:FindFirstChild("Level")
local ScoreVal = LStats and LStats:FindFirstChild("Highscore")

local MoneyRemote = RS:FindFirstChild("GiveMoneyEvent", true)
local XPRemote = RS:FindFirstChild("AddXPEvent", true)
local ScoreRemote = RS:FindFirstChild("UpdateHighscoreEvent", true)

_G.SyncActive = false
_G.AddMoney = 10000 
_G.AddScore = 10000 
_G.AddXP = 1000000  
_G.Speed = 0.5

-- TABS
local InfoTab = Window:CreateTab("📖 How to Use", 4483362458)
local MainTab = Window:CreateTab("🚀 Main Farm", 4483362458)
local ConfigTab = Window:CreateTab("⚙️ Settings", 4483362458)

-- ==========================================
-- 📖 INFO SECTION
-- ==========================================
InfoTab:CreateSection("Step-by-Step Guide")
InfoTab:CreateLabel("1. Spawn your car in the world.")
InfoTab:CreateLabel("2. Go to 'Main Farm' tab.")
InfoTab:CreateLabel("3. Enable 'Auto-Injection' and just wait! ^^")

InfoTab:CreateSection("⚠️ WARNING - READ CAREFULLY")
InfoTab:CreateLabel("DO NOT change the 'Injection Delay' (Speed).")
InfoTab:CreateLabel("Lowering the delay below 0.5s is at your own risk!")
InfoTab:CreateLabel("Speeding it up will likely trigger a Server Kick.")

-- ==========================================
-- 🚀 AUTO FARM SECTION
-- ==========================================
MainTab:CreateSection("🥇 Status: Elite Driver")

MainTab:CreateToggle({
    Name = "Enable Auto-Injection",
    CurrentValue = false,
    Callback = function(v)
        _G.SyncActive = v
        task.spawn(function()
            while _G.SyncActive do
                pcall(function()
                    if MoneyRemote then MoneyRemote:FireServer(_G.AddMoney, "Driving income") end
                    if ScoreRemote and ScoreVal then ScoreRemote:FireServer(ScoreVal.Value + _G.AddScore) end
                    if XPRemote then XPRemote:FireServer(_G.AddXP, "Driving income") end
                end)
                task.wait(_G.Speed)
            end
        end)
    end,
})

MainTab:CreateSection("📊 Live Statistics")
local MLabel = MainTab:CreateLabel("💰 Money: " .. (MoneyVal and MoneyVal.Value or "N/A"))
local LLabel = MainTab:CreateLabel("🆙 Level: " .. (LevelVal and LevelVal.Value or "N/A"))
local SLabel = MainTab:CreateLabel("🏆 Score: " .. (ScoreVal and ScoreVal.Value or "N/A"))

task.spawn(function()
    while true do
        pcall(function()
            if MoneyVal then MLabel:Set("💰 Money: " .. MoneyVal.Value) end
            if LevelVal then LLabel:Set("🆙 Level: " .. LevelVal.Value) end
            if ScoreVal then SLabel:Set("🏆 Score: " .. ScoreVal.Value) end
        end)
        task.wait(0.5)
    end
end)

-- ==========================================
-- ⚙️ CONFIGURATION SECTION
-- ==========================================
ConfigTab:CreateSection("🛡️ Safe Limits")

ConfigTab:CreateSlider({
    Name = "Money Gain (Max 10k)",
    Range = {1, 10000},
    Increment = 500,
    CurrentValue = 10000,
    Callback = function(v) _G.AddMoney = v end,
})

ConfigTab:CreateSlider({
    Name = "Score Gain (Max 10k)",
    Range = {1, 10000},
    Increment = 500,
    CurrentValue = 10000,
    Callback = function(v) _G.AddScore = v end,
})

ConfigTab:CreateSection("🚀 XP Boost")

ConfigTab:CreateSlider({
    Name = "XP Amount (Bypass)",
    Range = {1, 1000000},
    Increment = 50000,
    CurrentValue = 1000000,
    Callback = function(v) _G.AddXP = v end,
})

ConfigTab:CreateSection("⛔ Danger Zone")

ConfigTab:CreateSlider({
    Name = "Injection Delay (Risky)",
    Range = {0.1, 2},
    Increment = 0.1,
    CurrentValue = 0.5,
    Callback = function(v) _G.Speed = v end,
})

Rayfield:Notify({
    Title = "Highway Showdown V1", 
    Content = "Read 'How to Use' to avoid Kicks!", 
    Duration = 6
})
