--[[
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/UniversalLoader.lua"))()

]]

mathseed = tick()
math.randomseed(mathseed)

renderS = game:GetService("RunService").RenderStepped
repeat renderS:Wait() until game:IsLoaded() 

virtualUser = game:GetService("VirtualUser")
tweenService = game:GetService("TweenService")
userInput = game:GetService("UserInputService")

workspace = game:GetService("Workspace")

function wait(n)  
    local n = n or 0
    assert(type(n) == "number","no")
    for _ = 1,(n*60) do
        renderS:Wait()
    end
end

function ifBreak(checking,val)
    if (checking == val) then
        return break
    end
end

function loopThrough(...)
    local arg = {...}

    assert(type(arg[1]) == "table","no")
    assert(type(arg[2]) == "function","no")
    for _,loop in pairs(arg[1]) do
        arg[2](loop)
    end
end

function randomNameNumber(...)
    local arg = {...}
    local array = {}

    local length = math.random(arg[1],arg[2])

    array[1] = string.char(math.random(97,122))
    for i = 2,length do
        if math.random(1,2) == 1 then
            array[i] = math.random(0,9)
        else
            array[i] = string.char(math.random(97,122))

            if math.random(1,2) == 1 then
                array[i] = string.upper(array[i])
            end
        end
    end

	return table.concat(array)
end

function OnOff(val)
	val = val or false
    assert(type(val) == "boolean","no")
    local globalName = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/OnOff.lua"))(val)
    return globalName
end

function castRay(...)
    local arg = {...}

    if arg[1] and arg[2] then
        assert(type(arg[1]) == "vector","no")

        local castprams = RaycastParams.new()

        if arg[4] and arg[5] then
            castprams.FilterDescendantsInstances = {arg[4]:GetDescendants()}
            castprams.FilterType = Enum.RaycastFilterType[arg[5]]
        end

        local direct = Vector3.new(arg[2].X*arg[3],arg[2].Y*arg[3],arg[2].Z*arg[3])
        local cast = workspace:Raycast(arg[1],direct,castprams)

        return cast
    end

    return nil
end

function cWrap(functioN)
    coroutine.resume(coroutine.create(functioN))
end
 
function cButton(indeX)
    for _,v in pairs(getconnections(indeX.MouseButton1Click)) do
        v:Function()
    end
end

function antiLAG()
	pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/AntiLag.lua"))()
	end)
end

function serverHop()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/ServerHop.lua"))()
end

function fireTouch(root,target)
	if root and target then
		firetouchinterest(root,target,0) renderS:Wait() firetouchinterest(root,target,1)
	end
end

function tweenPart(speed,root,pos,anchored)
    local ab

    if anchored then
        ab = root.Anchored; root.Anchored = true
    end
    assert(type(pos) == "vector","no")
    local tween = tweenService:Create(root,TweenInfo.new((root.Position - pos).magnitude/speed),{CFrame = CFrame.new(pos.X,pos.Y,pos.Z)})
    tween:Play() tween.Completed:Wait()
    if ab then
        root.Anchored = ab
    end
end
 
function CFrameTP(root,pos,x,y,z)
    local x = tonumber(x) or 0
    local y = tonumber(y) or 0
    local z = tonumber(z) or 0
    assert(type(pos) == "userdata","no")
    root.CFrame = CFrame.new(pos.X + x,pos.Y + y, pos.Z + z)
end

function CFrameBack(root,pos,waiT,functioN,x,y,z)
    local old = root.CFrame

    local x = tonumber(x) or 0
    local y = tonumber(y) or 0
    local z = tonumber(z) or 0

    assert(type(pos) == "userdata","no")
    root.CFrame = CFrame.new(pos.X + x,pos.Y + y, pos.Z + z)

    wait(waiT/2)
    functioN()
    wait(waiT/2)

    root.CFrame = old
end

local loading = true

players = game:GetService("Players")
localPlayer = players.LocalPlayer

if localPlayer:HasAppearanceLoaded() then
    character = localPlayer.Character
else
    repeat renderS:Wait() until localPlayer:HasAppearanceLoaded()
    character = localPlayer.Character
end

humanoidRP = character:WaitForChild("HumanoidRootPart")
humanoid = character:WaitForChild("Humanoid")
playerGUI = localPlayer:WaitForChild("PlayerGui")

loading = false

function rejoin()
    game:GetService("TeleportService"):Teleport(game.PlaceId, localPlayer)
end

local idleConnection

function antiAFK(val)
    if val then
        idleConnection = localPlayer.Idled:Connect(function()
            virtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            virtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    elseif not val then
        pcall(function()
            idleConnection:Disconnect()
        end)
    end
end

function cPlayer(part)
    if character and localPlayer.Character:FindFirstChild(part) then
        return true
    else
        return false
    end
end

function onCharacterLoaded(loadWait,functioN)
    cWrap(function()
        localPlayer.CharacterAdded:Connect(function()
            if loadWait then
                while loading do renderS:Wait() end
            end

            functioN()
        end)
    end)
end

localPlayer.CharacterAdded:Connect(function(char)
    loading = true

    character = char
    humanoidRP = character:WaitForChild("HumanoidRootPart")
    humanoid = character:WaitForChild("Humanoid")
    playerGUI = localPlayer:WaitForChild("PlayerGui")

    loading = false
end)
