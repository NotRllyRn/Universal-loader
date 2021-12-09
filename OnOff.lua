local arg = ({...})
local val = arg[1] or false
local title = arg[2] or ""
 
assert(type(val) == "boolean","no")
assert(type(title) == "string","no")

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextButton1 = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextButton2 = Instance.new("TextButton")
 
syn.protect_gui(ScreenGui)
 
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
Frame.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.245924875, 0, 0.157055214, 0)
Frame.Size = UDim2.new(0.160170108, 0, 0.187730059, 0)
 
TextButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, 0.142857149, 0)
TextButton.Size = UDim2.new(0.99999994, 0, 0.714285731, 0)
TextButton.Font = Enum.Font.SourceSans
if val then
    TextButton.Text = "Off"
else
    TextButton.Text = "On"
end
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
 
TextButton1.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
TextButton1.BorderSizePixel = 0
TextButton1.Position = UDim2.new(0.799999952, 0, 0, 0)
TextButton1.Size = UDim2.new(0.199999988, 0, 0.142857149, 0)
TextButton1.Font = Enum.Font.SourceSans
TextButton1.Text = "X"
TextButton1.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton1.TextScaled = true
TextButton1.TextSize = 14.000
TextButton1.TextWrapped = true
 
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0.799999952, 0, 0.142857149, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton2.BackgroundTransparency = 1.000
TextButton2.BorderSizePixel = 0
TextButton2.Position = UDim2.new(0, 0, 0.857142866, 0)
TextButton2.Size = UDim2.new(0.99999994, 0, 0.142857149, 0)
TextButton2.Font = Enum.Font.SourceSans
TextButton2.Text = "Copy discord link"
TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton2.TextScaled = true
TextButton2.TextSize = 14.000
TextButton2.TextWrapped = true

ScreenGui.Name = randomNameNumber(10,20)
Frame.Name = randomNameNumber(10,20)
TextLabel.Name = randomNameNumber(10,20)
TextButton.Name = randomNameNumber(10,20)
TextButton1.Name = randomNameNumber(10,20)
TextButton2.Name = randomNameNumber(10,20)

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
TextLabel.Parent = Frame
TextButton.Parent = Frame
TextButton1.Parent = Frame
TextButton2.Parent = Frame
 
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

TextButton2.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/zpFpWqBqCn")
    TextButton2.Text = "Copied!"
    wait(3)
    TextButton2.Text = "Copy discord link"
end)

return globalName
