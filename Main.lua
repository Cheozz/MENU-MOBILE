-- CHEOZ MENU

if _G.CheozPermitido ~= "\67\72\69\79\90\95\65\85\84\72\95\57\57\50\49" then return end

local _0xP = game:GetService("\80\108\97\121\101\114\115")
local _0xR = game:GetService("\82\117\110\83\101\114\118\105\99\101")
local _0xC = workspace.CurrentCamera
local _0xL = _0xP.LocalPlayer

local function _0xGet()
    local d, t = math.huge, nil
    for _, v in pairs(_0xP:GetPlayers()) do
        if v ~= _0xL and v.Character and v.Character:FindFirstChild("\100072\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") then
            if _G.TeamCheck and v.Team == _0xL.Team then continue end
            local p, s = _0xC:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            if s then
                local m = (Vector2.new(p.X, p.Y) - Vector2.new(_0xC.ViewportSize.X/2, _0xC.ViewportSize.Y/2)).Magnitude
                if m < d then d = m t = v end
            end
        end
    end
    return t
end

_0xR.RenderStepped:Connect(function()
    if _G.AimbotEnabled then
        local target = _0xGet()
        if target and target.Character then
            -- Foco no Corpo (HumanoidRootPart) ou Pernas (LeftLeg/RightLeg)
            local part = target.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") or target.Character:FindFirstChild("\76\101\102\116\76\101\103")
            if part then
                local lookAt = CFrame.new(_0xC.CFrame.p, part.Position)
                _0xC.CFrame = _0xC.CFrame:Lerp(lookAt, _G.Smoothness)
            end
        end
    end
end)

local function _0xUI()
    local g = Instance.new("\83\99\114\101\101\110\71\117\105", (gethui and gethui()) or game:GetService("\67\111\114\101\71\117\105"))
    local f = Instance.new("\70\114\97\109\101", g)
    f.Size = UDim2.new(0, 350, 0, 250) -- Ajustado para telas de celular
    f.Position = UDim2.new(0.5, -175, 0.5, -125)
    f.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Instance.new("\85\73\67\111\114\110\101\114", f)
    
    local t = Instance.new("\84\101\120\116\76\97\98\101\108", f)
    t.Size = UDim2.new(1, 0, 0, 40)
    t.Text = "\67\72\69\79\90\32\77\69\78\85\32\77\79\66\73\76\69"
    t.TextColor3 = Color3.fromRGB(170, 0, 255)
    t.BackgroundTransparency = 1
    t.Font = Enum.Font.LuckiestGuy
    t.TextSize = 18

    local b1 = Instance.new("\84\101\120\116\66\117\116\116\111\110", f)
    b1.Size = UDim2.new(0.8, 0, 0, 45)
    b1.Position = UDim2.new(0.1, 0, 0.3, 0)
    b1.Text = "AIMBOT (CORPO/PERNA): OFF"
    b1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b1.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("\85\73\67\111\114\110\101\114", b1)

    b1.MouseButton1Click:Connect(function()
        _G.AimbotEnabled = not _G.AimbotEnabled
        b1.Text = _G.AimbotEnabled and "AIMBOT: ON" or "AIMBOT: OFF"
        b1.TextColor3 = _G.AimbotEnabled and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
    end)

    local b2 = Instance.new("\84\101\120\116\66\117\116\116\111\110", f)
    b2.Size = UDim2.new(0.8, 0, 0, 45)
    b2.Position = UDim2.new(0.1, 0, 0.6, 0)
    b2.Text = "TEAM CHECK: OFF"
    b2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b2.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("\85\73\67\111\114\110\101\114", b2)
    
    b2.MouseButton1Click:Connect(function()
        _G.TeamCheck = not _G.TeamCheck
        b2.Text = _G.TeamCheck and "TEAM CHECK: ON" or "TEAM CHECK: OFF"
    end)
end

_0xUI()
