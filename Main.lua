-- [[ CHEOZ MENU - MAIN LOADER ]] --
local LinkDaKey = "https://work.ink/2h4Z/cheoz-menu-key-system" 
local ScriptOriginal = "https://raw.githubusercontent.com/Cheozz/MENU-MOBILE/refs/heads/main/Loader.lua"

-- Cria o evento de comunicação se não existir
if not _G.CheozEvent then
    _G.CheozEvent = Instance.new("BindableEvent")
end

local function Validar(v_key)
    local url = "https://work.ink/_api/v2/token/isValid/" .. v_key
    local success, response = pcall(function() return game:HttpGet(url) end)
    return success and response:find('"valid":true')
end

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0.5, -125, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "CHEOZ MENU"
Title.Size = UDim2.new(1, 0, 0, 35)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(0, 200, 0, 30)
TextBox.Position = UDim2.new(0.5, -100, 0.35, 0)
TextBox.PlaceholderText = "Cole a Key aqui..."
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TextBox)

local BtnEntrar = Instance.new("TextButton", Frame)
BtnEntrar.Size = UDim2.new(0, 90, 0, 30)
BtnEntrar.Position = UDim2.new(0.15, 0, 0.7, 0)
BtnEntrar.Text = "Entrar"
BtnEntrar.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
BtnEntrar.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", BtnEntrar)

local BtnKey = Instance.new("TextButton", Frame)
BtnKey.Size = UDim2.new(0, 90, 0, 30)
BtnKey.Position = UDim2.new(0.55, 0, 0.7, 0)
BtnKey.Text = "Pegar Key"
BtnKey.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
BtnKey.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", BtnKey)

BtnKey.MouseButton1Click:Connect(function()
    setclipboard(LinkDaKey)
    BtnKey.Text = "Copiado!"
    task.wait(1)
    BtnKey.Text = "Pegar Key"
end)

BtnEntrar.MouseButton1Click:Connect(function()
    if Validar(TextBox.Text) then
        BtnEntrar.Text = "Ok!"
        local s, content = pcall(function() return game:HttpGet(ScriptOriginal) end)
        if s then
            ScreenGui:Destroy()
            
            local MobileGui = Instance.new("ScreenGui", game.CoreGui)
            local OpenBtn = Instance.new("TextButton", MobileGui)
            OpenBtn.Size = UDim2.new(0, 45, 0, 45)
            OpenBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
            OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            OpenBtn.Text = "C"
            OpenBtn.TextColor3 = Color3.fromRGB(170, 0, 255)
            OpenBtn.Font = Enum.Font.LuckiestGuy
            OpenBtn.TextSize = 25
            Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)
            local st = Instance.new("UIStroke", OpenBtn)
            st.Color = Color3.fromRGB(170, 0, 255)
            st.Thickness = 2
            
            -- Draggable
            local dragging, dragStart, startPos
            OpenBtn.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true; dragStart = input.Position; startPos = OpenBtn.Position
                end
            end)
            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local delta = input.Position - dragStart
                    OpenBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            end)
            OpenBtn.InputEnded:Connect(function() dragging = false end)

            _G.CheozPermitido = "CHEOZ_AUTH_9921" 

            -- DISPARA O EVENTO PARA O MENU
            OpenBtn.MouseButton1Click:Connect(function()
                _G.CheozEvent:Fire()
            end)

            task.defer(function()
                local func = loadstring(content)
                if func then func() end
            end)
        end
    end
end)
