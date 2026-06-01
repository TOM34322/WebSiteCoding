local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Car Game",
   Icon = 0,
   LoadingTitle = "Car Game",
   LoadingSubtitle = "Auto Win, Spawn & Nuke",
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

-- Handle character respawns smoothly
LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    HumanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")
end)

local MainTab = Window:CreateTab("Main")
local VehicleTab = Window:CreateTab("Vehicles")
local UnlockTab = Window:CreateTab("Unlock Cars")
local StatusTab = Window:CreateTab("Status")

local autoWinActive = false

-- INSTANT WIN FUNCTION
local function InstantWin()
   local finishLine = workspace:FindFirstChild("C5E")
   if finishLine then
      finishLine = finishLine:FindFirstChild("FinishLine")
      if finishLine then
         finishLine = finishLine:FindFirstChild("Union")
         if finishLine then
            if HumanoidRootPart then
               HumanoidRootPart.CFrame = CFrame.new(finishLine.Position)
            end
            return
         end
      end
   end
   if HumanoidRootPart then
      HumanoidRootPart.CFrame = CFrame.new(1741, 169, -14612)
   end
end

-- RESET CHECKPOINT
local function ResetCheckpoint()
   local remote = ReplicatedStorage:FindFirstChild("ResetCheckpointEvent")
   if remote then
      remote:FireServer()
      return true
   end
   return false
end

-- AUTO WIN LOOP
local function startAutoWin()
   if autoWinActive then return end
   autoWinActive = true
   
   Rayfield:Notify({
      Title = "Auto Win",
      Content = "Started! Winning every 2 seconds",
      Duration = 2,
      Image = "trophy"
   })
   
   task.spawn(function()
       while autoWinActive do
           InstantWin()
           task.wait(0.3)
           ResetCheckpoint()
           task.wait(1.7)
       end
   end)
end

local function stopAutoWin()
   if not autoWinActive then return end
   autoWinActive = false
   
   Rayfield:Notify({
      Title = "Auto Win",
      Content = "Stopped!",
      Duration = 2,
      Image = "square"
   })
end

-- ==========================================
-- MAIN TAB UI (Auto Win & Chaos)
-- ==========================================
MainTab:CreateLabel("Auto Win (Infinite)", "infinity")
MainTab:CreateDivider()

MainTab:CreateButton({
   Name = "START AUTO WIN",
   Callback = function()
      startAutoWin()
   end
})

MainTab:CreateButton({
   Name = "STOP AUTO WIN",
   Callback = function()
      stopAutoWin()
   end
})

MainTab:CreateDivider()
MainTab:CreateLabel("Funny Moments / Chaos", "bomb")
MainTab:CreateDivider()

MainTab:CreateButton({
   Name = "☢️ NUKE ALL SERVER (TEST) ☢️",
   Callback = function()
      local nukeRemote = ReplicatedStorage:FindFirstChild("NukeEvent")
      if nukeRemote then
          nukeRemote:FireServer()
          Rayfield:Notify({Title = "KA-BOOM!", Content = "Nuke remote fired successfully!", Duration = 3, Image = "bomb"})
      else
          Rayfield:Notify({Title = "Error", Content = "NukeEvent remote not found", Duration = 3, Image = "x"})
      end
   end
})

MainTab:CreateDivider()
MainTab:CreateLabel("Manual Controls", "hand")
MainTab:CreateDivider()

MainTab:CreateButton({
   Name = "Instant Win (1 Time)",
   Callback = function()
      InstantWin()
      Rayfield:Notify({Title = "Done", Content = "Teleported to finish", Duration = 1, Image = "trophy"})
   end
})

-- ==========================================
-- VEHICLE TAB UI (FIXED TWO-STEP SPAWNER)
-- ==========================================
VehicleTab:CreateLabel("Spawn Vehicle Menu", "car")
VehicleTab:CreateDivider()

local totalCars = {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"}
local selectedCar = "8" -- Defaulted to 8 based on your image!

VehicleTab:CreateDropdown({
   Name = "Select Car ID",
   Options = totalCars,
   CurrentOption = "8",
   MultipleOptions = false,
   Callback = function(Option)
      selectedCar = Option[1]
   end,
})

VehicleTab:CreateButton({
   Name = "SPAWN SELECTED CAR",
   Callback = function()
      local selectionRemote = ReplicatedStorage:FindFirstChild("CarSelectionEvent")
      local spawnRemote = ReplicatedStorage:FindFirstChild("SpawnCarEvent")
      
      if selectionRemote and spawnRemote then
          -- Step 1: Select the car ID using the exact SimpleSpy array structure
          selectionRemote:FireServer(selectedCar)
          task.wait(0.1) -- Small delay to allow the server to register the choice
          
          -- Step 2: Fire the spawn event
          spawnRemote:FireServer()
          
          Rayfield:Notify({Title = "Spawner", Content = "Selected and Spawned Car ID: " .. selectedCar, Duration = 2, Image = "car"})
      else
          Rayfield:Notify({Title = "Error", Content = "Missing CarSelectionEvent or SpawnCarEvent!", Duration = 3, Image = "alert"})
      end
   end
})

-- ==========================================
-- UNLOCK TAB UI
-- ==========================================
UnlockTab:CreateLabel("Unlock Cars", "crown")
UnlockTab:CreateDivider()

UnlockTab:CreateButton({
   Name = "UNLOCK ALL CARS",
   Callback = function()
      local unlocks = ReplicatedStorage:FindFirstChild("Unlocks")
      if unlocks then
         for _, id in ipairs(totalCars) do
            local remote = unlocks:FindFirstChild("UnlockCar" .. id)
            if remote then remote:FireServer() task.wait(0.05) end
         end
      end
      Rayfield:Notify({Title = "Unlock Complete", Content = "Attempted unlock keys.", Duration = 3, Image = "crown"})
   end
})

-- ==========================================
-- STATUS TAB UI
-- ==========================================
StatusTab:CreateLabel("Status Monitor", "info")
StatusTab:CreateDivider()

local liveStatusLabel = StatusTab:CreateLabel("Auto Win: OFF", "square", Color3.fromRGB(255,0,0), false)

StatusTab:CreateDivider()
StatusTab:CreateLabel("Server Remotes Found:", "radio")

local criticalRemotes = {"CarSelectionEvent", "SpawnCarEvent", "NukeEvent", "ResetCheckpointEvent"}
for _, name in ipairs(criticalRemotes) do
    if ReplicatedStorage:FindFirstChild(name) then
        StatusTab:CreateLabel("✔ " .. name, "check", Color3.fromRGB(0,255,0), false)
    else
        StatusTab:CreateLabel("❌ " .. name .. " (Missing)", "x", Color3.fromRGB(255,0,0), false)
    end
end

-- Smooth status updater thread
task.spawn(function()
   while true do
      task.wait(0.5)
      pcall(function()
          if autoWinActive then
             liveStatusLabel:Set("Auto Win: ACTIVE")
          else
             liveStatusLabel:Set("Auto Win: OFF")
          end
      end)
   end
end)

Rayfield:Notify({Title = "Ready", Content = "Kinesis.Dev Loaded! Fixed vehicle sequences.", Duration = 3, Image = "check"})
