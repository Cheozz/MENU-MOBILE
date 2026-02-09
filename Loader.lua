-- CHEOZ MENU
-- CHEOZ MENU

if _G.CheozPermitido ~= "CHEOZ_AUTH_9921" then return end

local a=game:GetService("Players");local b=game:GetService("RunService");local d=game:GetService("TweenService");local e=a.LocalPlayer;local f=workspace.CurrentCamera;local g=Vector2.new;local l=mousemoverel or(Input and Input.MouseMove)or function()end;local m=true;

_G.AimbotEnabled=false;_G.TeamCheck=false;_G.TargetPart="LowerTorso";_G.Smoothness=0.5;
_G.ESP_Skeleton=false;_G.ESP_Box=false;_G.ESP_Tracers=false;_G.ESP_Color=Color3.fromRGB(170,0,255);

local p={
    Color3.fromRGB(170,0,255), Color3.fromRGB(0,255,127), Color3.fromRGB(255,50,50), Color3.fromRGB(0,255,255),
    Color3.fromRGB(255,255,0), Color3.fromRGB(255,165,0), Color3.fromRGB(255,255,255), Color3.fromRGB(0,100,255),
    Color3.fromRGB(15,15,15), Color3.fromRGB(25,25,25), Color3.fromRGB(35,35,35), Color3.fromRGB(45,45,45)
}

local function BuildMenu()
    local ad=(gethui and gethui()) or game:GetService("CoreGui")
    if ad:FindFirstChild("GodSystemMobile") then ad.GodSystemMobile:Destroy() end;
    
    local ae=Instance.new("ScreenGui",ad);ae.Name="GodSystemMobile";ae.ResetOnSpawn = false
    
    local btnC = Instance.new("TextButton", ae)
    btnC.Size=UDim2.new(0,45,0,45);btnC.Position=UDim2.new(0.02,0,0.4,0)
    btnC.Text="C";btnC.BackgroundColor3=Color3.fromRGB(15,15,15);btnC.TextColor3=_G.ESP_Color
    btnC.Font=Enum.Font.LuckiestGuy;btnC.TextSize=28;btnC.ZIndex=100
    Instance.new("UICorner",btnC).CornerRadius=UDim.new(1,0)
    local stC=Instance.new("UIStroke",btnC);stC.Color=_G.ESP_Color;stC.Thickness=2

    local af=Instance.new("CanvasGroup",ae);af.Size=UDim2.new(0,380,0,280);af.Position=UDim2.new(0.5,-190,0.5,-140);af.BackgroundColor3=Color3.fromRGB(15,15,15);af.Visible=false;af.GroupTransparency=1
    Instance.new("UICorner",af).CornerRadius=UDim.new(0,10);local ag=Instance.new("UIStroke",af);ag.Thickness=2;ag.Color=_G.ESP_Color

    local ah=Instance.new("TextButton",af);ah.Size=UDim2.new(0,25,0,25);ah.Position=UDim2.new(1,-30,0,5);ah.Text="X";ah.TextColor3=Color3.new(1,1,1);ah.BackgroundColor3=Color3.fromRGB(200,50,50);Instance.new("UICorner",ah)

    local ai=Instance.new("TextLabel",af);ai.Size=UDim2.new(1,0,0,35);ai.Text="CHEOZ MENU";ai.TextColor3=_G.ESP_Color;ai.Font=Enum.Font.LuckiestGuy;ai.TextSize=18;ai.BackgroundTransparency=1

    local function ak(am, title)
        local an=Instance.new("Frame",af);an.Size=UDim2.new(0,170,0,180);an.Position=UDim2.new(am,0,0.18,0);an.BackgroundColor3=Color3.fromRGB(22,22,22);Instance.new("UICorner",an)
        local t=Instance.new("TextLabel",an);t.Size=UDim2.new(1,0,0,15);t.Text=title;t.TextColor3=_G.ESP_Color;t.BackgroundTransparency=1;t.Font=Enum.Font.GothamBold;t.TextSize=9
        local ap=Instance.new("Frame",an);ap.Size=UDim2.new(0.9,0,0.8,0);ap.Position=UDim2.new(0.05,0,0.15,0);ap.BackgroundTransparency=1;local ui=Instance.new("UIListLayout",ap);ui.Padding=UDim.new(0,4);ui.HorizontalAlignment="Center";return ap
    end

    local aq = ak(0.03, "COMBAT SYSTEM")
    local as = ak(0.53, "VISUALS & ESP")

    local function createBtn(parent, text, var)
        local b = Instance.new("TextButton", parent);b.Size=UDim2.new(1,0,0,28);b.Text=text;b.BackgroundColor3=Color3.fromRGB(35,35,35);b.TextColor3=Color3.new(1,1,1);b.Font=Enum.Font.GothamBold;b.TextSize=9;Instance.new("UICorner",b)
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
    createBtn(aq, "TEAM CHECK", "TeamCheck")

    local clrF = Instance.new("Frame", af);clrF.Size=UDim2.new(0.9,0,0.12,0);clrF.Position=UDim2.new(0.05,0,0.86,0);clrF.BackgroundTransparency=1;
    local layout = Instance.new("UIGridLayout",clrF);layout.CellSize=UDim2.new(0,22,0,22);layout.CellPadding=UDim2.new(0,5,0,5);layout.HorizontalAlignment="Center"
    
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

pcall(BuildMenu)
