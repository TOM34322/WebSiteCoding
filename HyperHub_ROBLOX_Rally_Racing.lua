local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local parent = gethui()
local RunService = game:GetService("RunService")

RunService.Heartbeat:Connect(function()
    if parent:FindFirstChild("Rayfield") then
        parent.Rayfield.Loading.Banner.ImageTransparency = 1
        return
    end
end)

local Window = Rayfield:CreateWindow({
    Name = "HyperHub",
    Icon = 9033642906,
    LoadingTitle = "loading the Hub",
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
        Key = {"FreeCar"}
    }
})

Rayfield:Notify({
    Title = "HyperHub",
    Content = "Script injected",
    Duration = 6.5,
    Image = nil,
})

local Tab = Window:CreateTab("Car", 9033642906)

-- ✅ Liste de véhicules
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

local selectedCar = carList[1] -- voiture par défaut

-- Dropdown menu pour choisir une voiture
local Dropdown = Tab:CreateDropdown({
    Name = "Select Car",
    Options = carList,
    CurrentOption = {selectedCar},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Options)
        selectedCar = Options[1]
    end,
})

-- Bouton pour spawn la voiture
local SpawnButton = Tab:CreateButton({
    Name = "Spawn Selected Car",
    Callback = function()
        local args = {selectedCar}
        game:GetService("ReplicatedStorage"):WaitForChild("SpawnCar"):FireServer(unpack(args))
    end,
})

-- Bouton pour supprimer la voiture
local DeleteButton = Tab:CreateButton({
    Name = "Delete Car",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("DespawnCar"):FireServer()
    end,
})

-- Onglet infos
local InfoTab = Window:CreateTab("Infos Car Simulator", "badge-info")

-- Label
local Label = InfoTab:CreateLabel("Pourquoi ce script", "help-circle")

-- Paragraphe explicatif
local Paragraph = InfoTab:CreateParagraph({
    Title = "À propos",
    Content = "Ce script Car Driving Simulator est conçu pour le fun. et pour avoir des avantages de jeu."
})

-- Journal des mises à jour
local UpdateLog = InfoTab:CreateParagraph({
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
