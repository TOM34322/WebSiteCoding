local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

--> [< Variables >] <--
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local plr = Players.LocalPlayer

local pianoRemote = game:GetService("Workspace"):FindFirstChild("GlobalPianoConnector")
if not pianoRemote then
    Rayfield:Notify({
        Title = "Error!",
        Content = "Piano remote not found! Either patched or you didn't join the right game.",
        Duration = 10,
        Image = nil,
    })
end

_G.crash = false
_G.fling = false
local flinging = false
local flingDied
local Noclipping = nil
local Clip = true
--> [< Variables >] <--

local Window = Rayfield:CreateWindow({
    Name = "▶ Piano Crasher ◀",
    Icon = "home",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by HyperHub",
    Theme = "Amethyst",
})

local Tab = Window:CreateTab("Main")

local Section = Tab:CreateSection("Ctrl + Shift + F7 to see ping!")

local Crasher = Tab:CreateToggle({
    Name = "Crash Everyone (Server Too)",
    CurrentValue = false,
    Callback = function(Value)
        _G.crash = Value
        if Value then
            if plr.Character.Humanoid.Sit then
                Rayfield:Notify({
                    Title = "Enabled!",
                    Content = "The server will get laggier and people will freeze!",
                    Duration = 5,
                    Image = nil,
                })
            else
                Rayfield:Notify({
                    Title = "Error!",
                    Content = "You must sit behind a piano to use this!",
                    Duration = 2.5,
                    Image = nil,
                })
                return
            end
            while _G.crash do
                for i = 1, 61 do
                    pianoRemote:FireServer("play", i)
                end
                task.wait()
            end
            pianoRemote:FireServer("abort")
            Rayfield:Notify({
                Title = "Disabled!",
                Content = "Hope you had fun using it ;)",
                Duration = 2.5,
                Image = nil,
            })
        end
    end,
})

local Section = Tab:CreateSection("ça marche si y'a les collision")

local Flinger = Tab:CreateToggle({
    Name = "Flinger",
    CurrentValue = false,
    Callback = function(Value)
        _G.fling = Value
        if Value then
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                flinging = true
                for _, child in pairs(plr.Character:GetDescendants()) do
                    if child:IsA("BasePart") then
                        child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
                    end
                end

                if Noclipping then
                    Noclipping:Disconnect()
                end
                Clip = true

                local bambam = Instance.new("BodyAngularVelocity")
                bambam.Name = "FlingAngularVelocity"
                bambam.Parent = plr.Character:FindFirstChild("HumanoidRootPart")
                bambam.AngularVelocity = Vector3.new(0, 99999, 0)
                bambam.MaxTorque = Vector3.new(0, math.huge, 0)
                bambam.P = math.huge

                for _, part in pairs(plr.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                        part.Massless = true
                        part.Velocity = Vector3.new(0, 0, 0)
                    end
                end

                flingDied = plr.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
                    flinging = false
                    if flingDied then
                        flingDied:Disconnect()
                    end
                    for _, child in pairs(plr.Character:FindFirstChild("HumanoidRootPart"):GetChildren()) do
                        if child.ClassName == "BodyAngularVelocity" then
                            child:Destroy()
                        end
                    end

                    for _, part in pairs(plr.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
                        end
                    end
                end)

                while flinging do
                    bambam.AngularVelocity = Vector3.new(0, 99999, 0)
                    wait(0.2)
                    bambam.AngularVelocity = Vector3.new(0, 0, 0)
                    wait(0.1)
                end
            end
        else
            flinging = false
            if flingDied then
                flingDied:Disconnect()
            end
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                for _, child in pairs(plr.Character:FindFirstChild("HumanoidRootPart"):GetChildren()) do
                    if child.ClassName == "BodyAngularVelocity" then
                        child:Destroy()
                    end
                end

                for _, part in pairs(plr.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
                    end
                end
            end
        end
    end,
})

local TabSpeed = Window:CreateTab("Speed", "chevrons-up")

-- ✅ Slider pour ajuster la vitesse de marche
local SliderSpeed = TabSpeed:CreateSlider({
    Name = "Ajuster Speed Boost",
    Range = {16, 100},  -- Plage de valeurs de 16 (vitesse de base) à 100 (vitesse très rapide)
    Increment = 1,  -- Incrément de la valeur, de 1 en 1
    Suffix = "Vitesse",  -- Suffixe pour ajouter un texte après la valeur (facultatif)
    CurrentValue = 16,  -- Valeur initiale de la vitesse (16 est la valeur de base)
    Flag = "SpeedSlider",  -- Identifiant unique pour ce slider
    Callback = function(Value)
        -- Lorsque le slider change, ajuster la vitesse de marche du personnage
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = Value
            print("Vitesse de marche définie à : " .. Value)
        end
    end,
})
