-- Protected by CodeBlox Studio
-- Game: Brookhaven
-- Date: 27/03/2026 22:15:21

if not game or not game.GetService then error("Invalid environment") end

-- Strings
local _sP0ds0 = "_vyrb7E0"
local _sRDbb1 = "_vy3H0V1"
local _sXF1q2 = "_vSAfqs2"
local _szW2N3 = "EggHunt_Easy"
local _sjPli4 = "EggHunt_Medium"
local _saNwW5 = "EggHunt_Hard"
local _siQPI6 = "EggHunt_Eggstreme"
local _sB0ya7 = "HumanoidRootPart"
local _s9gRo8 = "Humanoid"
local _sOkfP9 = "Humanoid"
local _sA5Wv10 = "BasePart"
local _sXWJD11 = "BasePart"
local _slamc12 = "ScreenGui"
local _snj4Z13 = "AutoFarmGui"
local _sU40e14 = "Frame"
local _sNHJB15 = "UICorner"
local _sqNoQ16 = "TextLabel"
local _she1w17 = "EGG AUTO FARM"
local _smNK218 = "UICorner"
local _skde719 = "TextButton"
local _sXCtZ20 = "-"
local _sftLQ21 = "UICorner"
local _sjwY122 = "TextLabel"
local _sCryO23 = "Waiting..."
local _sB6We24 = "UICorner"
local _sQ99l25 = "Frame"
local _sQiJE26 = "UICorner"
local _s7yb027 = "Frame"
local _s7qgZ28 = "UICorner"
local _sJPcu29 = "TextButton"
local _sGo2Z30 = "START"
local _sx7MN31 = "UICorner"
local _srGRW32 = "Frame"
local _sBqHU33 = "TextLabel"
local _sPLuW34 = "Speed: 100"
local _smn5i35 = "TextButton"
local _stskP36 = "-"
local _sWTWm37 = "UICorner"
local _s9Vbu38 = "TextButton"
local _s2NN339 = "+"
local _sEdkW40 = "UICorner"
local _s4O1s41 = "TextLabel"
local _snmiG42 = "100"
local _s1ziT43 = "UICorner"
local _sqIW244 = "TextButton"
local _sRjAG45 = "Noclip: OFF"
local _sMrAS46 = "UICorner"
local _sjVfu47 = "TextButton"
local _s0y8c48 = "Auto Jump: OFF"
local _ssUDQ49 = "UICorner"
local _syGQl50 = "TextLabel"
local _sVRyO51 = "Mode: Standing"
local _sSSNr52 = "UICorner"
local _s8Drv53 = "TextLabel"
local _shYw654 = "Status: Free"
local _snyrj55 = "UICorner"
local _sXDef56 = "%d/%d _v5DJAl16"
local _splin57 = "No _v5DJAl16 found"
local _sCUQx58 = "Status: Stuck - jumping in "
local _sgMVZ59 = "%.1f"
local _ssc1j60 = "_vLlFSz29"
local _sTp2b61 = "Status: Free"
local _sc99Z62 = "Speed: "
local _s8Oo963 = "BasePart"
local _sG6JS64 = "BasePart"
local _s7cdK65 = "HumanoidRootPart"
local _sm4IS66 = "BodyVelocity"
local _s0GBc67 = "BodyPosition"
local _sWlnR68 = "STOP"
local _sqBCE69 = "Mode: Sitting"
local _sotXD70 = "Complete! %d _v5DJAl16"
local _sCDm071 = "START"
local _sxBXm72 = "Mode: Standing"
local _sSRrL73 = "Farming %d/%d _v5DJAl16"
local _skDHO74 = "Mode: Standing"
local _soCxs75 = "START"
local _sNrvW76 = "Done! %d/%d _v5DJAl16"
local _sZa8Q77 = "Mode: Standing"
local _sbWDy78 = "Humanoid"
local _sVC6Q79 = "HumanoidRootPart"
local _syrff80 = "START"
local _srUAb81 = "Stopped - %d/%d _v5DJAl16"
local _shZiD82 = "Noclip: ON"
local _sTok483 = "Noclip: OFF"
local _s6dzs84 = "HumanoidRootPart"
local _sKof285 = "Auto Jump: ON"
local _sWBxw86 = "Auto Jump: OFF"
local _sPtZH87 = "+"
local _sFKrB88 = "-"
-- Main
local _vyrb7E0 = game:GetService(_sP0ds0)
local _vy3H0V1 = game:GetService(_sRDbb1)
local _vSAfqs2 = game:GetService(_sXF1q2)
local _vcaPfa3 = _vyrb7E0.LocalPlayer
local _vvEmmg4 = false
local _vQhzCS5 = 100
local _vcMrMO6 = false
local _vtKnK97 = false
local _vHCJW38 = false
local _v3aw9O9 = nil
local _vd2vhy10 = {
    _szW2N3,
    _sjPli4,
    _saNwW5,
    _siQPI6
}
local _vwPADr11 = 0
local _vmYRwL12 = Vector3.new(0, 0, 0)
_vy3H0V1.Heartbeat:Connect(function(dt)
    if not _vtKnK97 then return end
    if not _vvEmmg4 then return end
    if not _vcaPfa3.Character then return end
    local _vGjvKW13 = _vcaPfa3.Character:FindFirstChild(_sB0ya7)
    local _vkyTnR14 = _vcaPfa3.Character:FindFirstChild(_s9gRo8)
    if not _vGjvKW13 or not _vkyTnR14 then return end
    local _vUb5NP15 = (_vGjvKW13.Position - _vmYRwL12).Magnitude
    if _vUb5NP15 < 0.3 then
        _vwPADr11 = _vwPADr11 + dt
        if _vwPADr11 >= 0.3 then
            _vkyTnR14.Jump = true
            _vwPADr11 = 0
        end
    else
        _vwPADr11 = 0
        _vmYRwL12 = _vGjvKW13.Position
    end
end)
local function _vD8zOe52(sit)
    if not _vcaPfa3.Character then return end
    local _vkyTnR14 = _vcaPfa3.Character:FindFirstChild(_sOkfP9)
    if not _vkyTnR14 then return end
    if sit then
        _vkyTnR14.Sit = true
        _vkyTnR14.AutoRotate = false
    else
        _vkyTnR14.Sit = false
        _vkyTnR14.AutoRotate = true
    end
end
local function _vdrclj53(egg)
    if egg:IsA(_sA5Wv10) then return egg end
    return egg:FindFirstChildWhichIsA(_sXWJD11, true) or egg.PrimaryPart
end
local function _v8r2li54(egg)
    if not egg or not egg.Parent then
        return true
    end
    return false
end
local function _vTcL8N55()
    local _v5DJAl16 = {}
    for _, folderName in ipairs(_vd2vhy10) do
        local _vukbSp17 = workspace:FindFirstChild(folderName)
        if _vukbSp17 then
            for _, egg in ipairs(_vukbSp17:GetChildren()) do
                local _vkh7LP18 = _vdrclj53(egg)
                if _vkh7LP18 then
                    table.insert(_v5DJAl16, {
                        egg = egg,
                        _vkh7LP18 = _vkh7LP18,
                        _veTZUd39 = _v8r2li54(egg)
                    })
                end
            end
        end
    end
    return _v5DJAl16
end
local function _vemzxD56()
    local _vuSytW19 = _vTcL8N55()
    local _v5thzH20 = {}
    for _, eggData in ipairs(_vuSytW19) do
        if not eggData._veTZUd39 then
            table.insert(_v5thzH20, eggData._vkh7LP18)
        end
    end
    return _v5thzH20
end
local _vQVoT921 = Instance.new(_slamc12)
_vQVoT921.Name = _snj4Z13
_vQVoT921.ResetOnSpawn = false
_vQVoT921.Parent = _vcaPfa3.PlayerGui
local _vpU7te22 = Instance.new(_sU40e14)
_vpU7te22.Size = UDim2.new(0, 280, 0, 420)
_vpU7te22.Position = UDim2.new(0, 10, 0.2, 0)
_vpU7te22.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
_vpU7te22.BorderSizePixel = 0
_vpU7te22.Active = true
_vpU7te22.Draggable = true
_vpU7te22.Parent = _vQVoT921
Instance.new(_sNHJB15, _vpU7te22).CornerRadius = UDim.new(0, 12)
local _vnaxNT23 = Instance.new(_sqNoQ16)
_vnaxNT23.Size = UDim2.new(1, 0, 0, 40)
_vnaxNT23.BackgroundColor3 = Color3.fromRGB(75, 35, 180)
_vnaxNT23.BorderSizePixel = 0
_vnaxNT23.Text = _she1w17
_vnaxNT23.TextColor3 = Color3.fromRGB(255, 255, 255)
_vnaxNT23.Font = Enum.Font.GothamBold
_vnaxNT23.TextSize = 16
_vnaxNT23.Parent = _vpU7te22
Instance.new(_smNK218, _vnaxNT23).CornerRadius = UDim.new(0, 12)
local _vBURIK24 = Instance.new(_skde719)
_vBURIK24.Size = UDim2.new(0, 30, 0, 30)
_vBURIK24.Position = UDim2.new(1, -38, 0, 5)
_vBURIK24.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
_vBURIK24.TextColor3 = Color3.fromRGB(255, 255, 255)
_vBURIK24.Text = _sXCtZ20
_vBURIK24.Font = Enum.Font.GothamBold
_vBURIK24.TextSize = 18
_vBURIK24.Parent = _vpU7te22
Instance.new(_sftLQ21, _vBURIK24).CornerRadius = UDim.new(0, 8)
local _vZNU5U25 = Instance.new(_sjwY122)
_vZNU5U25.Size = UDim2.new(1, -20, 0, 32)
_vZNU5U25.Position = UDim2.new(0, 10, 0, 48)
_vZNU5U25.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
_vZNU5U25.TextColor3 = Color3.fromRGB(200, 200, 255)
_vZNU5U25.Text = _sCryO23
_vZNU5U25.Font = Enum.Font.Gotham
_vZNU5U25.TextSize = 12
_vZNU5U25.Parent = _vpU7te22
Instance.new(_sB6We24, _vZNU5U25).CornerRadius = UDim.new(0, 8)
local _vhx1dE26 = Instance.new(_sQ99l25)
_vhx1dE26.Size = UDim2.new(1, -20, 0, 6)
_vhx1dE26.Position = UDim2.new(0, 10, 0, 88)
_vhx1dE26.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
_vhx1dE26.BorderSizePixel = 0
_vhx1dE26.Parent = _vpU7te22
Instance.new(_sQiJE26, _vhx1dE26).CornerRadius = UDim.new(1, 0)
local _vVY9nG27 = Instance.new(_s7yb027)
_vVY9nG27.Size = UDim2.new(0, 0, 1, 0)
_vVY9nG27.BackgroundColor3 = Color3.fromRGB(120, 80, 255)
_vVY9nG27.BorderSizePixel = 0
_vVY9nG27.Parent = _vhx1dE26
Instance.new(_s7qgZ28, _vVY9nG27).CornerRadius = UDim.new(1, 0)
local _vNOuKC28 = Instance.new(_sJPcu29)
_vNOuKC28.Size = UDim2.new(1, -20, 0, 44)
_vNOuKC28.Position = UDim2.new(0, 10, 0, 102)
_vNOuKC28.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
_vNOuKC28.TextColor3 = Color3.fromRGB(255, 255, 255)
_vNOuKC28.Text = _sGo2Z30
_vNOuKC28.Font = Enum.Font.GothamBold
_vNOuKC28.TextSize = 16
_vNOuKC28.Parent = _vpU7te22
Instance.new(_sx7MN31, _vNOuKC28).CornerRadius = UDim.new(0, 10)
local function _vwy8Bx57(yPos)
    local _vLlFSz29 = Instance.new(_srGRW32)
    _vLlFSz29.Size = UDim2.new(1, -20, 0, 1)
    _vLlFSz29.Position = UDim2.new(0, 10, 0, yPos)
    _vLlFSz29.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    _vLlFSz29.BorderSizePixel = 0
    _vLlFSz29.Parent = _vpU7te22
end
_vwy8Bx57(156)
local _veFPO130 = Instance.new(_sBqHU33)
_veFPO130.Size = UDim2.new(0.5, -10, 0, 22)
_veFPO130.Position = UDim2.new(0, 10, 0, 164)
_veFPO130.BackgroundTransparency = 1
_veFPO130.TextColor3 = Color3.fromRGB(200, 200, 255)
_veFPO130.Text = _sPLuW34
_veFPO130.Font = Enum.Font.GothamBold
_veFPO130.TextSize = 13
_veFPO130.TextXAlignment = Enum.TextXAlignment.Left
_veFPO130.Parent = _vpU7te22
local _vpc6PV31 = Instance.new(_smn5i35)
_vpc6PV31.Size = UDim2.new(0, 35, 0, 30)
_vpc6PV31.Position = UDim2.new(0, 10, 0, 190)
_vpc6PV31.BackgroundColor3 = Color3.fromRGB(40, 40, 65)
_vpc6PV31.TextColor3 = Color3.fromRGB(255, 255, 255)
_vpc6PV31.Text = _stskP36
_vpc6PV31.Font = Enum.Font.GothamBold
_vpc6PV31.TextSize = 18
_vpc6PV31.Parent = _vpU7te22
Instance.new(_sWTWm37, _vpc6PV31).CornerRadius = UDim.new(0, 8)
local _vQBWbT32 = Instance.new(_s9Vbu38)
_vQBWbT32.Size = UDim2.new(0, 35, 0, 30)
_vQBWbT32.Position = UDim2.new(0, 220, 0, 190)
_vQBWbT32.BackgroundColor3 = Color3.fromRGB(40, 40, 65)
_vQBWbT32.TextColor3 = Color3.fromRGB(255, 255, 255)
_vQBWbT32.Text = _s2NN339
_vQBWbT32.Font = Enum.Font.GothamBold
_vQBWbT32.TextSize = 18
_vQBWbT32.Parent = _vpU7te22
Instance.new(_sEdkW40, _vQBWbT32).CornerRadius = UDim.new(0, 8)
local _voir4a33 = Instance.new(_s4O1s41)
_voir4a33.Size = UDim2.new(0, 140, 0, 30)
_voir4a33.Position = UDim2.new(0, 70, 0, 190)
_voir4a33.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
_voir4a33.TextColor3 = Color3.fromRGB(255, 255, 255)
_voir4a33.Text = _snmiG42
_voir4a33.Font = Enum.Font.GothamBold
_voir4a33.TextSize = 14
_voir4a33.Parent = _vpU7te22
Instance.new(_s1ziT43, _voir4a33).CornerRadius = UDim.new(0, 8)
_vwy8Bx57(230)
local _vn9YsT34 = Instance.new(_sqIW244)
_vn9YsT34.Size = UDim2.new(1, -20, 0, 36)
_vn9YsT34.Position = UDim2.new(0, 10, 0, 238)
_vn9YsT34.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
_vn9YsT34.TextColor3 = Color3.fromRGB(200, 200, 255)
_vn9YsT34.Text = _sRjAG45
_vn9YsT34.Font = Enum.Font.GothamBold
_vn9YsT34.TextSize = 14
_vn9YsT34.Parent = _vpU7te22
Instance.new(_sMrAS46, _vn9YsT34).CornerRadius = UDim.new(0, 10)
local _viDBMg35 = Instance.new(_sjVfu47)
_viDBMg35.Size = UDim2.new(1, -20, 0, 36)
_viDBMg35.Position = UDim2.new(0, 10, 0, 282)
_viDBMg35.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
_viDBMg35.TextColor3 = Color3.fromRGB(200, 200, 255)
_viDBMg35.Text = _s0y8c48
_viDBMg35.Font = Enum.Font.GothamBold
_viDBMg35.TextSize = 14
_viDBMg35.Parent = _vpU7te22
Instance.new(_ssUDQ49, _viDBMg35).CornerRadius = UDim.new(0, 10)
local _vVS3TF36 = Instance.new(_syGQl50)
_vVS3TF36.Size = UDim2.new(1, -20, 0, 28)
_vVS3TF36.Position = UDim2.new(0, 10, 0, 330)
_vVS3TF36.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
_vVS3TF36.TextColor3 = Color3.fromRGB(150, 255, 180)
_vVS3TF36.Text = _sVRyO51
_vVS3TF36.Font = Enum.Font.Gotham
_vVS3TF36.TextSize = 11
_vVS3TF36.Parent = _vpU7te22
Instance.new(_sSSNr52, _vVS3TF36).CornerRadius = UDim.new(0, 8)
local _vBtk9H37 = Instance.new(_s8Drv53)
_vBtk9H37.Size = UDim2.new(1, -20, 0, 28)
_vBtk9H37.Position = UDim2.new(0, 10, 0, 366)
_vBtk9H37.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
_vBtk9H37.TextColor3 = Color3.fromRGB(150, 255, 180)
_vBtk9H37.Text = _shYw654
_vBtk9H37.Font = Enum.Font.Gotham
_vBtk9H37.TextSize = 11
_vBtk9H37.Parent = _vpU7te22
Instance.new(_snyrj55, _vBtk9H37).CornerRadius = UDim.new(0, 8)
local function _vnbRxq58()
    local _vuSytW19 = _vTcL8N55()
    local _vXeXBg38 = #_vuSytW19
    local _veTZUd39 = 0
    for _, eggData in ipairs(_vuSytW19) do
        if eggData._veTZUd39 then
            _veTZUd39 = _veTZUd39 + 1
        end
    end
    if _vXeXBg38 > 0 then
        _vZNU5U25.Text = string.format(_sXDef56, _veTZUd39, _vXeXBg38)
        _vVY9nG27.Size = UDim2.new(_veTZUd39 / _vXeXBg38, 0, 1, 0)
    else
        _vZNU5U25.Text = _splin57
        _vVY9nG27.Size = UDim2.new(0, 0, 1, 0)
    end
    return _vXeXBg38, _veTZUd39
end
_vy3H0V1.Heartbeat:Connect(function()
    if _vwPADr11 > 0.1 and _vtKnK97 and _vvEmmg4 then
        _vBtk9H37.Text = _sCUQx58 .. string.format(_sgMVZ59, math.max(0, 0.3 - _vwPADr11)) .. _ssc1j60
        _vBtk9H37.BackgroundColor3 = Color3.fromRGB(80, 40, 10)
        _vBtk9H37.TextColor3 = Color3.fromRGB(255, 180, 80)
    else
        _vBtk9H37.Text = _sTp2b61
        _vBtk9H37.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        _vBtk9H37.TextColor3 = Color3.fromRGB(150, 255, 180)
    end
end)
local function _vpxs8p59(_vLlFSz29)
    _vQhzCS5 = _vLlFSz29
    _voir4a33.Text = tostring(_vLlFSz29)
    _veFPO130.Text = _sc99Z62 .. _vLlFSz29
end
local function _vPhHyC60()
    _v3aw9O9 = _vy3H0V1.Stepped:Connect(function()
        if _vcaPfa3.Character then
            for _, p in ipairs(_vcaPfa3.Character:GetDescendants()) do
                if p:IsA(_s8Oo963) then p.CanCollide = false end
            end
        end
    end)
end
local function _vnJ3YQ61()
    if _v3aw9O9 then
        _v3aw9O9:Disconnect()
        _v3aw9O9 = nil
    end
    if _vcaPfa3.Character then
        for _, p in ipairs(_vcaPfa3.Character:GetDescendants()) do
            if p:IsA(_sG6JS64) then p.CanCollide = true end
        end
    end
end
local function _vZRXvR62(targetPart)
    if not targetPart or not _vcaPfa3.Character then return end
    local _vGjvKW13 = _vcaPfa3.Character:FindFirstChild(_s7cdK65)
    if not _vGjvKW13 then return end
    workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
    _vmYRwL12 = _vGjvKW13.Position
    local _vdM6OD40 = targetPart.Position + Vector3.new(0, 2, 0)
    local _vVwWN341 = (_vGjvKW13.Position - _vdM6OD40).Magnitude
    local _vnyCOE42 = math.max(_vQhzCS5, 20)
    local _vn7iFR43 = math.clamp(_vVwWN341 / _vnyCOE42, 0.3, 8)
    local _vAYYfZ44 = Instance.new(_sm4IS66)
    _vAYYfZ44.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    _vAYYfZ44.P = 1e4
    _vAYYfZ44.Velocity = Vector3.new(0, 0, 0)
    _vAYYfZ44.Parent = _vGjvKW13
    local _vIdSds45 = 0
    while _vvEmmg4 and _vIdSds45 < _vn7iFR43 do
        task.wait(0.05)
        _vIdSds45 = _vIdSds45 + 0.05
        if not _vGjvKW13 or not _vGjvKW13.Parent then break end
        local _vLIzoA46 = _vdM6OD40 - _vGjvKW13.Position
        local _v8ib8I47 = _vLIzoA46.Magnitude
        if _v8ib8I47 < 2.5 then break end
        local _vVbppF48 = _vnyCOE42 * math.clamp(_v8ib8I47 / 10, 0.3, 1)
        _vAYYfZ44.Velocity = _vLIzoA46.Unit * _vVbppF48
    end
    _vAYYfZ44:Destroy()
    if _vvEmmg4 then
        if (_vGjvKW13.Position - targetPart.Position).Magnitude > 4 then
            local _vGBMSi49 = Instance.new(_s0GBc67)
            _vGBMSi49.Position = targetPart.Position + Vector3.new(0, 2, 0)
            _vGBMSi49.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            _vGBMSi49.P = 5000
            _vGBMSi49.D = 500
            _vGBMSi49.Parent = _vGjvKW13
            task.wait(0.5)
            _vGBMSi49:Destroy()
        end
    end
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    task.wait(0.2)
end
local function _vHiJ8d63()
    _vvEmmg4 = true
    _vNOuKC28.Text = _sWlnR68
    _vNOuKC28.BackgroundColor3 = Color3.fromRGB(200, 55, 55)
    _vD8zOe52(true)
    _vVS3TF36.Text = _sqBCE69
    _vVS3TF36.BackgroundColor3 = Color3.fromRGB(40, 25, 40)
    _vVS3TF36.TextColor3 = Color3.fromRGB(255, 200, 100)
    local _veKYL750 = _vemzxD56()
    if #_veKYL750 == 0 then
        local _, _vXeXBg38 = _vnbRxq58()
        _vZNU5U25.Text = string.format(_sotXD70, _vXeXBg38)
        _vVY9nG27.Size = UDim2.new(1, 0, 1, 0)
        _vvEmmg4 = false
        _vNOuKC28.Text = _sCDm071
        _vNOuKC28.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        _vD8zOe52(false)
        _vVS3TF36.Text = _sxBXm72
        _vVS3TF36.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        _vVS3TF36.TextColor3 = Color3.fromRGB(150, 255, 180)
        return
    end
    for i, _vkh7LP18 in ipairs(_veKYL750) do
        if not _vvEmmg4 then break end
        local _, _vXeXBg38, _veTZUd39 = _vnbRxq58()
        _vZNU5U25.Text = string.format(_sSRrL73, i, #_veKYL750)
        _vZRXvR62(_vkh7LP18)
        _vnbRxq58()
    end
    _vD8zOe52(false)
    _vVS3TF36.Text = _skDHO74
    _vVS3TF36.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    _vVS3TF36.TextColor3 = Color3.fromRGB(150, 255, 180)
    _vvEmmg4 = false
    _vNOuKC28.Text = _soCxs75
    _vNOuKC28.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
    local _, _vXeXBg38, _veTZUd39 = _vnbRxq58()
    _vZNU5U25.Text = string.format(_sNrvW76, _veTZUd39, _vXeXBg38)
end
local function _vxv5Xo64()
    _vvEmmg4 = false
    _vD8zOe52(false)
    _vVS3TF36.Text = _sZa8Q77
    _vVS3TF36.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    _vVS3TF36.TextColor3 = Color3.fromRGB(150, 255, 180)
    if _vcaPfa3.Character then
        local _v6mBXX51 = _vcaPfa3.Character:FindFirstChild(_sbWDy78)
        local _vGjvKW13 = _vcaPfa3.Character:FindFirstChild(_sVC6Q79)
        if _v6mBXX51 and _vGjvKW13 then _v6mBXX51:MoveTo(_vGjvKW13.Position) end
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
    _vNOuKC28.Text = _syrff80
    _vNOuKC28.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
    local _, _vXeXBg38, _veTZUd39 = _vnbRxq58()
    _vZNU5U25.Text = string.format(_srUAb81, _veTZUd39, _vXeXBg38)
end
_vNOuKC28.MouseButton1Click:Connect(function()
    if _vvEmmg4 then 
        _vxv5Xo64() 
    else 
        _vnbRxq58()
        task.spawn(_vHiJ8d63) 
    end
end)
_vpc6PV31.MouseButton1Click:Connect(function()
    _vpxs8p59(math.max(8, _vQhzCS5 - 4))
end)
_vQBWbT32.MouseButton1Click:Connect(function()
    _vpxs8p59(math.min(100, _vQhzCS5 + 4))
end)
_vn9YsT34.MouseButton1Click:Connect(function()
    _vcMrMO6 = not _vcMrMO6
    if _vcMrMO6 then
        _vPhHyC60()
        _vn9YsT34.Text = _shZiD82
        _vn9YsT34.BackgroundColor3 = Color3.fromRGB(90, 50, 200)
    else
        _vnJ3YQ61()
        _vn9YsT34.Text = _sTok483
        _vn9YsT34.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    end
end)
_viDBMg35.MouseButton1Click:Connect(function()
    _vtKnK97 = not _vtKnK97
    _vwPADr11 = 0
    if _vtKnK97 then
        _vmYRwL12 = _vcaPfa3.Character and
            _vcaPfa3.Character:FindFirstChild(_s6dzs84) and
            _vcaPfa3.Character.HumanoidRootPart.Position or Vector3.new(0,0,0)
        _viDBMg35.Text = _sKof285
        _viDBMg35.BackgroundColor3 = Color3.fromRGB(90, 50, 200)
    else
        _viDBMg35.Text = _sWBxw86
        _viDBMg35.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    end
end)
_vBURIK24.MouseButton1Click:Connect(function()
    _vHCJW38 = not _vHCJW38
    _vpU7te22.Size = _vHCJW38
        and UDim2.new(0, 280, 0, 40)
        or UDim2.new(0, 280, 0, 420)
    _vBURIK24.Text = _vHCJW38 and _sPtZH87 or _sFKrB88
end)
_vnbRxq58()
