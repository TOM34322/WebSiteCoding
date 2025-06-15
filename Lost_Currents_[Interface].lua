-- Chargement de Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Thème spatial violet (Comet Space)
local CometSpaceTheme = {
    TextColor = Color3.fromRGB(220, 200, 255),
    Background = Color3.fromRGB(10, 8, 25),
    Topbar = Color3.fromRGB(30, 0, 60),
    Shadow = Color3.fromRGB(5, 5, 15),

    NotificationBackground = Color3.fromRGB(30, 20, 50),
    NotificationActionsBackground = Color3.fromRGB(60, 40, 90),

    TabBackground = Color3.fromRGB(20, 15, 35),
    TabStroke = Color3.fromRGB(60, 40, 100),
    TabBackgroundSelected = Color3.fromRGB(80, 50, 130),
    TabTextColor = Color3.fromRGB(180, 160, 220),
    SelectedTabTextColor = Color3.fromRGB(240, 220, 255),

    ElementBackground = Color3.fromRGB(25, 15, 40),
    ElementBackgroundHover = Color3.fromRGB(40, 25, 60),
    SecondaryElementBackground = Color3.fromRGB(35, 25, 50),
    ElementStroke = Color3.fromRGB(80, 60, 120),
    SecondaryElementStroke = Color3.fromRGB(70, 50, 100),

    SliderBackground = Color3.fromRGB(60, 45, 90),
    SliderProgress = Color3.fromRGB(130, 90, 200),
    SliderStroke = Color3.fromRGB(90, 60, 140),

    ToggleBackground = Color3.fromRGB(40, 30, 60),
    ToggleEnabled = Color3.fromRGB(170, 90, 255),
    ToggleDisabled = Color3.fromRGB(90, 90, 90),
    ToggleEnabledStroke = Color3.fromRGB(200, 120, 255),
    ToggleDisabledStroke = Color3.fromRGB(80, 80, 80),
    ToggleEnabledOuterStroke = Color3.fromRGB(110, 70, 170),
    ToggleDisabledOuterStroke = Color3.fromRGB(60, 60, 60),

    DropdownSelected = Color3.fromRGB(80, 60, 120),
    DropdownUnselected = Color3.fromRGB(60, 45, 100),

    InputBackground = Color3.fromRGB(35, 25, 55),
    InputStroke = Color3.fromRGB(100, 70, 160),
    PlaceholderColor = Color3.fromRGB(160, 130, 200)
}

-- Interface principale
local Window = Rayfield:CreateWindow({
    Name = "Lost Currents [Alpha]",
    Icon = "fish",
    LoadingTitle = "Chargement...",
    LoadingSubtitle = "Merci d'utiliser notre Script !",
    Theme = CometSpaceTheme,
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "LostCurrents",
        FileName = "InterfaceConfig"
    }
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Onglet Fonctions
local Tab = Window:CreateTab("Fonctions", "fish")
local Section = Tab:CreateSection("Outils Utiles")

-- Bouton Oxygène Infini
Tab:CreateButton({
    Name = "Activer Oxygène Infini",
    Callback = function()
        local success, err = pcall(function()
            local Remote = ReplicatedStorage:FindFirstChild("AirChange")
            if Remote and Remote:IsA("RemoteEvent") then
                Remote:FireServer(math.huge)
            else
                error("Remote 'AirChange' non trouvée.")
            end
        end)

        Rayfield:Notify({
            Title = success and "Succès" or "Erreur",
            Content = success and "Oxygène infini activé !" or ("Échec : " .. tostring(err)),
            Duration = 4,
            Image = success and "wind" or "alert-triangle"
        })
    end
})

-- Soigner
Tab:CreateButton({
    Name = "Soigner le Joueur",
    Callback = function()
        local success, err = pcall(function()
            local player = Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            local hum = char and char:FindFirstChild("Humanoid")
            if hum then
                hum.Health = hum.MaxHealth
            else
                error("Aucun corps valide.")
            end
        end)

        Rayfield:Notify({
            Title = success and "Succès" or "Erreur",
            Content = success and "Tu es rétabli." or "Soin non appliqué.",
            Duration = 4,
            Image = success and "heart-pulse" or "alert-triangle"
        })
    end
})

-- Choix de skin
local skins = {"Builder", "Businessman", "Pirate", "Shark Hunter", "Medic", "Bolt Licker", "Engineer", "Fisherman"}
Tab:CreateDropdown({
    Name = "Sélection de Skin",
    Options = skins,
    CurrentOption = {skins[1]},
    MultipleOptions = false,
    Flag = "SkinDropdown",
    Callback = function(selected)
        local chosenSkin = selected[1]
        local success, err = pcall(function()
            local SelectedClass = ReplicatedStorage:WaitForChild("SelectedClass")
            SelectedClass:FireServer(chosenSkin)
        end)
        Rayfield:Notify({
            Title = success and "Succès" or "Erreur",
            Content = success and "Skin équipé : " .. chosenSkin or "Impossible d'équiper le skin",
            Duration = 3,
            Image = success and "check" or "alert-triangle"
        })
    end
})

-- Résusciter gratuitement
Tab:CreateButton({
    Name = "Résusciter Gratuitement",
    Callback = function()
        local success, err = pcall(function()
            local respawnRemote = ReplicatedStorage:WaitForChild("RespawnRequest")
            respawnRemote:FireServer()
        end)

        Rayfield:Notify({
            Title = success and "Succès" or "Erreur",
            Content = success and "Tu as été ressuscité sans payer !" or ("Erreur : "..tostring(err)),
            Duration = 4,
            Image = success and "plus-circle" or "alert-triangle"
        })
    end
})

-- Onglet Infos
local InfoTab = Window:CreateTab("Infos", "info")

local changelog = {
    "v1.0 - Script initial : oxygène, soin, skins",
    "v1.1 - Ajout du bouton Résusciter Gratuitement",
    "v1.2 - Ajout des notifications pour chaque action",
    "v1.3 - Thème nature amélioré",
    "v1.4 - Ajout du launcher Infinite Yield",
    "v1.5 - Nouveau thème spatial violet ajouté"
}

local function formatChangelog(list)
    local text = ""
    for i, entry in ipairs(list) do
        text = text .. "- " .. entry .. "\n"
    end
    return text
end

InfoTab:CreateParagraph({
    Title = "Historique des mises à jour",
    Content = formatChangelog(changelog)
})

InfoTab:CreateParagraph({
    Title = "Infos sur le script",
    Content = "Script utilitaire pour Lost Currents. Oxygen, soins, skins, et plus. Nouveau thème spatial !"
})

InfoTab:CreateButton({
    Name = "Launch Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
})


-- Tables pour stocker les ESP
local espGoldBillboards = {}
local espScrapsBillboards = {}

-- Fonction pour créer un ESP simple
local function createESP(part, color)
    if not part:IsA("BasePart") then return nil end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP"
    billboard.Adornee = part
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel", billboard)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = color
    textLabel.TextStrokeTransparency = 0
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.Text = part.Name
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextScaled = true

    billboard.Parent = game.CoreGui:FindFirstChild("ESPFolder") or Instance.new("Folder", game.CoreGui)
    billboard.Parent.Name = "ESPFolder"
    return billboard
end

-- Toggle ESP Gold
local espGoldEnabled = false
Tab:CreateToggle({
    Name = "ESP Gold",
    CurrentValue = false,
    Flag = "ToggleESPGold",
    Callback = function(Value)
        espGoldEnabled = Value
        local espFolder = game.CoreGui:FindFirstChild("ESPFolder")
        if not espFolder then
            espFolder = Instance.new("Folder")
            espFolder.Name = "ESPFolder"
            espFolder.Parent = game.CoreGui
        end

        if espGoldEnabled then
            for _, part in ipairs(workspace:WaitForChild("Gold"):GetChildren()) do
                local esp = createESP(part, Color3.fromRGB(255, 215, 0)) -- Or jaune
                espGoldBillboards[part] = esp
            end
        else
            for _, esp in pairs(espGoldBillboards) do
                if esp then esp:Destroy() end
            end
            espGoldBillboards = {}
        end

        Rayfield:Notify({
            Title = "ESP Gold",
            Content = espGoldEnabled and "Activé" or "Désactivé",
            Duration = 3,
            Image = espGoldEnabled and "eye" or "eye-off"
        })
    end,
})

-- Toggle ESP Scraps
local espScrapsEnabled = false
Tab:CreateToggle({
    Name = "ESP Scraps",
    CurrentValue = false,
    Flag = "ToggleESPScraps",
    Callback = function(Value)
        espScrapsEnabled = Value
        local espFolder = game.CoreGui:FindFirstChild("ESPFolder")
        if not espFolder then
            espFolder = Instance.new("Folder")
            espFolder.Name = "ESPFolder"
            espFolder.Parent = game.CoreGui
        end

        if espScrapsEnabled then
            for _, part in ipairs(workspace:WaitForChild("Scraps"):GetChildren()) do
                local esp = createESP(part, Color3.fromRGB(192, 192, 192)) -- Gris argenté
                espScrapsBillboards[part] = esp
            end
        else
            for _, esp in pairs(espScrapsBillboards) do
                if esp then esp:Destroy() end
            end
            espScrapsBillboards = {}
        end

        Rayfield:Notify({
            Title = "ESP Scraps",
            Content = espScrapsEnabled and "Activé" or "Désactivé",
            Duration = 3,
            Image = espScrapsEnabled and "eye" or "eye-off"
        })
    end,
})

Tab:CreateButton({
    Name = "Dupliquer le Fuel Tool",
    Callback = function()
        local success, err = pcall(function()
            local respawnRemote = ReplicatedStorage:WaitForChild("RespawnRequest")
            respawnRemote:FireServer()
        end)

        Rayfield:Notify({
            Title = success and "Succès" or "Erreur",
            Content = success and "Fuel Tool dupliqué (via résurrection) !" or ("Erreur : " .. tostring(err)),
            Duration = 4,
            Image = success and "fuel" or "alert-triangle"
        })
    end
})
