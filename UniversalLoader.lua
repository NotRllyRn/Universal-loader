--[[
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/UniversalLoader.lua"))()

]]

pcall(function()
	local Incoming = {...}
	repeat
		wait()
	until game:IsLoaded()

	function ExploitCheck(name, ...)
		local found
		for _, v in pairs({ ... }) do
			if v then
				found = v
				break
			end
		end
		if found then
			getgenv()[name] = found
		elseif Incoming and Incoming[1] and Incoming[1] == true then
			error("Unsupported exploit: " .. name, 1)
		end
	end
	ExploitCheck("getrawmetatable", getrawmetatable)
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
	ExploitCheck("protectgui", syn and syn.protect_gui)

	httpService = game:GetService("HttpService")
	JSONDecode = function(...)
		return (httpService:JSONDecode(...))
	end
	JSONEncode = function(...)
		return (httpService:JSONEncode(...))
	end

	local defaultTable = {
		Date = os.date("!*t"),
		Serverhop = {},
	}
	local SaveTable = {}

	if not isfolder("Universal") then
		makefolder("Universal")
		SaveTable = defaultTable
		local Encoded = JSONEncode(SaveTable)
		writefile("Universal/Universal.json", Encoded)
	elseif isfile("Universal/Universal.json") then
		local s = pcall(function()
			SaveTable = JSONDecode(readfile("Universal/Universal.json"))
		end)
		if not s then
			SaveTable = defaultTable
			local Encoded = JSONEncode(SaveTable)
			writefile("Universal/Universal.json", Encoded)
		else
			for index, _ in pairs(defaultTable) do
				if not SaveTable[index] then
					SaveTable = defaultTable
					local Encoded = JSONEncode(SaveTable)
					writefile("Universal/Universal.json", Encoded)
					break
				end
			end
		end
	end

	do
		local mt = getrawmetatable(game)
		setreadonly(mt, false)
		local oldnc = mt.__namecall

		local getnamecallfuncs = {
			HasA = function(self, ...)
				return self:FindFirstChildOfClass(...)
			end,
			GetA = function(self, ...)
				return self:FindFirstChildOfClass(...)
			end,
			Get = function(self, ...)
				return self:FindFirstChild(...)
			end,
			Has = function(self, ...)
				return self:FindFirstChild(...)
			end,
		}

		mt.__namecall = newcclosure(function(self, ...)
			local gncm = getnamecallmethod()
			if getnamecallfuncs[gncm] then
				return getnamecallfuncs[gncm](self, ...)
			end

			return oldnc(self, ...)
		end)

		setreadonly(mt, true)
	end

	mathseed = tick()
	math.randomseed(mathseed)

	virtualUser = game:GetService("VirtualUser")
	tweenService = game:GetService("TweenService")
	userInput = game:GetService("UserInputService")
	runService = game:GetService("RunService")
	contextAS = game:GetService("ContextActionService")
	virtualIM = game:GetService("VirtualInputManager")
	replicatedS = game:GetService("ReplicatedStorage")
	TPService = game:GetService("TeleportService")

	renderS = runService.RenderStepped
	heartS = runService.Heartbeat

	workspace = game:GetService("Workspace")

	function fastWait(n)
		if not n then
			heartS:Wait()
		else
			local n = assert(n and tonumber(n))
			for _ = 1, (n * 60) do
				heartS:Wait()
			end
		end
	end

	function CalculateTime(t)
		local days = 00
		local hours = 00
		local minutes = 00
		local seconds = assert(t and tonumber(t))
		if seconds > 59 then
			minutes = math.floor(seconds / 60)
			seconds -= (minutes * 60)
		end
		if minutes > 59 then
			hours = math.floor(minutes / 60)
			minutes -= (hours * 60)
		end
		if hours > 23 then
			days = math.floor(hours / 24)
			hours -= (days * 24)
		end
		if string.len(seconds) == 1 then
			seconds = 0 .. seconds
		end
		if string.len(minutes) == 1 then
			minutes = 0 .. minutes
		end
		if string.len(hours) == 1 then
			hours = 0 .. hours
		end
		if string.len(days) == 1 then
			days = 0 .. days
		end
		return ("%02i:%02i:%02i:%02i"):format(days, hours, minutes, seconds)
	end

	function genName(min, max)
		local min = (min and tonumber(min)) or 1
		local max = (max and tonumber(max)) or 10

		local chars = {}
		local length = math.random(min, max)

		chars[1] = string.char(math.random(97, 122))
		for i = 2, length - 1 do
			if math.random(1, 2) == 1 then
				chars[i] = math.random(0, 9)
			elseif math.random(1, 2) == 1 then
				chars[i] = string.char(math.random(97, 122))
			else
				chars[i] = string.upper(string.char(math.random(97, 122)))
			end
		end

		return (tostring(table.concat(chars)))
	end

	function castRay(start, direct, distance, list, type1)
		assert(start and (type(start) == "vector"))
		assert(direct and (type(direct) == "vector"))
		local distant = (distant and tonumber(distance)) or 100
		local type1 = (type1 and tostring(type1))

		if start and direct then
			local castprams = RaycastParams.new()

			if list and type1 then
				castprams.FilterDescendantsInstances = list:GetDescendants()
				castprams.FilterType = Enum.RaycastFilterType[type1]
			end

			local cast = workspace:Raycast(start, direct * distance, castprams)
			return cast
		end
		return nil
	end

	function cWrap(functioN)
		coroutine.resume(coroutine.create(functioN))
	end

	function cButton(indeX)
		for _, v in pairs(getconnections(indeX.MouseButton1Click)) do
			v:Function()
		end
	end

	function antiLAG()
		pcall(function()
			loadstring(
				game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/Lag/AntiLag.lua")
			)()
		end)
	end

	function noLag(ta)
		local ta = ta or {}
		return table.unpack({
			loadstring(
				game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/Lag/BetterAntiLag.lua")
			)(ta),
		})
	end

	function getCustomCmds(arg1)
		local arg1 = (arg1 and tostring(arg1)) or ""
		return loadstring(
			game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/Other/CustomCommands.lua")
		)(arg1)
	end

	function fireTouch(root, target, waitVal)
		if root and target then
			firetouchinterest(root, target, 0)
			if waitVal then
				fastWait()
			end
			firetouchinterest(root, target, 1)
		end
	end

	function tweenPart(speed, root, pos, anchored)
		local pos = (pos and pos.Position) or (pos and (type(pos) == "vector") and pos) or nil
		assert(speed and (type(speed) == "number") and root and root.CFrame and pos)
		local ab

		if anchored then
			ab = root.Anchored
			root.Anchored = true
		end
		local tween = tweenService:Create(
			root,
			TweenInfo.new((root.Position - pos).magnitude / speed),
			{ CFrame = CFrame.new(pos.X, pos.Y, pos.Z) }
		)
		tween:Play()
		tween.Completed:Wait()
		if not (ab == nil) then
			root.Anchored = ab
		end
	end

	local loading = true
	local ChildAddedConnect

	players = game:GetService("Players")
	localPlayer = players.LocalPlayer
	mouse = localPlayer:GetMouse()

	if localPlayer:HasAppearanceLoaded() then
		character = localPlayer.Character
	else
		repeat
			fastWait()
		until localPlayer:HasAppearanceLoaded()
		character = localPlayer.Character
	end

	humanoidRP = character:FindFirstChild("HumanoidRootPart")
	humanoid = character:FindFirstChild("Humanoid")
	playerGUI = localPlayer:WaitForChild("PlayerGui")
	camera = workspace.CurrentCamera

	ChildAddedConnect = character.ChildAdded:Connect(function(child)
		if child:IsA("Humanoid") then
			humanoid = child
		elseif child.Name == "HumanoidRootPart" then
			humanoidRP = child
		end
	end)

	loading = false

	function getPoint(target)
		local target = (target and (type(target) == "vector") and target) or (target and target.Position) or nil
		assert(target)

		local vector, on = camera:WorldToViewportPoint(target)
		if on then
			return (Vector2.new(vector.X, vector.Y))
		end
		return nil
	end

	function DrawToTarget(target, Color_1, Thick)
		local target = (target and (type(target) == "vector") and target) or (target and target.Position) or nil
		assert(target)

		local vector = getPoint(target)
		if vector then
			local Line = Drawing.new("Line")
			Line.Visible = true
			Line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
			Line.To = vector
			Line.Color = Color_1
			Line.Thickness = Thick
			Line.Transparency = 1
			return Line
		end
	end

	function DrawText(Text_1, Point, Color_1, Thick)
		local Text_1 = assert(Text_1 and tostring(Text_1))
		local Point = assert(Point and Point.X and Point.Y and Vector2.new(Point.X, Point.Y))

		local Text = Drawing.new("Text")
		Text.Visible = true
		Text.Text = Text_1
		Text.Color = Color_1
		Text.Position = Point
		Text.Size = 24
		Text.Outline = true

		return Text
	end

	function rejoin()
		TPService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
	end

	function serverHop()
		local GameID = tostring(game.PlaceId)
		local JobID = tostring(game.JobId)
		local CHour = os.date("!*t").hour
		local Serverhop = SaveTable.Serverhop
		local nextPage
		local Url = "https://games.roblox.com/v1/games/" .. GameID .. "/servers/Public?sortOrder=Asc&limit=100"
		if not (CHour == SaveTable.Date.hour) then
			SaveTable.Date.hour = CHour
			SaveTable.Serverhop = {}
		end
		if not table.find(Serverhop, JobID) then
			table.insert(Serverhop, JobID)
		end
		local Trigger
		Trigger = function()
			if nextPage then
				Url = "https://games.roblox.com/v1/games/" .. GameID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. nextPage
			end
			local body = JSONDecode(httpRequest({
				Url = Url,
				Method = "GET",
			}).Body)
			if body then
				local found = false
				if body.nextPageCursor then
					nextPage = body.nextPageCursor
				else
					nextPage = nil
				end
				for _, group in pairs(body.data) do
					local id = group.id
					if group.playing < group.maxPlayers and not (JobID == id) then
						found = true
						if not table.find(Serverhop, id) then
							table.insert(Serverhop, id)
						end
						TPService:TeleportToPlaceInstance(GameID, id, localPlayer)
						break
					end
				end
				if not found and nextPage then
					return Trigger()
				elseif not nextPage then
					return false
				else
					return true
				end
			else
				return false
			end
		end
		local Connection
		Connection = TPService.TeleportInitFailed:Connect(function()
			wait(2)
			Trigger()
		end)
		return Trigger()
	end

	function checkGame(id, leave)
		local id = assert(id and tonumber(id))
		local leave = (not (leave == nil) and (type(leave) == "boolean") and leave) or true
		if not (game.PlaceId == id) then
			if leave then
				game:GetService("TeleportService"):Teleport(id, localPlayer)
			else
				return false
			end
		end
		return true
	end

	do
		local idleConnection

		function idleAfk(val)
			local val = (val and (type(val) == "boolean") and val) or true
			if val and not idleConnection then
				idleConnection = localPlayer.Idled:Connect(function()
					virtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
					wait(1)
					virtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				end)
			elseif not val and idleConnection then
				pcall(function()
					idleConnection:Disconnect()
					idleConnection = nil
				end)
			end
		end
	end

	function onCharacterLoaded(loadWait, functioN)
		assert(functioN and (type(functioN) == "function"))
		localPlayer.CharacterAdded:Connect(function()
			if loadWait then
				while loading do
					fastWait()
				end
			end

			functioN()
		end)
	end

	function sendNotification(title, text, time_1, func, bn1, bn2)
		local pack = {
			Title = assert(title and tostring(title)),
			Text = assert(text and tostring(text)),
			Icon = "",
			Duration = (time_1 and tonumber(time_1)) or 5,
			CallBack = (func and (type(func) == "function") and func) or function() end,
			Button1 = bn1 or nil,
			Button2 = bn2 or nil,
		}
		game:GetService("StarterGui"):SetCore("SendNotification", pack)
	end

	localPlayer.CharacterAdded:Connect(function(char)
		loading = true

		if ChildAddedConnect then
			ChildAddedConnect:Disconnect()
			ChildAddedConnect = nil
		end

		character = char
		humanoidRP = character:FindFirstChild("HumanoidRootPart")
		humanoid = character:FindFirstChild("Humanoid")
		camera = workspace.CurrentCamera

		ChildAddedConnect = character.ChildAdded:Connect(function(child)
			if child:IsA("Humanoid") then
				humanoid = child
			elseif child.Name == "HumanoidRootPart" then
				humanoidRP = child
			end
		end)

		loading = false
	end)

	players.PlayerRemoving:Connect(function(plr)
		if plr == localPlayer then
			local Encoded = JSONEncode(SaveTable)
			writefile("Universal/Universal.json", Encoded)
		end
	end)
end)
