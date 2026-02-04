local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local VIM = game:GetService("VirtualInputManager")

local Window = Rayfield:CreateWindow({
   Name = "Aura Farm Game",
   LoadingTitle = "Amethyst Fix Final",
   Theme = "Amethyst",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Auto-Farm", 4483362458)

_G.YOffset = 58
_G.FullAuto = false

-- Fonction pour un clic unique (Énergie)
local function SingleClick(btnName)
    local pGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("AuraCounter")
    local btn = pGui and pGui:FindFirstChild(btnName)
    if btn then
        btn.Visible = true
        local x = btn.AbsolutePosition.X + (btn.AbsoluteSize.X / 2)
        local y = btn.AbsolutePosition.Y + (btn.AbsoluteSize.Y / 2) + _G.YOffset
        VIM:SendMouseButtonEvent(x, y, 0, true, game, 1)
        task.wait(0.1)
        VIM:SendMouseButtonEvent(x, y, 0, false, game, 1)
    end
end

-- Fonction pour maintenir (Aura)
local function StartHold(btnName)
    local pGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("AuraCounter")
    local btn = pGui and pGui:FindFirstChild(btnName)
    if btn then
        btn.Visible = true
        local x = btn.AbsolutePosition.X + (btn.AbsoluteSize.X / 2)
        local y = btn.AbsolutePosition.Y + (btn.AbsoluteSize.Y / 2) + _G.YOffset
        VIM:SendMouseButtonEvent(x, y, 0, true, game, 1)
    end
end

local function StopHold(btnName)
    local pGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("AuraCounter")
    local btn = pGui and pGui:FindFirstChild(btnName)
    if btn then
        local x = btn.AbsolutePosition.X + (btn.AbsoluteSize.X / 2)
        local y = btn.AbsolutePosition.Y + (btn.AbsoluteSize.Y / 2) + _G.YOffset
        VIM:SendMouseButtonEvent(x, y, 0, false, game, 1)
    end
end

Tab:CreateToggle({
   Name = "DÉMARRER AUTO-FARM",
   CurrentValue = false,
   Callback = function(Value)
       _G.FullAuto = Value
       task.spawn(function()
           local mode = "NONE" -- Pour éviter de spammer les actions
           
           while _G.FullAuto do
               pcall(function()
                   local text = game.Players.LocalPlayer.PlayerGui.AuraCounter.EnergyInfo.Counter.Text
                   local current, max = text:match("(%d+)/(%d+)")
                   current = tonumber(current) or 0
                   max = tonumber(max) or 100

                   if current <= 0 and mode ~= "ENERGY" then
                       -- ÉNERGIE VIDE : Un seul clic
                       StopHold("FarmAura")
                       task.wait(0.5)
                       SingleClick("FarmEnergy")
                       mode = "ENERGY" 
                       
                   elseif current >= max and mode ~= "AURA" then
                       -- ÉNERGIE PLEINE : On maintient l'aura
                       StartHold("FarmAura")
                       mode = "AURA"
                   
                   elseif mode == "NONE" and current > 0 then
                       -- Lancement initial
                       StartHold("FarmAura")
                       mode = "AURA"
                   end
               end)
               task.wait(1)
           end
           StopHold("FarmAura")
       end)
   end,
})

Tab:CreateSlider({
   Name = "Ajustement Y",
   Min = 0, Max = 150, CurrentValue = 58,
   Callback = function(v) _G.YOffset = v end,
})

Tab:CreateButton({
   Name = "FORCE RESET",
   Callback = function()
       StopHold("FarmAura")
   end,
})
