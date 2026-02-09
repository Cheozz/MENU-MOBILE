-- [[ CHEOZ MENU ]] --

if _G.CheozPermitido ~= "CHEOZ_AUTH_9921" then return end

local a=game:GetService("Players");local b=game:GetService("RunService");local d=game:GetService("TweenService");local e=a.LocalPlayer;local f=workspace.CurrentCamera;local g=Vector2.new;local h=Vector3.new;local l=mousemoverel or(Input and Input.MouseMove)or function()end;local m=true;

_G.AimbotEnabled=false;_G.TeamCheck=false;_G.TargetPart="HumanoidRootPart";_G.Smoothness=0.5;
_G.ESP_Skeleton=false;_G.ESP_Box=false;_G.ESP_Tracers=false;_G.ESP_Color=Color3.fromRGB(170,0,255);

local p={
    Color3.fromRGB(170,0,255), Color3.fromRGB(0,255,127), Color3.fromRGB(255,50,50), Color3.fromRGB(0,255,255),
    Color3.fromRGB(255,255,0), Color3.fromRGB(255,165,0), Color3.fromRGB(255,255,255), Color3.fromRGB(0,100,255),
    Color3.fromRGB(15,15,15), Color3.fromRGB(25,25,25), Color3.fromRGB(35,35,35), Color3.fromRGB(45,45,45)
}

local function ac()
    local ad=(gethui and gethui()) or game:GetService("CoreGui")
    if ad:FindFirstChild("GodMobile") then ad.GodMobile:Destroy() end;
    
    local ae=Instance.new("ScreenGui",ad);ae.Name="GodMobile";ae.ResetOnSpawn = false
    
    local btnC = Instance.new("TextButton", ae)
    btnC.Size=UDim2.new(0,45,0,45);btnC.Position=UDim2.new(0.02,0,0.4,0)
    btnC.Text="C";btnC.BackgroundColor3=Color3.fromRGB(15,15,15);btnC.TextColor3=_G.ESP_Color
    btnC.Font=Enum.Font.LuckiestGuy;btnC.TextSize=28;btnC.ZIndex=100
    Instance.new("UICorner",btnC).CornerRadius=UDim.new(1,0)
    local stC=Instance.new("UIStroke",btnC);stC.Color=_G.ESP_Color;stC.Thickness=2

    -- Menu Redimensionado (Menor para Celular)
    local af=Instance.new("CanvasGroup",ae);af.Size=UDim2.new(0,420,0,320);af.Position=UDim2.new(0.5,-210,0.5,-160);af.BackgroundColor3=Color3.fromRGB(15,15,15);af.Visible=false;af.GroupTransparency=1
    Instance.new("UICorner",af).CornerRadius=UDim.new(0,10)
    local ag=Instance.new("UIStroke",af);ag.Thickness=2;ag.Color=_G.ESP_Color

    local ah=Instance.new("TextButton",af);ah.Size=UDim2.new(0,30,0,30);ah.Position=UDim2.new(1,-35,0,5);ah.Text="X";ah.TextColor3=Color3.new(1,1,1);ah.BackgroundColor3=Color3.fromRGB(200,50,50);Instance.new("UICorner",ah)

    local ai=Instance.new("TextLabel",af);ai.Size=UDim2.new(1,0,0,40);ai.Text="CHEOZ MENU";ai.TextColor3=_G.ESP_Color;ai.Font=Enum.Font.LuckiestGuy;ai.TextSize=20;ai.BackgroundTransparency=1

    local function ak(am, titleText)
        local an=Instance.new("Frame",af);an.Size=UDim2.new(0.46,0,0.68,0);an.Position=UDim2.new(am,0,0.18,0);an.BackgroundColor3=Color3.fromRGB(22,22,22);Instance.new("UICorner",an)
        local lab=Instance.new("TextLabel",an);lab.Size=UDim2.new(1,0,0,20);lab.Text=titleText;lab.TextColor3=_G.ESP_Color;lab.BackgroundTransparency=1;lab.Font=Enum.Font.GothamBold;lab.TextSize=10
        local ap=Instance.new("Frame",an);ap.Size=UDim2.new(0.9,0,0.8,0);ap.Position=UDim2.new(0.05,0,0.15,0);ap.BackgroundTransparency=1;local ui=Instance.new("UIListLayout",ap);ui.Padding=UDim.new(0,5);ui.HorizontalAlignment="Center";return ap
    end

    local aq = ak(0.03, "COMBAT SYSTEM")
    local as = ak(0.51, "VISUALS & ESP")

    local function createBtn(parent, text, var)
        local b = Instance.new("TextButton", parent);b.Size=UDim2.new(1,0,0,32);b.Text=text;b.BackgroundColor3=Color3.fromRGB(35,35,35);b.TextColor3=Color3.new(1,1,1);b.Font=Enum.Font.GothamBold;b.TextSize=10;Instance.new("UICorner",b)
        b.MouseButton1Click:Connect(function()
            _G[var] = not _G[var]
            b.BackgroundColor3 = _G[var] and _G.ESP_Color or Color3.fromRGB(35,35,35)
            b.TextColor3 = _G[var] and Color3.new(0,0,0) or Color3.new(1,1,1)
        end)
    end

    createBtn(aq, "ATIVAR AIMBOT", "AimbotEnabled")
    createBtn(as, "ESP BOXES", "ESP_Box")
    createBtn(as, "ESP SKELETON", "ESP_Skeleton")
    createBtn(as, "ESP TRACERS", "ESP_Tracers")
    createBtn(aq, "TEAM CHECK", "TeamCheck") -- Colocado como último da esquerda

    local clrF = Instance.new("Frame", af);clrF.Size=UDim2.new(0.9,0,0.12,0);clrF.Position=UDim2.new(0.05,0,0.86,0);clrF.BackgroundTransparency=1;
    local layout = Instance.new("UIGridLayout",clrF);layout.CellSize=UDim2.new(0,25,0,25);layout.CellPadding=UDim2.new(0,5,0,5);layout.HorizontalAlignment="Center"
    
    for _,color in pairs(p) do
        local cB = Instance.new("TextButton", clrF);cB.BackgroundColor3=color;cB.Text="";Instance.new("UICorner",cB).CornerRadius=UDim.new(1,0)
        cB.MouseButton1Click:Connect(function() _G.ESP_Color=color;ag.Color=color;ai.TextColor3=color;stC.Color=color end)
    end

    local open = false
    btnC.MouseButton1Click:Connect(function()
        open = not open; af.Visible = open
        if open then d:Create(af, TweenInfo.new(0.2), {GroupTransparency = 0}):Play() else af.GroupTransparency = 1 end
    end)
    ah.MouseButton1Click:Connect(function() m=false; ae:Destroy() end)
end

-- Lógica de Aimbot focando em Corpo e Perna
local function GetTarget()
    local T,U=nil,1000;local V=g(f.ViewportSize.X/2, f.ViewportSize.Y/2)
    for _,Y in pairs(a:GetPlayers()) do
        if Y~=e and Y.Character then
            local pPart = Y.Character:FindFirstChild("LowerTorso") or Y.Character:FindFirstChild("LeftLowerLeg")
            if pPart then
                local pos, vis = f:WorldToViewportPoint(pPart.Position)
                if vis then local dist = (g(pos.X, pos.Y) - V).Magnitude; if dist < U then U = dist; T = Y end end
            end
        end
    end; return T
end

b.RenderStepped:Connect(function()
    if not m then return end
    if _G.AimbotEnabled then
        local t = GetTarget()
        if t and t.Character then
            local p = t.Character:FindFirstChild("LowerTorso") or t.Character:FindFirstChild("LeftLowerLeg")
            if p then
                local pos, vis = f:WorldToViewportPoint(p.Position)
                local center = g(f.ViewportSize.X/2, f.ViewportSize.Y/2)
                l((pos.X-center.X)*_G.Smoothness, (pos.Y-center.Y)*_G.Smoothness)
            end
        end
    end
end)

pcall(ac)
