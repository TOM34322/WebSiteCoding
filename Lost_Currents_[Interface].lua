local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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

local Window = Rayfield:CreateWindow({
    Name = "Lost Currents [Interface]",
    Icon = "fish",
    LoadingTitle = "Chargement...",
    LoadingSubtitle = "Interface Personnalisée",
    Theme = DarkNatureTheme,
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "LostCurrents",
        FileName = "InterfaceConfig"
    }
})

local Tab = Window:CreateTab("Fonctions", "fish")

local Section = Tab:CreateSection("Outils Utiles")

local OxyValue = 60

local Slider = Tab:CreateSlider({
    Name = "Quantité d'Oxygène",
    Range = {0, 100},
    Increment = 5,
    Suffix = "%",
    CurrentValue = OxyValue,
    Flag = "OxySlider",
    Callback = function(Value)
        OxyValue = Value
    end,
})

Tab:CreateButton({
    Name = "Donner Oxygène",
    Callback = function()
        local success, err = pcall(function()
            local Remote = game:GetService("ReplicatedStorage"):FindFirstChild("AirChange")
            if Remote then
                Remote:FireServer(OxyValue)
            else
                error("Remote 'AirChange' non trouvé.")
            end
        end)

        Rayfield:Notify({
            Title = success and "Succès" or "Erreur",
            Content = success and ("Oxygène donné : " .. tostring(OxyValue)) or "Remote AirChange introuvable.",
            Duration = 4,
            Image = success and "wind" or "alert-triangle"
        })
    end
})

Tab:CreateButton({
    Name = "Soigner le Joueur",
    Callback = function()
        local success, err = pcall(function()
            local player = game.Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            local hum = char and char:FindFirstChild("Humanoid")

            if hum then
                hum.Health = hum.MaxHealth
            else
                error("Aucun humanoïde trouvé.")
            end
        end)

        Rayfield:Notify({
            Title = success and "Succès" or "Erreur",
            Content = success and "Tu es soigné à fond !" or "Impossible de te soigner.",
            Duration = 4,
            Image = success and "heart-pulse" or "alert-triangle"
        })
    end
})
