local arg = ({...})

local function setname()
    local v = RandomNameNumber(10,20)
    if (_G[v] == false) or (_G[v] == true) then
        v = RandomNameNumber(10,20)
        
        setname()
    else
        _G[v] = false
        return v
    end
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/GuiLib.lua"))()

local globalNames = {}

do
    local window = lib:CreateWindow("Strongest Punch Simulator")

    window:CreateButton("Copy Discord Link",function()
        setclipboard("https://discord.gg/zpFpWqBqCn")
    end)
    for _,v in pairs(arg) do
        setName = setname()
        globalNames[arg[1]] = setName
        window:CreateToggle(arg[1],function(val)
            _G[setName] = val
        end)
    end
end

return globalNames
