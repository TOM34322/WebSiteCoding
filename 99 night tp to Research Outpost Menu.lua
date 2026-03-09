local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Research Outpost Menu",
   LoadingTitle = "Initialisation...",
   LoadingSubtitle = "by che3t_2345",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ResearchScripts",
      FileName = "MainConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = true
   },
   KeySystem = false,
   Theme = "AmberGlow" -- Thème AmberGlow activé
})

local Tab = Window:CreateTab("Teleports", 4483362458)

local Button = Tab:CreateButton({
   Name = "TP to Research Outpost",
   Callback = function()
      local destination = workspace.Map.Landmarks["Research Outpost"]
      local player = game.Players.LocalPlayer
      
      if destination and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Téléportation sur l'élément 'Main' du landmark
          player.Character.HumanoidRootPart.CFrame = destination.Main.CFrame + Vector3.new(0, 5, 0)
          
          Rayfield:Notify({
             Title = "Teleportation",
             Content = "Successfully arrived at Research Outpost",
             Duration = 3,
             Image = 4483362458,
          })
      else
          Rayfield:Notify({
             Title = "Error",
             Content = "Destination not found in Workspace",
             Duration = 5,
             Image = 4483362458,
          })
      end
   end,
})

Rayfield:LoadConfiguration()
