-- Protected by CodeBlox Studio
-- Game: BrookhavenRP
-- Date: 27/03/2026 22:06:13

if not game or not game.GetService then error("Invalid environment") end

-- Strings
local _scbuw0 = "_v0u4iY0"
local _sOYux1 = "_vZbux51"
local _s9ElE2 = "_vz1fXe2"
local _sGbaP3 = "EggHunt_Easy"
local _sH5gv4 = "EggHunt_Medium"
local _sRYwo5 = "EggHunt_Hard"
local _sU5Ox6 = "EggHunt_Eggstreme"
local _suAuq7 = "HumanoidRootPart"
local _sDbw98 = "Humanoid"
local _sSACr9 = "Humanoid"
local _sFirN10 = "BasePart"
local _s6VJE11 = "BasePart"
local _skFxi12 = "ScreenGui"
local _snH0J13 = "AutoFarmGui"
local _sAcz014 = "Frame"
local _sQv4h15 = "UICorner"
local _sHwN216 = "TextLabel"
local _s4iAl17 = "EGG AUTO FARM"
local _smX9m18 = "UICorner"
local _sqK2F19 = "TextButton"
local _svriJ20 = "-"
local _sPm8x21 = "UICorner"
local _s2rG222 = "TextLabel"
local _sCSOr23 = "Waiting..."
local _sjzPv24 = "UICorner"
local _sl22Z25 = "Frame"
local _sg8mq26 = "UICorner"
local _sN1Kt27 = "Frame"
local _slr4N28 = "UICorner"
local _sL9ub29 = "TextButton"
local _slPLn30 = "START"
local _s7bsV31 = "UICorner"
local _sZzma32 = "Frame"
local _sSbWA33 = "TextLabel"
local _sspUe34 = "Speed: 100"
local _sXMoC35 = "TextButton"
local _sPRRm36 = "-"
local _s2w1437 = "UICorner"
local _sv9ry38 = "TextButton"
local _s7n3939 = "+"
local _svUyO40 = "UICorner"
local _sZ1bc41 = "TextLabel"
local _soIOy42 = "100"
local _s3RgR43 = "UICorner"
local _sAAHP44 = "TextButton"
local _sbMTI45 = "Noclip: OFF"
local _sqR4L46 = "UICorner"
local _sKI5j47 = "TextButton"
local _syBZ748 = "Auto Jump: OFF"
local _sE0wK49 = "UICorner"
local _st87f50 = "TextLabel"
local _s7TWc51 = "Mode: Standing"
local _sgJul52 = "UICorner"
local _sFVOC53 = "TextLabel"
local _smjUO54 = "Status: Free"
local _smV6j55 = "UICorner"
local _sRx9D56 = "%d/%d _vOoFxI16"
local _sf41G57 = "No _vOoFxI16 found"
local _sx38p58 = "Status: Stuck - jumping in "
local _sXryb59 = "%.1f"
local _s72de60 = "_vCDiZt29"
local _sAVAF61 = "Status: Free"
local _stzwl62 = "Speed: "
local _sOijK63 = "BasePart"
local _smkDv64 = "BasePart"
local _sMgTk65 = "HumanoidRootPart"
local _sSEt666 = "BodyVelocity"
local _skhto67 = "BodyPosition"
local _sTNfk68 = "STOP"
local _sIGyL69 = "Mode: Sitting"
local _sPQO570 = "Complete! %d _vOoFxI16"
local _sg7dM71 = "START"
local _sgXB572 = "Mode: Standing"
local _sAIBp73 = "Farming %d/%d _vOoFxI16"
local _sNjBE74 = "Mode: Standing"
local _sBnQ475 = "START"
local _sFA3v76 = "Done! %d/%d _vOoFxI16"
local _sFd0d77 = "Mode: Standing"
local _sntBR78 = "Humanoid"
local _syS2m79 = "HumanoidRootPart"
local _sKi9d80 = "START"
local _s90UU81 = "Stopped - %d/%d _vOoFxI16"
local _saMln82 = "Noclip: ON"
local _sympr83 = "Noclip: OFF"
local _siAyU84 = "HumanoidRootPart"
local _s7P8o85 = "Auto Jump: ON"
local _s4WzL86 = "Auto Jump: OFF"
local _s9SgK87 = "+"
local _sfqyu88 = "-"
-- Main
local _v0u4iY0 = game:GetService(_scbuw0)
local _vZbux51 = game:GetService(_sOYux1)
local _vz1fXe2 = game:GetService(_s9ElE2)
local _v2BF1l3 = _v0u4iY0.LocalPlayer
local _vy4KOg4 = false
local _vquErb5 = 100
local _voAAjv6 = false
local _vHhlDs7 = false
local _vS8WjU8 = false
local _vQanOn9 = nil
local _vfRRHv10 = {
    _sGbaP3,
    _sH5gv4,
    _sRYwo5,
    _sU5Ox6
}
local _vGZUF411 = 0
local _vG7MET12 = Vector3.new(0, 0, 0)
_vZbux51.Heartbeat:Connect(function(dt)
    local _c1uwWM=not _vHhlDs7 if _c1uwWM then return end
    local _cOnd8r=not _vy4KOg4 if _cOnd8r then return end
    local _cjnUP5=not _v2BF1l3.Character if _cjnUP5 then return end
    local _v38yIi13 = _v2BF1l3.Character:FindFirstChild(_suAuq7)
    local _vdgoQz14 = _v2BF1l3.Character:FindFirstChild(_sDbw98)
    local _cpw941=not _v38yIi13 or not _vdgoQz14 if _cpw941 then return end
    local _vt2yAw15 = (_v38yIi13.Position - _vG7MET12).Magnitude
    local _cT8cU3=_vt2yAw15 < 0.3 if _cT8cU3 then
        _vGZUF411 = _vGZUF411 + dt
        local _cCRFyB=_vGZUF411 >= 0.3 if _cCRFyB then
            _vdgoQz14.Jump = true
            _vGZUF411 = 0
        end
    else
        _vGZUF411 = 0
        _vG7MET12 = _v38yIi13.Position
    end
end)
local function _vY1AiM52(sit)
    local _cQC5f1=not _v2BF1l3.Character if _cQC5f1 then return end
    local _vdgoQz14 = _v2BF1l3.Character:FindFirstChild(_sSACr9)
    local _cPIzZW=not _vdgoQz14 if _cPIzZW then return end
    local _cPCqeT=sit if _cPCqeT then
        _vdgoQz14.Sit = true
        _vdgoQz14.AutoRotate = false
    else
        _vdgoQz14.Sit = false
        _vdgoQz14.AutoRotate = true
    end
end
local function _vSothn53(egg)
    local _cKMYPF=egg:IsA(_sFirN10) if _cKMYPF then return egg end
    return egg:FindFirstChildWhichIsA(_s6VJE11, true) or egg.PrimaryPart
end
local function _vOU1Zy54(egg)
    local _cK1zP5=not egg or not egg.Parent if _cK1zP5 then
        return true
    end
    return false
end
local function _vqxUho55()
    local _vOoFxI16 = {}
    for _, folderName in ipairs(_vfRRHv10) do
        local _vhrSbZ17 = workspace:FindFirstChild(folderName)
        local _ckopwN=_vhrSbZ17 if _ckopwN then
            for _, egg in ipairs(_vhrSbZ17:GetChildren()) do
                local _vuStfj18 = _vSothn53(egg)
                local _caJWPt=_vuStfj18 if _caJWPt then
                    table.insert(_vOoFxI16, {
                        egg = egg,
                        _vuStfj18 = _vuStfj18,
                        _v7dBVQ39 = _vOU1Zy54(egg)
                    })
                end
            end
        end
    end
    return _vOoFxI16
end
local function _vOXdpx56()
    local _voRaf319 = _vqxUho55()
    local _vZ2sjS20 = {}
    for _, eggData in ipairs(_voRaf319) do
        local _cYs0ok=not eggData._v7dBVQ39 if _cYs0ok then
            table.insert(_vZ2sjS20, eggData._vuStfj18)
        end
    end
    return _vZ2sjS20
end
local _v0c7Cg21 = Instance.new(_skFxi12)
_v0c7Cg21.Name = _snH0J13
_v0c7Cg21.ResetOnSpawn = false
_v0c7Cg21.Parent = _v2BF1l3.PlayerGui
local _vpVMo322 = Instance.new(_sAcz014)
_vpVMo322.Size = UDim2.new(0, 280, 0, 420)
_vpVMo322.Position = UDim2.new(0, 10, 0.2, 0)
_vpVMo322.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
_vpVMo322.BorderSizePixel = 0
_vpVMo322.Active = true
_vpVMo322.Draggable = true
_vpVMo322.Parent = _v0c7Cg21
Instance.new(_sQv4h15, _vpVMo322).CornerRadius = UDim.new(0, 12)
local _vcRVWF23 = Instance.new(_sHwN216)
_vcRVWF23.Size = UDim2.new(1, 0, 0, 40)
_vcRVWF23.BackgroundColor3 = Color3.fromRGB(75, 35, 180)
_vcRVWF23.BorderSizePixel = 0
_vcRVWF23.Text = _s4iAl17
_vcRVWF23.TextColor3 = Color3.fromRGB(255, 255, 255)
_vcRVWF23.Font = Enum.Font.GothamBold
_vcRVWF23.TextSize = 16
_vcRVWF23.Parent = _vpVMo322
Instance.new(_smX9m18, _vcRVWF23).CornerRadius = UDim.new(0, 12)
local _vgsyeb24 = Instance.new(_sqK2F19)
_vgsyeb24.Size = UDim2.new(0, 30, 0, 30)
_vgsyeb24.Position = UDim2.new(1, -38, 0, 5)
_vgsyeb24.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
_vgsyeb24.TextColor3 = Color3.fromRGB(255, 255, 255)
_vgsyeb24.Text = _svriJ20
_vgsyeb24.Font = Enum.Font.GothamBold
_vgsyeb24.TextSize = 18
_vgsyeb24.Parent = _vpVMo322
Instance.new(_sPm8x21, _vgsyeb24).CornerRadius = UDim.new(0, 8)
local _vjQtqT25 = Instance.new(_s2rG222)
_vjQtqT25.Size = UDim2.new(1, -20, 0, 32)
_vjQtqT25.Position = UDim2.new(0, 10, 0, 48)
_vjQtqT25.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
_vjQtqT25.TextColor3 = Color3.fromRGB(200, 200, 255)
_vjQtqT25.Text = _sCSOr23
_vjQtqT25.Font = Enum.Font.Gotham
_vjQtqT25.TextSize = 12
_vjQtqT25.Parent = _vpVMo322
Instance.new(_sjzPv24, _vjQtqT25).CornerRadius = UDim.new(0, 8)
local _vvpxmw26 = Instance.new(_sl22Z25)
_vvpxmw26.Size = UDim2.new(1, -20, 0, 6)
_vvpxmw26.Position = UDim2.new(0, 10, 0, 88)
_vvpxmw26.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
_vvpxmw26.BorderSizePixel = 0
_vvpxmw26.Parent = _vpVMo322
Instance.new(_sg8mq26, _vvpxmw26).CornerRadius = UDim.new(1, 0)
local _v0AtsQ27 = Instance.new(_sN1Kt27)
_v0AtsQ27.Size = UDim2.new(0, 0, 1, 0)
_v0AtsQ27.BackgroundColor3 = Color3.fromRGB(120, 80, 255)
_v0AtsQ27.BorderSizePixel = 0
_v0AtsQ27.Parent = _vvpxmw26
Instance.new(_slr4N28, _v0AtsQ27).CornerRadius = UDim.new(1, 0)
local _vFb8xH28 = Instance.new(_sL9ub29)
_vFb8xH28.Size = UDim2.new(1, -20, 0, 44)
_vFb8xH28.Position = UDim2.new(0, 10, 0, 102)
_vFb8xH28.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
_vFb8xH28.TextColor3 = Color3.fromRGB(255, 255, 255)
_vFb8xH28.Text = _slPLn30
_vFb8xH28.Font = Enum.Font.GothamBold
_vFb8xH28.TextSize = 16
_vFb8xH28.Parent = _vpVMo322
Instance.new(_s7bsV31, _vFb8xH28).CornerRadius = UDim.new(0, 10)
local function _v39IPP57(yPos)
    local _vCDiZt29 = Instance.new(_sZzma32)
    _vCDiZt29.Size = UDim2.new(1, -20, 0, 1)
    _vCDiZt29.Position = UDim2.new(0, 10, 0, yPos)
    _vCDiZt29.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    _vCDiZt29.BorderSizePixel = 0
    _vCDiZt29.Parent = _vpVMo322
end
_v39IPP57(156)
local _vMYe0a30 = Instance.new(_sSbWA33)
_vMYe0a30.Size = UDim2.new(0.5, -10, 0, 22)
_vMYe0a30.Position = UDim2.new(0, 10, 0, 164)
_vMYe0a30.BackgroundTransparency = 1
_vMYe0a30.TextColor3 = Color3.fromRGB(200, 200, 255)
_vMYe0a30.Text = _sspUe34
_vMYe0a30.Font = Enum.Font.GothamBold
_vMYe0a30.TextSize = 13
_vMYe0a30.TextXAlignment = Enum.TextXAlignment.Left
_vMYe0a30.Parent = _vpVMo322
local _vTmhbk31 = Instance.new(_sXMoC35)
_vTmhbk31.Size = UDim2.new(0, 35, 0, 30)
_vTmhbk31.Position = UDim2.new(0, 10, 0, 190)
_vTmhbk31.BackgroundColor3 = Color3.fromRGB(40, 40, 65)
_vTmhbk31.TextColor3 = Color3.fromRGB(255, 255, 255)
_vTmhbk31.Text = _sPRRm36
_vTmhbk31.Font = Enum.Font.GothamBold
_vTmhbk31.TextSize = 18
_vTmhbk31.Parent = _vpVMo322
Instance.new(_s2w1437, _vTmhbk31).CornerRadius = UDim.new(0, 8)
local _vlnxvl32 = Instance.new(_sv9ry38)
_vlnxvl32.Size = UDim2.new(0, 35, 0, 30)
_vlnxvl32.Position = UDim2.new(0, 220, 0, 190)
_vlnxvl32.BackgroundColor3 = Color3.fromRGB(40, 40, 65)
_vlnxvl32.TextColor3 = Color3.fromRGB(255, 255, 255)
_vlnxvl32.Text = _s7n3939
_vlnxvl32.Font = Enum.Font.GothamBold
_vlnxvl32.TextSize = 18
_vlnxvl32.Parent = _vpVMo322
Instance.new(_svUyO40, _vlnxvl32).CornerRadius = UDim.new(0, 8)
local _v78PIg33 = Instance.new(_sZ1bc41)
_v78PIg33.Size = UDim2.new(0, 140, 0, 30)
_v78PIg33.Position = UDim2.new(0, 70, 0, 190)
_v78PIg33.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
_v78PIg33.TextColor3 = Color3.fromRGB(255, 255, 255)
_v78PIg33.Text = _soIOy42
_v78PIg33.Font = Enum.Font.GothamBold
_v78PIg33.TextSize = 14
_v78PIg33.Parent = _vpVMo322
Instance.new(_s3RgR43, _v78PIg33).CornerRadius = UDim.new(0, 8)
_v39IPP57(230)
local _vAkQzR34 = Instance.new(_sAAHP44)
_vAkQzR34.Size = UDim2.new(1, -20, 0, 36)
_vAkQzR34.Position = UDim2.new(0, 10, 0, 238)
_vAkQzR34.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
_vAkQzR34.TextColor3 = Color3.fromRGB(200, 200, 255)
_vAkQzR34.Text = _sbMTI45
_vAkQzR34.Font = Enum.Font.GothamBold
_vAkQzR34.TextSize = 14
_vAkQzR34.Parent = _vpVMo322
Instance.new(_sqR4L46, _vAkQzR34).CornerRadius = UDim.new(0, 10)
local _vPxC7f35 = Instance.new(_sKI5j47)
_vPxC7f35.Size = UDim2.new(1, -20, 0, 36)
_vPxC7f35.Position = UDim2.new(0, 10, 0, 282)
_vPxC7f35.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
_vPxC7f35.TextColor3 = Color3.fromRGB(200, 200, 255)
_vPxC7f35.Text = _syBZ748
_vPxC7f35.Font = Enum.Font.GothamBold
_vPxC7f35.TextSize = 14
_vPxC7f35.Parent = _vpVMo322
Instance.new(_sE0wK49, _vPxC7f35).CornerRadius = UDim.new(0, 10)
local _vY046L36 = Instance.new(_st87f50)
_vY046L36.Size = UDim2.new(1, -20, 0, 28)
_vY046L36.Position = UDim2.new(0, 10, 0, 330)
_vY046L36.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
_vY046L36.TextColor3 = Color3.fromRGB(150, 255, 180)
_vY046L36.Text = _s7TWc51
_vY046L36.Font = Enum.Font.Gotham
_vY046L36.TextSize = 11
_vY046L36.Parent = _vpVMo322
Instance.new(_sgJul52, _vY046L36).CornerRadius = UDim.new(0, 8)
local _vKSHkM37 = Instance.new(_sFVOC53)
_vKSHkM37.Size = UDim2.new(1, -20, 0, 28)
_vKSHkM37.Position = UDim2.new(0, 10, 0, 366)
_vKSHkM37.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
_vKSHkM37.TextColor3 = Color3.fromRGB(150, 255, 180)
_vKSHkM37.Text = _smjUO54
_vKSHkM37.Font = Enum.Font.Gotham
_vKSHkM37.TextSize = 11
_vKSHkM37.Parent = _vpVMo322
Instance.new(_smV6j55, _vKSHkM37).CornerRadius = UDim.new(0, 8)
local function _vBmdrz58()
    local _voRaf319 = _vqxUho55()
    local _vbTYNl38 = #_voRaf319
    local _v7dBVQ39 = 0
    for _, eggData in ipairs(_voRaf319) do
        local _cH8pI6=eggData._v7dBVQ39 if _cH8pI6 then
            _v7dBVQ39 = _v7dBVQ39 + 1
        end
    end
    local _c1bue8=_vbTYNl38 > 0 if _c1bue8 then
        _vjQtqT25.Text = string.format(_sRx9D56, _v7dBVQ39, _vbTYNl38)
        _v0AtsQ27.Size = UDim2.new(_v7dBVQ39 / _vbTYNl38, 0, 1, 0)
    else
        _vjQtqT25.Text = _sf41G57
        _v0AtsQ27.Size = UDim2.new(0, 0, 1, 0)
    end
    return _vbTYNl38, _v7dBVQ39
end
_vZbux51.Heartbeat:Connect(function()
    local _c53Bnx=_vGZUF411 > 0.1 and _vHhlDs7 and _vy4KOg4 if _c53Bnx then
        _vKSHkM37.Text = _sx38p58 .. string.format(_sXryb59, math.max(0, 0.3 - _vGZUF411)) .. _s72de60
        _vKSHkM37.BackgroundColor3 = Color3.fromRGB(80, 40, 10)
        _vKSHkM37.TextColor3 = Color3.fromRGB(255, 180, 80)
    else
        _vKSHkM37.Text = _sAVAF61
        _vKSHkM37.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        _vKSHkM37.TextColor3 = Color3.fromRGB(150, 255, 180)
    end
end)
local function _vr1i5159(_vCDiZt29)
    _vquErb5 = _vCDiZt29
    _v78PIg33.Text = tostring(_vCDiZt29)
    _vMYe0a30.Text = _stzwl62 .. _vCDiZt29
end
local function _vvX5mX60()
    _vQanOn9 = _vZbux51.Stepped:Connect(function()
        local _cmjBrk=_v2BF1l3.Character if _cmjBrk then
            for _, p in ipairs(_v2BF1l3.Character:GetDescendants()) do
                local _clbWPV=p:IsA(_sOijK63) if _clbWPV then p.CanCollide = false end
            end
        end
    end)
end
local function _vHYgOd61()
    local _cMVwNV=_vQanOn9 if _cMVwNV then
        _vQanOn9:Disconnect()
        _vQanOn9 = nil
    end
    local _cHzl6Z=_v2BF1l3.Character if _cHzl6Z then
        for _, p in ipairs(_v2BF1l3.Character:GetDescendants()) do
            local _cwnaTv=p:IsA(_smkDv64) if _cwnaTv then p.CanCollide = true end
        end
    end
end
local function _vRrKVy62(targetPart)
    local _cLbCnn=not targetPart or not _v2BF1l3.Character if _cLbCnn then return end
    local _v38yIi13 = _v2BF1l3.Character:FindFirstChild(_sMgTk65)
    local _cuSIRy=not _v38yIi13 if _cuSIRy then return end
    workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
    _vG7MET12 = _v38yIi13.Position
    local _vAG1mG40 = targetPart.Position + Vector3.new(0, 2, 0)
    local _vqjas241 = (_v38yIi13.Position - _vAG1mG40).Magnitude
    local _vzKBdk42 = math.max(_vquErb5, 20)
    local _v6SuMe43 = math.clamp(_vqjas241 / _vzKBdk42, 0.3, 8)
    local _vi5rPg44 = Instance.new(_sSEt666)
    _vi5rPg44.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    _vi5rPg44.P = 1e4
    _vi5rPg44.Velocity = Vector3.new(0, 0, 0)
    _vi5rPg44.Parent = _v38yIi13
    local _vnmJAv45 = 0
    while _vy4KOg4 and _vnmJAv45 < _v6SuMe43 do
        task.wait(0.05)
        _vnmJAv45 = _vnmJAv45 + 0.05
        local _cyU6MC=not _v38yIi13 or not _v38yIi13.Parent if _cyU6MC then break end
        local _vYx37946 = _vAG1mG40 - _v38yIi13.Position
        local _vVSInz47 = _vYx37946.Magnitude
        local _chNoFB=_vVSInz47 < 2.5 if _chNoFB then break end
        local _v6dMje48 = _vzKBdk42 * math.clamp(_vVSInz47 / 10, 0.3, 1)
        _vi5rPg44.Velocity = _vYx37946.Unit * _v6dMje48
    end
    _vi5rPg44:Destroy()
    local _coWi51=_vy4KOg4 if _coWi51 then
        local _calhah=(_v38yIi13.Position - targetPart.Position).Magnitude > 4 if _calhah then
            local _vbjnVY49 = Instance.new(_skhto67)
            _vbjnVY49.Position = targetPart.Position + Vector3.new(0, 2, 0)
            _vbjnVY49.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            _vbjnVY49.P = 5000
            _vbjnVY49.D = 500
            _vbjnVY49.Parent = _v38yIi13
            task.wait(0.5)
            _vbjnVY49:Destroy()
        end
    end
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    task.wait(0.2)
end
local function _vxX7gH63()
    _vy4KOg4 = true
    _vFb8xH28.Text = _sTNfk68
    _vFb8xH28.BackgroundColor3 = Color3.fromRGB(200, 55, 55)
    _vY1AiM52(true)
    _vY046L36.Text = _sIGyL69
    _vY046L36.BackgroundColor3 = Color3.fromRGB(40, 25, 40)
    _vY046L36.TextColor3 = Color3.fromRGB(255, 200, 100)
    local _vpO2ey50 = _vOXdpx56()
    local _ckOG3o=#_vpO2ey50 == 0 if _ckOG3o then
        local _, _vbTYNl38 = _vBmdrz58()
        _vjQtqT25.Text = string.format(_sPQO570, _vbTYNl38)
        _v0AtsQ27.Size = UDim2.new(1, 0, 1, 0)
        _vy4KOg4 = false
        _vFb8xH28.Text = _sg7dM71
        _vFb8xH28.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        _vY1AiM52(false)
        _vY046L36.Text = _sgXB572
        _vY046L36.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        _vY046L36.TextColor3 = Color3.fromRGB(150, 255, 180)
        return
    end
    for i, _vuStfj18 in ipairs(_vpO2ey50) do
        local _cMR3Y5=not _vy4KOg4 if _cMR3Y5 then break end
        local _, _vbTYNl38, _v7dBVQ39 = _vBmdrz58()
        _vjQtqT25.Text = string.format(_sAIBp73, i, #_vpO2ey50)
        _vRrKVy62(_vuStfj18)
        _vBmdrz58()
    end
    _vY1AiM52(false)
    _vY046L36.Text = _sNjBE74
    _vY046L36.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    _vY046L36.TextColor3 = Color3.fromRGB(150, 255, 180)
    _vy4KOg4 = false
    _vFb8xH28.Text = _sBnQ475
    _vFb8xH28.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
    local _, _vbTYNl38, _v7dBVQ39 = _vBmdrz58()
    _vjQtqT25.Text = string.format(_sFA3v76, _v7dBVQ39, _vbTYNl38)
end
local function _vM95aO64()
    _vy4KOg4 = false
    _vY1AiM52(false)
    _vY046L36.Text = _sFd0d77
    _vY046L36.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    _vY046L36.TextColor3 = Color3.fromRGB(150, 255, 180)
    local _clXGZR=_v2BF1l3.Character if _clXGZR then
        local _v9LBIv51 = _v2BF1l3.Character:FindFirstChild(_sntBR78)
        local _v38yIi13 = _v2BF1l3.Character:FindFirstChild(_syS2m79)
        local _cHCCWl=_v9LBIv51 and _v38yIi13 if _cHCCWl then _v9LBIv51:MoveTo(_v38yIi13.Position) end
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
    _vFb8xH28.Text = _sKi9d80
    _vFb8xH28.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
    local _, _vbTYNl38, _v7dBVQ39 = _vBmdrz58()
    _vjQtqT25.Text = string.format(_s90UU81, _v7dBVQ39, _vbTYNl38)
end
_vFb8xH28.MouseButton1Click:Connect(function()
    local _ck0cD6=_vy4KOg4 if _ck0cD6 then 
        _vM95aO64() 
    else 
        _vBmdrz58()
        task.spawn(_vxX7gH63) 
    end
end)
_vTmhbk31.MouseButton1Click:Connect(function()
    _vr1i5159(math.max(8, _vquErb5 - 4))
end)
_vlnxvl32.MouseButton1Click:Connect(function()
    _vr1i5159(math.min(100, _vquErb5 + 4))
end)
_vAkQzR34.MouseButton1Click:Connect(function()
    _voAAjv6 = not _voAAjv6
    local _cr6Pku=_voAAjv6 if _cr6Pku then
        _vvX5mX60()
        _vAkQzR34.Text = _saMln82
        _vAkQzR34.BackgroundColor3 = Color3.fromRGB(90, 50, 200)
    else
        _vHYgOd61()
        _vAkQzR34.Text = _sympr83
        _vAkQzR34.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    end
end)
_vPxC7f35.MouseButton1Click:Connect(function()
    _vHhlDs7 = not _vHhlDs7
    _vGZUF411 = 0
    local _cqIj2H=_vHhlDs7 if _cqIj2H then
        _vG7MET12 = _v2BF1l3.Character and
            _v2BF1l3.Character:FindFirstChild(_siAyU84) and
            _v2BF1l3.Character.HumanoidRootPart.Position or Vector3.new(0,0,0)
        _vPxC7f35.Text = _s7P8o85
        _vPxC7f35.BackgroundColor3 = Color3.fromRGB(90, 50, 200)
    else
        _vPxC7f35.Text = _s4WzL86
        _vPxC7f35.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
    end
end)
_vgsyeb24.MouseButton1Click:Connect(function()
    _vS8WjU8 = not _vS8WjU8
    _vpVMo322.Size = _vS8WjU8
        and UDim2.new(0, 280, 0, 40)
        or UDim2.new(0, 280, 0, 420)
    _vgsyeb24.Text = _vS8WjU8 and _s9SgK87 or _sfqyu88
end)
_vBmdrz58()
-- Junk code
local _j01KPBs=math.random(100,999)
local _j0PbRRO=game:GetService("RunService")
local _j0PbRRO=game:GetService("RunService")
-- Dead code
while false do local _dead = workspace break end
