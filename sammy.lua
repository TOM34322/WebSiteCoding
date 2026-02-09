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

local Version = "v3.0 Sammy"
local creditGradients = {}
local autoFarmButtons = {} 
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
local loadCorner = Instance.new("UICorner", loadFrame)
local loadStroke = Instance.new("UIStroke", loadFrame)
loadStroke.Color = Theme.Accent
loadStroke.Thickness = 2

local loadLabel = Instance.new("TextLabel", loadFrame)
loadLabel.Size = UDim2.new(1, 0, 0, 50); loadLabel.BackgroundTransparency = 1
loadLabel.Text = "Sammy Hub Loading..."; loadLabel.TextColor3 = Color3.new(1,1,1); loadLabel.Font = "GothamBold"; loadLabel.TextSize = 18

local barBg = Instance.new("Frame", loadFrame)
barBg.Size = UDim2.new(0.8, 0, 0, 10); barBg.Position = UDim2.new(0.1, 0, 0.7, 0); barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", barBg)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0); barFill.BackgroundColor3 = Theme.Accent
Instance.new("UICorner", barFill)

task.spawn(function()
    TweenService:Create(barFill, TweenInfo.new(2, Enum.EasingStyle.Quart), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(2.2)
    TweenService:Create(loadFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -150, 1.2, 0)}):Play()
    task.wait(0.6); loadFrame:Destroy()
end)

----------------------------------------------------------------
-- MAIN FRAME
----------------------------------------------------------------
local main = Instance.new("Frame", gui)
main.Name = "MainFrame"; main.Size = UDim2.new(0, 520, 0, 340); main.Position = UDim2.new(0.5, -260, 0.5, -170)
main.BackgroundColor3 = Theme.Main; main.Visible = false; Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local mainStroke = Instance.new("UIStroke", main); mainStroke.Color = Color3.new(1,1,1); mainStroke.Thickness = 3.5
local mainGradient = Instance.new("UIGradient", mainStroke)
mainGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Theme.Accent), ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, Theme.Accent)})
task.spawn(function() while task.wait(0.01) do mainGradient.Rotation = mainGradient.Rotation + 2 end end)

local dragZone = Instance.new("Frame", main); dragZone.Size = UDim2.new(1, 0, 0, 60); dragZone.BackgroundTransparency = 1; dragZone.ZIndex = 100

local group = Instance.new("CanvasGroup", main); group.Size = UDim2.new(1, 0, 1, 0); group.BackgroundTransparency = 1; group.GroupTransparency = 1

local sidebar = Instance.new("Frame", group); sidebar.Size = UDim2.new(0, 150, 1, 0); sidebar.BackgroundColor3 = Theme.Side; Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

local sideTitle = Instance.new("TextLabel", sidebar)
sideTitle.Size = UDim2.new(1, 0, 0, 60); sideTitle.Text = "Sammy Hub"; sideTitle.TextColor3 = Theme.Accent; sideTitle.Font = "GothamBold"; sideTitle.TextSize = 20; sideTitle.BackgroundTransparency = 1

local container = Instance.new("Frame", group); container.Size = UDim2.new(1, -170, 0, 300); container.Position = UDim2.new(0, 160, 0, 20); container.BackgroundTransparency = 1

local selector = Instance.new("Frame", sidebar)
selector.Size = UDim2.new(0.9, 0, 0, 35); selector.Position = UDim2.new(0.05, 0, 0, 70); selector.BackgroundColor3 = Theme.Accent; selector.BackgroundTransparency = 0.8; Instance.new("UICorner", selector).CornerRadius = UDim.new(0, 8)

----------------------------------------------------------------
-- TAB SYSTEM
----------------------------------------------------------------
local pages = {}
local function createTab(name, posIndex)
    local p = Instance.new("ScrollingFrame", container); p.Size = UDim2.new(1, 0, 1, 0); p.BackgroundTransparency = 1; p.Visible = false
    p.ScrollBarThickness = 2; p.CanvasSize = UDim2.new(0, 0, 0, 450)
    local layout = Instance.new("UIListLayout", p); layout.Padding = UDim.new(0, 10); layout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local b = Instance.new("TextButton", sidebar); b.Size = UDim2.new(0.9, 0, 0, 35); b.Position = UDim2.new(0.05, 0, 0, 70 + (posIndex * 40)); b.BackgroundTransparency = 1; b.Text = name; b.TextColor3 = Theme.Secondary; b.Font = "GothamSemibold"; b.TextSize = 14
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(pages) do v.Visible = false end
        p.Visible = true; TweenService:Create(selector, TweenInfo.new(0.4), {Position = b.Position}):Play()
        for _, child in pairs(sidebar:GetChildren()) do if child:IsA("TextButton") then child.TextColor3 = Theme.Secondary end end
        b.TextColor3 = Color3.new(1,1,1)
    end)
    pages[name] = p
    return p
end

local sammyPage = createTab("Main Tools", 0)
local skinsPage = createTab("Skins Hub", 1)
local playerPage = createTab("Player", 2)
local settingsPage = createTab("Settings", 3)
local creditsPage = createTab("Credits", 4)
sammyPage.Visible = true

----------------------------------------------------------------
-- UTILS / BUTTONS
----------------------------------------------------------------
local function createCleanButton(parent, text, cb)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -10, 0, 35); btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); btn.Text = text; btn.Font = "GothamBold"; btn.TextSize = 14; btn.TextColor3 = Theme.Accent; btn.AutoButtonColor = false; Instance.new("UICorner", btn)
    local stroke = Instance.new("UIStroke", btn); stroke.Color = Theme.Accent; stroke.Thickness = 1.5; stroke.ApplyStrokeMode = "Border"
    btn.MouseButton1Click:Connect(cb)
    table.insert(autoFarmButtons, btn)
    return btn
end

----------------------------------------------------------------
-- MAIN TOOLS CONTENT (BYPASS & REWARDS)
----------------------------------------------------------------
createCleanButton(sammyPage, "🔓 Bypass VIP Wall", function()
    if workspace:FindFirstChild("VIP") and workspace.VIP:FindFirstChild("VIPWALL") then
        workspace.VIP.VIPWALL:Destroy()
        Notify("Success", "VIP Wall Deleted!", Color3.fromRGB(50, 255, 50))
    end
end)

createCleanButton(sammyPage, "🎁 Claim Daily Rewards", function()
    local daily = workspace:FindFirstChild("DailyRewardsFolder")
    if daily then
        for _, v in pairs(daily:GetChildren()) do
            local prompt = v:FindFirstChildOfClass("ProximityPrompt")
            if prompt then fireproxyprompt(prompt) end
        end
        Notify("Success", "All Daily Claimed!", Theme.Accent)
    end
end)

----------------------------------------------------------------
-- SKINS CONTENT (FULL LIST)
----------------------------------------------------------------
local function GetSkin(target)
    local hrp = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp and target then
        local oldPos = hrp.CFrame
        hrp.CFrame = target.CFrame
        task.wait(0.2)
        hrp.CFrame = oldPos
    end
end

local skinList = {
    {"Frontman", "MorphFrontman"}, {"Big Sammy", "MorphBigSammy"}, 
    {"Meowl", "MorphMeowl"}, {"Diamond", "MorphDiamond"},
    {"Strawberry", "MorphCandyStrawberry"}, {"Dragon", "MorphDragon"},
    {"Golden Sammy", "MorphGoldenSammy"}
}

for _, skin in pairs(skinList) do
    local model = workspace:FindFirstChild(skin[2])
    if model then
        createCleanButton(skinsPage, "Collect " .. skin[1], function() GetSkin(model:FindFirstChild("MorphPart")) end)
    end
end

----------------------------------------------------------------
-- PLAYER CONTENT
----------------------------------------------------------------
local function createInput(parent, txt, cb)
    local frame = Instance.new("Frame", parent); frame.Size = UDim2.new(1, -10, 0, 35); frame.BackgroundTransparency = 1
    local l = Instance.new("TextLabel", frame); l.Size = UDim2.new(0.4, 0, 1, 0); l.Text = txt; l.TextColor3 = Color3.new(1,1,1); l.Font = "GothamBold"; l.TextSize = 14; l.BackgroundTransparency = 1; l.TextXAlignment = "Left"
    local b = Instance.new("TextBox", frame); b.Size = UDim2.new(0.5, 0, 1, 0); b.Position = UDim2.new(0.45, 0, 0, 0); b.BackgroundColor3 = Color3.fromRGB(30, 30, 30); b.Text = ""; b.PlaceholderText = "Value..."; b.TextColor3 = Theme.Accent; b.Font = "GothamBold"; b.TextSize = 14; Instance.new("UICorner", b)
    local s = Instance.new("UIStroke", b); s.Color = Theme.Accent; s.Thickness = 1.5; s.ApplyStrokeMode = "Border"
    b.FocusLost:Connect(function() cb(tonumber(b.Text) or 16) end)
    table.insert(autoFarmButtons, b)
end

createInput(playerPage, "WalkSpeed", function(v) if Players.LocalPlayer.Character then Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end end)
createInput(playerPage, "JumpPower", function(v) if Players.LocalPlayer.Character then Players.LocalPlayer.Character.Humanoid.JumpPower = v end end)

local infJ = createCleanButton(playerPage, "Infinity Jump: OFF", function() end)
infJ.MouseButton1Click:Connect(function()
    InfJumpEnabled = not InfJumpEnabled
    infJ.Text = InfJumpEnabled and "Infinity Jump: ON" or "Infinity Jump: OFF"
    infJ.TextColor3 = InfJumpEnabled and Color3.new(0, 1, 0) or Theme.Accent
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
-- SETTINGS CONTENT (TON SYSTEM)
----------------------------------------------------------------
local function createPresetButton(name, accent, order)
    local btn = Instance.new("TextButton", settingsPage)
    btn.Size = UDim2.new(1, -10, 0, 35); btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); btn.Text = name; btn.TextColor3 = accent; btn.Font = "GothamBold"; btn.TextSize = 15; Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(function()
        Theme.Accent = accent; sideTitle.TextColor3 = accent; selector.BackgroundColor3 = accent
        mainGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, accent), ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, accent)})
        for _, abtn in pairs(autoFarmButtons) do abtn.TextColor3 = accent; local s = abtn:FindFirstChildOfClass("UIStroke"); if s then s.Color = accent end end
        for _, grad in pairs(creditGradients) do grad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, accent), ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, accent)}) end
    end)
end
createPresetButton("Classic Blue", Color3.fromRGB(0, 150, 255)); createPresetButton("Neon Red", Color3.fromRGB(255, 50, 50)); createPresetButton("Galaxy Purple", Color3.fromRGB(180, 50, 255)); createPresetButton("Fire Orange", Color3.fromRGB(255, 150, 50))

----------------------------------------------------------------
-- CREDITS CONTENT (TON SYSTEM)
----------------------------------------------------------------
local function addCreditLine(title, info)
    local label = Instance.new("TextLabel", creditsPage)
    label.Size = UDim2.new(1, 0, 0, 30); label.BackgroundTransparency = 1; label.Text = title .. " :  " .. info; label.TextColor3 = Color3.new(1,1,1); label.Font = "GothamBold"; label.TextSize = 16; label.TextXAlignment = "Left"
    local grad = Instance.new("UIGradient", label); grad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Theme.Accent), ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, Theme.Accent)})
    table.insert(creditGradients, grad); task.spawn(function() while task.wait(0.01) do grad.Rotation = grad.Rotation + 2 end end)
end
addCreditLine("Lead Developer", "che3t_2345")
addCreditLine("Game", "Sammy Jump Rope")
addCreditLine("Status", "Stable")
addCreditLine("Version", Version)

----------------------------------------------------------------
-- UI TOGGLE & DRAG (TON BOUTON AC)
----------------------------------------------------------------
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 50, 0, 50); toggleBtn.Position = UDim2.new(0, 15, 0.5, -25); toggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20); toggleBtn.Text = "AC"; toggleBtn.TextColor3 = Color3.new(1,1,1); toggleBtn.Font = "GothamBold"; toggleBtn.TextSize = 16; Instance.new("UICorner", toggleBtn)
local btnStroke = Instance.new("UIStroke", toggleBtn); btnStroke.Color = Theme.Accent; btnStroke.Thickness = 2

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
toggleBtn.MouseButton1Click:Connect(toggleUI)

local dragging, dragStart, startPos
dragZone.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true; dragStart = input.Position; startPos = main.Position end end)
UserInputService.InputChanged:Connect(function(input) if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then local delta = input.Position - dragStart; main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) end end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
