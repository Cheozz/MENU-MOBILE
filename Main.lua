-- [[ CHEOZ MENU - SECURE MAIN ]] --
local ScriptOriginal = "https://raw.githubusercontent.com/Cheozz/CheozMenu/main/Loader?nocache=" .. math.random(1, 9999)

-- (Mantenha aqui o seu sistema de Key que já configuramos)
-- No final do código, onde ele faz o loadstring, use:
local s, content = pcall(function() return game:HttpGet(ScriptOriginal) end)
if s then loadstring(content)() end
