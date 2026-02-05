-- CHEOZ MENU

if _G.CheozPermitido ~= "CHEOZ_AUTH_9921" then return end

local a = game:GetService("Players")
local b = game:GetService("RunService")
local c = game:GetService("UserInputService")
local d = game:GetService("TweenService")
local e = a.LocalPlayer
local f = workspace.CurrentCamera
local g = Vector2.new
local h = Vector3.new
local j = math.huge
local l = mousemoverel or (Input and Input.MouseMove) or function() end
local m = true

_G.AimbotEnabled = false
_G.TeamCheck = false
_G.TargetPart = "HumanoidRootPart" -- Foco no corpo/perna
_G.Smoothness = 0.5

local function C(D)
    if not _G.TeamCheck then return true end
    local myTeam = e.Team or e:GetAttribute("Team")
    local enemyTeam = D.Team or D:GetAttribute("Team")
    return myTeam ~= enemyTeam
end

local function S()
    local T, U = nil, j
    local V = g(f.ViewportSize.X/2, f.ViewportSize.Y/2)
    for _, Y in pairs(a:GetPlayers()) do
        if Y ~= e and Y.Character and C(Y) then
            local Z = Y.Character:FindFirstChild(_G.TargetPart) or Y.Character:FindFirstChild("UpperTorso")
            if Z then
                local _, aa = f:WorldToViewportPoint(Z.Position)
                if aa then
                    local ab = (g(_.X, _.Y) - V).Magnitude
                    if ab < U then U = ab T = Y end
                end
            end
        end
    end
    return T
end

local function ac()
    local ad = (gethui and gethui()) or game:GetService("CoreGui")
    if ad:FindFirstChild("CheozMenuMobile") then ad.CheozMenuMobile:Destroy() end
    
    local ae = Instance.new("ScreenGui", ad)
    ae.Name = "CheozMenuMobile"
    
    -- Ícone C para abrir o menu
    local btnC = Instance.new("TextButton", ae)
    btnC.Name = "OpenButton"
    btnC.Size = UDim2.new(0, 55, 0, 55)
    btnC.Position = UDim2.new(0.02, 0, 0.4, 0)
    btnC.Text = "C"
    btnC.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    btnC.TextColor3 = Color3.fromRGB(170, 0, 255)
    btnC.Font = Enum.Font.LuckiestGuy
    btnC.TextSize = 32
    btnC.ZIndex = 10
    Instance.new("UICorner", btnC).CornerRadius = UDim.new(1, 0)
    local stC = Instance.new("UIStroke", btnC)
    stC.Color = Color3.fromRGB(170, 0, 255)
    stC.Thickness = 2

    local af = Instance.new("CanvasGroup", ae)
    af.Size = UDim2.new(0, 360, 0, 260)
    af.Position = UDim2.new(0.5, -180, 0.5, -130)
    af.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    af.Visible = false
    af.GroupTransparency = 1
    Instance.new("UICorner", af).CornerRadius = UDim.new(0, 12)
    local ag = Instance.new("UIStroke", af)
    ag.Thickness = 2; ag.Color = Color3.fromRGB(170, 0, 255);

    -- Botão X para fechar
    local ah = Instance.new("TextButton", af)
    ah.Size = UDim2.new(0, 35, 0, 35)
    ah.Position = UDim2.new(1, -40, 0, 5)
    ah.Text = "X"
    ah.TextColor3 = Color3.new(1, 1, 1)
    ah.Font = Enum.Font.GothamBold
    ah.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    Instance.new("UICorner", ah)

    local ai = Instance.new("TextLabel", af)
    ai.Size = UDim2.new(1, 0, 0, 50)
    ai.Text = "CHEOZ MOBILE"
    ai.TextColor3 = Color3.fromRGB(170, 0, 255)
    ai.Font = Enum.Font.LuckiestGuy
    ai.TextSize = 22
    ai.BackgroundTransparency = 1

    -- Botões de Funções
    local b1 = Instance.new("TextButton", af)
    b1.Size = UDim2.new(0.8, 0, 0, 45)
    b1.Position = UDim2.new(0.1, 0, 0.35, 0)
    b1.Text = "AIMBOT: OFF"
    b1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b1.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b1)

    b1.MouseButton1Click:Connect(function()
        _G.AimbotEnabled = not _G.AimbotEnabled
        b1.Text = _G.AimbotEnabled and "AIMBOT: ON" or "AIMBOT: OFF"
        b1.TextColor3 = _G.AimbotEnabled and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
    end)

    local b2 = Instance.new("TextButton", af)
    b2.Size = UDim2.new(0.8, 0, 0, 45)
    b2.Position = UDim2.new(0.1, 0, 0.65, 0)
    b2.Text = "TEAM CHECK: OFF"
    b2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b2.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b2)

    b2.MouseButton1Click:Connect(function()
        _G.TeamCheck = not _G.TeamCheck
        b2.Text = _G.TeamCheck and "TEAM CHECK: ON" or "TEAM CHECK: OFF"
    end)

    -- Lógica de abrir/fechar
    local open = false
    btnC.MouseButton1Click:Connect(function()
        open = not open
        if open then
            af.Visible = true
            d:Create(af, TweenInfo.new(0.3), {GroupTransparency = 0}):Play()
        else
            local tw = d:Create(af, TweenInfo.new(0.3), {GroupTransparency = 1})
            tw:Play()
            tw.Completed:Connect(function() if not open then af.Visible = false end end)
        end
    end)

    ah.MouseButton1Click:Connect(function()
        m = false
        ae:Destroy()
    end)
end

b.RenderStepped:Connect(function()
    if not m then return end
    if _G.AimbotEnabled then
        local target = S()
        if target and target.Character then
            local p = target.Character:FindFirstChild(_G.TargetPart) or target.Character:FindFirstChild("UpperTorso")
            if p then
                local pos, vis = f:WorldToViewportPoint(p.Position)
                if vis then
                    local center = g(f.ViewportSize.X/2, f.ViewportSize.Y/2)
                    l((pos.X - center.X) * _G.Smoothness, (pos.Y - center.Y) * _G.Smoothness)
                end
            end
        end
    end
end)

pcall(ac)
