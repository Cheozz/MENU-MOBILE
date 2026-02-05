-- CHEOZ MENU Loader

local LinkDaKey = "https://work.ink/2h4Z/cheoz-menu-key-system" 
local ScriptOriginal = "https://raw.githubusercontent.com/Cheozz/MENU-MOBILE/main/Main.lua"

local function Validar(v_key)
    local url = "https://work.ink/_api/v2/token/isValid/" .. v_key
    local success, response = pcall(function() return game:HttpGet(url) end)
    return success and response:find('"valid":true')
end

local ScreenGui = Instance.new("ScreenGui", (gethui and gethui()) or game:GetService("CoreGui"))
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 180)
Frame.Position = UDim2.new(0.5, -150, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, -15)
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "CHEOZ MENU MOBILE"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(0, 240, 0, 35)
TextBox.Position = UDim2.new(0.5, -120, 0.4, 0)
TextBox.PlaceholderText = "Cole a Key aqui..."
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TextBox)

local BtnEntrar = Instance.new("TextButton", Frame)
BtnEntrar.Size = UDim2.new(0, 110, 0, 35)
BtnEntrar.Position = UDim2.new(0.2, 0, 0.75, 0)
BtnEntrar.Text = "Entrar"
BtnEntrar.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
BtnEntrar.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", BtnEntrar)

local BtnKey = Instance.new("TextButton", Frame)
BtnKey.Size = UDim2.new(0, 110, 0, 35)
BtnKey.Position = UDim2.new(0.55, 0, 0.75, 0)
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
    BtnEntrar.Text = "Validando..."
    if Validar(TextBox.Text) then
        local s, content = pcall(function() return game:HttpGet(ScriptOriginal) end)
        if s then
            ScreenGui:Destroy()
            _G.CheozPermitido = "CHEOZ_AUTH_9921" 
            task.defer(function()
                local func = loadstring(content)
                if func then
                    func()
                else
                    warn("Erro ao carregar o Main.lua")
                end
            end)
        else
            BtnEntrar.Text = "Erro no Link!"
            task.wait(1.5)
            BtnEntrar.Text = "Entrar"
        end
    else
        BtnEntrar.Text = "Key Inválida!"
        task.wait(1.5)
        BtnEntrar.Text = "Entrar"
    end
end)
