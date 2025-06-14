-- Chargement de Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Thème nature
local DarkNatureTheme = {
    TextColor = Color3.fromRGB(200, 230, 200),
    Background = Color3.fromRGB(15, 25, 15),
    Topbar = Color3.fromRGB(30, 50, 30),
    Shadow = Color3.fromRGB(10, 18, 10),

    NotificationBackground = Color3.fromRGB(40, 70, 40),
    NotificationActionsBackground = Color3.fromRGB(60, 100, 60),

    TabBackground = Color3.fromRGB(30, 60, 30),
    TabStroke = Color3.fromRGB(40, 80, 40),
    TabBackgroundSelected = Color3.fromRGB(55, 110, 55),
    TabTextColor = Color3.fromRGB(160, 200, 160),
    SelectedTabTextColor = Color3.fromRGB(210, 255, 210),

    ElementBackground = Color3.fromRGB(25, 50, 25),
    ElementBackgroundHover = Color3.fromRGB(40, 80, 40),
    SecondaryElementBackground = Color3.fromRGB(35, 70, 35),
    ElementStroke = Color3.fromRGB(60, 110, 60),
    SecondaryElementStroke = Color3.fromRGB(50, 90, 50),

    SliderBackground = Color3.fromRGB(50, 100, 50),
    SliderProgress = Color3.fromRGB(65, 140, 65),
    SliderStroke = Color3.fromRGB(45, 90, 45),

    ToggleBackground = Color3.fromRGB(30, 55, 30),
    ToggleEnabled = Color3.fromRGB(0, 110, 0),
    ToggleDisabled = Color3.fromRGB(90, 90, 90),
    ToggleEnabledStroke = Color3.fromRGB(0, 150, 0),
    ToggleDisabledStroke = Color3.fromRGB(80, 80, 80),
    ToggleEnabledOuterStroke = Color3.fromRGB(30, 90, 30),
    ToggleDisabledOuterStroke = Color3.fromRGB(60, 60, 60),

    DropdownSelected = Color3.fromRGB(50, 90, 50),
    DropdownUnselected = Color3.fromRGB(35, 70, 35),

    InputBackground = Color3.fromRGB(30, 60, 30),
    InputStroke = Color3.fromRGB(60, 90, 60),
    PlaceholderColor = Color3.fromRGB(130, 180, 130)
}

-- Interface principale
local Window = Rayfield:CreateWindow({
    Name = "Lost Currents [Alpha]",
    Icon = "fish",
    LoadingTitle = "Chargement...",
    LoadingSubtitle = "Merci d'utiliser notre Script !",
    Theme = DarkNatureTheme,
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

-- Valeur d’oxygène par défaut
local OxyValue = 60

-- Slider pour oxygène
local Slider = Tab:CreateSlider({
    Name = "Quantité d'Oxygène",
    Range = {0, 99999999999999999999999999999999999999999999999},
    Increment = 5,
    Suffix = "%",
    CurrentValue = OxyValue,
    Flag = "OxySlider",
    Callback = function(Value)
        OxyValue = Value
    end,
})

-- Fonction pour récupérer la remote d'oxygène (nom contenant "air")
local function getOxyRemote()
    local rep = ReplicatedStorage
    for _, r in pairs(rep:GetChildren()) do
        if r:IsA("RemoteEvent") and r.Name:lower():find("air") then
            return r
        end
    end
    return nil
end

-- Bouton donner oxygène
Tab:CreateButton({
    Name = "Donner Oxygène",
    Callback = function()
        local success, err = pcall(function()
            local Remote = getOxyRemote()
            if Remote then
                Remote:FireServer(OxyValue)
            else
                error("Canal non disponible.")
            end
        end)

        Rayfield:Notify({
            Title = success and "Succès" or "Erreur",
            Content = success and ("Oxygène appliqué : " .. tostring(OxyValue) .. "%") or "Action impossible.",
            Duration = 4,
            Image = success and "wind" or "alert-triangle"
        })
    end
})

-- Bouton soin
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

-- Dropdown sélection de skin
local skins = {"Builder", "Businessman", "Pirate"}
local SkinDropdown = Tab:CreateDropdown({
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
        if success then
            Rayfield:Notify({
                Title = "Succès",
                Content = "Skin équipé : " .. chosenSkin,
                Duration = 3,
                Image = "check"
            })
        else
            Rayfield:Notify({
                Title = "Erreur",
                Content = "Impossible d'équiper le skin",
                Duration = 3,
                Image = "alert-triangle"
            })
        end
    end
})

-- Bouton Résusciter Gratuitement
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

-- Historique des mises à jour (tu peux éditer ou ajouter des lignes ici)
local changelog = {
    "v1.0 - Script initial : oxygène, soin, skins",
    "v1.1 - Ajout du bouton Résusciter Gratuitement",
    "v1.2 - Ajout des notifications pour chaque action",
    "v1.3 - Thème nature amélioré",
    "v1.4 - Ajout du launcher Infinite Yield",
}

-- Fonction pour concaténer la liste dans un seul string
local function formatChangelog(list)
    local text = ""
    for i, entry in ipairs(list) do
        text = text .. "- " .. entry .. "\n"
    end
    return text
end

-- Affichage du changelog dans l'onglet
InfoTab:CreateParagraph({
    Title = "Historique des mises à jour",
    Content = formatChangelog(changelog)
})

-- Description générale
InfoTab:CreateParagraph({
    Title = "Infos sur le script",
    Content = "C'est le tout premier script créé pour ce jeu. Pour l'instant, il permet uniquement de donner de l'oxygène et de la vie. Je cherche encore d'autres fonctionnalités pour plus de fun !"
})

-- Bouton pour lancer Infinite Yield
InfoTab:CreateButton({
    Name = "Launch Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
})
