-- [[ CHEOZ LOADER MOBILE - PROTECTED ]]

local _0xK1 = {
    -- A chave e o link agora estão codificados para ninguém copiar direto
    ["\67\104\97\118\101"] = "\67\72\69\79\90\95\79\70\70\73\67\73\65\76\95\50\48\50\54", 
    ["\76\105\110\107"] = "\104\116\116\112\115\58\47\47\119\111\114\107\46\105\110\107\47\50\104\52\90\47\99\104\101\111\122\45\109\101\110\117\45\102\101\121\45\115\121\115\116\101\109" 
}

local function _0xStart()
    _G.CheozPermitido = "\67\72\69\79\90\95\65\85\84\72\95\57\57\50\49"
    local _0xURL = "\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\67\104\101\111\122\122\47\77\69\78\85\45\77\79\66\73\76\69\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\77\97\105\110\46\108\117\97"
    loadstring(game:HttpGet(_0xURL))()
end

local _0xGUI = Instance.new("\83\99\114\101\101\110\71\117\105", (gethui and gethui()) or game:GetService("\67\111\114\101\71\117\105"))
local _0xMF = Instance.new("\70\114\97\109\101", _0xGUI)
_0xMF.Size = UDim2.new(0, 300, 0, 180)
_0xMF.Position = UDim2.new(0.5, -150, 0.4, -90)
_0xMF.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("\85\73\67\111\114\110\101\114", _0xMF)
local _0xST = Instance.new("\85\73\83\116\114\111\107\101", _0xMF)
_0xST.Color = Color3.fromRGB(170, 0, 255)
_0xST.Thickness = 2

local _0xTT = Instance.new("\84\101\120\116\76\97\98\101\108", _0xMF)
_0xTT.Size = UDim2.new(1, 0, 0, 40)
_0xTT.Text = "\67\72\69\79\90\32\75\69\89\32\83\89\83\84\69\77"
_0xTT.TextColor3 = Color3.fromRGB(170, 0, 255)
_0xTT.Font = Enum.Font.LuckiestGuy
_0xTT.TextSize = 20
_0xTT.BackgroundTransparency = 1

local _0xTB = Instance.new("\84\101\120\116\66\111\120", _0xMF)
_0xTB.Size = UDim2.new(0.8, 0, 0, 35)
_0xTB.Position = UDim2.new(0.1, 0, 0.3, 0)
_0xTB.PlaceholderText = "\73\110\115\105\114\97\32\97\32\75\101\121\32\97\113\117\105\46\46\46"
_0xTB.Text = ""
_0xTB.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
_0xTB.TextColor3 = Color3.new(1, 1, 1)
Instance.new("\85\73\67\111\114\110\101\114", _0xTB)

local _0xVB = Instance.new("\84\101\120\116\66\117\116\116\111\110", _0xMF)
_0xVB.Size = UDim2.new(0.35, 0, 0, 35)
_0xVB.Position = UDim2.new(0.1, 0, 0.6, 0)
_0xVB.Text = "\86\69\82\73\70\73\67\65\82"
_0xVB.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
_0xVB.TextColor3 = Color3.new(1, 1, 1)
_0xVB.Font = Enum.Font.GothamBold
Instance.new("\85\73\67\111\114\110\101\114", _0xVB)

local _0xGB = Instance.new("\84\101\120\116\66\117\116\116\111\110", _0xMF)
_0xGB.Size = UDim2.new(0.35, 0, 0, 35)
_0xGB.Position = UDim2.new(0.55, 0, 0.6, 0)
_0xGB.Text = "\71\69\84\32\75\69\89"
_0xGB.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
_0xGB.TextColor3 = Color3.new(1, 1, 1)
_0xGB.Font = Enum.Font.GothamBold
Instance.new("\85\73\67\111\114\110\101\114", _0xGB)

_0xGB.MouseButton1Click:Connect(function()
    setclipboard(_0xK1["\76\105\110\107"])
    _0xGB.Text = "\67\79\80\73\65\68\79\33"
    task.wait(2)
    _0xGB.Text = "\71\69\84\32\75\69\89"
end)

_0xVB.MouseButton1Click:Connect(function()
    if _0xTB.Text == _0xK1["\67\104\97\118\101"] then
        _0xGUI:Destroy()
        _0xStart()
    else
        _0xTB.Text = ""
        _0xTB.PlaceholderText = "\75\69\89\32\73\78\86\193\76\73\68\65\33"
        task.wait(1)
        _0xTB.PlaceholderText = "\73\110\115\105\114\97\32\97\32\75\101\121\32\97\113\117\105\46\46\46"
    end
end)
