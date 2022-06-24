--[[

    Mediorce Command library

    By NotRllyRn <3

]]

local Error_Metatable = {
    __index = {
        __ERROR = nil
    },
    __newindex = function(self, i, v)
        if self.__ERROR then
            return
        elseif i == "__ERROR" then
            rawset(self, i, v)
        end
    end
}
local Error_Handler = {
    CreateError = function(self, message)
        local error = setrawmetatable({}, Error_Metatable)
        error.__ERROR = message

        return error
    end,
}

local Command_Metatable = {
    __index = {
        Fire = function(self, ...)
            local success, output = pcall(function(...)
                local args_out = {self.Function(...)}
                return args_out
            end)

            if not success then
                return Error_Handler:CreateError(output)
            else
                return output
            end
        end,
        AddAlias = function(self, list)
            if not list or not (type(list) == "string" or type(list) == "table") then
                return Error_Handler:CreateError("No alias(es) to asign to command.")
            end

            if type(list) == "table" then
                if #list == 0 then
                    return Error_Handler:CreateError("No alias(es) to asign command.")
                else
                    local before = #self.Aliases
                    for _, name in ipairs(list) do
                        if name and type(name) == "string" and not self:CheckAlias(name) then
                            table.insert(self.Aliases, name)
                        end
                    end
                    if #self.Aliases == before then
                        return Error_Handler:CreateError("No alias(es) found.")
                    end
                end
            else
                if not self:CheckAlias(list) then
                    table.insert(self.Aliases, list)
                elseif self:CheckAlias(list) then
                    return Error_Handler:CreateError("Alias(es) already exist in command.")
                end
            end
        end,
        RemoveAlias = function(self, list)
            if not list or not (type(list) == "string" or type(list) == "table") then
                return Error_Handler:CreateError("No alias(es) to remove from command.")
            end
            if #self.Aliases == 1 then
                return Error_Handler:CreateError("Atleast 1 alias must remain in the command.")
            end

            if type(list) == "table" then
                if #list == 0 then
                    return Error_Handler:CreateError("No alias(es) to asign command.")
                else
                    local before = #self.Aliases
                    for _, name in ipairs(list) do
                        local position = self:CheckAlias(name)
                        if name and type(name) == "string" and position and type(position) == "number" then
                            table.remove(self.Aliases, position)
                        end
                    end
                    if #self.Aliases == before then
                        return Error_Handler:CreateError("No alias(es) found.")
                    end
                end
            else
                local position = self:CheckAlias(list)
                if position and type(position) == "number" then
                    table.remove(self.Aliases, position)
                else
                    return Error_Handler:CreateError("Alias(es) already exist in command.")
                end
            end
        end,
        Function = function() end,
        Aliases = {},
        CheckAlias = function(self, name)
            if not name or type(name) ~= "string" then
                return Error_Handler:CreateError("Valid alias is needed.")
            end

            for position, alias in ipairs(self.Aliases) do
                if alias == name:lower() then
                    return position
                end
            end
        end,
    }
}
local Handler_Metatable = {
    __index = {
        Commands = {},
        AddCommand = function(self, alias, func)
            if not func or not alias or type(func) ~= "function" or not (type(alias) == "string" or type(alias) == "table") then
                return warn("Valid alias(es) and function is needed.")
            end

            if not self:GetCommand(alias) then
                local Command = setmetatable({}, Command_Metatable)
                Command.Function = func
                local output = Command:AddAlias(alias)
                if output and output.__ERROR then
                    return warn(output.__ERROR)
                end

                table.insert(self.Commands, Command)
            else
                return warn("Command with provided alias(es) already exist.")
            end
        end,
        RemoveCommand = function(self, alias)
            if not alias or type(alias) ~= "string" then
                return warn("Valid alias needed.")
            end

            local Command = self:GetCommand(alias) 
            if Command then
                table.remove(self.Commands, table.find(self.Commands, Command))
            else
                return warn("Failed to find command, check the alias(es).")
            end
        end,
        GetCommand = function(self, alias)
            if not alias or not (type(alias) == "string" or type(alias) == "table") then
                return warn("Valid alias(es) is needed.")
            end

            local alias_to_checks = type(alias) == "table" and alias or { alias }
            for _, al in ipairs(alias_to_checks) do
                if not al or type(al) ~= "string" then
                    table.remove(alias_to_checks, table.find(alias_to_checks, al))
                end
            end

            for _, Command in ipairs(self.Commands) do
                for _, alias in ipairs(alias_to_checks) do
                    if Command:CheckAlias(alias) then
                        return Command
                    end
                end
            end
        end,
        EditCommand = function(self, cmdAlias, alias, func)
            local alias = alias and type(alias) == "table" and alias or alias and type(alias) == "string" and alias or nil
            local func = func and type(func) == "function" and func or nil

            local Command = self:GetCommand(cmdAlias)
            if Command then
                if alias then
                    local old_Alias = Command.Alias

                    Command.Alias = {}
                    local output = Command:AddAlias(alias)
                    if output and output.__ERROR then
                        warn(output.__ERROR)
                        Command.Alias = old_Alias
                    end
                end

                if func then
                    Command.Function = func
                end
            else
                return warn("Command not found, check the alias(es).")
            end
        end,
        Prefix = ";",
        AddCommandAlias = function(self, cmdAlias, aliases)
            if not cmdAlias or not aliases or not (type(aliases) == "string" or type(aliases) == "table") or not (type(cmdAlias) == "string" or type(cmdAlias) == "table") then
                return warn("Valid alias(es) and command alias(es) is needed.")
            end

            local Command = self:GetCommand(cmdAlias)
            if Command then
                local output = Command:AddAlias(aliases)
                if output and output.__ERROR then
                    return warn(output.__ERROR)
                end
            else
                return warn("Command not found, check the alias(es).")
            end
        end,
        RemoveCommandAlias = function(self, cmdAlias, aliases)
            if not cmdAlias or not aliases or not (type(aliases) == "string" or type(aliases) == "table") or not (type(cmdAlias) == "string" or type(cmdAlias) == "table") then
                return warn("Valid alias(es) and command alias(es) is needed.")
            end

            local Command = self:GetCommand(cmdAlias)
            if Command then
                local output = Command:RemoveAlias(aliases)
                if output and output.__ERROR then
                    return warn(output.__ERROR)
                end
            else
                return warn("Command not found, check the alias(es).")
            end
        end,
        Input = function(self, str)
            if not str or type(str) == "string" then
                return warn("Input has to be a string.")
            end

            local startsWith = str:sub(1,1)
            local parts = str:sub(2, -1):split(" ")

            if startsWith == self.Prefix and #parts > 0 then
                local Alias = table.remove(parts, 1)
                local Command = self:GetCommand(Alias)

                if Command then
                    local output = Command:Fire(table.unpack(parts))
                    if output and type(output) == "table" and output.__ERROR then
                        return warn(output.__ERROR)
                    else
                        return output
                    end
                end
            end
        end
    }
}

return {
    CreateCommandHandler = function(self, prefix)
        local Handler = setmetatable({}, Handler_Metatable)
        Handler.Prefix = prefix or Handler.Prefix

        return Handler
    end,
}