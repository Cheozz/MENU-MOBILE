-- CHEOZ MENU

if _G.CheozPermitido ~= "CHEOZ_AUTH_9921" then return end

local a=game:GetService("Players");local b=game:GetService("RunService");local c=game:GetService("UserInputService");local d=game:GetService("TweenService");local e=a.LocalPlayer;local f=workspace.CurrentCamera;local g=Vector2.new;local h=Vector3.new;local j=math.huge;local l=mousemoverel or(Input and Input.MouseMove)or function()end;local m=true;

_G.AimbotEnabled=false;_G.TeamCheck=false;_G.TargetPart="HumanoidRootPart";_G.Smoothness=0.5;
_G.ESP_Skeleton=false;_G.ESP_Box=false;_G.ESP_Tracers=false;_G.ESP_Color=Color3.fromRGB(170,0,255);

local o={}
local p={
    Color3.fromRGB(170,0,255), Color3.fromRGB(0,255,127), Color3.fromRGB(255,50,50), Color3.fromRGB(0,255,255),
    Color3.fromRGB(15,15,15), Color3.fromRGB(25,25,25), Color3.fromRGB(35,35,35), Color3.fromRGB(45,45,45)
}

local function C(D)
    if not _G.TeamCheck then return true end
    local myTeam = e.Team or e:GetAttribute("Team")
    local enemyTeam = D.Team or D:GetAttribute("Team")
    return myTeam ~= enemyTeam
end

local function G(H,I)
    local J=Drawing.new(H)
    for K,L in pairs(I)do J[K]=L end;
    table.insert(o,J)
    return J 
end

local M,N,P={},{},{}
for Q=1,300 do table.insert(M,G("Line",{Thickness=1.5,Visible=false}))end;
for Q=1,50 do table.insert(N,G("Square",{Thickness=1.5,Visible=false}))table.insert(P,G("Line",{Thickness=1.5,Visible=false}))end;

local R={{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"}}

local function S()
    local T,U=nil,j;local V=g(f.ViewportSize.X/2, f.ViewportSize.Y/2)
    for _,Y in pairs(a:GetPlayers())do
        if Y~=e and Y.Character and C(Y)then
            local Z=Y.Character:FindFirstChild(_G.TargetPart) or Y.Character:FindFirstChild("UpperTorso")
            if Z then
                local _,aa=f:WorldToViewportPoint(Z.Position)
                if aa then local ab=(g(_.X,_.Y)-V).Magnitude;if ab<U then U=ab;T=Y end end
            end
        end
    end;return T
end

local function ac()
    local ad=(gethui and gethui()) or game:GetService("CoreGui")
    if ad:FindFirstChild("CheozMenuMobile") then ad.CheozMenuMobile:Destroy() end;
    local ae=Instance.new("ScreenGui",ad);ae.Name="CheozMenuMobile"
    
    local btnC = Instance.new("TextButton", ae)
    btnC.Size=UDim2.new(0,55,0,55);btnC.Position=UDim2.new(0.02,0,0.4,0);btnC.Text="C";btnC.BackgroundColor3=Color3.fromRGB(15,15,15);btnC.TextColor3=_G.ESP_Color;btnC.Font=Enum.Font.LuckiestGuy;btnC.TextSize=32;Instance.new("UICorner",btnC).CornerRadius=UDim.new(1,0);local stC=Instance.new("UIStroke",btnC);stC.Color=_G.ESP_Color;stC.Thickness=2

    local af=Instance.new("CanvasGroup",ae);af.Size=UDim2.new(0,500,0,420);af.Position=UDim2.new(0.5,-250,0.5,-210);af.BackgroundColor3=Color3.fromRGB(15,15,15);af.Visible=false;af.GroupTransparency=1;Instance.new("UICorner",af).CornerRadius=UDim.new(0,12);local ag=Instance.new("UIStroke",af);ag.Thickness=2;ag.Color=_G.ESP_Color

    local ah=Instance.new("TextButton",af);ah.Size=UDim2.new(0,35,0,35);ah.Position=UDim2.new(1,-40,0,5);ah.Text="X";ah.TextColor3=Color3.new(1,1,1);ah.BackgroundColor3=Color3.fromRGB(200,50,50);Instance.new("UICorner",ah)

    local ai=Instance.new("TextLabel",af);ai.Size=UDim2.new(1,0,0,50);ai.Text="CHEOZ V2 - FULL";ai.TextColor3=_G.ESP_Color;ai.Font=Enum.Font.LuckiestGuy;ai.TextSize=25;ai.BackgroundTransparency=1

    local function ak(am)
        local an=Instance.new("Frame",af);an.Size=UDim2.new(0.45,0,0.65,0);an.Position=UDim2.new(am,0,0.18,0);an.BackgroundColor3=Color3.fromRGB(22,22,22);Instance.new("UICorner",an)
        local ap=Instance.new("Frame",an);ap.Size=UDim2.new(0.9,0,0.9,0);ap.Position=UDim2.new(0.05,0,0.05,0);ap.BackgroundTransparency=1;local ui=Instance.new("UIListLayout",ap);ui.Padding=UDim.new(0,8);ui.HorizontalAlignment="Center";return ap
    end

    local aq = ak(0.03)
    local as = ak(0.52)

    local function createBtn(parent, text, var)
        local b = Instance.new("TextButton", parent);b.Size=UDim2.new(1,0,0,38);b.Text=text;b.BackgroundColor3=Color3.fromRGB(35,35,35);b.TextColor3=Color3.new(1,1,1);b.Font=Enum.Font.GothamBold;b.TextSize=12;Instance.new("UICorner",b)
        b.MouseButton1Click:Connect(function()
            _G[var] = not _G[var]
            b.BackgroundColor3 = _G[var] and _G.ESP_Color or Color3.fromRGB(35,35,35)
            b.TextColor3 = _G[var] and Color3.new(0,0,0) or Color3.new(1,1,1)
        end)
    end

    createBtn(aq, "ATIVAR AIMBOT", "AimbotEnabled")
    createBtn(aq, "TEAM CHECK", "TeamCheck")
    createBtn(as, "ESP BOXES", "ESP_Box")
    createBtn(as, "ESP SKELETON", "ESP_Skeleton")
    createBtn(as, "ESP TRACERS", "ESP_Tracers")

    local clrF = Instance.new("Frame", af);clrF.Size=UDim2.new(0.94,0,0.1,0);clrF.Position=UDim2.new(0.03,0,0.85,0);clrF.BackgroundTransparency=1;local uiL=Instance.new("UIListLayout",clrF);uiL.FillDirection="Horizontal";uiL.Padding=UDim.new(0,8);uiL.HorizontalAlignment="Center"
    for _,color in pairs(p) do
        local cB = Instance.new("TextButton", clrF);cB.Size=UDim2.new(0,35,0,35);cB.BackgroundColor3=color;cB.Text="";Instance.new("UICorner",cB).CornerRadius=UDim.new(1,0)
        cB.MouseButton1Click:Connect(function() _G.ESP_Color=color;ag.Color=color;ai.TextColor3=color;stC.Color=color end)
    end

    local open = false
    btnC.MouseButton1Click:Connect(function()
        open = not open; if open then af.Visible=true;d:Create(af,TweenInfo.new(0.3),{GroupTransparency=0}):Play() else local tw=d:Create(af,TweenInfo.new(0.3),{GroupTransparency=1});tw:Play();tw.Completed:Connect(function() if not open then af.Visible=false end end) end
    end)
    ah.MouseButton1Click:Connect(function() m=false;ae:Destroy() end)
end

b.RenderStepped:Connect(function()
    if not m then return end
    local b2=_G.ESP_Color;for Q=1,300 do M[Q].Visible=false;M[Q].Color=b2 end;for Q=1,50 do N[Q].Visible=false;N[Q].Color=b2;P[Q].Visible=false;P[Q].Color=b2 end
    local b3,b4,b6=1,1,1;local b7=f.ViewportSize

    for _,Y in pairs(a:GetPlayers())do
        if Y~=e and Y.Character and C(Y)then
            local root=Y.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local b8,aa=f:WorldToViewportPoint(root.Position)
                if aa then
                    if _G.ESP_Box then
                        local head=Y.Character:FindFirstChild("Head")
                        if head then
                            local b9=f:WorldToViewportPoint(head.Position+h(0,0.5,0));local ba=f:WorldToViewportPoint(root.Position-h(0,3,0));local bb=math.abs(b9.Y-ba.Y);local bc=bb*0.6;local bd=N[b4];bd.Visible=true;bd.Size=g(bc,bb);bd.Position=g(b8.X-bc/2,b8.Y-bb/2);b4=b4+1
                        end
                    end
                    if _G.ESP_Tracers then local bf=P[b6];bf.Visible=true;bf.From=g(b7.X/2,b7.Y);bf.To=g(b8.X,b8.Y);b6=b6+1 end
                    if _G.ESP_Skeleton then
                        for _,conn in pairs(R)do
                            local bg,bh=Y.Character:FindFirstChild(conn[1]),Y.Character:FindFirstChild(conn[2])
                            if bg and bh then local bi,bj=f:WorldToViewportPoint(bg.Position);local bk,bl=f:WorldToViewportPoint(bh.Position);if(bj or bl)and M[b3]then local s=M[b3];s.Visible=true;s.From=g(bi.X,bi.Y);s.To=g(bk.X,bk.Y);b3=b3+1 end end
                        end
                    end
                end
            end
        end
    end
    if _G.AimbotEnabled then
        local target = S()
        if target and target.Character then
            local p = target.Character:FindFirstChild(_G.TargetPart) or target.Character:FindFirstChild("UpperTorso")
            if p then
                local pos, vis = f:WorldToViewportPoint(p.Position)
                if vis then local center = g(f.ViewportSize.X/2, f.ViewportSize.Y/2);l((pos.X-center.X)*_G.Smoothness, (pos.Y-center.Y)*_G.Smoothness) end
            end
        end
    end
end)
pcall(ac)
