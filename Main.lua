-- [[ CHEOZ MENU - MAIN LOADER ]] --
local LinkDaKey = "https://work.ink/2h4Z/cheoz-menu-key-system" 
local ScriptOriginal = "https://raw.githubusercontent.com/Cheozz/MENU-MOBILE/refs/heads/main/Loader.lua"

if not _G.CheozEvent then _G.CheozEvent = Instance.new("BindableEvent") end

local function Validar(v_key)
    local url = "https://work.ink/_api/v2/token/isValid/" .. v_key
    local success, response = pcall(function() return game:HttpGet(url) end)
    return success and response:find('"valid":true')
end

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.ResetOnSpawn = false
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0.5, -125, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("UICorner", Frame)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "CHEOZ MENU"
Title.Size = UDim2.new(1, 0, 0, 35)
Title.TextColor3 = Color3.fromRGB(170, 0, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.LuckiestGuy
Title.TextSize = 20

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

BtnKey.MouseButton1Click:Connect(function() setclipboard(LinkDaKey); BtnKey.Text = "Copiado!" end)

BtnEntrar.MouseButton1Click:Connect(function()
    if Validar(TextBox.Text) then
        ScreenGui:Destroy()
        
        -- ICONE FIXO "C"
        local MobileGui = Instance.new("ScreenGui", game.CoreGui)
        MobileGui.ResetOnSpawn = false
        local OpenBtn = Instance.new("TextButton", MobileGui)
        OpenBtn.Size = UDim2.new(0, 50, 0, 50)
        OpenBtn.Position = UDim2.new(0.02, 0, 0.4, 0)
        OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        OpenBtn.Text = "C"
        OpenBtn.TextColor3 = Color3.fromRGB(170, 0, 255)
        OpenBtn.Font = Enum.Font.LuckiestGuy
        OpenBtn.TextSize = 28
        Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)
        local st = Instance.new("UIStroke", OpenBtn)
        st.Color = Color3.fromRGB(170, 0, 255); st.Thickness = 2

        _G.CheozPermitido = "CHEOZ_AUTH_9921" 
        OpenBtn.MouseButton1Click:Connect(function() _G.CheozEvent:Fire() end)

        local s, content = pcall(function() return game:HttpGet(ScriptOriginal) end)
        if s then loadstring(content)() end
    end
end)
