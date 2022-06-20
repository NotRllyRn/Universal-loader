--[[
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/UniversalLoader.lua"))()

	Universal loader,
	Made for LUAU roblox exploiting.

	by NotRllyRn <3
]]
local Incoming = {...} --// for incoming input
local success, uni_table = pcall(function()
	local Universal = {}

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
	ExploitCheck("getrawmetatable", getrawmetatable) --// checks if built in functions are valid and sets them to the global enviorment
	ExploitCheck("getnamecallmethod", getnamecallmethod)
	ExploitCheck("httpRequest", syn and syn.request, request, http_request)
	ExploitCheck("firetouchinterest", firetouchinterest)
	ExploitCheck("writefile", writefile)
	ExploitCheck("readfile", readfile)
	ExploitCheck("isfile", isfile)
	ExploitCheck("makefolder", makefolder)
	ExploitCheck("delfolder", delfolder)
	ExploitCheck("delfile", delfile)
	ExploitCheck("isfolder", isfolder)
	ExploitCheck("setclipboard", setclipboard)
	ExploitCheck("fireprompt", fireproximityprompt)
	ExploitCheck("protectgui", gethui and function(v) --// for protecting screenguis from being detected
		v.Parent = gethui() --// sets the gui to the hui so that no other scripts can access it
	end, syn and syn.protect_gui and function(v, parent)
		syn.protect_gui(v) --// protects gui with Synapse's method
		v.Parent = parent --// sets the parent.
	end)
	
	Universal.Connections = {} --// makes the connections table
	Universal.Tables = {} --// makes the tables table
	Universal.Librarys = {} --// makes the librarys table
	Universal.Librarys.kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/GUILibs/Kavo.lua")) --// loads the Kavo library
	Universal.Librarys.notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/GUILibs/Notification.lua")) --// loads the Notification library
	Universal.Librarys.customcommands = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/Other/CustomCommands.lua")) --// loads the CustomCommands library
	Universal.Librarys.antilag = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/Lag/AntiLag.lua")) --// loads the AntiLag script
	Universal.Librarys.ultraantilag = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/Lag/BetterAntiLag.lua")) --// loads the UltraAntiLag script

	function libraryLoad(name, ...) --// function that loads the a library with the name you pass
		local name = name and tostring(name) and tostring(name):lower() --// makes sure name is a string
		if not name then
			return nil
		end --// if name is not a string, return nil

		if Universal.Librarys[name] then --// checks if the library exists
			return Universal.Librarys[name](...) --// runs and returns the library
		end
	end

	mathseed = tick() --// sets mathseed
	math.randomseed(mathseed) --// sets randomseed to mathseed

	function copyOver(from, to) --// function that copies from one table to another
		local to = to or {}
		if from and to and type(from) == "table" and type(to) == "table" then --// checks if the tables are valid
			for index, value in pairs(from) do --// loops through the table
				if value and type(value) == "table" then --// checks if the value is a table
					to[index] = {} --// makes a new table
					copyOver(value, to[index]) --// copies the table again
				else
					to[index] = value --// sets the value
				end
			end
			return to --// returns the table it got copied too
		end
	end

	function discordWebSend(URL, data) --// send webhook data to a discord webhook
		if data and type(data) == "table" and URL then -- checks if the data is a table and the URL is a string
			local content = JSONEncode(data) --// encodes the data into json
			if content then --// checks if the content was successfully convereted into json
				return httpRequest({ --// sends the request
					Url = URL, --// sets the url
					Method = "POST", --// sets the method to post
					Body = content, --// sets the body to the content
					Headers = { 
						["Content-Type"] = "application/json", --// sets the content type to json to accept json data
					},
				})
			end
		end
	end

	function formatTime(tick) --// formats a tick to a readable time in the format of days:hours:minutes:seconds
		local tick = tick and tonumber(tick) --// makes sure tick is a number
		if not tick then
			return nil
		end --// if tick is not a number, return nil

		local days = math.floor(tick / 86400) --// gets the days
		local hours = math.floor((tick / 3600) % 24) --// gets the hours
		local minutes = math.floor((tick / 60) % 60) --// gets the minutes
		local seconds = math.floor(tick % 60) --// gets the seconds
		return ("%02i:%02i:%02i:%02i"):format(days, hours, minutes, seconds) --// returns the formatted time
	end

	if not game:IsLoaded() then
		game.Loaded:Wait() --// waits until game is loaded
	end

	httpService = game:GetService("HttpService") --// gets all the services that are useful
	virtualUser = game:GetService("VirtualUser")
	tweenService = game:GetService("TweenService")
	userInput = game:GetService("UserInputService")
	runService = game:GetService("RunService")
	contextAS = game:GetService("ContextActionService")
	virtualIM = game:GetService("VirtualInputManager")
	replicatedS = game:GetService("ReplicatedStorage")
	TPService = game:GetService("TeleportService")
	PhyService = game:GetService("PhysicsService")
	httpAPI = game:GetService('HttpRbxApiService')

	JSONDecode = function(...) --// decodes json function for easier use
		return (httpService:JSONDecode(...))
	end
	JSONEncode = function(...) --// encodes json function for easier use
		return (httpService:JSONEncode(...))
	end

	renderS = runService.RenderStepped --// gets the renderstepped event
	heartS = runService.Heartbeat --// gets the heartbeat event

	workspace = game:GetService("Workspace") --// gets the workspace

	local defaultTable = { --// the save table for Universal Loader
		Date = os.date("!*t"), --// makes a date table
		Serverhop = {}, --// serverhop table
	}
	Universal.SaveTable = {} --// makes the input table for loading the script

	local compare_save
	function compare_save(t1, t2) 
		for i, v in pairs(t1) do
			if v and not t2[i] then
				if type(v) == 'table' then
					t2[i] = {}
					compare_save(v, t2[i])
				else
					t2[i] = v
				end
			elseif v and type(v) == 'table' and type(t2[i]) == 'table' then
				compare_save(v, t2[i])
			end
		end
	end
	
	if not isfolder("Universal") then --// checks if Universal folder exists
		makefolder("Universal")
		Universal.SaveTable = defaultTable
		local Encoded = JSONEncode(Universal.SaveTable)
		writefile("Universal/Universal.json", Encoded) --// encodes the save table to a json file
	elseif isfile("Universal/Universal.json") then --// checks if Universal.json exists
		local s = pcall(function() --// tries to load the json file
			Universal.SaveTable = JSONDecode(readfile("Universal/Universal.json")) --// decodes the json file and saves it to the save table
		end)
		if not s then
			Universal.SaveTable = defaultTable
			local Encoded = JSONEncode(Universal.SaveTable)
			writefile("Universal/Universal.json", Encoded) --// encodes the save table to a json file
		else
			compare_save(defaultTable, Universal.SaveTable) --// compares the default table with the save table
		end
	end

	function fastWait(n) --// function that waits for 1 frame render
		heartS:Wait()
	end

	function genName(len) --// function that generates a random string of characters and letters and numbers using string.char
		local len = len and tonumber(len) or math.random(5, 10) --// makes sure len is a number
		local str = "" --// makes a string
		for _ = 1, len do --// loops the lenght of requested string
			local char = string.char(math.random(32, 126)) --// makes a random character
			str = str .. char --// adds the character to the string
		end
		return str --// returns the string
	end

	function castRay(start, direct, distance, list, type1, id) --// casts a ray and returns it
		local start = start and type(start) == "vector" and start --// checks if start is a vector
		local direct = direct and (type(direct) == "vector") and direct --// checks if direct is a vector
		if not start or not direct then
			return nil
		end --// if start or direct is not a vector, return nil

		local distant = (distant and tonumber(distance)) or 100 --// sets the distance to 100 if not specified
		local type1 = (type1 and tostring(type1)) --// sets the type to nil if not specified

		if start and direct then
			local castprams = RaycastParams.new() --// makes a new raycast params

			if list and type1 then
				castprams.FilterDescendantsInstances = (typeof(list) == "table" and list) or { list } --// sets the filter to the list if specified
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
		for _, v in pairs(getconnections(indeX.MouseButton1Click)) do --// gets the connections of MouseButton1Click for the button
			v:Function() --// fires any connections it finds
		end
		for _, v in pairs(getconnections(indeX.Activated)) do --// gets the connections of Activated for the button
			v:Function() --// fires any connections it finds
		end
		for _, v in pairs(getconnections(indeX.Button1Down)) do --// gets the connections of Button1Down for the button
			v:Function() --// fires any connections it finds
		end
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
		local pos = (pos and pos.Position) or (pos and (type(pos) == "vector") and pos) --// tries to set pos to something true
		local speed = speed and tonumber(speed)
		if not speed or not root or not root.CFrame or not pos then
			return nil
		end --// checks if speed, root, and pos are valid

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

	Universal.charLoading = true --// sets char loading to true to start loading the characters

	players = game:GetService("Players") --// gets players
	localPlayer = players.LocalPlayer --// gets localplayer
	mouse = localPlayer:GetMouse() --// gets the mouse
	playerGUI = localPlayer:WaitForChild("PlayerGui") --// gets player's gui
	camera = workspace.CurrentCamera --// gets current camera

	cWrap(function() --// encapsulates so that it doesn't hold up the script
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

		Universal.Connections.ChildAddedConnect = character.ChildAdded:Connect(
			function(child) --// creates a hook that will check for new humanoid or humanoid root parts
				if child:IsA("Humanoid") then --// checks if child is a humanoid
					humanoid = child
				elseif child.Name == "HumanoidRootPart" then --// checks if child is humanoid root part
					humanoidRP = child
				end
			end
		)
	
		Universal.Tables.onCharacterLoaded_table = {} --// creates a table for onCharacterLoaded
		Universal.Connections.CharacterAdded = localPlayer.CharacterAdded:Connect(function(char) --// connects to character added event
			Universal.charLoading = true --// sets loading to true while character loading is happening
	
			cWrap(function()
				for i, v in pairs(Universal.Tables.onCharacterLoaded_table) do --// goes through the onCharacterLoaded_table
					if v.loadWait then --// checks if loadWait is true
						cWrap(function() --// creates a coroutine to wait for the character to load
							repeat
								fastWait() --// waits for the character to load
							until not Universal.charLoading
							v.func() --// calls the function
						end)
					else --// checks if loadWait is false
						cWrap(
							function() --// creates a coroutine to continue the loop without having to wait for the character to load
								v.func() --// calls the function
							end
						)
					end
				end
			end)
	
			if Universal.Connections.ChildAddedConnect then --// checks if child added connection exists
				Universal.Connections.ChildAddedConnect:Disconnect() --// disconnects child added connection
				Universal.Connections.ChildAddedConnect = nil
			end
	
			character = char --// sets character to the character that was added
			humanoidRP = character:FindFirstChild("HumanoidRootPart") --// finds humanoid root part
			humanoid = character:FindFirstChild("Humanoid") --// finds humanoid
			camera = workspace.CurrentCamera --// finds current camera
	
			Universal.Connections.ChildAddedConnect = character.ChildAdded:Connect(function(child) --// connects to child added event
				if child:IsA("Humanoid") then --// checks if child is a humanoid
					humanoid = child
				elseif child.Name == "HumanoidRootPart" then --// checks if child is humanoid root part
					humanoidRP = child
				end
			end)
	
			Universal.charLoading = false --// sets loading to false
		end)

		Universal.charLoading = false
	end)


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
		local Text_1 = Text_1 and tostring(Text_1) --// sets text to something
		local Point = Point and Point.X and Point.Y and Vector2.new(Point.X, Point.Y) --// sets point to something
		
		if Text_1 and Point then
			local Text = Drawing.new("Text") --// makes a new text
			Text.Visible = true --// sets properties of text
			Text.Text = Text_1
			Text.Color = Color_1
			Text.Position = Point
			Text.Size = 24
			Text.Outline = true

			return Text
		end

		return nil
	end

	function join(id)
		local id = id and tonumber(id)

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
		local CHour = os.date("!*t").hour --// get the current hour
		local Serverhop = Universal.SaveTable.Serverhop --// gets serverhop table
		local nextPage
		local Url = "https://games.roblox.com/v1/games/" .. GameID .. "/servers/Public?sortOrder=Asc&limit=100" --// sets the url to check for endpoint
		if not (CHour == Universal.SaveTable.Date.hour) then --// checks if the current hour is different from saved hour
			Universal.SaveTable.Date.hour = CHour --// sets saved hour to current hour
			Universal.SaveTable.Serverhop = {} --// resets serverhop table
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
						if group.playing and group.maxPlayers and group.playing < group.maxPlayers and not (JobID == id) then --// checks if the server is full and current game is not the same as game thats its checking
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
		TPService.TeleportInitFailed:Connect(function() --// connects to teleport init failed event
			wait(2)
			Trigger() --// calls the function again if teleport init failed
		end)
		return Trigger() --// calls the function to start the serverhop
	end

	function checkGame(id, leave) --// function that checks if current game is the same as the game that is being checked
		local id = id and tonumber(id) --// makes sure the id is a number
		if not id then
			return nil
		end --// checks if id is a number
		local leave = leave
		if leave == nil or not (type(leave) == "boolean") then --// checks if leave is a boolean
			leave = true
		end

		if not (game.PlaceId == id) then --// checks if current game is not the same as the game that is being checked
			if leave then --// checks if leave is true
				game:GetService("TeleportService"):Teleport(id, localPlayer) --// teleports to the game that is being checked
			else
				return false
			end
		end
		return true --// returns true if the game is the same
	end

	function idleAfk(val) --// function that prevents player from being kicked when idled
		local val = val
		if val == nil or not (type(val) == "boolean") then --// checks if val is a boolean
			val = true
		end
		if val and not Universal.Tables.idleConnection then --// checks if val is true and if idle connection does not exist
			Universal.Tables.idleConnection = localPlayer.Idled:Connect(function() --// connects to idled event
				virtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				wait(1)
				virtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			end) --// clicks virtual button to prevent idle afk
		elseif not val and Universal.Tables.idleConnection then --// checks if val is false and if idle connection does exist
			pcall(function()
				Universal.Tables.idleConnection:Disconnect() --// disconnects idle connection
				Universal.Tables.idleConnection = nil
			end)
		end
	end

	function sendNotification(title, text, time_1, func, bn1, bn2) --// function that sends a notification
		if not title or not tostring(title) or not text or not tostring(text) then
			return nil
		end --// makes sure title and text are not nil
		local pack = { --// creates a table to store the data
			Title = title and tostring(title),
			Text = text and tostring(text),
			Icon = "",
			Duration = (time_1 and tonumber(time_1)) or 5,
			CallBack = (func and (type(func) == "function") and func) or function() end,
			Button1 = bn1 or nil,
			Button2 = bn2 or nil,
		}
		game:GetService("StarterGui"):SetCore("SendNotification", pack) --// sends the notification
	end

	Universal.Tables.OnLeave_table = {} --// creates a table to store functions that are called when player leaves a server
	function onLeave(func)
		if not func or not (type(func) == 'function') then
			return nil
		end --// makes sure func is a function
		table.insert(Universal.Tables.OnLeave_table, func) --// inserts the function into the table
	end

	players.PlayerRemoving:Connect(function(plr) --// connects to player removing event
		if plr == localPlayer then --// checks if player is local player
			cWrap(function()
				local Encoded = JSONEncode(Universal.SaveTable)
				writefile("Universal/Universal.json", Encoded) --// writes the save table to a file
			end)

			for _, func in ipairs(Universal.Tables.OnLeave_table) do --// loops through all functions in the table
				cWrap(function() --// wraps function in a coroutine
					func() --// calls the function
				end)
			end
		end
	end)

	return Universal --// returns Universal
end)

if not success then
	warn("Universal failed to load, error: " .. uni_table)
end

return uni_table