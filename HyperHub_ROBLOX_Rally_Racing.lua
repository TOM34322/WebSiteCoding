-- Services nécessaires
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Chargement de Rayfield depuis le lien fonctionnel
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Création de la fenêtre
local Window = Rayfield:CreateWindow({
   Name = "HyperHub",
   Icon = "car", -- Utilise un nom Lucide ou un ID image si tu veux
   LoadingTitle = "🚘 Rally Car",
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

-- Notification d’injection
Rayfield:Notify({
   Title = "🚘 Rally Car",
   Content = "Script injecté avec succès",
   Duration = 6.5,
   Image = "car",
})

-- Onglet principal
local CarTab = Window:CreateTab("Car", 9033642906)

-- Liste des voitures
local carList = {
    "geoff", "Citroen gamepass", "Mower", "f1",
    "gamepass4", "gamepass3", "Vantage", "M1", "934"
}

local selectedCar = carList[1]

-- Dropdown pour sélectionner une voiture
CarTab:CreateDropdown({
    Name = "Select Car",
    Options = carList,
    CurrentOption = {selectedCar},
    MultipleOptions = false,
    Flag = "CarSelect",
    Callback = function(Options)
        selectedCar = Options[1]
    end,
})

-- Bouton pour faire spawn la voiture
CarTab:CreateButton({
    Name = "Spawn Selected Car",
    Callback = function()
        ReplicatedStorage:WaitForChild("SpawnCar"):FireServer(selectedCar)
    end,
})

-- Bouton pour la supprimer
CarTab:CreateButton({
    Name = "Delete Car",
    Callback = function()
        ReplicatedStorage:WaitForChild("DeleteCar"):FireServer()
    end,
})

-- Onglet Infos
local InfoTab = Window:CreateTab("Infos", "info")

InfoTab:CreateParagraph({
    Title = "À propos",
    Content = "Ce script Car Driving Simulator est conçu pour le fun et pour obtenir des avantages dans le jeu."
})

InfoTab:CreateParagraph({
    Title = "🛠️ Mises à jour",
    Content = [[
🚘 Véhicules ajoutés :
- geoff
- Citroen gamepass
- Mower
- f1
- gamepass4
- gamepass3
- Vantage
- M1
- 934
]]
})
