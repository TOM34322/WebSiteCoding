--[=[  
    🚂 CONTRÔLEUR ULTRA-RAPIDE (Spam max speed)
]=]--

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "🚂 Spam Contrôleur Max",
    LoadingTitle = "Chargement...",
    LoadingSubtitle = "Vitesse maximale",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "CartControllerFast"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvite",
        RememberJoins = true
    },
    KeySystem = false,
})

local MainTab = Window:CreateTab("🚂 Contrôle", 4483362458)

local targetNames = { ["Up"] = true, ["Down"] = true, ["On"] = true }
local activeObjects = { Up = {}, Down = {}, On = {} }

local statusParagraph = MainTab:CreateParagraph({
    Title = "📊 Statut",
    Content = "Recherche en cours...",
})

-- ============================================
-- 🔍 SCANNER UNIVERSEL RAPIDE
-- ============================================

local function RescanObjects()
    activeObjects.Up = {}
    activeObjects.Down = {}
    activeObjects.On = {}
    
    local foundCount = 0
    
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant.Name == "Controller" then
            for _, child in ipairs(descendant:GetChildren()) do
                if targetNames[child.Name] then
                    -- Cible prioritaire : l'enfant "Click" ou un ClickDetector / Part dedans
                    local clickTarget = child:FindFirstChild("Click") or child:FindFirstChildOfClass("ClickDetector") or child
                    
                    if clickTarget then
                        table.insert(activeObjects[child.Name], clickTarget)
                        foundCount = foundCount + 1
                    end
                end
            end
        end
    end
    
    statusParagraph:Set({
        Title = "📊 Statut",
        Content = "Contrôleurs prêts : " .. foundCount .. " (Up: " .. #activeObjects.Up .. " | Down: " .. #activeObjects.Down .. " | On: " .. #activeObjects.On .. ")"
    })
end

RescanObjects()

-- Rescan automatique si un contrôleur apparaît ou disparaît
workspace.DescendantAdded:Connect(function(d)
    if d.Name == "Controller" or targetNames[d.Name] or d.Name == "Click" then
        task.wait(0.1)
        RescanObjects()
    end
end)

workspace.DescendantRemoving:Connect(function(d)
    if d.Name == "Controller" or targetNames[d.Name] or d.Name == "Click" then
        task.wait(0.1)
        RescanObjects()
    end
end)

-- ============================================
-- ⚡ FONCTION D'ACTIVATION INSTANTANÉE
-- ============================================

local function FireFast(list)
    for _, obj in ipairs(list) do
        pcall(function()
            if obj:IsA("ClickDetector") then
                if fireclickdetector then fireclickdetector(obj) else obj:MouseClick() end
            elseif obj.Name == "Click" then
                -- Si c'est l'objet "Click", on cherche un ClickDetector dedans ou on clique la Part
                local cd = obj:FindFirstChildOfClass("ClickDetector")
                if cd then
                    if fireclickdetector then fireclickdetector(cd) else cd:MouseClick() end
                elseif obj:IsA("BasePart") then
                    if fireclickdetector then fireclickdetector(obj) else obj:MouseClick() end
                end
            elseif obj:IsA("BasePart") or obj:IsA("Model") or obj:IsA("Folder") then
                local cd = obj:FindFirstChildOfClass("ClickDetector")
                if cd then
                    if fireclickdetector then fireclickdetector(cd) else cd:MouseClick() end
                end
            end
        end)
    end
end

-- ============================================
-- 🎯 INTERFACE (Toggles Hyper Rapides)
-- ============================================

MainTab:CreateSection("⚡ Spam Turbo (Vitesse Max)")

-- TOGGLE UP
local spamUp = false
MainTab:CreateToggle({
    Name = "⚡ TURBO SPAM [ UP ]",
    CurrentValue = false,
    Flag = "TurboUp",
    Callback = function(Value)
        spamUp = Value
        if Value then
            task.spawn(function()
                while spamUp do
                    FireFast(activeObjects.Up)
                    task.wait() -- Boucle à la vitesse maximale du moteur du jeu (0 délai)
                end
            end)
        end
    end,
})

-- TOGGLE DOWN
local spamDown = false
MainTab:CreateToggle({
    Name = "⚡ TURBO SPAM [ DOWN ]",
    CurrentValue = false,
    Flag = "TurboDown",
    Callback = function(Value)
        spamDown = Value
        if Value then
            task.spawn(function()
                while spamDown do
                    FireFast(activeObjects.Down)
                    task.wait()
                end
            end)
        end
    end,
})

-- TOGGLE ON
local spamOn = false
MainTab:CreateToggle({
    Name = "⚡ TURBO SPAM [ ON ]",
    CurrentValue = false,
    Flag = "TurboOn",
    Callback = function(Value)
        spamOn = Value
        if Value then
            task.spawn(function()
                while spamOn do
                    FireFast(activeObjects.On)
                    task.wait()
                end
            end)
        end
    end,
})

-- ============================================
-- ⚙️ OPTIONS
-- ============================================

local SettingsTab = Window:CreateTab("⚙️ Options", 4483362458)

SettingsTab:CreateButton({
    Name = "🔄 Forcer le Rescan",
    Callback = function()
        RescanObjects()
        Rayfield:Notify({ Title = "🔄 Rescan", Content = "Actualisé !", Duration = 1 })
    end,
})

SettingsTab:CreateButton({
    Name = "❌ Fermer",
    Callback = function()
        Rayfield:Destroy()
    end,
})

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.X then
        Rayfield:ToggleVisibility(not Rayfield:IsVisible())
    end
end)

Rayfield:Notify({
    Title = "🚀 Prêt - Turbo Actif !",
    Content = "X = Ouvrir/Fermer le menu",
    Duration = 3,
})
