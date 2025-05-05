local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Car Driving Simulator",
    Icon = 9033642906,
    LoadingTitle = "Car Simulator",
    LoadingSubtitle = "by Guest666",
    Theme = "Ocean",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Car"
    },

    Discord = {
        Enabled = true,
        Invite = "28kZCPUU8b",
        RememberJoins = false
    },

    KeySystem = true,
    KeySettings = {
        Title = "🚘 Car Simulator",
        Subtitle = "Key System",
        Note = "spawn vehicles instead of waiting for minutes ._.",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"IdkKey"}
    }
})

local selectedCar = "mp4"

local Tab = Window:CreateTab("Car", 9033642906)

-- ✅ Liste complète des véhicules (avec les nouveaux)
local carList = {
    "mp4", "agera", "jesko", "regera",
    "bug", "chir", "huayra", "F1", "p1",
    "gtc", "laferrari", "fenzo", "sf90",
    "urus", "huracan", "gallardo", "aventador",
    "dsts", "chir_ps", "civic_T", "r8lms", "suprat"
}

-- Dropdown menu
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

-- Bouton de spawn
local SpawnButton = Tab:CreateButton({
    Name = "Spawn Selected Car",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("SpawnCar"):FireServer(selectedCar)
    end,
})

-- Bouton de suppression
local DeleteButton = Tab:CreateButton({
    Name = "Delete Car",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("DespawnCar"):FireServer()
    end,
})

-- Création du nouveau tab "Infos"
local InfoTab = Window:CreateTab("Infos Car Simulator", "badge-info") -- Tu peux changer l'emoji et l'ID de l'image

-- Un label simple avec un emoji et une icône
local Label = InfoTab:CreateLabel("Pourquoi ce script", "help-circle") -- Icône Lucide : "help-circle"

-- Paragraphe explicatif
local Paragraph = InfoTab:CreateParagraph({
    Title = "À propos",
    Content = "Ce script Car Driving Simulator est conçu pour le fun. et pour avoir des avantage de jeu."
})

-- 🆕 Journal des mises à jour
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
- 🚘 mp4
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 agera
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 jesko
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 regera
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 bug
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 chir
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 huayra
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 F1
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 p1
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 gtc
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 laferrari
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 fenzo
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 sf90
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 urus
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 huracan
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 gallardo
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 aventador
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 dsts
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 chir_ps
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 civic_T
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 r8lms
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- 🚘 suprat
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
]]
})
