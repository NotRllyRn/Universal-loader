local args = ({...})

local pf = args[1]
local Main = {}
local cmds = {}

function Main:createCommand(name, func)
	cmds[string.lower(name)] = func
end

function Main:init()
	setmetatable(cmds, {
		__newindex = function() end,
	})
	setmetatable(Main, {
		__index = cmds,
		__newindex = function() end,
	})
end

function Main:Fire(string_1)
    if (string.sub(string_1,1,1) == pf) then
		local parts = string.split(string.sub(string_1,2,-1)," ")
        local cmdName = string.lower(parts[1])
        if Main[cmdName] then
			table.remove(parts,1)
			Main[cmdName](parts)
		end
    end
    return nil
end

return Main