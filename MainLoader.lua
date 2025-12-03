local gameID = game.GameId

local scripts = {
    [2232507648] = "https://raw.githubusercontent.com/minh597/Egg/refs/heads/main/Loader/untitledAttackOnTitan.lua",
    [210851291] = "https://raw.githubusercontent.com/minh597/Egg/refs/heads/main/Loader/BuildABoatForTreasure.lua"
}

if scripts[gameID] then
    loadstring(game:HttpGet(scripts[gameID]))()
else
    local player = game.Players.LocalPlayer
    player:Kick("Haven't support this game yet !")
end
