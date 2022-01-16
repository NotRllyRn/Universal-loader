local args = ({...})

local pf = args[1]
local Main = {}
local cmds = {}

function Main:createCommand(name, func)
	assert(name and ((type(name) == "string") or (type(name) == "table")))
	assert(func and (type(func) == "function"))
	if (type(name) == "string") then
		cmds[string.lower(name)] = func
	else
		for _, name1 in ipairs(name) do
			if name1 and (type(name1) == "string") then
				cmds[string.lower(name1)] = func
			end
		end
	end
end

function Main:Init()
	setmetatable(cmds, {
		__newindex = function() end,
	})
	setmetatable(Main, {
		__index = cmds,
		__newindex = function() end,
	})
end

function Main:Fire(string_1)
    if (string.sub(string_1,1,string.len(pf)) == pf) then
		local parts = string.split(string.sub(string_1,string.len(pf)+1,-1)," ")
        local cmdName = string.lower(parts[1])
        if Main[cmdName] then
			table.remove(parts,1)
			Main[cmdName](parts)
		end
    end
    return nil
end

return Main