local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

_G.TsunamiEnabled = true
_G.AutoUpgrade = false
_G.SelectedCarObj = nil

local basePos = CFrame.new(119, 3, 0)
local secretZonePos = CFrame.new(2398, 3, -52)

task.spawn(function()
    while task.wait(0.5) do 
        if _G.TsunamiEnabled then
            local t = workspace:FindFirstChild("ActiveTsunamis")
            if t then for _, v in pairs(t:GetChildren()) do v:Destroy() end end 
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if _G.AutoUpgrade then
            local func = ReplicatedStorage:FindFirstChild("RemoteFunctions") and ReplicatedStorage.RemoteFunctions:FindFirstChild("UpgradeSpeed")
            if func then func:InvokeServer() end
        end
    end
end)

local Window = Rayfield:CreateWindow({
    Name = "Grab Cars",
    LoadingTitle = "Genesis Protocol",
    ConfigurationSaving = {Enabled = false},
    Theme = "Amethyst" -- Change ici par "AmberGlow", "Ocean", "Green", etc.
})

local MainTab = Window:CreateTab("🎯 Main", nil)

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
    if #names == 0 then table.insert(names, "Aucun véhicule détecté") end
    return names, objects
end

local carNames, carObjects = GetCarList()

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
    Name = "🔄 Refresh Liste",
    Callback = function()
        local n, o = GetCarList()
        carNames = n
        carObjects = o
        CarDropdown:Set(carNames)
    end,
})

MainTab:CreateButton({
    Name = "🚀 LANCER L'ACQUISITION",
    Callback = function()
        local h = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if h and _G.SelectedCarObj then
            local root = _G.SelectedCarObj:FindFirstChild("Root") or _G.SelectedCarObj:FindFirstChildWhichIsA("BasePart", true)
            local prompt = _G.SelectedCarObj:FindFirstChildWhichIsA("ProximityPrompt", true)
            if root and prompt then
                local tween = TweenService:Create(h, TweenInfo.new((h.Position - root.Position).Magnitude/250, Enum.EasingStyle.Linear), {CFrame = root.CFrame * CFrame.new(0, 2, 0)})
                tween:Play()
                tween.Completed:Wait()
                task.wait(0.7)
                prompt.HoldDuration = 0
                for i = 1, 10 do fireproximityprompt(prompt) task.wait(0.05) end
                task.wait(0.3)
                TweenService:Create(h, TweenInfo.new((h.Position - basePos.Position).Magnitude/300, Enum.EasingStyle.Linear), {CFrame = basePos}):Play()
            end
        end
    end,
})

MainTab:CreateSection("⚙️ Settings")

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
            TweenService:Create(h, TweenInfo.new((h.Position - secretZonePos.Position).Magnitude/350, Enum.EasingStyle.Linear), {CFrame = secretZonePos}):Play()
        end
    end,
})

local h_init = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
h_init.CFrame = secretZonePos
