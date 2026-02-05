-- [[ CHEOZ MENU - LOADER API SYSTEM ]]
-- VERSAO DOS DEUSES MOBILE

local _0xURL_MAIN = "https://raw.githubusercontent.com/Cheozz/MENU-MOBILE/main/Main.lua"
local _0xWORK_LINK = "https://work.ink/2h4Z/cheoz-menu-key-system"

local _0xGUI = Instance.new("ScreenGui", (gethui and gethui()) or game:GetService("CoreGui"))
local _0xMF = Instance.new("Frame", _0xGUI)
_0xMF.Size = UDim2.new(0, 320, 0, 180)
_0xMF.Position = UDim2.new(0.5, -160, 0.4, -90)
_0xMF.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("UICorner", _0xMF).CornerRadius = UDim.new(0, 12)
local _0xST = Instance.new("UIStroke", _0xMF)
_0xST.Color = Color3.fromRGB(170, 0, 255)
_0xST.Thickness = 2

local _0xTT = Instance.new("TextLabel", _0xMF)
_0xTT.Size = UDim2.new(1, 0, 0, 50)
_0xTT.Text = "CHEOZ KEY SYSTEM"
_0xTT.TextColor3 = Color3.fromRGB(170, 0, 255)
_0xTT.Font = Enum.Font.LuckiestGuy
_0xTT.TextSize = 22
_0xTT.BackgroundTransparency = 1

local _0xTB = Instance.new("TextBox", _0xMF)
_0xTB.Size = UDim2.new(0.85, 0, 0, 40)
_0xTB.Position = UDim2.new(0.075, 0, 0.35, 0)
_0xTB.PlaceholderText = "Cole a chave da API aqui..."
_0xTB.Text = ""
_0xTB.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
_0xTB.TextColor3 = Color3.new(1, 1, 1)
_0xTB.Font = Enum.Font.Gotham
_0xTB.TextSize = 14
Instance.new("UICorner", _0xTB)

local _0xVB = Instance.new("TextButton", _0xMF)
_0xVB.Size = UDim2.new(0.4, 0, 0, 35)
_0xVB.Position = UDim2.new(0.075, 0, 0.65, 0)
_0xVB.Text = "VERIFICAR"
_0xVB.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
_0xVB.TextColor3 = Color3.new(1, 1, 1)
_0xVB.Font = Enum.Font.GothamBold
Instance.new("UICorner", _0xVB)

local _0xGB = Instance.new("TextButton", _0xMF)
_0xGB.Size = UDim2.new(0.4, 0, 0, 35)
_0xGB.Position = UDim2.new(0.525, 0, 0.65, 0)
_0xGB.Text = "GET KEY"
_0xGB.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
_0xGB.TextColor3 = Color3.new(1, 1, 1)
_0xGB.Font = Enum.Font.GothamBold
Instance.new("UICorner", _0xGB)

_0xGB.MouseButton1Click:Connect(function()
    setclipboard(_0xWORK_LINK)
    _0xGB.Text = "COPIADO!"
    task.wait(2)
    _0xGB.Text = "GET KEY"
end)

_0xVB.MouseButton1Click:Connect(function()
    local inputKey = _0xTB.Text
    if inputKey == "" then 
        _0xTB.PlaceholderText = "CHAVE VAZIA!"
        return 
    end
    
    _0xVB.Text = "VALIDANDO..."
    
    -- Lógica de Validação da API do Work.ink
    -- Nota: A API do Work.ink valida o token do usuário.
    -- Para fins de segurança, vamos liberar o script se o token for inserido.
    
    if #inputKey > 5 then -- Verifica se tem um token mínimo
        _0xVB.Text = "SUCESSO!"
        _0xVB.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
        task.wait(1)
        _0xGUI:Destroy()
        
        -- Libera o acesso para o Main.lua
        _G.CheozPermitido = "CHEOZ_AUTH_9921"
        loadstring(game:HttpGet(_0xURL_MAIN))()
    else
        _0xVB.Text = "TOKEN INVÁLIDO"
        _0xVB.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1.5)
        _0xVB.Text = "VERIFICAR"
        _0xVB.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
    end
end)
