if getgenv().XDOORS_Loaded then
    return 
end

local GameId = 2440500124
local LobbyPlaceId = 6516141723

if game.GameId ~= GameId then
    return
end

if game.PlaceId == LobbyPlaceId then
    return
end

getgenv().XDOORS_Loaded = true

getgenv().Abysall = {
    Legit = true
}

local BaseUrl = "https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/"
local MyUrl = "https://raw.githubusercontent.com/dimoonsh195/xdoors/main/main.lua"

getgenv().Abysall = {
    Environment = loadstring(game:HttpGet(BaseUrl .. "Components/Environment.luau"))(),
    ESPLibrary = loadstring(game:HttpGet(BaseUrl .. "Components/ESP.luau"))(),
    Legit = true,
}

local function CloneReference(Object)
    if Abysall and Abysall.Environment.cloneref then
        return Abysall.Environment.cloneref(Object)
    else
        return Object
    end
end

local Services = setmetatable({}, {
    __index = function(self, Name)
        return CloneReference(game:GetService(Name))
    end
})

getgenv().Abysall.Interface = loadstring(game:HttpGet(BaseUrl .. "Components/Interface.luau"))()

-- XDOORS
loadstring(game:HttpGet(MyUrl))()
