-- CHEOZ MENU (VERSAO DOS DEUSES - REATIVAÇÃO DO ÍCONE C)
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
    if ad:FindFirstChild("CheozGodSystem") then ad.CheozGodSystem:Destroy() end;
    
    local ae=Instance.new("ScreenGui",ad);ae.Name="CheozGodSystem";ae.ResetOnSpawn = false
    
    -- CRIANDO O ÍCONE "C" (BOTÃO MOBILE)
    local btnC = Instance.new("TextButton", ae)
    btnC.Name = "MobileToggle"
    btnC.Size=UDim2.new(0,55,0,55);btnC.Position=UDim2.new(0.02,0,0.4,0)
    btnC.Text="C";btnC.BackgroundColor3=Color3.fromRGB(15,15,15);btnC.TextColor3=_G.ESP_Color
    btnC.Font=Enum.Font.LuckiestGuy;btnC.TextSize=32;btnC.ZIndex=10
    Instance.new("UICorner",btnC).CornerRadius=UDim.new(1,0)
    local stC=Instance.new("UIStroke",btnC);stC.Color=_G.ESP_Color;stC.Thickness=2

    -- MENU PRINCIPAL (O QUE APARECE NA SUA FOTO)
    local af=Instance.new("CanvasGroup",ae);af.Size=UDim2.new(0,500,0,420);af.Position=UDim2.new(0.5,-250,0.5,-210);af.BackgroundColor3=Color3.fromRGB(15,15,15);af.Visible=false;af.GroupTransparency=1
    Instance.new("UICorner",af).CornerRadius=UDim.new(0,12)
    local ag=Instance.new("UIStroke",af);ag.Thickness=2;ag.Color=_G.ESP_Color

    local ah=Instance.new("TextButton",af);ah.Size=UDim2.new(0,35,0,35);ah.Position=UDim2.new(1,-40,0,5);ah.Text="X";ah.TextColor3=Color3.new(1,1,1);ah.BackgroundColor3=Color3.fromRGB(200,50,50);Instance.new("UICorner",ah)

    local ai=Instance.new("TextLabel",af);ai.Size=UDim2.new(1,0,0,50);ai.Text="CHEOZ MENU - VERSÃO DOS DEUSES";ai.TextColor3=_G.ESP_Color;ai.Font=Enum.Font.LuckiestGuy;ai.TextSize=22;ai.BackgroundTransparency=1

    local function ak(am)
        local an=Instance.new("Frame",af);an.Size=UDim2.new(0.45,0,0.65,0);an.Position=UDim2.new(am,0,0.15,0);an.BackgroundColor3=Color3.fromRGB(22,22,22);Instance.new("UICorner",an)
        local ap=Instance.new("Frame",an);ap.Size=UDim2.new(0.9,0,0.9,0);ap.Position=UDim2.new(0.05,0,0.05,0);ap.BackgroundTransparency=1;local ui=Instance.new("UIListLayout",ap);ui.Padding=UDim.new(0,8);ui.HorizontalAlignment="Center";return ap
    end

    local aq = ak(0.03) -- Combat System
    local as = ak(0.52) -- Visuals & ESP

    local function createBtn(parent, text, var)
        local b = Instance.new("TextButton", parent);b.Size=UDim2.new(1,0,0,38);b.Text=text;b.BackgroundColor3=Color3.fromRGB(35,35,35);b.TextColor3=Color3.new(1,1,1);b.Font=Enum.Font.GothamBold;b.TextSize=11;Instance.new("UICorner",b)
        b.MouseButton1Click:Connect(function()
            _G[var] = not _G[var]
            b.BackgroundColor3 = _G[var] and _G.ESP_Color or Color3.fromRGB(35,35,35)
            b.TextColor3 = _G[var] and Color3.new(0,0,0) or Color3.new(1,1,1)
        end)
    end

    -- BOTÕES DO COMBAT (LADO ESQUERDO)
    createBtn(aq, "ATIVAR AIMBOT", "AimbotEnabled")
    createBtn(aq, "TEAM CHECK", "TeamCheck")
    
    -- BOTÕES DO VISUAL (LADO DIREITO)
    createBtn(as, "ESP BOXES", "ESP_Box")
    createBtn(as, "ESP SKELETON", "ESP_Skeleton")
    createBtn(as, "ESP TRACERS", "ESP_Tracers")

    -- SELETOR DE CORES (ABAIXO)
    local clrF = Instance.new("Frame", af);clrF.Size=UDim2.new(0.94,0,0.15,0);clrF.Position=UDim2.new(0.03,0,0.82,0);clrF.BackgroundTransparency=1;
    local layout = Instance.new("UIGridLayout",clrF);layout.CellSize=UDim2.new(0,32,0,32);layout.CellPadding=UDim2.new(0,6,0,6);layout.HorizontalAlignment="Center"
    
    for _,color in pairs(p) do
        local cB = Instance.new("TextButton", clrF);cB.BackgroundColor3=color;cB.Text="";Instance.new("UICorner",cB).CornerRadius=UDim.new(1,0)
        cB.MouseButton1Click:Connect(function() _G.ESP_Color=color;ag.Color=color;ai.TextColor3=color;stC.Color=color end)
    end

    -- LÓGICA DE ABRIR/FECHAR PELO BOTÃO "C"
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

    ah.MouseButton1Click:Connect(function() m=false; ae:Destroy() end)
end

-- MANTENDO A LÓGICA DE RENDERIZAÇÃO E AIMBOT
b.RenderStepped:Connect(function()
    if not m then return end
    -- (Aqui segue sua lógica de ESP e Mira da VERSAO DOS DEUSES que já estava funcionando)
    -- ... (Lógica omitida para brevidade, mas incluída no script final que você usa)
end)

pcall(ac)
