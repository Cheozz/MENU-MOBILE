-- CHEOZ MENU

if _G.CheozPermitido ~= "\67\72\69\79\90\95\65\85\84\72\95\57\57\50\49" then return end

local _0x1 = game:GetService("\80\108\97\121\101\114\115")
local _0x2 = game:GetService("\82\117\110\83\101\114\118\105\99\101")
local _0x3 = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
local _0x4 = game:GetService("\84\119\101\101\110\83\101\114\118\105\99\101")
local _0x5 = _0x1.LocalPlayer
local _0x6 = workspace.CurrentCamera
local _0x7 = mousemoverel or (Input and Input.MouseMove) or function() end

local _0x8 = true
_G.AimbotEnabled = false
_G.TeamCheck = false
_G.TargetPart = "\72\101\97\100"
_G.Smoothness = 1.0

local function _0x9(p)
    if not _G.TeamCheck then return true end
    local t1 = _0x5.Team or _0x5:GetAttribute("\84\101\97\109")
    local t2 = p.Team or p:GetAttribute("\84\101\97\109")
    return t1 ~= t2
end

local function _0x10()
    local d, target = 9e9, nil
    local center = Vector2.new(_0x6.ViewportSize.X/2, _0x6.ViewportSize.Y/2)
    for _, v in pairs(_0x1:GetPlayers()) do
        if v ~= _0x5 and v.Character and _0x9(v) then
            local part = v.Character:FindFirstChild(_G.TargetPart)
            if part then
                local pos, vis = _0x6:WorldToViewportPoint(part.Position)
                if vis then
                    local mag = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                    if mag < d then d = mag target = v end
                end
            end
        end
    end
    return target
end

local function _0xUI()
    local h = (gethui and gethui()) or game:GetService("\67\111\114\101\71\117\105")
    if h:FindFirstChild("\67\104\101\111\122\77\111\98\105\108\101") then h.\67\104\101\111\122\77\111\98\105\108\101:Destroy() end
    
    local sg = Instance.new("\83\101\114\101\101\110\71\117\105", h)
    sg.Name = "\67\104\101\111\122\77\111\98\105\108\101"
    
    local cBtn = Instance.new("\84\101\120\116\66\117\116\116\111\110", sg)
    cBtn.Size = UDim2.new(0, 50, 0, 50)
    cBtn.Position = UDim2.new(0.1, 0, 0.15, 0)
    cBtn.Text = "\67"
    cBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    cBtn.TextColor3 = Color3.fromRGB(170, 0, 255)
    cBtn.Font = Enum.Font.LuckiestGuy
    cBtn.TextSize = 30
    Instance.new("\85\73\67\111\114\110\101\114", cBtn).CornerRadius = UDim.new(1, 0)
    local st = Instance.new("\85\73\83\116\114\111\107\101", cBtn)
    st.Color = Color3.fromRGB(170, 0, 255)
    st.Thickness = 2

    local main = Instance.new("\67\97\110\118\97\115\71\114\111\117\112", sg)
    main.Size = UDim2.new(0, 340, 0, 240)
    main.Position = UDim2.new(0.5, -170, 0.5, -120)
    main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    main.Visible = false
    main.GroupTransparency = 1
    Instance.new("\85\73\67\111\114\110\101\114", main)

    local xBtn = Instance.new("\84\101\120\116\66\117\116\116\111\110", main)
    xBtn.Size = UDim2.new(0, 30, 0, 30)
    xBtn.Position = UDim2.new(1, -35, 0, 5)
    xBtn.Text = "\88"
    xBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    xBtn.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("\85\73\67\111\114\110\101\114", xBtn)

    local title = Instance.new("\84\101\120\116\76\97\98\101\108", main)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "\67\72\69\79\90\32\77\69\78\85"
    title.TextColor3 = Color3.fromRGB(170, 0, 255)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.LuckiestGuy
    title.TextSize = 20

    local b1 = Instance.new("\84\101\120\116\66\117\116\116\111\110", main)
    b1.Size = UDim2.new(0.8, 0, 0, 40)
    b1.Position = UDim2.new(0.1, 0, 0.3, 0)
    b1.Text = "\65\73\77\66\79\84\58\32\79\70\70"
    b1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b1.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("\85\73\67\111\114\110\101\114", b1)

    b1.MouseButton1Click:Connect(function()
        _G.AimbotEnabled = not _G.AimbotEnabled
        b1.Text = _G.AimbotEnabled and "\65\73\77\66\79\84\58\32\79\78" or "\65\73\77\66\79\84\58\32\79\70\70"
        b1.TextColor3 = _G.AimbotEnabled and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
    end)

    local open = false
    cBtn.MouseButton1Click:Connect(function()
        open = not open
        main.Visible = true
        _0x4:Create(main, TweenInfo.new(0.3), {GroupTransparency = open and 0 or 1}):Play()
        if not open then task.wait(0.3) main.Visible = false end
    end)

    xBtn.MouseButton1Click:Connect(function() sg:Destroy() _0x8 = false end)
end

_0x2.RenderStepped:Connect(function()
    if not _0x8 then return end
    if _G.AimbotEnabled then
        local t = _0x10()
        if t and t.Character then
            local p = t.Character:FindFirstChild(_G.TargetPart)
            if p then
                local pos, vis = _0x6:WorldToViewportPoint(p.Position)
                if vis then
                    local center = Vector2.new(_0x6.ViewportSize.X/2, _0x6.ViewportSize.Y/2)
                    _0x7((pos.X - center.X) * _G.Smoothness, (pos.Y - center.Y) * _G.Smoothness)
                end
            end
        end
    end
end)

pcall(_0xUI)
