--// SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// CONFIG
local Theme = {
    Main = Color3.fromRGB(15, 15, 15),
    Side = Color3.fromRGB(22, 22, 22),
    Accent = Color3.fromRGB(0, 150, 255),
    Secondary = Color3.fromRGB(160, 160, 160),
}

local Version = "v2.0 Piano"
local creditGradients = {}
local autoFarmButtons = {} 
local CrashEnabled = false
local FlingEnabled = false
local InfJumpEnabled = false

--// MAIN UI
local gui = Instance.new("ScreenGui")
gui.Name = "Universal Scripts"
gui.IgnoreGuiInset = true 
gui.ResetOnSpawn = false
gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

----------------------------------------------------------------
-- NOTIFICATION SYSTEM
----------------------------------------------------------------
local function Notify(title, text, color)
    local nFrame = Instance.new("Frame", gui)
    nFrame.Size = UDim2.new(0, 250, 0, 60)
    nFrame.Position = UDim2.new(1, 10, 0.9, 0)
    nFrame.BackgroundColor3 = Theme.Main
    Instance.new("UICorner", nFrame)
    local nStroke = Instance.new("UIStroke", nFrame)
    nStroke.Color = color or Theme.Accent
    nStroke.Thickness = 2

    local nTitle = Instance.new("TextLabel", nFrame)
    nTitle.Size = UDim2.new(1, -10, 0.5, 0); nTitle.Position = UDim2.new(0, 10, 0, 5)
    nTitle.BackgroundTransparency = 1; nTitle.Text = title; nTitle.TextColor3 = color or Theme.Accent
    nTitle.Font = "GothamBold"; nTitle.TextSize = 14; nTitle.TextXAlignment = "Left"

    local nDesc = Instance.new("TextLabel", nFrame)
    nDesc.Size = UDim2.new(1, -10, 0.5, 0); nDesc.Position = UDim2.new(0, 10, 0.4, 5)
    nDesc.BackgroundTransparency = 1; nDesc.Text = text; nDesc.TextColor3 = Color3.new(1,1,1)
    nDesc.Font = "Gotham"; nDesc.TextSize = 12; nDesc.TextXAlignment = "Left"

    nFrame:TweenPosition(UDim2.new(1, -260, 0.9, 0), "Out", "Quart", 0.5)
    task.wait(3)
    nFrame:TweenPosition(UDim2.new(1, 10, 0.9, 0), "In", "Quart", 0.5)
    task.spawn(function() task.wait(0.6); nFrame:Destroy() end)
end

----------------------------------------------------------------
-- LOADING SYSTEM
----------------------------------------------------------------
local loadFrame = Instance.new("Frame", gui)
loadFrame.Size = UDim2.new(0, 300, 0, 100)
loadFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
loadFrame.BackgroundColor3 = Theme.Main
loadFrame.BorderSizePixel = 0
local loadCorner = Instance.new("UICorner", loadFrame)
local loadStroke = Instance.new("UIStroke", loadFrame)
loadStroke.Color = Theme.Accent
loadStroke.Thickness = 2

local loadLabel = Instance.new("TextLabel", loadFrame)
loadLabel.Size = UDim2.new(1, 0, 0, 50)
loadLabel.BackgroundTransparency = 1
loadLabel.Text = "Universal Scripts Loading..."
loadLabel.TextColor3 = Color3.new(1,1,1)
loadLabel.Font = "GothamBold"
loadLabel.TextSize = 18

local barBg = Instance.new("Frame", loadFrame)
barBg.Size = UDim2.new(0.8, 0, 0, 10)
barBg.Position = UDim2.new(0.1, 0, 0.7, 0)
barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", barBg)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Theme.Accent
Instance.new("UICorner", barFill)

task.spawn(function()
    TweenService:Create(barFill, TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(2.2)
    TweenService:Create(loadFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -150, 1.2, 0)}):Play()
    task.wait(0.6)
    loadFrame:Destroy()
end)

----------------------------------------------------------------
-- PARTICLES & UTILS
----------------------------------------------------------------
local function CreateParticle()
    local mousePos = UserInputService:GetMouseLocation()
    local p = Instance.new("Frame", gui)
    p.AnchorPoint = Vector2.new(0.5, 0.5)
    p.BackgroundColor3 = Theme.Accent
    p.Position = UDim2.new(0, mousePos.X, 0, mousePos.Y) 
    p.Size = UDim2.new(0, 6, 0, 6)
    p.ZIndex = 100
    Instance.new("UICorner", p).CornerRadius = UDim.new(1, 0)
    local t = TweenService:Create(p, TweenInfo.new(0.5), {BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 0), Position = p.Position + UDim2.new(0, math.random(-10, 10), 0, math.random(-10, 10))})
    t:Play()
    t.Completed:Connect(function() p:Destroy() end)
end

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and gui:FindFirstChild("MainFrame") and gui.MainFrame.Visible then
        CreateParticle()
    end
end)

UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled then
        local char = Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end
end)

----------------------------------------------------------------
-- MAIN FRAME
----------------------------------------------------------------
local main = Instance.new("Frame", gui)
main.Name = "MainFrame"
main.Size = UDim2.new(0, 520, 0, 340)
main.Position = UDim2.new(0.5, -260, 0.5, -170)
main.BackgroundColor3 = Theme.Main
main.Visible = false 
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = Color3.new(1,1,1); mainStroke.Thickness = 3.5
local mainGradient = Instance.new("UIGradient", mainStroke)
mainGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Theme.Accent), ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, Theme.Accent)})
task.spawn(function() while task.wait(0.01) do mainGradient.Rotation = mainGradient.Rotation + 2 end end)

local dragZone = Instance.new("Frame", main)
dragZone.Size = UDim2.new(1, 0, 0, 60); dragZone.BackgroundTransparency = 1; dragZone.ZIndex = 100

local group = Instance.new("CanvasGroup", main)
group.Size = UDim2.new(1, 0, 1, 0); group.BackgroundTransparency = 1; group.GroupTransparency = 1

local sidebar = Instance.new("Frame", group)
sidebar.Size = UDim2.new(0, 150, 1, 0); sidebar.BackgroundColor3 = Theme.Side; Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

local sideTitle = Instance.new("TextLabel", sidebar)
sideTitle.Size = UDim2.new(1, 0, 0, 60); sideTitle.Text = "Universal Scripts"; sideTitle.TextColor3 = Theme.Accent; sideTitle.Font = Enum.Font.GothamBold; sideTitle.TextSize = 20; sideTitle.BackgroundTransparency = 1

local container = Instance.new("Frame", group)
container.Size = UDim2.new(1, -170, 0, 300); container.Position = UDim2.new(0, 160, 0, 20); container.BackgroundTransparency = 1

local selector = Instance.new("Frame", sidebar)
selector.Size = UDim2.new(0.9, 0, 0, 35); selector.Position = UDim2.new(0.05, 0, 0, 70); selector.BackgroundColor3 = Theme.Accent; selector.BackgroundTransparency = 0.8; Instance.new("UICorner", selector).CornerRadius = UDim.new(0, 8)

----------------------------------------------------------------
-- TAB SYSTEM
----------------------------------------------------------------
local pages = {}
local function createTab(name, posIndex)
    local p = Instance.new("Frame", container); p.Size = UDim2.new(1, 0, 1, 0); p.BackgroundTransparency = 1; p.Visible = false
    local b = Instance.new("TextButton", sidebar); b.Size = UDim2.new(0.9, 0, 0, 35); b.Position = UDim2.new(0.05, 0, 0, 70 + (posIndex * 40)); b.BackgroundTransparency = 1; b.Text = name; b.TextColor3 = Theme.Secondary; b.Font = Enum.Font.GothamSemibold; b.TextSize = 14
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(pages) do v.Visible = false end
        p.Visible = true; TweenService:Create(selector, TweenInfo.new(0.4), {Position = b.Position}):Play()
        for _, child in pairs(sidebar:GetChildren()) do if child:IsA("TextButton") then child.TextColor3 = Theme.Secondary end end
        b.TextColor3 = Color3.new(1,1,1)
    end)
    pages[name] = p
    return p
end

local pianoPage = createTab("Piano Hub", 0)
local infoPage = createTab("Info", 1)
local playerPage = createTab("Player", 2)
local systemPage = createTab("System", 3)
local settingsPage = createTab("Settings", 4)
local creditsPage = createTab("Credits", 5)
pianoPage.Visible = true

----------------------------------------------------------------
-- INFO TAB CONTENT
----------------------------------------------------------------
local infoScroll = Instance.new("ScrollingFrame", infoPage)
infoScroll.Size = UDim2.new(1, 0, 1, 0); infoScroll.BackgroundTransparency = 1; infoScroll.CanvasSize = UDim2.new(0, 0, 0, 400); infoScroll.ScrollBarThickness = 2
local infoLayout = Instance.new("UIListLayout", infoScroll); infoLayout.Padding = UDim.new(0, 8); infoLayout.SortOrder = Enum.SortOrder.LayoutOrder

local infoTitle = Instance.new("TextLabel", infoScroll)
infoTitle.Size = UDim2.new(1, 0, 0, 40); infoTitle.BackgroundTransparency = 1; infoTitle.Text = "LES JEUX DE PIANO SANS LA FAILLE :"; infoTitle.TextColor3 = Color3.fromRGB(255, 50, 50); infoTitle.Font = "GothamBold"; infoTitle.TextSize = 14; infoTitle.TextXAlignment = "Left"; infoTitle.LayoutOrder = 0

local function addSecurityLine(gameName, order)
    local frame = Instance.new("Frame", infoScroll); frame.Size = UDim2.new(1, 0, 0, 25); frame.BackgroundTransparency = 1; frame.LayoutOrder = order
    local dot = Instance.new("Frame", frame); dot.Size = UDim2.new(0, 8, 0, 8); dot.Position = UDim2.new(0, 5, 0.5, -4); dot.BackgroundColor3 = Color3.fromRGB(255, 0, 0); dot.BorderSizePixel = 0; Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
    local txt = Instance.new("TextLabel", frame); txt.Size = UDim2.new(1, -25, 1, 0); txt.Position = UDim2.new(0, 25, 0, 0); txt.BackgroundTransparency = 1; txt.Text = gameName; txt.TextColor3 = Color3.new(1,1,1); txt.Font = "GothamSemibold"; txt.TextSize = 14; txt.TextXAlignment = "Left"
end

addSecurityLine("Visual Pianos", 1)
addSecurityLine("Piano Rooms", 2)
addSecurityLine("Tac's Piano Stuff", 3)
addSecurityLine("Piano Haven", 4)

local infoDesc = Instance.new("TextLabel", infoScroll)
infoDesc.Size = UDim2.new(1, -10, 0, 60); infoDesc.BackgroundTransparency = 1; infoDesc.Text = "Ces jeux utilisent un système sécurisé. La faille GlobalPianoConnector ne peut pas fonctionner ici."; infoDesc.TextColor3 = Color3.new(0.7, 0.7, 0.7); infoDesc.Font = "Gotham"; infoDesc.TextSize = 12; infoDesc.TextXAlignment = "Left"; infoDesc.TextWrapped = true; infoDesc.LayoutOrder = 5

----------------------------------------------------------------
-- BUTTON TEMPLATE
----------------------------------------------------------------
local function createCleanButton(parent, text, yPos)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 35); btn.Position = UDim2.new(0, 0, 0, yPos); btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); btn.Text = text; btn.Font = Enum.Font.GothamBold; btn.TextSize = 16; btn.TextColor3 = Theme.Accent; btn.AutoButtonColor = false; Instance.new("UICorner", btn)
    local stroke = Instance.new("UIStroke", btn); stroke.Color = Theme.Accent; stroke.Thickness = 1.5; stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    btn.MouseButton1Down:Connect(function() TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Theme.Accent, TextColor3 = Color3.new(1,1,1)}):Play() end)
    btn.MouseButton1Up:Connect(function() TweenService:Create(btn, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 35), BackgroundColor3 = Color3.fromRGB(30, 30, 30), TextColor3 = Theme.Accent}):Play() end)
    table.insert(autoFarmButtons, btn)
    return btn
end

----------------------------------------------------------------
-- PIANO CRASH LOGIC
----------------------------------------------------------------
local crashBtn = createCleanButton(pianoPage, "Crash Server : OFF", 0)
crashBtn.MouseButton1Click:Connect(function()
    local remote = workspace:FindFirstChild("GlobalPianoConnector")
    
    if not remote then
        Notify("Error", "GlobalPianoConnector Not Found", Color3.fromRGB(255, 50, 50))
        return
    end

    CrashEnabled = not CrashEnabled
    crashBtn.Text = CrashEnabled and "Crash Server : ACTIVE" or "Crash Server : OFF"
    crashBtn.TextColor3 = CrashEnabled and Color3.new(1, 0, 0) or Theme.Accent

    if CrashEnabled then
        Notify("Success", "Faille trouvée ! Crash lancé.", Color3.fromRGB(50, 255, 50))
        task.spawn(function()
            while CrashEnabled do
                if remote then
                    for i = 1, 61 do remote:FireServer("play", i) end
                end
                task.wait()
            end
        end)
    end
end)

local flingBtn = createCleanButton(pianoPage, "Fling Others : OFF", 45)
flingBtn.MouseButton1Click:Connect(function()
    FlingEnabled = not FlingEnabled
    flingBtn.Text = FlingEnabled and "Fling Others : ON" or "Fling Others : OFF"
    flingBtn.TextColor3 = FlingEnabled and Color3.new(0, 1, 0) or Theme.Accent
    local hrp = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if FlingEnabled and hrp then
        local b = Instance.new("BodyAngularVelocity", hrp); b.Name = "PianoFling"; b.MaxTorque = Vector3.new(0, math.huge, 0); b.P = math.huge; b.AngularVelocity = Vector3.new(0, 99999, 0)
    elseif hrp and hrp:FindFirstChild("PianoFling") then hrp.PianoFling:Destroy() end
end)

----------------------------------------------------------------
-- PLAYER & OTHERS
----------------------------------------------------------------
local function createInput(parent, txt, y, cb)
    local l = Instance.new("TextLabel", parent); l.Size = UDim2.new(0.4,0,0,35); l.Position = UDim2.new(0,0,0,y); l.Text = txt; l.TextColor3 = Color3.new(1,1,1); l.Font = "GothamBold"; l.TextSize = 15; l.BackgroundTransparency = 1; l.TextXAlignment = "Left"
    local b = Instance.new("TextBox", parent); b.Size = UDim2.new(0.5,0,0,35); b.Position = UDim2.new(0.45,0,0,y); b.BackgroundColor3 = Color3.fromRGB(30,30,30); b.Text = ""; b.PlaceholderText = "Value..."; b.TextColor3 = Theme.Accent; b.Font = "GothamBold"; b.TextSize = 14; Instance.new("UICorner", b)
    local s = Instance.new("UIStroke", b); s.Color = Theme.Accent; s.Thickness = 1.5; s.ApplyStrokeMode = "Border"
    b.FocusLost:Connect(function() cb(tonumber(b.Text) or 16) end)
    table.insert(autoFarmButtons, b)
end

createInput(playerPage, "WalkSpeed", 0, function(v) if Players.LocalPlayer.Character then Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end end)
createInput(playerPage, "JumpPower", 45, function(v) if Players.LocalPlayer.Character then Players.LocalPlayer.Character.Humanoid.JumpPower = v end end)
local infJ = createCleanButton(playerPage, "Infinity Jump: OFF", 90)
infJ.MouseButton1Click:Connect(function() InfJumpEnabled = not InfJumpEnabled; infJ.Text = InfJumpEnabled and "Infinity Jump: ON" or "Infinity Jump: OFF"; infJ.TextColor3 = InfJumpEnabled and Color3.new(0,1,0) or Theme.Accent end)

createCleanButton(systemPage, "🚀 FPS Booster", 0).MouseButton1Click:Connect(function()
    for _, v in pairs(game:GetDescendants()) do if v:IsA("BasePart") then v.Material = "SmoothPlastic" end end
end)

----------------------------------------------------------------
-- THEMES & CREDITS
----------------------------------------------------------------
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 50, 0, 50); toggleBtn.Position = UDim2.new(0, 15, 0.5, -25); toggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20); toggleBtn.BackgroundTransparency = 1; toggleBtn.Text = ""
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 12)
local btnStroke = Instance.new("UIStroke", toggleBtn); btnStroke.Color = Theme.Accent; btnStroke.Thickness = 2; btnStroke.Transparency = 1
local btnIcon = Instance.new("TextLabel", toggleBtn); btnIcon.Size = UDim2.new(1, 0, 1, 0); btnIcon.Text = "AC"; btnIcon.TextColor3 = Color3.new(1, 1, 1); btnIcon.Font = "GothamBold"; btnIcon.TextSize = 16; btnIcon.BackgroundTransparency = 1; btnIcon.TextTransparency = 1
local statusBar = Instance.new("Frame", toggleBtn); statusBar.Size = UDim2.new(0, 4, 0, 20); statusBar.Position = UDim2.new(0, 4, 0.5, -10); statusBar.BackgroundColor3 = Theme.Accent; statusBar.BackgroundTransparency = 1; Instance.new("UICorner", statusBar)

task.spawn(function()
    task.wait(2.8)
    TweenService:Create(toggleBtn, TweenInfo.new(0.5), {BackgroundTransparency = 0.2}):Play()
    TweenService:Create(btnStroke, TweenInfo.new(0.5), {Transparency = 0}):Play()
    TweenService:Create(btnIcon, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    TweenService:Create(statusBar, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
end)

local function createPresetButton(name, accent, order)
    local btn = Instance.new("TextButton", settingsPage)
    btn.Size = UDim2.new(1, 0, 0, 35); btn.Position = UDim2.new(0, 0, 0, (order - 1) * 40); btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); btn.Text = name; btn.TextColor3 = accent; btn.Font = "GothamBold"; btn.TextSize = 15; Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(function()
        Theme.Accent = accent; sideTitle.TextColor3 = accent; selector.BackgroundColor3 = accent; btnStroke.Color = accent; statusBar.BackgroundColor3 = accent
        mainGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, accent), ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, accent)})
        for _, abtn in pairs(autoFarmButtons) do abtn.TextColor3 = accent; local s = abtn:FindFirstChildOfClass("UIStroke"); if s then s.Color = accent end end
        for _, grad in pairs(creditGradients) do grad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, accent), ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, accent)}) end
    end)
end
createPresetButton("Classic Blue", Color3.fromRGB(0, 150, 255), 1); createPresetButton("Neon Red", Color3.fromRGB(255, 50, 50), 2); createPresetButton("Galaxy Purple", Color3.fromRGB(180, 50, 255), 3); createPresetButton("Fire Orange", Color3.fromRGB(255, 150, 50), 4)

local function addCreditLine(title, info, pos)
    local label = Instance.new("TextLabel", creditsPage); label.Size = UDim2.new(1, 0, 0, 30); label.Position = UDim2.new(0, 0, 0, pos * 35); label.BackgroundTransparency = 1; label.Text = title .. " :  " .. info; label.TextColor3 = Color3.new(1,1,1); label.Font = "GothamBold"; label.TextSize = 16; label.TextXAlignment = "Left"
    local grad = Instance.new("UIGradient", label); grad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Theme.Accent), ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, Theme.Accent)})
    table.insert(creditGradients, grad); task.spawn(function() while task.wait(0.01) do grad.Rotation = grad.Rotation + 2 end end)
end
addCreditLine("Lead Developer", "che3t_2345", 0); addCreditLine("Universal", "Piano Crasher Edition", 1); addCreditLine("Status", "It depends on the game or security.", 2); addCreditLine("Version", Version, 3)

----------------------------------------------------------------
-- UI TOGGLE & DRAG
----------------------------------------------------------------
local isOpen = false
local function toggleUI()
    isOpen = not isOpen
    if isOpen then
        main.Visible = true; TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 520, 0, 340)}):Play(); TweenService:Create(group, TweenInfo.new(0.3), {GroupTransparency = 0}):Play()
    else
        local t = TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
        TweenService:Create(group, TweenInfo.new(0.2), {GroupTransparency = 1}):Play(); t:Play(); t.Completed:Connect(function() if not isOpen then main.Visible = false end end)
    end
end
toggleBtn.MouseEnter:Connect(function() if toggleBtn.BackgroundTransparency < 1 then TweenService:Create(toggleBtn, TweenInfo.new(0.3), {Size = UDim2.new(0, 56, 0, 56), Position = UDim2.new(0, 12, 0.5, -28), BackgroundColor3 = Theme.Accent}):Play(); TweenService:Create(btnIcon, TweenInfo.new(0.3), {TextColor3 = Color3.new(0,0,0)}):Play() end end)
toggleBtn.MouseLeave:Connect(function() if toggleBtn.BackgroundTransparency < 1 then TweenService:Create(toggleBtn, TweenInfo.new(0.3), {Size = UDim2.new(0, 50, 0, 50), Position = UDim2.new(0, 15, 0.5, -25), BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play(); TweenService:Create(btnIcon, TweenInfo.new(0.3), {TextColor3 = Color3.new(1,1,1)}):Play() end end)
toggleBtn.MouseButton1Click:Connect(toggleUI)

local dragging, dragStart, startPos
dragZone.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true; dragStart = input.Position; startPos = main.Position end end)
UserInputService.InputChanged:Connect(function(input) if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then local delta = input.Position - dragStart; main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) end end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
