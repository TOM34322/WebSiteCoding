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
    Icon = 9033642906, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "loading the Hub",
    LoadingSubtitle = "by Guest 666",
    Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "CarHub"
    },
 
    Discord = {
       Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "28kZCPUU8b", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = false -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "🔑 Car Key",
       Subtitle = "Key System",
       Note = "Free Car GamePass", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"FreeCar"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 Rayfield:Notify({
    Title = "HyperHub",
    Content = "Script injected",
    Duration = 6.5,
    Image = nil,
 })

 local Tab = Window:CreateTab("Car", 9033642906)

-- ✅ Nouvelle liste de véhicules
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
        local args = {selectedCar}
        game:GetService("ReplicatedStorage"):WaitForChild("SpawnCar"):FireServer(unpack(args))
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
local InfoTab = Window:CreateTab("Infos Car Simulator", "badge-info")

-- Label simple
local Label = InfoTab:CreateLabel("Pourquoi ce script", "help-circle")

-- Paragraphe explicatif
local Paragraph = InfoTab:CreateParagraph({
    Title = "À propos",
    Content = "Ce script Car Driving Simulator est conçu pour le fun. et pour avoir des avantages de jeu."
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
