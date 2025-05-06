-- Vérifie si c'est le bon jeu
if game.PlaceId ~= 4992570197 then
    -- Crée une alerte sonore si ce n'est pas le bon jeu
    local soundAlert = Instance.new("Sound")
    soundAlert.SoundId = "rbxassetid://6176997734"  -- ID du son d'erreur
    soundAlert.Volume = 1 -- Volume du son
    soundAlert.Looped = false  -- Le son ne se répète pas
    soundAlert.Parent = game.Players.LocalPlayer.Character or game.Workspace

    -- Joue le son
    soundAlert:Play()

    -- Envoie une notification pour dire que ce n'est pas le bon jeu
    game.StarterGui:SetCore("SendNotification", {
        Title = "Error The Game",
        Text = "❌ This script does not work in this game.",
        Duration = 10
    })
    
    -- Stoppe l'exécution du script si ce n'est pas le bon jeu
    return
else
    -- Si c'est le bon jeu, joue un son de confirmation
    local soundConfirmation = Instance.new("Sound")
    soundConfirmation.SoundId = "rbxassetid://137818744150574"  -- ID du son de confirmation (tu peux le remplacer par un autre ID)
    soundConfirmation.Volume = 1 -- Volume du son
    soundConfirmation.Looped = false  -- Le son ne se répète pas
    soundConfirmation.Parent = game.Players.LocalPlayer.Character or game.Workspace

    -- Joue le son de confirmation
    soundConfirmation:Play()

    -- Optionnel : Envoie une notification pour dire que le script est dans le bon jeu
    game.StarterGui:SetCore("SendNotification", {
        Title = "Good Game",
        Text = "✅ This script is working in the right game.",
        Duration = 10
    })
end


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
    Icon = "home",
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
   Image = "car",
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
