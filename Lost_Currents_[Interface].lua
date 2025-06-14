-- Charger Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Créer la fenêtre principale
local Window = Rayfield:CreateWindow({
   Name = "Lost Currents [Interface]",
   Icon = 0,
   LoadingTitle = "Chargement...",
   LoadingSubtitle = "Interface Personnalisée",
   Theme = "Ocean",
   ToggleUIKeybind = "K",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "LostCurrents",
      FileName = "InterfaceConfig"
   }
})

-- Créer un onglet avec l'icône poisson
local Tab = Window:CreateTab("Fonctions", "fish")

-- Créer une section
local Section = Tab:CreateSection("Outils Utiles")

-- Variable pour stocker la valeur d'oxygène (défaut 60)
local OxyValue = 60

-- Slider pour régler la quantité d'oxygène
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

-- Bouton pour donner de l'oxygène
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

-- Bouton pour soigner le joueur
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
