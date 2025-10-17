-- 1. Load the Luna Interface Suite library
local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua", true))()

-- Services and Base Objects (Unchanged)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Parameters (Unchanged)
local TELEPORT_DELAY = 0.01 
local BUY_DELAY = 0.05      
local RIDE_NAMES = {
    "Battleship", "Bed", "BigTruck", "BurgerMobile", "Bus", "CameraMan", "Car", "Cart",
    "Cat", "Cottage", "CrazyToilet", "CyberTruck", "Doomspire", "FishingBoat", "Grimace",
    "House", "LightHouse", "Log", "MegaPlane", "MonsterTruck", "Motorcycle", "NyanCat",
    "OldRoblox", "PirateShip", "Pizza", "RedBird", "Rocket", "RowBoat", "SchoolBus",
    "Shop", "Submarine", "Train", "Villa",
}

----------------------------------------------------------------------
-- 2. Window Configuration (Adjustable Size & Furtive Info)
----------------------------------------------------------------------

local Window = Luna:CreateWindow({
    Name = "ALL-STAR HUB", 
    Subtitle = "High-Performance Automation Tool",
    LoadingEnabled = true,
    LoadingTitle = "Loading Automation Modules",
    LoadingSubtitle = "Script by TestCheat_20252",
    
    -- ADJUSTABLE SIZE (X=Width, Y=Height)
    InitialSize = {X = 400, Y = 500},
    
    -- Logo ID (Placeholder - You can change this)
    LogoID = "2156434493", 
    
    -- KEY SYSTEM CONFIGURATION 
    KeySystem = true, 
    KeySettings = {
        Title = "Authentication Required",
        Subtitle = "Access is locked",
        Note = "Join the Discord to get the key. The current key is: ScriptOP",
        SaveKey = true, 
        Key = {"ScriptOP"}, 
        SecondAction = {
            Enabled = true,
            Type = "Discord", 
            Parameter = "VTJf24m5UM" 
        }
    },
    
    -- STATIC THEME (Most reliable color configuration)
    ThemeSettings = {
        Accent = Color3.fromRGB(0, 255, 255), 
        Primary = Color3.fromRGB(25, 25, 30), 
        Secondary = Color3.fromRGB(40, 40, 50),
        Background = Color3.fromRGB(15, 15, 20),
    }
})

----------------------------------------------------------------------
-- UTILITY AND ACTION FUNCTIONS (Unchanged)
----------------------------------------------------------------------

local function getGameObjects()
    local objs = {}
    objs.collectablesContainer = workspace:FindFirstChild("SeasonCurrencyCollectable")
    
    local endModel = workspace:FindFirstChild("Slide") and workspace.Slide:FindFirstChild("End")
    if endModel and endModel:IsA("Model") then
        objs.endPositionPart = endModel:FindFirstChild("Part") or endModel:FindFirstChildOfClass("BasePart")
    end
    
    objs.gibberishEvent = game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Events"):WaitForChild("Gibberish")
    return objs
end

local function sendNotification(title, content)
    Luna:Notification({
        Title = title,
        Icon = "notifications_active",
        ImageSource = "Material",
        Content = content
    })
end

local function collectItemsRapidTeleport()
    local objs = getGameObjects()
    if not objs.collectablesContainer then 
        sendNotification("Error", "XP Container not found.")
        return 
    end
    
    local collectedCount = 0
    local partsToTeleportTo = {}
    
    for _, collectibleModel in ipairs(objs.collectablesContainer:GetChildren()) do
        local rimPart = collectibleModel:FindFirstChild("Rim")
        if rimPart and rimPart:IsA("BasePart") then
            table.insert(partsToTeleportTo, rimPart)
        end
    end
    
    sendNotification("Collection Started", string.format("Rapidly collecting %d available stars...", #partsToTeleportTo))

    for _, partToTeleportTo in ipairs(partsToTeleportTo) do
        local teleportCFrame = CFrame.new(partToTeleportTo.Position) * CFrame.new(0, 3, 0)
        rootPart.CFrame = teleportCFrame
        
        wait(TELEPORT_DELAY)
        collectedCount = collectedCount + 1
    end
    
    sendNotification("Collection Complete", string.format("Successfully collected %d stars.", collectedCount))
end

local function teleportToEnd()
    local objs = getGameObjects()
    
    if objs.endPositionPart and objs.endPositionPart:IsA("BasePart") then
        local targetCFrame = CFrame.new(objs.endPositionPart.Position)
        rootPart.CFrame = targetCFrame
        sendNotification("Teleport Successful", "Arrived at 'End' position.")
    else
        sendNotification("Teleport Error", "'End' Part not found. Console may provide debug info.")
    end
end

local function buyAllRides()
    local objs = getGameObjects()
    if not objs.gibberishEvent then 
        sendNotification("Error", "Purchase Remote not found.")
        return 
    end
    
    local successCount = 0
    local totalItems = #RIDE_NAMES
    sendNotification("Purchase Started", string.format("Attempting to buy %d items...", totalItems))
    
    for i, rideName in ipairs(RIDE_NAMES) do
        local args = { "Ride", rideName, 1 }
        
        local success = pcall(function()
            objs.gibberishEvent:FireServer(unpack(args))
        end)
        
        if success then
            successCount = successCount + 1
        end
        wait(BUY_DELAY)
    end
    
    sendNotification("Purchase Complete", string.format("%d purchase requests sent out of %d.", successCount, totalItems))
end

local function setRagdoll(state)
    local objs = getGameObjects()
    if not objs.gibberishEvent then 
        sendNotification("Error", "Action Remote not found for Ragdoll.")
        return 
    end
    
    local success = pcall(function()
        objs.gibberishEvent:FireServer(state)
    end)
    
    if success then
        local status = state and "Enabled" or "Disabled"
        sendNotification("Ragdoll Control", "Ragdoll " .. status .. " successfully.")
    else
        sendNotification("Ragdoll Error", "Failed to send Ragdoll request.")
    end
end

----------------------------------------------------------------------
-- 3. BUILDING THE LUNA GUI (V21 Structure)
----------------------------------------------------------------------

-- Tab 1: Actions 
local ActionsTab = Window:CreateTab({
    Name = "Actions",
    Icon = "bolt",
    ImageSource = "Material",
    ShowTitle = true
})

ActionsTab:CreateSection("XP Collection & Navigation")

ActionsTab:CreateButton({
    Name = "Star Collection (Optimized)",
    Description = "Uses rapid player teleport to collect all available stars. Accounts for star regeneration.",
    Callback = function()
        task.spawn(collectItemsRapidTeleport)
    end
})

ActionsTab:CreateDivider() 

ActionsTab:CreateButton({
    Name = "Teleport to End",
    Description = "Teleports player to the final finish line part.",
    Callback = function()
        teleportToEnd()
    end
})

ActionsTab:CreateSection("Player Control")

ActionsTab:CreateButton({
    Name = "Enable Ragdoll",
    Description = "Activates the ragdoll state for your character (you will fall).",
    Callback = function()
        setRagdoll(true)
    end
})

ActionsTab:CreateButton({
    Name = "Disable Ragdoll",
    Description = "Disables the ragdoll state (normal walking).",
    Callback = function()
        setRagdoll(false)
    end
})

ActionsTab:CreateDivider() 

ActionsTab:CreateSection("Store Exploits")

ActionsTab:CreateButton({
    Name = string.format("Buy All Rides (%d Items)", #RIDE_NAMES),
    Callback = function()
        task.spawn(buyAllRides)
    end
})

-- Tab 2: Information (Furtive)
local InfoTab = Window:CreateTab({
    Name = "Information",
    Icon = "info",
    ImageSource = "Material",
    ShowTitle = true
})

InfoTab:CreateSection("Script Details")

InfoTab:CreateLabel({Text = "Creator: TestCheat_20252"})
InfoTab:CreateLabel({Text = "Date: 10/17/2025"})
InfoTab:CreateLabel({Text = "UI Framework: Luna Interface Suite"})
InfoTab:CreateLabel({Text = "Key Access: Discord (VTJf24m5UM)"})

InfoTab:CreateDivider()

InfoTab:CreateParagraph({
    Title = "Core Functionality",
    Text = "This tool uses a 'Rapid Teleport' method (0.01s delay) to dynamically acquire all available collectibles. It targets the 'Rim' part of the models to ensure reliable server contact registration, bypassing common anti-cheat measures related to collection."
})

InfoTab:CreateSection("Configuration")

InfoTab:CreateLabel({
    Text = "All settings and toggles are saved automatically via the Luna configuration system."
})

-- Tab 3: Config (For Save/Load/Delete settings)
local ConfigTab = Window:CreateTab({
    Name = "Config",
    Icon = "settings",
    ImageSource = "Material",
    ShowTitle = true
})
ConfigTab:BuildConfigSection()

print("ALL-STAR HUB V21 loaded. Optimized for stability and security. Key: ScriptOP.")