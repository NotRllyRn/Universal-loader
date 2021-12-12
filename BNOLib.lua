
local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Side = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Holder = Instance.new("ScrollingFrame")
local Tab = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local Tab_2 = Instance.new("TextButton")
local Seperator = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local DiscordButton = Instance.new("ImageButton")
local DiscordLabel = Instance.new("TextButton")
local Top = Instance.new("Frame")
local Close = Instance.new("ImageButton")
local UICorner_4 = Instance.new("UICorner")
local Page = Instance.new("ScrollingFrame")
local Button = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local ButtonButton = Instance.new("TextButton")
local ButtonLabel = Instance.new("TextLabel")
local UIListLayout_2 = Instance.new("UIListLayout")
local Toggle = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local UIStroke_2 = Instance.new("UIStroke")
local ToggleLabel = Instance.new("TextLabel")
local ToggleButtonFrame = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local UIStroke_3 = Instance.new("UIStroke")
local ToggleButton = Instance.new("ImageButton")
local Label = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local UIStroke_4 = Instance.new("UIStroke")
local Label_2 = Instance.new("TextLabel")
local Seperator_2 = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local Slider = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local UIStroke_5 = Instance.new("UIStroke")
local SliderLabel = Instance.new("TextLabel")
local Bar = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")
local UIStroke_6 = Instance.new("UIStroke")
local Val = Instance.new("TextLabel")
local Fill = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local Logo = Instance.new("ImageLabel")
local UIStroke_7 = Instance.new("UIStroke")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(21, 23, 36)
Main.BorderColor3 = Color3.fromRGB(112, 162, 193)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Position = UDim2.new(0.191025868, 0, 0.137556449, 0)
Main.Size = UDim2.new(0.389483929, 0, 0.500834703, 0)

UICorner.CornerRadius = UDim.new(0.0299999993, 0)
UICorner.Parent = Main

Side.Name = "Side"
Side.Parent = Main
Side.BackgroundColor3 = Color3.fromRGB(30, 34, 53)
Side.Size = UDim2.new(0.256830603, 0, 1, 0)

UICorner_2.CornerRadius = UDim.new(0.100000001, 0)
UICorner_2.Parent = Side

Title.Name = "Title"
Title.Parent = Side
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.0495946333, 0, 0.226666719, 0)
Title.Size = UDim2.new(0.900810719, 0, 0.0599999987, 0)
Title.Font = Enum.Font.Gotham
Title.Text = "be nice okay?"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 1.000
Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Title.TextWrapped = true

Holder.Name = "Holder"
Holder.Parent = Side
Holder.Active = true
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.BackgroundTransparency = 1.000
Holder.BorderSizePixel = 0
Holder.Position = UDim2.new(2.1621544e-07, 0, 0.32093662, 0)
Holder.Size = UDim2.new(1.00000012, 0, 0.573717773, 0)
Holder.CanvasSize = UDim2.new(0, 0, 0, 0)
Holder.ScrollBarThickness = 0

Tab.Name = "Tab"
Tab.Parent = Holder
Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tab.BackgroundTransparency = 1.000
Tab.Size = UDim2.new(0.992872238, 0, 0.117310949, 0)
Tab.Font = Enum.Font.Gotham
Tab.Text = "tab 1"
Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab.TextScaled = true
Tab.TextSize = 14.000
Tab.TextWrapped = true

UIListLayout.Parent = Holder
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.0299999993, 0)

Tab_2.Name = "Tab"
Tab_2.Parent = Holder
Tab_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tab_2.BackgroundTransparency = 1.000
Tab_2.Position = UDim2.new(0, 0, 0.175242141, 0)
Tab_2.Size = UDim2.new(0.992872238, 0, 0.117310949, 0)
Tab_2.Font = Enum.Font.Gotham
Tab_2.Text = "tab 2"
Tab_2.TextColor3 = Color3.fromRGB(154, 154, 154)
Tab_2.TextScaled = true
Tab_2.TextSize = 14.000
Tab_2.TextWrapped = true

Seperator.Name = "Seperator"
Seperator.Parent = Side
Seperator.BackgroundColor3 = Color3.fromRGB(115, 168, 190)
Seperator.BorderSizePixel = 0
Seperator.Position = UDim2.new(0.0495946333, 0, 0.290113151, 0)
Seperator.Size = UDim2.new(0.900810719, 0, 0.0199999996, 0)

UICorner_3.CornerRadius = UDim.new(1, 0)
UICorner_3.Parent = Seperator

DiscordButton.Name = "DiscordButton"
DiscordButton.Parent = Side
DiscordButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DiscordButton.BackgroundTransparency = 1.000
DiscordButton.Position = UDim2.new(0.736999989, 0, 0.921999931, 0)
DiscordButton.Size = UDim2.new(0.154150546, 0, 0.050999999, 0)
DiscordButton.Image = "rbxassetid://7072718185"
DiscordButton.ImageColor3 = Color3.fromRGB(154, 154, 154)

DiscordLabel.Name = "DiscordLabel"
DiscordLabel.Parent = Side
DiscordLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DiscordLabel.BackgroundTransparency = 1.000
DiscordLabel.Position = UDim2.new(0.0799999982, 0, 0.921999991, 0)
DiscordLabel.Size = UDim2.new(0.638000011, 0, 0.0489999987, 0)
DiscordLabel.Font = Enum.Font.Gotham
DiscordLabel.Text = "Discord Link"
DiscordLabel.TextColor3 = Color3.fromRGB(154, 154, 154)
DiscordLabel.TextScaled = true
DiscordLabel.TextSize = 14.000
DiscordLabel.TextWrapped = true

Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(30, 34, 53)
Top.ClipsDescendants = true
Top.Size = UDim2.new(1.00000024, 0, 0.0710470453, 0)
Top.ZIndex = 3

Close.Name = "Close"
Close.Parent = Top
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(0.949999988, 0, 0.200000003, 0)
Close.Size = UDim2.new(0, 19, 0, 19)
Close.Image = "rbxassetid://7072725342"
Close.ImageColor3 = Color3.fromRGB(115, 168, 190)

UICorner_4.CornerRadius = UDim.new(0.400000006, 0)
UICorner_4.Parent = Top

Page.Name = "Page"
Page.Parent = Main
Page.Active = true
Page.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Page.BackgroundTransparency = 1.000
Page.BorderSizePixel = 0
Page.ClipsDescendants = false
Page.Position = UDim2.new(0.280000001, 0, 0.126666665, 0)
Page.Size = UDim2.new(0.69749999, 0, 0.843333304, 0)
Page.ScrollBarThickness = 0

Button.Name = "Button"
Button.Parent = Page
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundTransparency = 1.000
Button.Size = UDim2.new(0.999166846, 0, 0.104410961, 0)
Button.SizeConstraint = Enum.SizeConstraint.RelativeXX

UICorner_5.CornerRadius = UDim.new(0.200000003, 0)
UICorner_5.Parent = Button

UIStroke.Parent = Button
UIStroke.Thickness = 2.000

ButtonButton.Name = "ButtonButton"
ButtonButton.Parent = Button
ButtonButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonButton.BackgroundTransparency = 1.000
ButtonButton.Size = UDim2.new(1, 0, 1, 0)
ButtonButton.Font = Enum.Font.SourceSans
ButtonButton.Text = ""
ButtonButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonButton.TextScaled = true
ButtonButton.TextSize = 14.000
ButtonButton.TextWrapped = true
ButtonButton.TextXAlignment = Enum.TextXAlignment.Left

ButtonLabel.Name = "ButtonLabel"
ButtonLabel.Parent = Button
ButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonLabel.BackgroundTransparency = 1.000
ButtonLabel.Position = UDim2.new(0.0250896066, 0, 0.111111112, 0)
ButtonLabel.Size = UDim2.new(0.953405023, 0, 0.740740716, 0)
ButtonLabel.Font = Enum.Font.Gotham
ButtonLabel.Text = "TextButton"
ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonLabel.TextScaled = true
ButtonLabel.TextSize = 14.000
ButtonLabel.TextWrapped = true
ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left

UIListLayout_2.Parent = Page
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 4)

Toggle.Name = "Toggle"
Toggle.Parent = Page
Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BackgroundTransparency = 1.000
Toggle.Size = UDim2.new(1, 0, 0.106719375, 0)
Toggle.SizeConstraint = Enum.SizeConstraint.RelativeXX

UICorner_6.CornerRadius = UDim.new(0.200000003, 0)
UICorner_6.Parent = Toggle

UIStroke_2.Parent = Toggle
UIStroke_2.Thickness = 2.000

ToggleLabel.Name = "ToggleLabel"
ToggleLabel.Parent = Toggle
ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.BackgroundTransparency = 1.000
ToggleLabel.Position = UDim2.new(0.0250000004, 0, 0.150000006, 0)
ToggleLabel.Size = UDim2.new(0.845878124, 0, 0.740740716, 0)
ToggleLabel.Font = Enum.Font.Gotham
ToggleLabel.Text = "Toggle"
ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.TextScaled = true
ToggleLabel.TextSize = 14.000
ToggleLabel.TextWrapped = true
ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

ToggleButtonFrame.Name = "ToggleButtonFrame"
ToggleButtonFrame.Parent = Toggle
ToggleButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButtonFrame.BackgroundTransparency = 1.000
ToggleButtonFrame.Position = UDim2.new(0.907000005, 0, 0.143999994, 0)
ToggleButtonFrame.Size = UDim2.new(0.0719999969, 0, 0.740999997, 0)

UICorner_7.CornerRadius = UDim.new(0.300000012, 0)
UICorner_7.Parent = ToggleButtonFrame

UIStroke_3.Parent = ToggleButtonFrame
UIStroke_3.Thickness = 2.000

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ToggleButtonFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundTransparency = 1.000
ToggleButton.Position = UDim2.new(0.150000006, 0, 0.200000003, 0)
ToggleButton.Size = UDim2.new(0.647000015, 0, 0.649999976, 0)
ToggleButton.Image = "rbxassetid://7072706620"
ToggleButton.ImageColor3 = Color3.fromRGB(115, 168, 190)

Label.Name = "Label"
Label.Parent = Page
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.Size = UDim2.new(1, 0, 0.106719375, 0)
Label.SizeConstraint = Enum.SizeConstraint.RelativeXX

UICorner_8.CornerRadius = UDim.new(0.200000003, 0)
UICorner_8.Parent = Label

UIStroke_4.Parent = Label
UIStroke_4.Thickness = 2.000

Label_2.Name = "Label"
Label_2.Parent = Label
Label_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_2.BackgroundTransparency = 1.000
Label_2.Position = UDim2.new(0.0250896066, 0, 0.111111112, 0)
Label_2.Size = UDim2.new(0.953405023, 0, 0.740740716, 0)
Label_2.Font = Enum.Font.Gotham
Label_2.Text = "TextLabel"
Label_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_2.TextScaled = true
Label_2.TextSize = 14.000
Label_2.TextWrapped = true
Label_2.TextXAlignment = Enum.TextXAlignment.Left

Seperator_2.Name = "Seperator"
Seperator_2.Parent = Page
Seperator_2.BackgroundColor3 = Color3.fromRGB(30, 34, 53)
Seperator_2.BorderSizePixel = 0
Seperator_2.Position = UDim2.new(0, 0, 0.410158128, 0)
Seperator_2.Size = UDim2.new(1, 0, 0.0199999996, 0)
Seperator_2.SizeConstraint = Enum.SizeConstraint.RelativeXX

UICorner_9.CornerRadius = UDim.new(1, 0)
UICorner_9.Parent = Seperator_2

Slider.Name = "Slider"
Slider.Parent = Page
Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider.BackgroundTransparency = 1.000
Slider.Size = UDim2.new(0.999166846, 0, 0.209161252, 0)
Slider.SizeConstraint = Enum.SizeConstraint.RelativeXX

UICorner_10.CornerRadius = UDim.new(0.200000003, 0)
UICorner_10.Parent = Slider

UIStroke_5.Parent = Slider
UIStroke_5.Thickness = 2.000

SliderLabel.Name = "SliderLabel"
SliderLabel.Parent = Slider
SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderLabel.BackgroundTransparency = 1.000
SliderLabel.Position = UDim2.new(0.0250896066, 0, 0.111111112, 0)
SliderLabel.Size = UDim2.new(0.953002632, 0, 0.375, 0)
SliderLabel.Font = Enum.Font.Gotham
SliderLabel.Text = "Slider"
SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SliderLabel.TextScaled = true
SliderLabel.TextSize = 14.000
SliderLabel.TextWrapped = true
SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

Bar.Name = "Bar"
Bar.Parent = Slider
Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bar.BackgroundTransparency = 1.000
Bar.ClipsDescendants = true
Bar.Position = UDim2.new(0.0251104683, 0, 0.569444418, 0)
Bar.Size = UDim2.new(0.95039165, 0, 0.291666657, 0)

UICorner_11.CornerRadius = UDim.new(0.200000003, 0)
UICorner_11.Parent = Bar

UIStroke_6.Parent = Bar
UIStroke_6.Thickness = 2.000

Val.Name = "Val"
Val.Parent = Bar
Val.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Val.BackgroundTransparency = 1.000
Val.Position = UDim2.new(0.225274727, 0, 0, 0)
Val.Size = UDim2.new(0.549450636, 0, 1, 0)
Val.ZIndex = 2
Val.Font = Enum.Font.Gotham
Val.Text = "1000"
Val.TextColor3 = Color3.fromRGB(255, 255, 255)
Val.TextScaled = true
Val.TextSize = 14.000
Val.TextWrapped = true

Fill.Name = "Fill"
Fill.Parent = Bar
Fill.BackgroundColor3 = Color3.fromRGB(115, 168, 190)
Fill.Size = UDim2.new(1.00272548, 0, 1, 0)

UICorner_12.CornerRadius = UDim.new(0.25, 0)
UICorner_12.Parent = Fill

Logo.Name = "Logo"
Logo.Parent = Main
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.Position = UDim2.new(-0.018889999, 0, 0.0142093981, 0)
Logo.Size = UDim2.new(0.313889951, 0, 0.295903742, 0)
Logo.Image = "rbxassetid://8223199719"
Logo.ScaleType = Enum.ScaleType.Crop

UIStroke_7.Parent = Main
UIStroke_7.Color = Color3.fromRGB(115, 168, 190)
UIStroke_7.Thickness = 2.000

-- Scripts:

local function CIPFGIC_fake_script() -- Bar.LocalScript 
	local script = Instance.new('LocalScript', Bar)

	local uis = game:GetService("UserInputService")
	local box = script.Parent
	local slider = box.Fill
	local valValue = box.Val
	
	local clicked = false
	local entered = false
	
	box.MouseEnter:Connect(function()
		entered = true
	end)
	
	box.MouseLeave:Connect(function()
		if not clicked then
			entered = false
		end
	end)
	
	local decimals = 1
	local min = 25
	local max = 30
	local setpos = 25.8
	
	local decimaltab = {}
	
	for i = 1,decimals do
		table.insert(decimaltab,0)
	end
	
	slider.Size = UDim2.new((setpos-min)/(max-min),0,slider.Size.Y.Scale,0)
	valValue.Text = setpos
	
	local function dothing()
		if clicked and entered then
			local mospos = uis:GetMouseLocation()
			local relpos = mospos-box.AbsolutePosition
			local percent = math.clamp(relpos.X/box.AbsoluteSize.X,0,1)
			slider.Size = UDim2.new(percent,0,slider.Size.Y.Scale,0)
			valValue.Text = math.floor( ( ( ( max - min ) * percent ) + min ) * ( (1)..(table.concat(decimaltab)) ) ) / ( (1)..(table.concat(decimaltab)) )
		end
	end
	
	uis.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and not clicked then
			clicked = true
			dothing()
		end
	end)
	
	uis.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and clicked then
			clicked = false
		end
	end)
	
	uis.InputChanged:Connect(dothing)
end
coroutine.wrap(CIPFGIC_fake_script)()


local Ui = {
    ["Info"] = {
        ["ClassName"] = "Window"
    }
    ["Children"] = {
        [1] = {
            ["Info"] = {
                ["ClassName"] = "Tab",
                ["Name"] = "Tab 1"
                ["Selected"] = false
            },
            ["Children"] = {
                [1] = {
                    ["Info"] = {
                        ["ClassName"] = "Toggle"
                        ["Text"] = "Yes or no"
                        ["Selected"] = true
                    },
                    ["Function"] = function(val)
                        print(val)
                    end
                }
            }
        },
        [2] = {
            ["Info"] = {
                ["ClassName"] = "Tab"
                ["Name"] = "AutoFarm"
                ["Selected"] = true
            },
            ["Children"] = {
                [1] = {
                    ["Info"] = {
                        ["ClassName"] = "Label"
                        ["Text"] = "AutoFarm"
                    }
                },
                [2] = {
                    ["Info"] = {
                        ["ClassName"] = "Seperator"
                    }
                },
                [3] = {
                    ["Info"] = {
                        ["ClassName"] = "Slider"
                        ["Text"] = "Print Number LOl"
                        ["Minimum"] = 900
                        ["Maximum"] = 1000
                        ["StartValue"] = 983
                    },
                    ["Function"] = function(val)
                        print(val)
                    end
                }
            }
        }
    }
}