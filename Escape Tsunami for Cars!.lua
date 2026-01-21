local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

_G.TsunamiEnabled = true
_G.AutoUpgrade = false
_G.SelectedCarObj = nil

local basePos = CFrame.new(119, 3, 0)
local secretZonePos = CFrame.new(2398, 3, -52)

-- 🌊 ANTI-TSUNAMI
task.spawn(function()
    while task.wait(0.5) do 
        if _G.TsunamiEnabled then
            local t = workspace:FindFirstChild("ActiveTsunamis")
            if t then for _, v in pairs(t:GetChildren()) do v:Destroy() end end 
        end
    end
end)

-- ⚡ AUTO-UPGRADE
task.spawn(function()
    while task.wait(1) do
        if _G.AutoUpgrade then
            local func = ReplicatedStorage:FindFirstChild("RemoteFunctions") and ReplicatedStorage.RemoteFunctions:FindFirstChild("UpgradeSpeed")
            if func then func:InvokeServer() end
        end
    end
end)

local Window = Rayfield:CreateWindow({
    Name = "🏎️ PANEL V3 | REFRESH FIX",
    LoadingTitle = "Protocol Final",
    ConfigurationSaving = {Enabled = false}
})

local MainTab = Window:CreateTab("🎯 Acquisition", nil)

-- Fonction de Scan propre
local function GetCarList()
    local names = {}
    local objects = {}
    for _, folderName in pairs({"Secret", "Rare"}) do
        local folder = workspace:FindFirstChild("ActiveCars") and workspace.ActiveCars:FindFirstChild(folderName)
        if folder then
            for _, car in pairs(folder:GetChildren()) do
                if car:IsA("Model") then
                    local label = "["..folderName.."] "..car.Name
                    table.insert(names, label)
                    objects[label] = car
                end
            end
        end
    end
    return names, objects
end

local carNames, carObjects = GetCarList()

-- --- INTERFACE ---

local CarDropdown = MainTab:CreateDropdown({
    Name = "Sélectionner un véhicule",
    Options = carNames,
    CurrentOption = "",
    Callback = function(Option)
        local choice = type(Option) == "table" and Option[1] or Option
        _G.SelectedCarObj = carObjects[choice]
    end,
})

MainTab:CreateButton({
    Name = "🔄 REFRESH LA LISTE",
    Callback = function()
        local newNames, newObjects = GetCarList()
        carNames = newNames
        carObjects = newObjects
        CarDropdown:Set(carNames)
        Rayfield:Notify({Title = "Système", Content = "Liste mise à jour !", Duration = 2})
    end,
})

MainTab:CreateButton({
    Name = "🚀 LANCER L'ACQUISITION",
    Callback = function()
        local h = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local target = _G.SelectedCarObj
        if h and target then
            local root = target:FindFirstChild("Root") or target:FindFirstChildWhichIsA("BasePart", true)
            local prompt = target:FindFirstChildWhichIsA("ProximityPrompt", true)
            
            if root and prompt then
                -- Aller
                local tween = TweenService:Create(h, TweenInfo.new((h.Position - root.Position).Magnitude/250, Enum.EasingStyle.Linear), {CFrame = root.CFrame * CFrame.new(0, 2, 0)})
                tween:Play()
                tween.Completed:Wait()
                
                -- Prendre
                task.wait(0.6)
                prompt.HoldDuration = 0
                for i = 1, 10 do fireproximityprompt(prompt) task.wait(0.05) end
                
                -- Retour
                task.wait(0.3)
                local tweenBack = TweenService:Create(h, TweenInfo.new((h.Position - basePos.Position).Magnitude/300, Enum.EasingStyle.Linear), {CFrame = basePos})
                tweenBack:Play()
            end
        else
            Rayfield:Notify({Title = "Erreur", Content = "Aucun véhicule sélectionné", Duration = 2})
        end
    end,
})

MainTab:CreateSection("⚙️ Options & Sécurité")

MainTab:CreateToggle({
    Name = "⚡ Auto Upgrade Speed",
    CurrentValue = false,
    Callback = function(v) _G.AutoUpgrade = v end
})

MainTab:CreateToggle({
    Name = "🌊 Anti-Tsunami",
    CurrentValue = true,
    Callback = function(v) _G.TsunamiEnabled = v end
})

MainTab:CreateButton({
    Name = "📍 Retour Zone Secret",
    Callback = function()
        local h = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if h then
            local tween = TweenService:Create(h, TweenInfo.new((h.Position - secretZonePos.Position).Magnitude/350, Enum.EasingStyle.Linear), {CFrame = secretZonePos})
            tween:Play()
        end
    end,
})

-- Initialisation
local h_init = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
h_init.CFrame = secretZonePos
