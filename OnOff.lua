local val = ({...})[1] or false
 
assert(type(val) == "boolean","no")

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextButton1 = Instance.new("TextButton")
 
syn.protect_gui(ScreenGui)
 
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
Frame.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.144578308, 0, 0.204907969, 0)
Frame.Size = UDim2.new(0.0566973761, 0, 0.110429451, 0)
 
TextButton.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, 0.111111112, 0)
TextButton.Size = UDim2.new(1, 0, 0.888888896, 0)
TextButton.Font = Enum.Font.Nunito
if val then
    TextButton.Text = "Off"
else
    TextButton.Text = "On"
end
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
 
TextButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton1.BorderSizePixel = 0
TextButton1.Position = UDim2.new(0.875, 0, 0, 0)
TextButton1.Size = UDim2.new(0.125, 0,0.111, 0)
TextButton1.Font = Enum.Font.SourceSans
TextButton1.Text = "X"
TextButton1.TextColor3 = Color3.fromRGB(255, 0, 4)
TextButton1.TextSize = 14.000
 
ScreenGui.Name = randomNameNumber(10,20)
Frame.Name = randomNameNumber(10,20)
TextButton.Name = randomNameNumber(10,20)
TextButton1.Name = randomNameNumber(10,20)

local globalName = randomNameNumber(10,20)
 
local function setname()
    if (_G[globalName] == false) or (_G[globalName] == true) then
        globalName = RandomNameNumber(10,20)
        
        setname()
    else
        _G[globalName] = val
    end
end
 
setname()
 
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
TextButton.Parent = Frame
TextButton1.Parent = Frame
 
Frame.Draggable = true

TextButton.MouseButton1Click:Connect(function()
    if not _G[globalName] then
        TextButton.Text = "Off"
        _G[globalName] = true
    else
        TextButton.Text = "On"
        _G[globalName] = false
    end
end)
 
TextButton1.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    _G[globalName] = nil
end)
 
return globalName
