local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Car Game",
   Icon = 0,
   LoadingTitle = "By Nexux_Dev",
   LoadingSubtitle = "Collaborateur: Nexo_DevX",
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

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    HumanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart")
end)

local MainTab = Window:CreateTab("Main")
local VehicleTab = Window:CreateTab("Vehicles")
local ChaosTab = Window:CreateTab("Chaos")
local UnlockTab = Window:CreateTab("Unlock Cars")
local StatusTab = Window:CreateTab("Status")

local autoWinActive = false
local winSpeed = "Normal Win"

local speedSettings = {
    ["Normal Win"] = {teleportDelay = 0.3, loopDelay = 1.7},
    ["Rapide"]     = {teleportDelay = 0.15, loopDelay = 0.6},
    ["Extrem Win"] = {teleportDelay = 0.05, loopDelay = 0.1}
}

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

local function ResetCheckpoint()
   local remote = ReplicatedStorage:FindFirstChild("ResetCheckpointEvent")
   if remote then
      remote:FireServer()
      return true
   end
   return false
end

local function startAutoWin()
   task.spawn(function()
       while autoWinActive do
           local currentSpeed = speedSettings[winSpeed] or speedSettings["Normal Win"]
           
           InstantWin()
           task.wait(currentSpeed.teleportDelay)
           ResetCheckpoint()
           task.wait(currentSpeed.loopDelay)
       end
   end)
end

MainTab:CreateLabel("Configuration Auto Win", "infinity")
MainTab:CreateDivider()

MainTab:CreateDropdown({
   Name = "Sélectionner la vitesse",
   Options = {"Normal Win", "Rapide", "Extrem Win"},
   CurrentOption = "Normal Win",
   MultipleOptions = false,
   Callback = function(Option)
      winSpeed = Option[1]
      Rayfield:Notify({Title = "Vitesse changée", Content = "Mode choisi : " .. winSpeed, Duration = 1.5, Image = "bolt"})
   end,
})

MainTab:CreateToggle({
   Name = "🚀 ACTIVER AUTO WIN 🚀",
   CurrentValue = false,
   Flag = "AutoWinToggle",
   Callback = function(Value)
      autoWinActive = Value
      if Value then
          Rayfield:Notify({Title = "Auto Win", Content = "Mode " .. winSpeed .. " activé !", Duration = 2, Image = "trophy"})
          startAutoWin()
      else
          Rayfield:Notify({Title = "Auto Win", Content = "Arrêté !", Duration = 2, Image = "square"})
      end
   end,
})

MainTab:CreateDivider()
MainTab:CreateLabel("Contrôles Manuels", "hand")
MainTab:CreateDivider()

MainTab:CreateButton({
   Name = "Instant Win (1 Fois)",
   Callback = function()
      InstantWin()
      Rayfield:Notify({Title = "Succès", Content = "Téléporté à l'arrivée", Duration = 1, Image = "trophy"})
   end
})

VehicleTab:CreateLabel("Menu de Spawn", "car")
VehicleTab:CreateDivider()

local totalCars = {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"}
local selectedCar = "8"

VehicleTab:CreateDropdown({
   Name = "Sélectionner ID Voiture",
   Options = totalCars,
   CurrentOption = "8",
   MultipleOptions = false,
   Callback = function(Option)
      selectedCar = Option[1]
   end,
})

VehicleTab:CreateButton({
   Name = "SPAWN LA VOITURE SELECTIONNÉE",
   Callback = function()
      local selectionRemote = ReplicatedStorage:FindFirstChild("CarSelectionEvent")
      local spawnRemote = ReplicatedStorage:FindFirstChild("SpawnCarEvent")
      
      if selectionRemote and spawnRemote then
          selectionRemote:FireServer(selectedCar)
          task.wait(0.1)
          spawnRemote:FireServer()
          Rayfield:Notify({Title = "Spawner", Content = "Voiture ID " .. selectedCar .. " demandée !", Duration = 2, Image = "car"})
      else
          Rayfield:Notify({Title = "Erreur", Content = "Remotes de spawn introuvables", Duration = 3, Image = "alert"})
      end
   end
})

ChaosTab:CreateLabel("Serveur Chaos", "skull")
ChaosTab:CreateDivider()

ChaosTab:CreateButton({
   Name = "☢️ NUKE ALL SERVER ☢️",
   Callback = function()
      local nukeRemote = ReplicatedStorage:FindFirstChild("NukeEvent")
      if nukeRemote then
          nukeRemote:FireServer()
          Rayfield:Notify({Title = "KA-BOOM!", Content = "Nuke activé !", Duration = 3, Image = "bomb"})
      else
          Rayfield:Notify({Title = "Erreur", Content = "NukeEvent introuvable", Duration = 3, Image = "x"})
      end
   end
})

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
      Rayfield:Notify({Title = "Unlock", Content = "Tentative d'unlock terminée.", Duration = 3, Image = "crown"})
   end
})

StatusTab:CreateLabel("Status Monitor", "info")
StatusTab:CreateDivider()

local liveStatusLabel = StatusTab:CreateLabel("Auto Win: OFF", "square", Color3.fromRGB(255,0,0), false)

StatusTab:CreateDivider()
StatusTab:CreateLabel("Remotes détectées :", "radio")

local criticalRemotes = {"CarSelectionEvent", "SpawnCarEvent", "NukeEvent", "ResetCheckpointEvent"}
for _, name in ipairs(criticalRemotes) do
    if ReplicatedStorage:FindFirstChild(name) then
        StatusTab:CreateLabel("✔ " .. name, "check", Color3.fromRGB(0,255,0), false)
    else
        StatusTab:CreateLabel("❌ " .. name .. " (Manquant)", "x", Color3.fromRGB(255,0,0), false)
    end
end

task.spawn(function()
   while true do
      task.wait(0.5)
      pcall(function()
          if autoWinActive then
             liveStatusLabel:Set("Auto Win: ACTIVE (" .. winSpeed .. ")")
          else
             liveStatusLabel:Set("Auto Win: OFF")
          end
      end)
   end
end)

Rayfield:Notify({Title = "Prêt", Content = "Script mis à jour par Nexux_Dev !", Duration = 3, Image = "check"})
