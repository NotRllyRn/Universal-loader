local all
all = {
    NoYield = (function()
--!nocheck

--[[
	Calls a function and throws an error if it attempts to yield.

	Pass any number of arguments to the function after the callback.

	This function supports multiple return; all results returned from the
	given function will be returned.
]]

local function resultHandler(co, ok, ...)
	if not ok then
		local message = (...)
		error(debug.traceback(co, message), 2)
	end

	if coroutine.status(co) ~= "dead" then
		error(debug.traceback(co, "Attempted to yield inside changed event!"), 2)
	end

	return ...
end

local function NoYield(callback, ...)
	local co = coroutine.create(callback)

	return resultHandler(co, coroutine.resume(co, ...))
end

return NoYield
    end)(),
    Signal = (function()
--[[
	A limited, simple implementation of a Signal.

	Handlers are fired in order, and (dis)connections are properly handled when
	executing an event.
]]
local function immutableAppend(list, ...)
	local new = {}
	local len = #list

	for key = 1, len do
		new[key] = list[key]
	end

	for i = 1, select("#", ...) do
		new[len + i] = select(i, ...)
	end

	return new
end

local function immutableRemoveValue(list, removeValue)
	local new = {}

	for i = 1, #list do
		if list[i] ~= removeValue then
			table.insert(new, list[i])
		end
	end

	return new
end

local Signal = {}

Signal.__index = Signal

function Signal.new(store)
	local self = {
		_listeners = {},
		_store = store
	}

	setmetatable(self, Signal)

	return self
end

function Signal:connect(callback)
	if typeof(callback) ~= "function" then
		error("Expected the listener to be a function.")
	end

	if self._store and self._store._isDispatching then
		error(
			'You may not call store.changed:connect() while the reducer is executing. ' ..
				'If you would like to be notified after the store has been updated, subscribe from a ' ..
				'component and invoke store:getState() in the callback to access the latest state. '
		)
	end

	local listener = {
		callback = callback,
		disconnected = false,
		connectTraceback = debug.traceback(),
		disconnectTraceback = nil
	}

	self._listeners = immutableAppend(self._listeners, listener)

	local function disconnect()
		if listener.disconnected then
			error((
				"Listener connected at: \n%s\n" ..
				"was already disconnected at: \n%s\n"
			):format(
				tostring(listener.connectTraceback),
				tostring(listener.disconnectTraceback)
			))
		end

		if self._store and self._store._isDispatching then
			error("You may not unsubscribe from a store listener while the reducer is executing.")
		end

		listener.disconnected = true
		listener.disconnectTraceback = debug.traceback()
		self._listeners = immutableRemoveValue(self._listeners, listener)
	end

	return {
		disconnect = disconnect
	}
end

function Signal:fire(...)
	for _, listener in ipairs(self._listeners) do
		if not listener.disconnected then
			listener.callback(...)
		end
	end
end

return Signal
    end)(),
    combineReducers = (function()
--[[
	Create a composite reducer from a map of keys and sub-reducers.
]]
local function combineReducers(map)
	return function(state, action)
		-- If state is nil, substitute it with a blank table.
		if state == nil then
			state = {}
		end

		local newState = {}

		for key, reducer in pairs(map) do
			-- Each reducer gets its own state, not the entire state table
			newState[key] = reducer(state[key], action)
		end

		return newState
	end
end

return combineReducers
    end)(),
    createReducer = (function()
        return function(initialState, handlers)
            return function(state, action)
                if state == nil then
                    state = initialState
                end
        
                local handler = handlers[action.type]
        
                if handler then
                    return handler(state, action)
                end
        
                return state
            end
        end        
    end)(),
    makeActionCreator = (function()
--[[
	A helper function to define a Rodux action creator with an associated name.
]]
local function makeActionCreator(name, fn)
	assert(type(name) == "string", "Bad argument #1: Expected a string name for the action creator")

	assert(type(fn) == "function", "Bad argument #2: Expected a function that creates action objects")

	return setmetatable({
		name = name,
	}, {
		__call = function(self, ...)
			local result = fn(...)

			assert(type(result) == "table", "Invalid action: An action creator must return a table")

			result.type = name

			return result
		end
	})
end

return makeActionCreator
    end)(),
    makeThunkMiddleware = (function()
--[[
	A middleware that allows for functions to be dispatched with an extra
	argument for convenience. Functions will receive two arguments:
	the store itself and the extra argument provided initially to makeThunkMiddleware.
	This middleware consumes the function; middleware further down the chain
	will not receive it.
]]
local function tracebackReporter(message)
	return debug.traceback(message)
end

local function makeThunkMiddleware(extraArgument)
	local function thunkMiddleware(nextDispatch, store)
		return function(action)
			if typeof(action) == "function" then
				local ok, result = xpcall(function()
					return action(store, extraArgument)
				end, tracebackReporter)

				if not ok then
					-- report the error and move on so it's non-fatal app
					store._errorReporter.reportReducerError(store:getState(), action, {
						message = "Caught error in thunk",
						thrownValue = result,
					})
					return nil
				end

				return result
			end

			return nextDispatch(action)
		end
	end

	return thunkMiddleware
end

return makeThunkMiddleware
    end)(),
    prettyPrint = (function()
        local indent = "    "

        local function prettyPrint(value, indentLevel)
            indentLevel = indentLevel or 0
            local output = {}
        
            if typeof(value) == "table" then
                table.insert(output, "{\n")
        
                for tableKey, tableValue in pairs(value) do
                    table.insert(output, indent:rep(indentLevel + 1))
                    table.insert(output, tostring(tableKey))
                    table.insert(output, " = ")
        
                    table.insert(output, prettyPrint(tableValue, indentLevel + 1))
                    table.insert(output, "\n")
                end
        
                table.insert(output, indent:rep(indentLevel))
                table.insert(output, "}")
            elseif typeof(value) == "string" then
                table.insert(output, string.format("%q", value))
                table.insert(output, " (string)")
            else
                table.insert(output, tostring(value))
                table.insert(output, " (")
                table.insert(output, typeof(value))
                table.insert(output, ")")
            end
        
            return table.concat(output, "")
        end
        
        return prettyPrint
    end)(),
    thunkMiddleware = (function()
--[[
	A middleware that allows for functions to be dispatched.
	Functions will receive a single argument, the store itself.
	This middleware consumes the function; middleware further down the chain
	will not receive it.
]]
local function tracebackReporter(message)
	return debug.traceback(message)
end

local function thunkMiddleware(nextDispatch, store)
	return function(action)
		if typeof(action) == "function" then
			local ok, result = xpcall(function()
				return action(store)
			end, tracebackReporter)

			if not ok then
				-- report the error and move on so it's non-fatal app
				store._errorReporter.reportReducerError(store:getState(), action, {
					message = "Caught error in thunk",
					thrownValue = result,
				})
				return nil
			end

			return result
		end

		return nextDispatch(action)
	end
end

return thunkMiddleware
    end)(),
}
all.Store = (function()
    local RunService = game:GetService("RunService")

    local Signal = all.Signal
    local NoYield = all.NoYield
    
    local ACTION_LOG_LENGTH = 3
    
    local rethrowErrorReporter = {
        reportReducerError = function(prevState, action, errorResult)
            error(string.format("Received error: %s\n\n%s", errorResult.message, errorResult.thrownValue))
        end,
        reportUpdateError = function(prevState, currentState, lastActions, errorResult)
            error(string.format("Received error: %s\n\n%s", errorResult.message, errorResult.thrownValue))
        end,
    }
    
    local function tracebackReporter(message)
        return debug.traceback(tostring(message))
    end
    
    local Store = {}
    
    -- This value is exposed as a private value so that the test code can stay in
    -- sync with what event we listen to for dispatching the Changed event.
    -- It may not be Heartbeat in the future.
    Store._flushEvent = RunService.Heartbeat
    
    Store.__index = Store
    
    --[[
        Create a new Store whose state is transformed by the given reducer function.
    
        Each time an action is dispatched to the store, the new state of the store
        is given by:
    
            state = reducer(state, action)
    
        Reducers do not mutate the state object, so the original state is still
        valid.
    ]]
    function Store.new(reducer, initialState, middlewares, errorReporter)
        assert(typeof(reducer) == "function", "Bad argument #1 to Store.new, expected function.")
        assert(middlewares == nil or typeof(middlewares) == "table", "Bad argument #3 to Store.new, expected nil or table.")
        if middlewares ~= nil then
            for i=1, #middlewares, 1 do
                assert(
                    typeof(middlewares[i]) == "function",
                    ("Expected the middleware ('%s') at index %d to be a function."):format(tostring(middlewares[i]), i)
                )
            end
        end
    
        local self = {}
    
        self._errorReporter = errorReporter or rethrowErrorReporter
        self._isDispatching = false
        self._reducer = reducer
        local initAction = {
            type = "@@INIT",
        }
        self._actionLog = { initAction }
        local ok, result = xpcall(function()
            self._state = reducer(initialState, initAction)
        end, tracebackReporter)
        if not ok then
            self._errorReporter.reportReducerError(initialState, initAction, {
                message = "Caught error in reducer with init",
                thrownValue = result,
            })
            self._state = initialState
        end
        self._lastState = self._state
    
        self._mutatedSinceFlush = false
        self._connections = {}
    
        self.changed = Signal.new(self)
    
        setmetatable(self, Store)
    
        local connection = self._flushEvent:Connect(function()
            self:flush()
        end)
        table.insert(self._connections, connection)
    
        if middlewares then
            local unboundDispatch = self.dispatch
            local dispatch = function(...)
                return unboundDispatch(self, ...)
            end
    
            for i = #middlewares, 1, -1 do
                local middleware = middlewares[i]
                dispatch = middleware(dispatch, self)
            end
    
            self.dispatch = function(_self, ...)
                return dispatch(...)
            end
        end
    
        return self
    end
    
    --[[
        Get the current state of the Store. Do not mutate this!
    ]]
    function Store:getState()
        if self._isDispatching then
            error(("You may not call store:getState() while the reducer is executing. " ..
                "The reducer (%s) has already received the state as an argument. " ..
                "Pass it down from the top reducer instead of reading it from the store."):format(tostring(self._reducer)))
        end
    
        return self._state
    end
    
    --[[
        Dispatch an action to the store. This allows the store's reducer to mutate
        the state of the application by creating a new copy of the state.
    
        Listeners on the changed event of the store are notified when the state
        changes, but not necessarily on every Dispatch.
    ]]
    function Store:dispatch(action)
        if typeof(action) ~= "table" then
            error(("Actions must be tables. " ..
                "Use custom middleware for %q actions."):format(typeof(action)),
                2
            )
        end
    
        if action.type == nil then
            error("Actions may not have an undefined 'type' property. " ..
                "Have you misspelled a constant? \n" ..
                tostring(action), 2)
        end
    
        if self._isDispatching then
            error("Reducers may not dispatch actions.")
        end
    
        local ok, result = pcall(function()
            self._isDispatching = true
            self._state = self._reducer(self._state, action)
            self._mutatedSinceFlush = true
        end)
    
        self._isDispatching = false
    
        if not ok then
            self._errorReporter.reportReducerError(
                self._state,
                action,
                {
                    message = "Caught error in reducer",
                    thrownValue = result,
                }
            )
        end
    
        if #self._actionLog == ACTION_LOG_LENGTH then
            table.remove(self._actionLog, 1)
        end
        table.insert(self._actionLog, action)
    end
    
    --[[
        Marks the store as deleted, disconnecting any outstanding connections.
    ]]
    function Store:destruct()
        for _, connection in ipairs(self._connections) do
            connection:Disconnect()
        end
    
        self._connections = nil
    end
    
    --[[
        Flush all pending actions since the last change event was dispatched.
    ]]
    function Store:flush()
        if not self._mutatedSinceFlush then
            return
        end
    
        self._mutatedSinceFlush = false
    
        -- On self.changed:fire(), further actions may be immediately dispatched, in
        -- which case self._lastState will be set to the most recent self._state,
        -- unless we cache this value first
        local state = self._state
    
        local ok, errorResult = xpcall(function()
            -- If a changed listener yields, *very* surprising bugs can ensue.
            -- Because of that, changed listeners cannot yield.
            NoYield(function()
                self.changed:fire(state, self._lastState)
            end)
        end, tracebackReporter)
    
        if not ok then
            self._errorReporter.reportUpdateError(
                self._lastState,
                state,
                self._actionLog,
                {
                    message = "Caught error flushing store updates",
                    thrownValue = errorResult,
                }
            )
        end
    
        self._lastState = state
    end
    
    return Store        
end)()
all.loggerMiddleware = (function()
    -- We want to be able to override outputFunction in tests, so the shape of this
    -- module is kind of unconventional.
    --
    -- We fix it this weird shape in init.lua.
    local prettyPrint = all.prettyPrint
    local loggerMiddleware = {
        outputFunction = print,
    }
    
    function loggerMiddleware.middleware(nextDispatch, store)
        return function(action)
            local result = nextDispatch(action)
    
            loggerMiddleware.outputFunction(("Action dispatched: %s\nState changed to: %s"):format(
                prettyPrint(action),
                prettyPrint(store:getState())
            ))
    
            return result
        end
    end
    
    return loggerMiddleware
end)()

local Store = all.Store
local createReducer = all.createReducer
local combineReducers = all.combineReducers
local makeActionCreator = all.makeActionCreator
local loggerMiddleware = all.loggerMiddleware
local thunkMiddleware = all.thunkMiddleware

return {
	Store = Store,
	createReducer = createReducer,
	combineReducers = combineReducers,
	makeActionCreator = makeActionCreator,
	loggerMiddleware = loggerMiddleware.middleware,
	thunkMiddleware = thunkMiddleware,
}
