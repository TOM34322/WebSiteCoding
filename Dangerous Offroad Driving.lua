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
local CashTab = Window:CreateTab("Cash")
local VehicleTab = Window:CreateTab("Vehicles")
local UnlockTab = Window:CreateTab("Unlock Cars")
local StatusTab = Window:CreateTab("Status")

local autoWinActive = false
local autoCashActive = false
local winSpeed = "Normal Win"

local speedSettings = {
    ["Normal Win"] = {teleportDelay = 0.3, loopDelay = 1.7},
    ["Rapide"]     = {teleportDelay = 0.15, loopDelay = 0.6},
    ["Extrem Win"] = {teleportDelay = 0.05, loopDelay = 0.1}
}

-- Table de correspondance pour associer le nom lisible à l'ID attendue par le jeu
local carMapping = {
    ["Groupe Véhicule (Car2)"] = "2",
    ["4X4 Purple (Car3)"] = "3",
    ["Petit Kangou (Car4)"] = "4",
    ["Lamborghini Urus (Car5)"] = "5",
    ["Tesla CyberTruck (Car6)"] = "6",
    ["Old Car (Car8)"] = "8",
    ["Range Rover Evoque (Car9)"] = "9",
    ["Ferrari (Car10)"] = "10",
    ["BMW E36 (Car11)"] = "11",
    ["Véhicule Tout Terrain (Car12)"] = "12",
    ["Fire Truck (Car13)"] = "13",
    ["4X4 (Car14)"] = "14",
    ["Voiture Banane (Car15)"] = "15",
    ["Bus Scolaire (Car16)"] = "16",
    ["Canard (Car17)"] = "17",
    ["Police Car (Car18)"] = "18",
    ["Bugatti (Car19)"] = "19",
    ["Cadi (Car20)"] = "20",
    ["Nissan Supra (Car21)"] = "21",
    ["Tesla Tout Terrain (Car22)"] = "22"
}

-- Liste triée des noms pour l'affichage dans le menu déroulant
local carDisplayList = {
    "Groupe Véhicule (Car2)",
    "4X4 Purple (Car3)",
    "Petit Kangou (Car4)",
    "Lamborghini Urus (Car5)",
    "Tesla CyberTruck (Car6)",
    "Old Car (Car8)",
    "Range Rover Evoque (Car9)",
    "Ferrari (Car10)",
    "BMW E36 (Car11)",
    "Véhicule Tout Terrain (Car12)",
    "Fire Truck (Car13)",
    "4X4 (Car14)",
    "Voiture Banane (Car15)",
    "Bus Scolaire (Car16)",
    "Canard (Car17)",
    "Police Car (Car18)",
    "Bugatti (Car19)",
    "Cadi (Car20)",
    "Nissan Supra (Car21)",
    "Tesla Tout Terrain (Car22)"
}

local selectedCarID = "8" -- Par défaut sur l'ancienne voiture (Car8)

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

local function CollectAllCash()
    local cashFolder = workspace:FindFirstChild("Cash")
    if cashFolder and HumanoidRootPart then
        for _, obj in ipairs(cashFolder:GetChildren()) do
            if obj:IsA("BasePart") or obj:FindFirstChildWhichIsA("TouchInterest") then
                if HumanoidRootPart then
                    HumanoidRootPart.CFrame = CFrame.new(obj.Position)
                    task.wait(0.05)
                end
            elseif obj:IsA("Model") and obj.PrimaryPart then
                if HumanoidRootPart then
                    HumanoidRootPart.CFrame = CFrame.new(obj.PrimaryPart.Position)
                    task.wait(0.05)
                end
            end
        end
        ResetCheckpoint()
    end
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

local function startAutoCash()
    task.spawn(function()
        while autoCashActive do
            CollectAllCash()
            task.wait(0.5)
        end
    end)
end

local function getLeaderboardStat(targetName)
    local scrollingFrame = workspace:FindFirstChild("C0E")
    if scrollingFrame then
        scrollingFrame = scrollingFrame:FindFirstChild("Leaderboard")
        if scrollingFrame then
            scrollingFrame = scrollingFrame:FindFirstChild("Part")
            if scrollingFrame then
                scrollingFrame = scrollingFrame:FindFirstChild("SurfaceGui")
                if scrollingFrame then
                    scrollingFrame = scrollingFrame:FindFirstChild("Frame")
                    if scrollingFrame then
                        scrollingFrame = scrollingFrame:FindFirstChild("ScrollingFrame")
                    end
                end
            end
        end
    end

    if scrollingFrame then
        for _, item in ipairs(scrollingFrame:GetChildren()) do
            local plrNameGui = item:FindFirstChild("PlrName")
            local amountGui = item:FindFirstChild("Amount")
            if plrNameGui and amountGui and plrNameGui:IsA("TextLabel") and amountGui:IsA("TextLabel") then
                if string.lower(plrNameGui.Text) == string.lower(targetName) or string.find(string.lower(plrNameGui.Text), string.lower(targetName)) then
                    return amountGui.Text
                end
            end
        end
    end
    return "Pas connecté"
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

CashTab:CreateLabel("Ferme à Cash Automatique (Téléportation)", "dollar-sign")
CashTab:CreateDivider()

CashTab:CreateToggle({
   Name = "💸 ACTIVER AUTO CASH (Infinis) 💸",
   CurrentValue = false,
   Flag = "AutoCashToggle",
   Callback = function(Value)
      autoCashActive = Value
      if Value then
          Rayfield:Notify({Title = "Auto Cash", Content = "Téléportations en boucle activées !", Duration = 2, Image = "coins"})
          startAutoCash()
      else
          Rayfield:Notify({Title = "Auto Cash", Content = "Arrêté !", Duration = 2, Image = "square"})
      end
   end,
})

CashTab:CreateButton({
   Name = "Ramasser Tout le Cash (1 Fois)",
   Callback = function()
      CollectAllCash()
      Rayfield:Notify({Title = "Cash", Content = "Rafale de téléportations sur le cash terminée !", Duration = 1.5, Image = "dollar-sign"})
   end
})

VehicleTab:CreateLabel("Menu de Spawn", "car")
VehicleTab:CreateDivider()

VehicleTab:CreateDropdown({
   Name = "Sélectionner la voiture",
   Options = carDisplayList,
   CurrentOption = "Old Car (Car8)",
   MultipleOptions = false,
   Callback = function(Option)
      local displayName = Option[1]
      selectedCarID = carMapping[displayName] or "8"
   end,
})

VehicleTab:CreateButton({
   Name = "SPAWN LA VOITURE SELECTIONNÉE",
   Callback = function()
      local selectionRemote = ReplicatedStorage:FindFirstChild("CarSelectionEvent")
      local spawnRemote = ReplicatedStorage:FindFirstChild("SpawnCarEvent")
      
      if selectionRemote and spawnRemote then
          selectionRemote:FireServer(selectedCarID)
          task.wait(0.1)
          spawnRemote:FireServer()
          Rayfield:Notify({Title = "Spawner", Content = "Requête envoyée pour l'ID " .. selectedCarID .. " !", Duration = 2, Image = "car"})
      else
          Rayfield:Notify({Title = "Erreur", Content = "Remotes de spawn introuvables", Duration = 3, Image = "alert"})
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
         for _, id in pairs(carMapping) do
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
StatusTab:CreateLabel("Statistiques Temps Réel", "bar-chart")
local myWinsLabel = StatusTab:CreateLabel("Mes Wins (fgh567) : Chargement...", "user")
local colabWinsLabel = StatusTab:CreateLabel("Wins Nexo_DevX : Chargement...", "users")

StatusTab:CreateDivider()
StatusTab:CreateLabel("Remotes détectées :", "radio")

local criticalRemotes = {"CarSelectionEvent", "SpawnCarEvent", "ResetCheckpointEvent"}
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
          
          local myCurrentWins = getLeaderboardStat("fgh567")
          local colabCurrentWins = getLeaderboardStat("Nexo_DevX")
          
          myWinsLabel:Set("Mes Wins (fgh567) : " .. myCurrentWins)
          colabWinsLabel:Set("Wins Nexo_DevX : " .. colabCurrentWins)
      end)
   end
end)

Rayfield:Notify({Title = "Prêt", Content = "Script mis à jour par Nexux_Dev !", Duration = 3, Image = "check"})
