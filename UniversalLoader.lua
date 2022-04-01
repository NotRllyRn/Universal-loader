--[[
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/UniversalLoader.lua"))()

	Universal loader,
	Made for LUAU roblox exploiting.

]]
local Incoming = { ... } --// for incoming input
pcall(function()
	repeat
		wait()
	until game:IsLoaded() --// waits until game is loaded

	function ExploitCheck(name, ...) --// checks if the executor has a function
		local found
		for _, v in pairs({ ... }) do --// go's trhough list of functions
			if v then --// checks if function is valid
				found = v --// if it is valid, sets it to found
				break
			end
		end
		if found then --// if found is valid
			getgenv()[name] = found --// set the name as the global enviorment for the function
		elseif Incoming and Incoming[1] and Incoming[1] == true then --// if the function is not valid and the input is true
			error("Unsupported exploit: " .. name, 1) --// throw an error
		end
	end
	ExploitCheck("getrawmetatable", getrawmetatable) --// checks if getrawmetatable is valid
	ExploitCheck("setreadonly", setreadonly)
	ExploitCheck("getnamecallmethod", getnamecallmethod)
	ExploitCheck("httpRequest", syn and syn.request)
	ExploitCheck("firetouchinterest", firetouchinterest)
	ExploitCheck("writefile", writefile)
	ExploitCheck("readfile", readfile)
	ExploitCheck("isfile", isfile)
	ExploitCheck("makefolder", makefolder)
	ExploitCheck("delfolder", delfolder)
	ExploitCheck("delfile", delfile)
	ExploitCheck("isfolder", isfolder)
	ExploitCheck("protectgui", gethui and function(v) --// for protecting screenguis from being detected 
		v.Parent = gethui() --// sets the gui to the hui so that no other scripts can access it
	end, syn and syn.protect_gui and function(v, parent)
		syn.protect_gui(v) --// protects gui with Synapse's method
		v.Parent = parent --// sets the parent.
	end)

	httpService = game:GetService("HttpService") --// gets the http service
	JSONDecode = function(...) --// decodes json function for easier use
		return (httpService:JSONDecode(...))
	end
	JSONEncode = function(...) --// encodes json function for easier use
		return (httpService:JSONEncode(...))
	end

	local defaultTable = { --// the save table for Universal Loader
		Date = os.date("!*t"), --// makes a date table
		Serverhop = {}, --// serverhop table
	}
	local SaveTable = {} --// makes the input table for loading the script

	if not isfolder("Universal") then --// checks if Universal folder exists
		makefolder("Universal")
		SaveTable = defaultTable
		local Encoded = JSONEncode(SaveTable)
		writefile("Universal/Universal.json", Encoded) --// encodes the save table to a json file
	elseif isfile("Universal/Universal.json") then --// checks if Universal.json exists
		local s = pcall(function() --// tries to load the json file
			SaveTable = JSONDecode(readfile("Universal/Universal.json")) --// decodes the json file and saves it to the save table
		end)
		if not s then
			SaveTable = defaultTable
			local Encoded = JSONEncode(SaveTable)
			writefile("Universal/Universal.json", Encoded) --// encodes the save table to a json file
		else
			for index, _ in pairs(defaultTable) do --// makes the save table the same size as the default table
				if not SaveTable[index] then
					SaveTable = defaultTable
					local Encoded = JSONEncode(SaveTable)
					writefile("Universal/Universal.json", Encoded) --// encodes the save table to a json file
					break
				end
			end
		end
	end

	mathseed = tick() --// sets mathseed
	math.randomseed(mathseed) --// sets randomseed to mathseed

	virtualUser = game:GetService("VirtualUser") --// gets all the services that are useful
	tweenService = game:GetService("TweenService")
	userInput = game:GetService("UserInputService")
	runService = game:GetService("RunService")
	contextAS = game:GetService("ContextActionService")
	virtualIM = game:GetService("VirtualInputManager")
	replicatedS = game:GetService("ReplicatedStorage")
	TPService = game:GetService("TeleportService")
	PhyService = game:GetService("PhysicsService")

	renderS = runService.RenderStepped --// gets the renderstepped event
	heartS = runService.Heartbeat --// gets the heartbeat event

	workspace = game:GetService("Workspace") --// gets the workspace

	function fastWait(n) --// makes a wait function that waits n seconds or 1 heartbeat
		if not n then
			heartS:Wait()
		else
			local n = assert(n and tonumber(n))
			for _ = 1, (n * 60) do --// loops n * 60 times using heartS
				heartS:Wait()
			end
		end
	end

	function copyOver(from, to) --// function that copies from one table to another
		if from and to and type(from) == 'table' and type(to) == 'table' then --// checks if the tables are valid
			for index, value in pairs(from) do --// loops through the table
				if value and type(value) == 'table' then --// checks if the value is a table
					to[index] = {} --// makes a new table
					copyOver(value, to[index]) --// copies the table again
				else
					to[index] = value --// sets the value
				end
			end

		end
	end

	function formatTime(tick) --// formats a tick to a readable time in the format of days:hours:minutes:seconds
		local tick = assert(tick and tonumber(tick)) --// makes sure tick is a number
		local days = math.floor(tick / 86400) --// gets the days
		local hours = math.floor((tick / 3600) % 24) --// gets the hours
		local minutes = math.floor((tick / 60) % 60) --// gets the minutes
		local seconds = math.floor(tick % 60) --// gets the seconds
		return ("%02i:%02i:%02i:%02i"):format(days, hours, minutes, seconds) --// returns the formatted time
	end

	function genName(length) --// generates a random string
		local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
		local str = ""
		for i = 1, length do
			str = str .. chars:sub(math.random(1, #chars), 1)
		end
		return str
	end

	function castRay(start, direct, distance, list, type1, id) --// casts a ray and returns it
		assert(start and (type(start) == "vector")) --// checks if start is a vector
		assert(direct and (type(direct) == "vector")) --// checks if direct is a vector
		local distant = (distant and tonumber(distance)) or 100 --// sets the distance to 100 if not specified
		local type1 = (type1 and tostring(type1)) --// sets the type to nil if not specified

		if start and direct then
			local castprams = RaycastParams.new() --// makes a new raycast params

			if list and type1 then
				castprams.FilterDescendantsInstances = (type(list) == "table" and list) or { list } --// sets the filter to the list if specified
				castprams.FilterType = Enum.RaycastFilterType[type1] --// sets the filter type to the specified type
			end

			if id then
				castprams.CollisionGroup = id --// sets the collision group to the specified id
			end

			local cast = workspace:Raycast(start, direct * distance, castprams) --// casts the ray
			return cast
		end
		return nil
	end

	function cWrap(functioN) --// wraps a function in a coroutine
		return coroutine.resume(coroutine.create(functioN))
	end

	function cButton(indeX) --// clicks on a gui button
		for _, v in pairs(getconnections(indeX.MouseButton1Click)) do
			v:Function()
		end
	end

	function antiLAG() --// runs anti lag
		pcall(function() --// pcall to prevent errors
			loadstring(
				game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/Lag/AntiLag.lua") --// gets the anti lag script
			)()
		end)
	end

	function noLag(ta) --// runs no lag which is really hood
		local ta = ta or {} --// sets the table to {} if not specified
		return table.unpack({
			loadstring(
				game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/Lag/BetterAntiLag.lua") --// gets the no lag script
			)(ta),
		})
	end

	function getVenyx() --// gets venyx
		return loadstring(
			game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/GUILibs/VenyxLib.lua")
		)()
	end

	function getCustomCmds(arg1) --// gets custom commands module
		local arg1 = (arg1 and tostring(arg1)) or "" --// sets the argument to "" if not specified for the command prefix
		return loadstring(
			game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/Other/CustomCommands.lua")
		)(arg1)
	end

	function fireTouch(root, target, waitVal) --// function to call firetouchinterest on an object
		if root and target then --// checks if root and target exist
			firetouchinterest(root, target, 0) --// touches target
			if waitVal then --// checks if the function needs to wait
				fastWait()
			end
			firetouchinterest(root, target, 1) --// untouches target
		end
	end

	function tweenPart(speed, root, pos, anchored) --// tweens a part somewhere
		local pos = (pos and pos.Position) or (pos and (type(pos) == "vector") and pos) or nil --// tries to set pos to something true
		assert(speed and (type(speed) == "number") and root and root.CFrame and pos) --// checks if speed, root, and pos are valid
		local ab

		if anchored then --// checks if it should anchor part
			ab = root.Anchored --// sets ab to the anchored value
			root.Anchored = true
		end
		local tween = tweenService:Create( --// creates the tween
			root,
			TweenInfo.new((root.Position - pos).magnitude / speed), --// calculates the time to tween
			{
				Position = pos, --// sets the position to the specified position
			}
		)
		tween:Play() --// plays the tween
		tween.Completed:Wait() --// waits for the tween to complete
		if not (ab == nil) then --// checks if we need to reset anchor
			root.Anchored = ab
		end
	end

	local loading = true
	local ChildAddedConnect

	players = game:GetService("Players") --// gets players
	localPlayer = players.LocalPlayer --// gets localplayer
	mouse = localPlayer:GetMouse() --// gets the mouse

	if localPlayer:HasAppearanceLoaded() then --// checks if player appearence has loaded
		character = localPlayer.Character --// sets character to player character
	else
		repeat
			fastWait() --// waits until character appearence is loaded
		until localPlayer:HasAppearanceLoaded()
		character = localPlayer.Character
	end

	humanoidRP = character:FindFirstChild("HumanoidRootPart") --// gets humanoid root part
	humanoid = character:FindFirstChild("Humanoid") --// gets humanoid of localplayer
	playerGUI = localPlayer:WaitForChild("PlayerGui") --// gets player's gui
	camera = workspace.CurrentCamera --// gets current camera

	ChildAddedConnect = character.ChildAdded:Connect(
		function(child) --// creates a hook that will check for new humanoid or humanoid root parts
			if child:IsA("Humanoid") then --// checks if child is a humanoid
				humanoid = child
			elseif child.Name == "HumanoidRootPart" then --// checks if child is humanoid root part
				humanoidRP = child
			end
		end
	)

	loading = false

	function getPoint(target, pass) --// gets the point on the screen of a position in game
		local target = (target and (type(target) == "vector") and target) or (target and target.Position) or nil --// sets target to something value
		if not target then
			return
		end --// returns if target is nil

		local vector, on = camera:WorldToViewportPoint(target) --// gets vector of target
		if on or pass then --// checks if target is on screen or pass is true
			return Vector2.new(vector.X, vector.Y) --// returns vector2 of target position on screen
		end
		return nil
	end

	function DrawToTarget(target, Color_1, Thick) --// draws a line to a target
		local target = (target and (type(target) == "vector") and target) or (target and target.Position) or nil --// tries to set target to something
		if not target then
			return
		end --// returns if target doesn't exist

		local vector = getPoint(target) --// gets vector of target
		if vector then
			local Line = Drawing.new("Line") --// creates a new line
			Line.Visible = true --// sets properties of line
			Line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
			Line.To = vector
			Line.Color = Color_1
			Line.Thickness = Thick
			Line.Transparency = 1
			return Line
		end
	end

	function DrawText(Text_1, Point, Color_1, Thick) --// draws a text at point
		local Text_1 = assert(Text_1 and tostring(Text_1)) --// sets text to something
		local Point = assert(Point and Point.X and Point.Y and Vector2.new(Point.X, Point.Y)) --// sets point to something

		local Text = Drawing.new("Text") --// makes a new text
		Text.Visible = true --// sets properties of text
		Text.Text = Text_1
		Text.Color = Color_1
		Text.Position = Point
		Text.Size = 24
		Text.Outline = true

		return Text
	end

	function join(id)
		local id = tonumber(id)

		if id then
			TPService:Teleport(id)
		end
	end

	function rejoin() --// function that rejoins the current game
		if #players:GetPlayers() > 1 then --// checks if there is more than 1 player in the current server
			TPService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer) --// teleports to the same game with the same job id which is a specific server
		else
			join(game.PlaceId) --// rejoins the game without going to a specific serever
		end
	end

	function serverHop(id) --// function that serverhops the same game
		local GameID = (id and tostring(id)) or tostring(game.PlaceId) --// gets game id of game
		local JobID = tostring(game.JobId) --// gets jobid of game
		local CHour = os.date("!*t").hour --// get the current our
		local Serverhop = SaveTable.Serverhop --// gets serverhop table
		local nextPage
		local Url = "https://games.roblox.com/v1/games/" .. GameID .. "/servers/Public?sortOrder=Asc&limit=100" --// sets the url to check for endpoint
		if not (CHour == SaveTable.Date.hour) then --// checks if the current hour is different from saved hour
			SaveTable.Date.hour = CHour --// sets saved hour to current hour
			SaveTable.Serverhop = {} --// resets serverhop table
		end
		if not table.find(Serverhop, JobID) then --// checks if current jobid is in the serverhop table
			table.insert(Serverhop, JobID) --// inserts game's jobid into serverhop table
		end
		local Trigger
		Trigger = function() --// main function that triggers serverhop
			if nextPage then --// checks if next page exist
				Url = "https://games.roblox.com/v1/games/" --// sets new Url for the next page
					.. GameID
					.. "/servers/Public?sortOrder=Asc&limit=100&cursor="
					.. nextPage
			end
			local body = JSONDecode(httpRequest({ --// gets the body of the request
				Url = Url,
				Method = "GET",
			}).Body)
			if body then --// checks if request was successfull
				local found = false
				if body.nextPageCursor then --// checks if next page exist
					nextPage = body.nextPageCursor --// sets the id of the next page to a variable
				else
					nextPage = nil
				end
				if body.data then
					for _, group in pairs(body.data) do --// goes through the data in the returned body
						local id = group.id --// gets the jobid of the server
						if group.playing < group.maxPlayers and not (JobID == id) then --// checks if the server is full and current game is not the same as game thats its checking
							found = true
							if not table.find(Serverhop, id) then --// checks if the server is in the serverhop table
								table.insert(Serverhop, id) --// inserts the server into the serverhop table
							end
							TPService:TeleportToPlaceInstance(GameID, id, localPlayer) --// tries to teleport to the server
							break
						end
					end
				end
				if not found and nextPage then --// checks if there is a next page and if the server was not found
					return Trigger() --// calls the function again
				elseif not nextPage then --// checks if there is no next page
					return false
				else
					return true --// returns true if server was found
				end
			else
				return false
			end
		end
		local Connection
		Connection = TPService.TeleportInitFailed:Connect(function() --// connects to teleport init failed event
			wait(2)
			Trigger() --// calls the function again if teleport init failed
		end)
		return Trigger() --// calls the function to start the serverhop
	end

	function checkGame(id, leave) --// function that checks if current game is the same as the game that is being checked
		local id = assert(id and tonumber(id)) --// makes sure the id is a number
		local leave = (not (leave == nil) and (type(leave) == "boolean") and leave) or true --// makes sure leave is a boolean
		if not (game.PlaceId == id) then --// checks if current game is not the same as the game that is being checked
			if leave then --// checks if leave is true
				game:GetService("TeleportService"):Teleport(id, localPlayer) --// teleports to the game that is being checked
			else
				return false
			end
		end
		return true --// returns true if the game is the same
	end

	do
		local idleConnection

		function idleAfk(val) --// function that prevents player from being kicked when idled
			local val = (val and (type(val) == "boolean") and val) or true --// makes sure val is a boolean
			if val and not idleConnection then --// checks if val is true and if idle connection does not exist
				idleConnection = localPlayer.Idled:Connect(function() --// connects to idled event
					virtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
					wait(1)
					virtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				end) --// clicks virtual button to prevent idle afk
			elseif not val and idleConnection then --// checks if val is false and if idle connection does exist
				pcall(function()
					idleConnection:Disconnect() --// disconnects idle connection
					idleConnection = nil
				end)
			end
		end
	end

	function onCharacterLoaded(loadWait, functioN) --// function that runs requested funcion when character is loaded
		assert(functioN and (type(functioN) == "function")) --// makes sure function is a function
		localPlayer.CharacterAdded:Connect(function() --// connects to character added event
			if loadWait then --// checks if load wait is true
				while loading do
					fastWait() --// waits for loading to be done
				end
			end

			functioN() --// runs the function requested
		end)
	end

	function sendNotification(title, text, time_1, func, bn1, bn2) --// function that sends a notification
		local pack = { --// creates a table to store the data
			Title = assert(title and tostring(title)),
			Text = assert(text and tostring(text)),
			Icon = "",
			Duration = (time_1 and tonumber(time_1)) or 5,
			CallBack = (func and (type(func) == "function") and func) or function() end,
			Button1 = bn1 or nil,
			Button2 = bn2 or nil,
		}
		game:GetService("StarterGui"):SetCore("SendNotification", pack) --// sends the notification
	end

	localPlayer.CharacterAdded:Connect(function(char) --// connects to character added event
		loading = true --// sets loading to true while character loading is happening

		if ChildAddedConnect then --// checks if child added connection exists
			ChildAddedConnect:Disconnect() --// disconnects child added connection
			ChildAddedConnect = nil
		end

		character = char --// sets character to the character that was added
		humanoidRP = character:FindFirstChild("HumanoidRootPart") --// finds humanoid root part
		humanoid = character:FindFirstChild("Humanoid") --// finds humanoid
		camera = workspace.CurrentCamera --// finds current camera

		ChildAddedConnect = character.ChildAdded:Connect(function(child) --// connects to child added event
			if child:IsA("Humanoid") then --// checks if child is a humanoid
				humanoid = child
			elseif child.Name == "HumanoidRootPart" then --// checks if child is humanoid root part
				humanoidRP = child
			end
		end)

		loading = false --// sets loading to false
	end)

	local on_leave_t = {} --// creates a table to store functions that are called when player leaves a server
	function onLeave(func)
		table.insert(on_leave_t, func) --// inserts the function into the table
	end

	players.PlayerRemoving:Connect(function(plr) --// connects to player removing event
		if plr == localPlayer then --// checks if player is local player
			local Encoded = JSONEncode(SaveTable)
			writefile("Universal/Universal.json", Encoded) --// writes the save table to a file

			for _, func in ipairs(on_leave_t) do --// loops through all functions in the table
				cWrap(function() --// wraps function in a coroutine
					func() --// calls the function
				end)
			end
		end
	end)
end)
