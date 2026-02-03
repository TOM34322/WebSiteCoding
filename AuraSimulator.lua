local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local VIM = game:GetService("VirtualInputManager")

local Window = Rayfield:CreateWindow({
   Name = "Aura Simulator Precision",
   LoadingTitle = "Configuration Tactile...",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Farm Manuel", 4483362458)

_G.YOffset = 58

-- Fonction pour obtenir les coordonnées et forcer la visibilité
local function GetButtonCoords(btnName)
    local pGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("AuraCounter")
    local btn = pGui and pGui:FindFirstChild(btnName)
    if btn then
        btn.Visible = true -- On s'assure qu'il est visible
        local x = btn.AbsolutePosition.X + (btn.AbsoluteSize.X / 2)
        local y = btn.AbsolutePosition.Y + (btn.AbsoluteSize.Y / 2) + _G.YOffset
        return x, y
    end
    return nil, nil
end

-- 1. AURA : RESTER APPUYÉ (HOLD)
Tab:CreateToggle({
   Name = "MAINTENIR AURA (Hold)",
   CurrentValue = false,
   Callback = function(Value)
       local x, y = GetButtonCoords("FarmAura")
       if x and y then
           if Value then
               -- On laisse le doigt appuyé
               VIM:SendMouseButtonEvent(x, y, 0, true, game, 1)
           else
               -- On retire le doigt
               VIM:SendMouseButtonEvent(x, y, 0, false, game, 1)
           end
       end
   end,
})

-- 2. ÉNERGIE : UN SEUL CLIC (PAS DE SPAM)
Tab:CreateButton({
   Name = "CLIQUER ÉNERGIE (1 seule fois)",
   Callback = function()
       local x, y = GetButtonCoords("FarmEnergy")
       if x and y then
           -- On appuie
           VIM:SendMouseButtonEvent(x, y, 0, true, game, 1)
           task.wait(0.1)
           -- On relâche immédiatement
           VIM:SendMouseButtonEvent(x, y, 0, false, game, 1)
           
           Rayfield:Notify({Title = "Energie", Content = "Clic unique effectué !"})
       end
   end,
})

Tab:CreateSection("Réglage iPhone")

Tab:CreateSlider({
   Name = "Ajustement Hauteur (Y)",
   Min = 0, Max = 150, CurrentValue = 58,
   Callback = function(v) _G.YOffset = v end,
})

Tab:CreateButton({
   Name = "FORCER VISIBILITÉ BOUTONS",
   Callback = function()
       local pGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("AuraCounter")
       if pGui then
           if pGui:FindFirstChild("FarmEnergy") then pGui.FarmEnergy.Visible = true end
           if pGui:FindFirstChild("FarmAura") then pGui.FarmAura.Visible = true end
       end
   end,
})
