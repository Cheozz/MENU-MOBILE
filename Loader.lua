-- [[ CHEOZ MENU ]] --
if _G.CheozPermitido ~= "CHEOZ_AUTH_9921" then 
    return 
end

local a=game:GetService("Players");local b=game:GetService("RunService");local c=game:GetService("UserInputService");local d=game:GetService("TweenService");local e=a.LocalPlayer;local f=workspace.CurrentCamera;local g=Vector2.new;local h=Vector3.new;local i=math.clamp;local j=math.huge;local l=mousemoverel or(Input and Input.MouseMove)or function()end;local m=true;_G.AimbotEnabled=false;_G.TeamCheck=false;_G.TargetPart="HumanoidRootPart";_G.Smoothness=0.5;_G.ESP_Skeleton=false;_G.ESP_Box=false;_G.ESP_HeadCircle=false;_G.ESP_Tracers=false;_G.ESP_Color=Color3.fromRGB(170,0,255);local o={}

local function ac()
    local ad=(gethui and gethui())or game:GetService("CoreGui")
    if ad:FindFirstChild("CheozMenuAnim")then ad.CheozMenuAnim:Destroy()end;
    local ae=Instance.new("ScreenGui",ad)ae.Name="CheozMenuAnim"
    local af=Instance.new("CanvasGroup",ae)
    af.Size=UDim2.new(0,350,0,280) -- Tamanho compacto para Mobile
    af.BackgroundColor3=Color3.fromRGB(15,15,15)
    af.AnchorPoint=g(0.5,0.5)
    af.Position=UDim2.new(0.5,0,0.5,0)
    af.GroupTransparency=0;
    Instance.new("UICorner",af).CornerRadius=UDim.new(0,10)
    local ag=Instance.new("UIStroke",af)ag.Thickness=2;ag.Color=_G.ESP_Color;

    local ai=Instance.new("TextLabel",af)
    ai.Size=UDim2.new(1,0,0,40)
    ai.Text="CHEOZ MENU"
    ai.TextColor3=_G.ESP_Color;
    ai.Font=Enum.Font.GothamBold;
    ai.TextSize=18;
    ai.BackgroundTransparency=1;

    local aj=Instance.new("ScrollingFrame",af)
    aj.Size=UDim2.new(1,-20,1,-50)
    aj.Position=UDim2.new(0,10,0,45)
    aj.BackgroundTransparency=1;
    aj.CanvasSize=UDim2.new(0,0,1.2,0)
    aj.ScrollBarThickness=0;
    Instance.new("UIListLayout",aj).Padding=UDim.new(0,8)

    local function aH(txt,var)
        local btn=Instance.new("TextButton",aj)
        btn.Size=UDim2.new(1,0,0,32)
        btn.BackgroundColor3=Color3.fromRGB(30,30,30)
        btn.Text=txt
        btn.TextColor3=Color3.new(1,1,1)
        btn.Font=Enum.Font.GothamBold;
        btn.TextSize=12;
        Instance.new("UICorner",btn)
        btn.MouseButton1Click:Connect(function()
            _G[var]=not _G[var]
            btn.BackgroundColor3=_G[var] and _G.ESP_Color or Color3.fromRGB(30,30,30)
        end)
    end

    aH("Ativar Aimbot","AimbotEnabled")
    aH("Team Check","TeamCheck")
    aH("ESP Boxes","ESP_Box")
    aH("ESP Skeleton","ESP_Skeleton")
    aH("ESP Head","ESP_HeadCircle")

    -- LÓGICA DE FECHAR/ABRIR SEM TECLADO
    b.RenderStepped:Connect(function()
        if af.Visible ~= _G.CheozMenuVisible then
            af.Visible = _G.CheozMenuVisible
        end
    end)
end

-- AIMBOT AUTOMÁTICO PARA MOBILE
b.RenderStepped:Connect(function()
    if _G.AimbotEnabled then
        local T; local U=j;
        for _,Y in pairs(a:GetPlayers()) do
            if Y~=e and Y.Character and Y.Character:FindFirstChild(_G.TargetPart) then
                local _,aa=f:WorldToViewportPoint(Y.Character[_G.TargetPart].Position)
                if aa then
                    local dist=(g(_.X,_.Y)-c:GetMouseLocation()).Magnitude
                    if dist < U then U=dist; T=Y end
                end
            end
        end
        if T then
            local pPos=f:WorldToViewportPoint(T.Character[_G.TargetPart].Position)
            l((pPos.X-c:GetMouseLocation().X)*_G.Smoothness, (pPos.Y-c:GetMouseLocation().Y)*_G.Smoothness)
        end
    end
end)

pcall(ac)
