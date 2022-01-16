local args = { ... }

local pf = string.lower(({ ... })[1])
local Main = {}
local cmds = {}

function Main:createCommand(name, func)
	assert(name and ((type(name) == "string") or (type(name) == "table")))
	assert(func and (type(func) == "function"))
	if type(name) == "string" then
		cmds[pf .. string.lower(name)] = func
	else
		for _, name1 in ipairs(name) do
			if name1 and (type(name1) == "string") then
				cmds[pf .. string.lower(name1)] = func
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
	local parts = assert(string_1 and (type(string_1) == "string") and string.split(string_1, " "))
	local cmdName = (parts and parts[1] and string.lower(parts[1]))
	if cmdName and Main[cmdName] then
		table.remove(parts, 1)
		Main[cmdName](parts)
	end
	return nil
end

return Main
