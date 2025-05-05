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
    Icon = "home", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "🔥Voice Chat Relax",
    LoadingSubtitle = "by Guest666",
    Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = FunScriptVC, -- Create a custom folder for your hub/game
       FileName = "deafult"
    },
 
    Discord = {
       Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "[28kZCPUU8b]", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "🔥 Voice Chat Relax 🔥",
       Subtitle = "Key System",
       Note = "[28kZCPUU8b]", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"HyperAccess"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 Rayfield:Notify({
   Title = "🔥 Voice Chat Relax 🔥",
   Content = "Script injected",
   Duration = 6.5,
   Image = "mic",
})


local Tab = Window:CreateTab("AFK Menu", "repeat")

local afkLoopActive = false
local afkLoopThread
local AFKRemote = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AFK")

-- Toggle AFK loop
local Toggle = Tab:CreateToggle({
    Name = "Boucle AFK",
    CurrentValue = false,
    Flag = "ToggleAFK",
    Callback = function(Value)
        afkLoopActive = Value

        if afkLoopActive then
            afkLoopThread = task.spawn(function()
                while afkLoopActive do
                    AFKRemote:FireServer("getafk")
                    AFKRemote:FireServer("gethg")
                    task.wait(0.1)
                end
            end)
        else
            afkLoopActive = false
        end
    end,
})

-- 🔻 Divider visuel entre les sections
local Divider = Tab:CreateDivider()

-- Bouton pour quitter manuellement le mode AFK
local Button = Tab:CreateButton({
    Name = "Quitter AFK (manuel)",
    Callback = function()
        AFKRemote:FireServer("removeafk")
        AFKRemote:FireServer("removehg")
    end,
})


local TabSpeed = Window:CreateTab("Speed", "chevrons-up")

-- ✅ Slider pour ajuster la vitesse de marche
local SliderSpeed = TabSpeed:CreateSlider({
    Name = "Ajuster Speed Boost",
    Range = {16, 100},  -- Plage de valeurs de 16 (vitesse de base) à 100 (vitesse très rapide)
    Increment = 1,  -- Incrément de la valeur, de 1 en 1
    Suffix = "Vitesse",  -- Suffixe pour ajouter un texte après la valeur (facultatif)
    CurrentValue = 16,  -- Valeur initiale de la vitesse (16 est la valeur de base)
    Flag = "SpeedSlider",  -- Identifiant unique pour ce slider
    Callback = function(Value)
        -- Lorsque le slider change, ajuster la vitesse de marche du personnage
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = Value
            print("Vitesse de marche définie à : " .. Value)
        end
    end,
})

local Divider = TabSpeed:CreateDivider()

-- Onglet "Give Sword"
local Tab = Window:CreateTab("Give Sword", "swords") -- Titre, Icône

local Button = Tab:CreateButton({
   Name = "Téléportation",
   Callback = function()
       local character = game.Players.LocalPlayer.Character
       if character and character:FindFirstChild("HumanoidRootPart") then
           -- CFrame avec orientation
           local cframe1 = CFrame.new(
               -462.741608, 15.1062622, 43.9290047,
               6.43730164e-05, 0.557742119, -0.830014467,
               1.00000012, -6.46114349e-05, 3.43620777e-05,
               -3.43620777e-05, -0.830014467, -0.557742238
           )

           local position2 = Vector3.new(-450, 14, 53)

           -- Téléportation initiale avec orientation
           character:SetPrimaryPartCFrame(cframe1)

           -- Attente de 3 secondes avant téléportation finale
           task.delay(3, function()
               if character and character:FindFirstChild("HumanoidRootPart") then
                   character:SetPrimaryPartCFrame(CFrame.new(position2))
               end
           end)
       end
   end,
})

local Tab = Window:CreateTab("Tp Room", "map-pin") -- Crée un nouvel onglet pour la téléportation

-- Options du Dropdown avec différentes positions
local Dropdown = Tab:CreateDropdown({
   Name = "Choisir la Position de Téléportation",
   Options = {"⭐ VIP", "👑 Premium", "🎁 Salle Giveaway", "🏠 Spawn", "🎥 Cinéma", "🔰 Saff Room", "☢️ Toxic Room"},  -- Ajout de Toxic Room
   CurrentOption = {"⭐ VIP"},  -- L'option par défaut
   MultipleOptions = false,  -- Choix unique
   Flag = "DropdownTP",  -- Identifiant pour la configuration
   Callback = function(Options)
       -- Lorsque l'option est sélectionnée, téléporte le joueur à la position correspondante
       local targetPosition

       if Options[1] == "⭐ VIP" then
           targetPosition = Vector3.new(1314, 48, 110)  -- Position VIP
       elseif Options[1] == "👑 Premium" then
           targetPosition = Vector3.new(498, 79, 1171)  -- Position Premium
       elseif Options[1] == "🎁 Salle Giveaway" then
           targetPosition = Vector3.new(-2304, 9, 116)  -- Position Giveaway
       elseif Options[1] == "🏠 Spawn" then
           targetPosition = Vector3.new(-2095, 4, 119)  -- Position Spawn
       elseif Options[1] == "🎥 Cinéma" then
           targetPosition = Vector3.new(133, 31, -8488)  -- Position Cinéma
       elseif Options[1] == "🔰 Saff Room" then
           targetPosition = Vector3.new(189, 31, -8452)  -- Position Saff Room
       elseif Options[1] == "☢️ Toxic Room" then
           targetPosition = Vector3.new(1122, 53, 2100)  -- Position Toxic Room
       end

       -- Téléporte le joueur à la position choisie
       game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
   end,
})

local ScriptsTab = Window:CreateTab("Scripts", "code") -- Titre, Icône

-- 📄 Ajout d'un label de présentation
local Label = ScriptsTab:CreateLabel("📜 Sélection de scripts utiles", "terminal")

-- 📝 Ajout d'un paragraphe explicatif
local Paragraph = ScriptsTab:CreateParagraph({
    Title = "À propos",
    Content = "Cette section contient des scripts populaires comme Infinite Yield ou Dex Explorer. Cliquez sur un bouton pour exécuter le script dans votre jeu."
})

-- 🔘 Bouton pour Infinite Yield
local Button = ScriptsTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})

-- 🔘 Bouton pour Dex Explorer
local Button = ScriptsTab:CreateButton({
   Name = "Dex Explorer",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
   end,
})

local TPTab = Window:CreateTab("Teleport to Player", "circle-user-round") -- Title, Image

local Input = TPTab:CreateInput({
   Name = "Teleport Input",
   CurrentValue = "",
   PlaceholderText = "Enter Username or Display Name",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
       for _, player in pairs(game.Players:GetPlayers()) do
           if player.Name:sub(1, #Text):lower() == Text:lower() or player.DisplayName:sub(1, #Text):lower() == Text:lower() then
               local targetCharacter = player.Character
               if targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart") then
                   game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(targetCharacter.HumanoidRootPart.CFrame)
                   break
               end
           end
       end
   end,
})

-- Création du nouveau tab "Infos"
local InfoTab = Window:CreateTab("Infos Voice Chat", "badge-info") -- Tu peux changer l'emoji et l'ID de l'image

-- Un label simple avec un emoji et une icône
local Label = InfoTab:CreateLabel("Pourquoi ce script", "help-circle") -- Icône Lucide : "help-circle"

-- Paragraphe explicatif
local Paragraph = InfoTab:CreateParagraph({
    Title = "À propos",
    Content = "Ce script Voice Chat Relax est conçu pour le fun. Il intègre des outils comme Infinite Yield et Dex Explorer pour améliorer l'expérience de jeu."
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
- 🔄 Boucle AFK : Nouvelle fonctionnalité pour rester AFK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━

- ⚡ Vitesse de marche ajustable (WalkSpeed) : Boostez votre vitesse !
━━━━━━━━━━━━━━━━━━━━━━━━━━━━

- 🗡️ Give Sword (FIX) : Correction du bug pour donner une épée
━━━━━━━━━━━━━━━━━━━━━━━━━━━━

- 🌍 Téléportation vers des salles :
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - ⭐ VIP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - 👑 Premium
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - 🎁 Giveaway
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - 🏠 Spawn
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- ☢️ Toxic Room
━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎮 Section Scripts :
   - 🔹 Infinite Yield
   - 🔹 Dex Explorer
━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🚶‍♂️ Téléportation vers un joueur : Entrez le pseudo et vous serez téléporté !
]]
})
