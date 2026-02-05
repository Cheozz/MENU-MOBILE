-- [[ CHEOZ MENU - MOBILE EDITION (PROTECTED) ]]
-- 'CHEOZ MENU' section

local _0x5F2 = "CHEOZ_AUTH_9921"
if _G.CheozPermitido ~= _0x5F2 then return end

local function _0x8892(_0x11)
    local _0x22 = ""
    for _0x33 in _0x11:gmatch("%d%d") do
        _0x22 = _0x22 .. string.char(tonumber(_0x33, 16))
    end
    return _0x22
end

local a=game:GetService("Players");local b=game:GetService("RunService");local c=game:GetService("UserInputService");local d=game:GetService("TweenService");local e=a.LocalPlayer;local f=workspace.CurrentCamera;local g=Vector2.new;local h=Vector3.new;local i=math.clamp;local j=math.huge;local l=mousemoverel or (Input and Input.MouseMove) or function() end;local m=true;

_G.AimbotEnabled=false;_G.TeamCheck=false;_G.TargetPart="Head";_G.Smoothness=0.4;_G.ESP_Box=false;_G.ESP_HeadCircle=false;_G.ESP_Tracers=false;_G.ESP_Color=Color3.fromRGB(170,0,255);

local o={}local p={Color3.fromRGB(170,0,255),Color3.fromRGB(0,255,127),Color3.fromRGB(255,50,50),Color3.fromRGB(0,255,255),Color3.fromRGB(30,0,50),Color3.fromRGB(0,40,0),Color3.fromRGB(50,0,0),Color3.fromRGB(40,40,40)}

local function C(D)if not _G.TeamCheck then return true end;if D.Team~=e.Team then return true end;return false end;
local function G(H,I)local J=Drawing.new(H)for K,L in pairs(I)do J[K]=L end;table.insert(o,J)return J end;
local N,O,P={},{},{}for Q=1,40 do table.insert(N,G("Square",{Thickness=1.5,Visible=false}))table.insert(O,G("Circle",{Thickness=1.5,Visible=false,Radius=6}))table.insert(P,G("Line",{Thickness=1.5,Visible=false}))end;

local function S()local T,U=nil,j;local V=g(f.ViewportSize.X/2,f.ViewportSize.Y/2)for X,Y in pairs(a:GetPlayers())do if Y~=e and Y.Character and Y.Character:FindFirstChild("Humanoid") and Y.Character.Humanoid.Health>0 and C(Y)then local Z=Y.Character:FindFirstChild(_G.TargetPart)if Z then local _,aa=f:WorldToViewportPoint(Z.Position)if aa then local ab=(g(_.X,_.Y)-V).Magnitude;if ab<U then U=ab;T=Y end end end end end;return T end;

local function ac()
    local ad=(gethui and gethui())or game:GetService("CoreGui")
    if ad:FindFirstChild("CheozMobile") then ad.CheozMobile:Destroy() end
    local ae=Instance.new("ScreenGui",ad);ae.Name="CheozMobile"
    
    local btnIcon = Instance.new("TextButton", ae)
    btnIcon.Size = UDim2.new(0, 45, 0, 45)
    btnIcon.Position = UDim2.new(0, 20, 0.5, 0)
    btnIcon.BackgroundColor3 = Color3.fromRGB(20,20,20)
    btnIcon.Text = "C"
    btnIcon.TextColor3 = _G.ESP_Color
    btnIcon.Font = Enum.Font.LuckiestGuy
    btnIcon.TextSize = 25
    btnIcon.Active = true
    btnIcon.Draggable = true
    Instance.new("UICorner", btnIcon).CornerRadius = UDim.new(1,0)
    Instance.new("UIStroke", btnIcon).Color = _G.ESP_Color

    local af=Instance.new("CanvasGroup",ae)
    af.Size=UDim2.new(0,360,0,280)
    af.Position=UDim2.new(0.5,0,0.5,0)
    af.AnchorPoint=g(0.5,0.5)
    af.BackgroundColor3=Color3.fromRGB(15,15,15)
    af.Visible = false
    Instance.new("UICorner",af)
    
    btnIcon.MouseButton1Click:Connect(function() af.Visible = not af.Visible end)

    local ai=Instance.new("TextLabel",af)
    ai.Size=UDim2.new(1,0,0,40);ai.Text="CHEOZ MENU";ai.TextColor3=_G.ESP_Color;ai.Font=Enum.Font.LuckiestGuy;ai.TextSize=22;ai.BackgroundTransparency=1;

    local aj=Instance.new("Frame",af)
    aj.Size=UDim2.new(1,-20,1,-50);aj.Position=UDim2.new(0,10,0,45);aj.BackgroundTransparency=1;
    local aq=Instance.new("Frame",aj);aq.Size=UDim2.new(0.48,0,1,0);aq.BackgroundColor3=Color3.fromRGB(20,20,20);Instance.new("UICorner",aq)
    local as=Instance.new("Frame",aj);as.Size=UDim2.new(0.48,0,1,0);as.Position=UDim2.new(0.52,0,0,0);as.BackgroundColor3=Color3.fromRGB(20,20,20);Instance.new("UICorner",as)

    local function aH(av,aw,ax)
        local btn=Instance.new("TextButton",av)
        btn.Size=UDim2.new(1,-10,0,35)
        btn.BackgroundColor3=Color3.fromRGB(30,30,30);btn.Text=aw;btn.TextColor3=Color3.new(1,1,1);btn.Font=Enum.Font.Gotham;btn.TextSize=12;Instance.new("UICorner",btn)
        btn.MouseButton1Click:Connect(function() _G[ax]=not _G[ax] btn.BackgroundColor3=_G[ax] and _G.ESP_Color or Color3.fromRGB(30,30,30) end)
        Instance.new("UIListLayout",av).Padding=UDim.new(0,5);Instance.new("UIPadding",av).PaddingTop=UDim.new(0,5)
    end

    aH(aq,"Aimbot","AimbotEnabled")
    aH(aq,"Team Check","TeamCheck")
    aH(as,"Box ESP","ESP_Box")
    aH(as,"Head ESP","ESP_HeadCircle")
    aH(as,"Tracers","ESP_Tracers")
end

b.RenderStepped:Connect(function()
    if not m then return end
    local b2=_G.ESP_Color;
    for Q=1,40 do N[Q].Visible=false;N[Q].Color=b2;O[Q].Visible=false;O[Q].Color=b2;P[Q].Visible=false;P[Q].Color=b2 end
    local b4,b5,b6=1,1,1
    for _,Y in pairs(a:GetPlayers()) do
        if Y~=e and Y.Character and C(Y) then
            local root=Y.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local pos,aa=f:WorldToViewportPoint(root.Position)
                if aa then
                    if _G.ESP_Box then local bd=N[b4] bd.Visible=true;bd.Size=g(450/pos.Z, 600/pos.Z)bd.Position=g(pos.X-bd.Size.X/2,pos.Y-bd.Size.Y/2) b4=b4+1 end
                    if _G.ESP_HeadCircle then local be=O[b5] be.Visible=true;be.Position=g(pos.X,pos.Y-2) b5=b5+1 end
                    if _G.ESP_Tracers then local bf=P[b6] bf.Visible=true;bf.From=g(f.ViewportSize.X/2,f.ViewportSize.Y);bf.To=g(pos.X,pos.Y) b6=b6+1 end
                end
            end
        end
    end
    if _G.AimbotEnabled then
        local target=S()
        if target and target.Character then
            local p=target.Character:FindFirstChild(_G.TargetPart)
            if p then
                local pos,aa=f:WorldToViewportPoint(p.Position)
                if aa then l((pos.X-c:GetMouseLocation().X)*_G.Smoothness,(pos.Y-c:GetMouseLocation().Y)*_G.Smoothness) end
            end
        end
    end
end)
pcall(ac)
