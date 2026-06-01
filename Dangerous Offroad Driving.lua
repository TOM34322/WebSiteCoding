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
local ChaosTab = Window:CreateTab("Chaos")
local UnlockTab = Window:CreateTab("Unlock Cars")
local StatusTab = Window:CreateTab("Status")

local autoWinActive = false
local autoCashActive = false
local winSpeed = "Normal Win"
local targetPlayer = "xal_1L"

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

ChaosTab:CreateLabel("Ciblage de Joueur", "user-minus")

ChaosTab:CreateInput({
   Name = "Pseudo de la cible",
   PlaceholderText = "Ex: xal_1L",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      targetPlayer = Text
      local setPlrRemote = ReplicatedStorage:FindFirstChild("SetSelectedPlayer")
      if setPlrRemote then
          setPlrRemote:FireServer(targetPlayer)
          Rayfield:Notify({Title = "Cible Verrouillée", Content = "Cible changée pour : " .. targetPlayer, Duration = 2, Image = "crosshair"})
      end
   end,
})

ChaosTab:CreateDivider()
ChaosTab:CreateLabel("Attaques Gratuites (Contournement Boutique)", "gift")
ChaosTab:CreateDivider()

ChaosTab:CreateButton({
   Name = "💥 FLING GRATUIT (Remote Directe) 💥",
   Callback = function()
      local flingRemote = ReplicatedStorage:FindFirstChild("FlingEvent")
      if flingRemote then
          flingRemote:FireServer()
          Rayfield:Notify({Title = "Exploit", Content = "Fling gratuit envoyé sur " .. targetPlayer .. " !", Duration = 1.5, Image = "wind"})
      else
          Rayfield:Notify({Title = "Erreur", Content = "FlingEvent gratuit introuvable", Duration = 3, Image = "x"})
      end
   end
})

ChaosTab:CreateButton({
   Name = "💥 EXPLODE GRATUIT (Remote Directe) 💥",
   Callback = function()
      local explodeRemote = ReplicatedStorage:FindFirstChild("ExplodeEvent")
      if explodeRemote then
          explodeRemote:FireServer()
          Rayfield:Notify({Title = "Exploit", Content = "Explosion gratuite envoyée sur " .. targetPlayer .. " !", Duration = 1.5, Image = "zap"})
      else
          Rayfield:Notify({Title = "Erreur", Content = "ExplodeEvent gratuit introuvable", Duration = 3, Image = "x"})
      end
   end
})

ChaosTab:CreateButton({
   Name = "☢️ NUKE GRATUIT (Remote Directe) ☢️",
   Callback = function()
      local nukeRemote = ReplicatedStorage:FindFirstChild("NukeEvent")
      if nukeRemote then
          nukeRemote:FireServer()
          Rayfield:Notify({Title = "KA-BOOM!", Content = "Nuke global gratuit activé !", Duration = 3, Image = "bomb"})
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
StatusTab:CreateLabel("Statistiques Temps Réel", "bar-chart")
local myWinsLabel = StatusTab:CreateLabel("Mes Wins (fgh567) : Chargement...", "user")
local colabWinsLabel = StatusTab:CreateLabel("Wins Nexo_DevX : Chargement...", "users")

StatusTab:CreateDivider()
StatusTab:CreateLabel("Remotes détectées :", "radio")

local criticalRemotes = {"CarSelectionEvent", "SpawnCarEvent", "NukeEvent", "ResetCheckpointEvent", "SetSelectedPlayer", "FlingEvent", "ExplodeEvent"}
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
