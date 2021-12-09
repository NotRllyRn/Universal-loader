local arg = ({...})

local title = arg[1] or ""

assert(type(title) == "string","no")

local function setname()
    local v
    repeat wait()
        v = randomNameNumber(10,20)
    until not ((_G[v] == false) or (_G[v] == true))

    _G[v] = false
    return v
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/GuiLib.lua"))()

do
    local window = lib:CreateWindow(title)

    window:CreateButton("Copy Discord Link",function()
        setclipboard("https://discord.gg/zpFpWqBqCn")
    end)
    print(arg[2])
    for _,v in pairs(arg[2]) do
        print(v)
        print("before")
        setName = setname()
        print(setName)
        window:CreateToggle(v[1],function(val)
            _G[setName] = val
            if val then
                cWrap(function()
                    repeat 
                        wait()
                        v[2]()
                    until not _G[setName]
                end)
            end
        end)
    end
end