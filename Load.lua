local Players = game:GetService("Players")
local player = Players.LocalPlayer

if player.PlayerGui:FindFirstChild("CBX_Loader") then player.PlayerGui.CBX_Loader:Destroy() end

local sg = Instance.new("ScreenGui", player.PlayerGui)
sg.Name = "CBX_Loader"

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 300, 0, 160)
main.Position = UDim2.new(0.5, -150, 0.5, -80)
main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(60, 60, 60)
stroke.Thickness = 2

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "CODEBLOX LOADER"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1

local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0, 55)
status.Text = "Checking User..."
status.TextColor3 = Color3.fromRGB(180, 180, 180)
status.Font = Enum.Font.Gotham
status.TextSize = 13
status.BackgroundTransparency = 1

local barBg = Instance.new("Frame", main)
barBg.Size = UDim2.new(0, 240, 0, 6)
barBg.Position = UDim2.new(0.5, -120, 0.5, 25)
barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
barFill.BorderSizePixel = 0
Instance.new("UICorner", barFill)

task.spawn(function()
    local t = {
        {0.3, "Fetching Data..."},
        {0.6, "Loading Assets..."},
        {1, "Welcome, " .. player.Name}
    }
    
    for _, s in ipairs(t) do
        status.Text = s[2]
        barFill:TweenSize(UDim2.new(s[1], 0, 1, 0), "Out", "Quad", 0.6)
        task.wait(0.8)
    end
    
    task.wait(0.5)
    sg:Destroy()
    
    
     loadstring(game:HttpGet("https://raw.githubusercontent.com/KinesisDev-Official/Genesis.Oversight/refs/heads/Main/%5BUPD%5D%20%2B1%20Speed%20Facility%20Escape_Protected.lua"))()
end)
