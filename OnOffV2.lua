local arg = ({...})

local title = arg[1] or ""

assert(type(title) == "string")

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
    local window = lib:CreateWindow(title)

    window:CreateButton("Copy Discord Link",function()
        setclipboard("https://discord.gg/zpFpWqBqCn")
    end)
    for _,v in pairs(arg[2]) do
        setName = setname()
        globalNames[v[1]] = setName
        window:CreateToggle(v[1],function(val)
            _G[setName] = val
        end)
    end
end

return globalNames
