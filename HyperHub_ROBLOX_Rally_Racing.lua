local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Corrige la transparence du bandeau de chargement Rayfield
local parent = gethui and gethui() or game.CoreGui
RunService.Heartbeat:Connect(function()
    local ui = parent:FindFirstChild("Rayfield")
    if ui and ui:FindFirstChild("Loading") and ui.Loading:FindFirstChild("Banner") then
        ui.Loading.Banner.ImageTransparency = 1
    end
end)

-- Création de la fenêtre principale
local Window = Rayfield:CreateWindow({
    Name = "HyperHub",
    Icon = "rbxassetid://123456789", -- Remplace par un vrai ID
    LoadingTitle = "🚘Rally Car",
    LoadingSubtitle = "by Guest 666",
    Theme = "DarkBlue",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "CarHub"
    },

    Discord = {
        Enabled = true,
        Invite = "28kZCPUU8b",
        RememberJoins = false
    },

    KeySystem = true,
    KeySettings = {
        Title = "🔑 Car Key",
        Subtitle = "Join The Discord For Key.",
        Note = "Join Discord: https://discord.gg/28kZCPUU8b - Free Car GamePass",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"HyperAccess"}
    }
})

Rayfield:Notify({
   Title = "🚘 Rally Car",
   Content = "Script injected",
   Duration = 6.5,
   Image = "rbxassetid://987654321", -- Remplace par un vrai ID
})

-- Onglet véhicules
local Tab = Window:CreateTab("Car", 9033642906)

local carList = {
    "geoff",
    "Citroen gamepass",
    "Mower",
    "f1",
    "gamepass4",
    "gamepass3",
    "Vantage",
    "M1",
    "934"
}

local selectedCar = carList[1]

Tab:CreateDropdown({
    Name = "Select Car",
    Options = carList,
    CurrentOption = {selectedCar},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Options)
        selectedCar = Options[1]
    end,
})

Tab:CreateButton({
    Name = "Spawn Selected Car",
    Callback = function()
        ReplicatedStorage:WaitForChild("SpawnCar"):FireServer(selectedCar)
    end,
})

Tab:CreateButton({
    Name = "Delete Car",
    Callback = function()
        ReplicatedStorage:WaitForChild("DespawnCar"):FireServer()
    end,
})

local InfoTab = Window:CreateTab("Infos Car Simulator", "badge-info")

InfoTab:CreateLabel("Pourquoi ce script", "help-circle")

InfoTab:CreateParagraph({
    Title = "À propos",
    Content = "Ce script Car Driving Simulator est conçu pour le fun. et pour avoir des avantages de jeu."
})

InfoTab:CreateParagraph({
    Title = "🛠️ Logs Update",
    Content = [[
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔔 NOUVEAUTÉS DU SCRIPT 🔔
━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✨ Fonctionnalités ajoutées :

━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🌍 Véhicules Disponibles:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 geoff
- 🚘 Citroen gamepass
- 🚘 Mower
- 🚘 f1
- 🚘 gamepass4
- 🚘 gamepass3
- 🚘 Vantage
- 🚘 M1
- 🚘 934
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
]]
})
