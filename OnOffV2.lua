local arg = ({...})

local title = arg[1] or ""

assert(type(title) == "string","no")

local function setname()
    local v = randomNameNumber(10,20)
    if ((_G[v] == false) or (_G[v] == true)) then
        v = setname()

        _G[v] = false
        return v
    else
        _G[v] = false
        return v
    end
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/GuiLib.lua"))()

local create = {
    ["toggle"] = function(name,func,wind,gName)
        wind:CreateToggle(name,function(val)
            _G[gName] = val
        end)
    end
}

do
    local window = lib:CreateWindow(title)

    window:CreateButton("Copy Discord Link",function()
        setclipboard("https://discord.gg/zpFpWqBqCn")
    end)
    for name,vals in pairs(arg[2]) do
        create[vals[2]](name,vals[1],window,setname())
    end
end