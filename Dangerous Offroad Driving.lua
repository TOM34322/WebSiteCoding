local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Car Game",
   Icon = 0,
   LoadingTitle = "Car Game",
   LoadingSubtitle = "Auto Win & Spawn",
   ShowText = "Menu",
   Theme = "Default",
   ToggleUIKeybind = "K",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "CarGame",
      FileName = "Config"
   },
   KeySystem = false
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local MainTab = Window:CreateTab("Main")
local SpawnTab = Window:CreateTab("Spawn All")
local StatusTab = Window:CreateTab("Status")

local autoWinActive = false
local loopConnection = nil

-- INSTANT WIN FUNCTION
local function InstantWin()
    local finishLine = workspace:FindFirstChild("C5E")
    if finishLine then
        finishLine = finishLine:FindFirstChild("FinishLine")
        if finishLine then
            finishLine = finishLine:FindFirstChild("Union")
            if finishLine then
                local pos = finishLine.Position
                if HumanoidRootPart then
                    HumanoidRootPart.CFrame = CFrame.new(pos)
                end
                return
            end
        end
    end
    -- Use coordinates if Union not found
    if HumanoidRootPart then
        HumanoidRootPart.CFrame = CFrame.new(1741, 169, -14612)
    end
end

-- RESET CHECKPOINT
local function ResetCheckpoint()
    local remote = ReplicatedStorage:FindFirstChild("ResetCheckpointEvent")
    if remote then
        remote:FireServer()
    end
end

-- AUTO WIN LOOP
local function startAutoWin()
    if autoWinActive then return end
    autoWinActive = true
    
    Rayfield:Notify({
        Title = "Auto Win",
        Content = "Started! Teleporting every 2 seconds",
        Duration = 3,
        Image = "trophy"
    })
    
    loopConnection = game:GetService("RunService").Stepped:Connect(function()
        if autoWinActive then
            InstantWin()
            wait(0.5)
            ResetCheckpoint()
        end
    end)
end

local function stopAutoWin()
    if not autoWinActive then return end
    autoWinActive = false
    
    if loopConnection then
        loopConnection:Disconnect()
        loopConnection = nil
    end
    
    Rayfield:Notify({
        Title = "Auto Win",
        Content = "Stopped!",
        Duration = 2,
        Image = "square"
    })
end

-- SPAWN ALL CARS FUNCTION
local function spawnAllCars()
    local carList = {
        "Baja", "Branor", "Buggy", "Firetruck", "Van", "Vortex"
    }
    
    local unlocks = ReplicatedStorage:FindFirstChild("Unlocks")
    if not unlocks then
        Rayfield:Notify({Title = "Error", Content = "Unlocks folder not found", Duration = 2, Image = "alert"})
        return
    end
    
    for _, carName in ipairs(carList) do
        local remote = unlocks:FindFirstChild("Unlock" .. carName)
        if remote then
            remote:FireServer()
            wait(0.1)
        end
    end
    
    Rayfield:Notify({
        Title = "Done",
        Content = "All vehicles unlocked!",
        Duration = 2,
        Image = "crown"
    })
end

-- BUTTONS

MainTab:CreateLabel("Instant Win", "trophy")
MainTab:CreateDivider()

MainTab:CreateButton({
    Name = "🏆 INSTANT WIN (1 TIME) 🏆",
    Callback = function()
        InstantWin()
        Rayfield:Notify({Title = "Done", Content = "Teleported to finish line", Duration = 1, Image = "trophy"})
    end
})

MainTab:CreateButton({
    Name = "Reset Checkpoint",
    Callback = function()
        ResetCheckpoint()
        Rayfield:Notify({Title = "Done", Content = "Checkpoint reset", Duration = 1, Image = "refresh"})
    end
})

MainTab:CreateDivider()
MainTab:CreateLabel("Auto Win (Infinite)", "infinity")
MainTab:CreateDivider()

MainTab:CreateButton({
    Name = "▶️ START AUTO WIN (INFINITE) ▶️",
    Callback = function()
        startAutoWin()
    end
})

MainTab:CreateButton({
    Name = "⏹️ STOP AUTO WIN ⏹️",
    Callback = function()
        stopAutoWin()
    end
})

MainTab:CreateDivider()
MainTab:CreateLabel("Car Spawn", "car")
MainTab:CreateDivider()

MainTab:CreateButton({
    Name = "Select Car 1",
    Callback = function()
        local remote = ReplicatedStorage:FindFirstChild("CarSelectionEvent")
        if remote then
            remote:FireServer("1")
            Rayfield:Notify({Title = "Done", Content = "Car 1 selected", Duration = 1, Image = "check"})
        end
    end
})

MainTab:CreateButton({
    Name = "Spawn Car",
    Callback = function()
        local remote = ReplicatedStorage:FindFirstChild("SpawnCarEvent")
        if remote then
            remote:FireServer()
            Rayfield:Notify({Title = "Done", Content = "Car spawned", Duration = 1, Image = "car"})
        end
    end
})

MainTab:CreateButton({
    Name = "Select + Spawn (Combo)",
    Callback = function()
        local select = ReplicatedStorage:FindFirstChild("CarSelectionEvent")
        local spawn = ReplicatedStorage:FindFirstChild("SpawnCarEvent")
        if select and spawn then
            select:FireServer("1")
            wait(0.2)
            spawn:FireServer()
            Rayfield:Notify({Title = "Done", Content = "Car selected and spawned", Duration = 1, Image = "check"})
        end
    end
})

-- SPAWN ALL TAB
SpawnTab:CreateLabel("Unlock All Vehicles", "unlock")
SpawnTab:CreateDivider()

SpawnTab:CreateButton({
    Name = "🔥 UNLOCK ALL VEHICLES 🔥",
    Callback = function()
        spawnAllCars()
    end
})

SpawnTab:CreateDivider()
SpawnTab:CreateLabel("Individual Unlocks", "car")

local carNames = {"Baja", "Branor", "Buggy", "Firetruck", "Van", "Vortex"}

for _, carName in ipairs(carNames) do
    SpawnTab:CreateButton({
        Name = "Unlock " .. carName,
        Callback = function()
            local unlocks = ReplicatedStorage:FindFirstChild("Unlocks")
            if unlocks then
                local remote = unlocks:FindFirstChild("Unlock" .. carName)
                if remote then
                    remote:FireServer()
                    Rayfield:Notify({Title = "Unlocked", Content = carName, Duration = 1, Image = "unlock"})
                end
            end
        end
    })
end

-- STATUS TAB
StatusTab:CreateLabel("Status", "info")
StatusTab:CreateDivider()

local function checkRemote(name)
    local exists = ReplicatedStorage:FindFirstChild(name) ~= nil
    local icon = exists and "check" or "x"
    local color = exists and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
    StatusTab:CreateLabel(name .. ": " .. (exists and "FOUND" or "NOT FOUND"), icon, color, false)
end

checkRemote("CarSelectionEvent")
checkRemote("SpawnCarEvent")
checkRemote("ResetCheckpointEvent")

StatusTab:CreateDivider()
StatusTab:CreateLabel("Unlocks Folder", "unlock")
local unlocks = ReplicatedStorage:FindFirstChild("Unlocks")
if unlocks then
    StatusTab:CreateLabel("Unlocks folder: FOUND", "check", Color3.fromRGB(0,255,0), false)
    for _, name in ipairs(carNames) do
        local exists = unlocks:FindFirstChild("Unlock" .. name) ~= nil
        local icon = exists and "check" or "x"
        local color = exists and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
        StatusTab:CreateLabel("  Unlock" .. name .. ": " .. (exists and "FOUND" or "NOT FOUND"), icon, color, false)
    end
else
    StatusTab:CreateLabel("Unlocks folder: NOT FOUND", "x", Color3.fromRGB(255,0,0), false)
end

StatusTab:CreateDivider()
StatusTab:CreateLabel("Finish Line", "flag-checkered")
local finishCheck = workspace:FindFirstChild("C5E")
if finishCheck then
    finishCheck = finishCheck:FindFirstChild("FinishLine")
    if finishCheck then
        finishCheck = finishCheck:FindFirstChild("Union")
        if finishCheck then
            StatusTab:CreateLabel("Finish Line: FOUND", "check", Color3.fromRGB(0,255,0), false)
        end
    end
end
StatusTab:CreateLabel("Coordinates: 1741, 169, -14612", "map-pin", Color3.fromRGB(255,255,0), false)

StatusTab:CreateDivider()
StatusTab:CreateLabel("Auto Win Status", "play")
local autoWinStatus = StatusTab:CreateLabel("Status: OFF", "square", Color3.fromRGB(255,0,0), false)

-- Update status periodically
spawn(function()
    while true do
        wait(1)
        if autoWinActive then
            pcall(function()
                autoWinStatus:Set("Status: ACTIVE", "play", Color3.fromRGB(0,255,0), false)
            end)
        else
            pcall(function()
                autoWinStatus:Set("Status: OFF", "square", Color3.fromRGB(255,0,0), false)
            end)
        end
    end
end)

Rayfield:Notify({Title = "Ready", Content = "Auto Win & Spawn All loaded", Duration = 3, Image = "car"})
