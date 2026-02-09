-- [[ CHEOZ MENU - SECURE LOADER ]] --
local LinkDaKey = "https://work.ink/2h4Z/cheoz-menu-key-system" 
local ScriptOriginal = "https://raw.githubusercontent.com/Cheozz/CheozMenu/refs/heads/main/Loader"

local function Validar(v_key)
    local url = "https://work.ink/_api/v2/token/isValid/" .. v_key
    local success, response = pcall(function() return game:HttpGet(url) end)
    return success and response:find('"valid":true')
end

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "Check_" .. math.random(100,999)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0.5, -125, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("UICorner", Frame)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "CHEOZ MENU"
Title.Size = UDim2.new(1, 0, 0, 35)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(0, 200, 0, 30); TextBox.Position = UDim2.new(0.5, -100, 0.35, 0)
TextBox.PlaceholderText = "Cole a Key aqui..."
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30); TextBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TextBox)

local BtnEntrar = Instance.new("TextButton", Frame)
BtnEntrar.Size = UDim2.new(0, 90, 0, 30); BtnEntrar.Position = UDim2.new(0.15, 0, 0.7, 0)
BtnEntrar.Text = "Entrar"; BtnEntrar.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
Instance.new("UICorner", BtnEntrar)

local BtnKey = Instance.new("TextButton", Frame)
BtnKey.Size = UDim2.new(0, 90, 0, 30); BtnKey.Position = UDim2.new(0.55, 0, 0.7, 0)
BtnKey.Text = "Pegar Key"; BtnKey.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
Instance.new("UICorner", BtnKey)

BtnKey.MouseButton1Click:Connect(function() setclipboard(LinkDaKey); BtnKey.Text = "Copiado!" end)

BtnEntrar.MouseButton1Click:Connect(function()
    if Validar(TextBox.Text) then
        ScreenGui:Destroy()
        _G.CheozPermitido = "CHEOZ_AUTH_9921" 
        local s, content = pcall(function() return game:HttpGet(ScriptOriginal) end)
        if s then loadstring(content)() end
    else
        BtnEntrar.Text = "Inválida!"
    end
end)
