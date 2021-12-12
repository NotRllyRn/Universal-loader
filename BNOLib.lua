local function CreateWindow(Table)
    local SelectedTab
    
    local GuiParts
    GuiParts = {
        ["Tab"] = function(Tab1,Parent1,Main)
            local TabInfo = Tab1["Info"]
            local Selected = TabInfo["Selected"]

            local Tab = Instance.new("TextButton")
            local Page = Instance.new("ScrollingFrame")
            local UIListLayout_2 = Instance.new("UIListLayout")

            Tab.Name = randomNameNumber(10,20)
            Tab.Parent = Parent1
            Tab.BackgroundTransparency = 1
            Tab.Size = UDim2.new(0.992872238, 0, 0.117310949, 0)
            Tab.Font = Enum.Font.Gotham
            Tab.Text = TabInfo["Name"]
            Tab.TextScaled = true
            Tab.TextWrapped = true

            Page.Name = randomNameNumber(10,20)
            Page.Parent = Main
            Page.Active = true
            Page.BackgroundTransparency = 1
            Page.ClipsDescendants = false
            Page.Position = UDim2.new(0.280000061, 0, 0.126666695, 0)
            Page.Size = UDim2.new(0.69749999, 0, 0.654481769, 0)
            Page.SizeConstraint = Enum.SizeConstraint.RelativeXX
            Page.ScrollBarThickness = 0
            UIListLayout_2.Parent = Page
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

            if not Selected then
                Page.Visible = false
                Tab.TextColor3 = Color3.fromRGB(154, 154, 154)
            elseif not SelectedTab then
                SelectedTab = {Tab,Page}
                Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
            end

            Tab.MouseButton1Click:Connect(function()
                if not (SelectedTab[1] == Tab) then
                    SelectedTab[1].TextColor3 = Color3.fromRGB(154, 154, 154)
                    SelectedTab[2].Visible = false

                    Page.Visible = true
                    Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SelectedTab = {Tab,Page}
                end
            end)

            local TabChildren = Tab1["Children"]

            if TabChildren then
                for _,part in pairs(TabChildren) do
                    GuiParts[part["Info"]["ClassName"]](part,Page,Main)
                end
            end

            local Child = Page:FindFirstChildOfClass("Frame")
            if Child then
                local ChildSize = Child.AbsoluteSize.Y
                UIListLayout_2.Padding = UDim.new(0, ChildSize/3)
                cWrap(function()
                    wait(1)
                    Page.CanvasSize = UDim2.new(0,0,0,(UIListLayout_2.AbsoluteContentSize.Y)+(ChildSize*7))
                end)
            end
        end,
        ["Button"] = function(Button1,Parent1)
            local ButtonInfo = Button1["Info"]
            local ButtonText = ButtonInfo["Text"]
            local ActivationAmount = ButtonInfo["ActivateAmount"]
            local WaitTime = ButtonInfo["Debounce"]

            local Button = Instance.new("Frame")
            local UICorner_5 = Instance.new("UICorner")
            local UIStroke = Instance.new("UIStroke")
            local ButtonButton = Instance.new("TextButton")
            local ButtonLabel = Instance.new("TextLabel")

            Button.Name = randomNameNumber(10,20)
            Button.Parent = Parent1
            Button.BackgroundTransparency = 1
            Button.Size = UDim2.new(0.999166846, 0, 0.104410961, 0)
            Button.SizeConstraint = Enum.SizeConstraint.RelativeXX
            UICorner_5.CornerRadius = UDim.new(0.200000003, 0)
            UICorner_5.Parent = Button
            UIStroke.Parent = Button
            UIStroke.Thickness = 2
            
            ButtonButton.Name = randomNameNumber(10,20)
            ButtonButton.Parent = Button
            ButtonButton.BackgroundTransparency = 1
            ButtonButton.Size = UDim2.new(1, 0, 1, 0)
            ButtonButton.Font = Enum.Font.Gotham
            ButtonButton.Text = ""
            ButtonButton.TextScaled = true
            ButtonButton.TextWrapped = true
            ButtonButton.TextXAlignment = Enum.TextXAlignment.Left
            
            ButtonLabel.Name = randomNameNumber(10,20)
            ButtonLabel.Parent = Button
            ButtonLabel.BackgroundTransparency = 1
            ButtonLabel.Position = UDim2.new(0.0250896066, 0, 0.111111112, 0)
            ButtonLabel.Size = UDim2.new(0.953405023, 0, 0.740740716, 0)
            ButtonLabel.Font = Enum.Font.Gotham
            ButtonLabel.Text = ButtonText
            ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonLabel.TextScaled = true
            ButtonLabel.TextWrapped = true
            ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left

            local Activated = 0
            local Debounce = false

            local ButtonConnection
            ButtonConnection = ButtonButton.MouseButton1Click:Connect(function()
                if ActivationAmount then
                    if ActivationAmount <= Activated then
                        Activated = nil
                        ButtonConnection:Disconnect()
                        Debounce = nil
                        return
                    end
                    Activated += 1
                elseif Activated then
                    Activated = nil
                end
                if WaitTime then
                    if Debounce then
                        return
                    end
                    Debounce = true
                elseif not (Debounce == nil) then
                    Debounce = nil
                end
                Button1["Function"]()
                if WaitTime then
                    wait(WaitTime)
                    Debounce = false
                end
            end)
        end,
        ["Label"] = function(Label1,Parent1)
            local LabelInfo = Label1["Info"]
            local LabelName = LabelInfo["Text"]

            local Label = Instance.new("Frame")
            local UICorner_8 = Instance.new("UICorner")
            local UIStroke_4 = Instance.new("UIStroke")
            local Label_2 = Instance.new("TextLabel")

            Label.Name = randomNameNumber(10,20)
            Label.Parent = Parent1
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(1, 0, 0.106719375, 0)
            Label.SizeConstraint = Enum.SizeConstraint.RelativeXX
            UICorner_8.CornerRadius = UDim.new(0.200000003, 0)
            UICorner_8.Parent = Label
            UIStroke_4.Parent = Label
            UIStroke_4.Thickness = 2
            
            Label_2.Name = randomNameNumber(10,20)
            Label_2.Parent = Label
            Label_2.BackgroundTransparency = 1
            Label_2.Position = UDim2.new(0.0250896066, 0, 0.111111112, 0)
            Label_2.Size = UDim2.new(0.953405023, 0, 0.740740716, 0)
            Label_2.Font = Enum.Font.Gotham
            Label_2.Text = LabelName
            Label_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label_2.TextScaled = true
            Label_2.TextWrapped = true
            Label_2.TextXAlignment = Enum.TextXAlignment.Left
        end,
        ["Seperator"] = function(_,Parent1)
            local Seperator_2 = Instance.new("Frame")
            local UICorner_9 = Instance.new("UICorner")

            Seperator_2.Name = "Seperator"
            Seperator_2.Parent = Parent1
            Seperator_2.BackgroundColor3 = Color3.fromRGB(30, 34, 53)
            Seperator_2.BorderSizePixel = 0
            Seperator_2.Position = UDim2.new(0, 0, 0.410158128, 0)
            Seperator_2.Size = UDim2.new(1, 0, 0.0199999996, 0)
            Seperator_2.SizeConstraint = Enum.SizeConstraint.RelativeXX
            
            UICorner_9.CornerRadius = UDim.new(1, 0)
            UICorner_9.Parent = Seperator_2
        end,
        ["Toggle"] = function(Toggle1,Parent1)
            local ToggleInfo = Toggle1["Info"]
            local ToggleName = ToggleInfo["Text"]
            local Selected = ToggleInfo["Selected"] or false

            local Toggle = Instance.new("Frame")
            local UICorner_6 = Instance.new("UICorner")
            local UIStroke_2 = Instance.new("UIStroke")
            local ToggleLabel = Instance.new("TextLabel")
            local ToggleButtonFrame = Instance.new("Frame")
            local UICorner_7 = Instance.new("UICorner")
            local UIStroke_3 = Instance.new("UIStroke")
            local ToggleButton = Instance.new("ImageButton")

            Toggle.Name = randomNameNumber(10,20)
            Toggle.Parent = Parent1
            Toggle.BackgroundTransparency = 1
            Toggle.Size = UDim2.new(1, 0, 0.106719375, 0)
            Toggle.SizeConstraint = Enum.SizeConstraint.RelativeXX
            UICorner_6.CornerRadius = UDim.new(0.200000003, 0)
            UICorner_6.Parent = Toggle
            UIStroke_2.Parent = Toggle
            UIStroke_2.Thickness = 2
            
            ToggleLabel.Name = randomNameNumber(10,20)
            ToggleLabel.Parent = Toggle
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Position = UDim2.new(0.0250000004, 0, 0.150000006, 0)
            ToggleLabel.Size = UDim2.new(0.845878124, 0, 0.740740716, 0)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Text = ToggleName
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextScaled = true
            ToggleLabel.TextWrapped = true
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            ToggleButtonFrame.Name = randomNameNumber(10,20)
            ToggleButtonFrame.Parent = Toggle
            ToggleButtonFrame.BackgroundTransparency = 1
            ToggleButtonFrame.Position = UDim2.new(0.907000005, 0, 0.143999994, 0)
            ToggleButtonFrame.Size = UDim2.new(0.0719999969, 0, 0.740999997, 0)
            UICorner_7.CornerRadius = UDim.new(0.300000012, 0)
            UICorner_7.Parent = ToggleButtonFrame
            UIStroke_3.Parent = ToggleButtonFrame
            UIStroke_3.Thickness = 2
            
            ToggleButton.Name = randomNameNumber(10,20)
            ToggleButton.Parent = ToggleButtonFrame
            ToggleButton.BackgroundTransparency = 1
            ToggleButton.Position = UDim2.new(0.150000006, 0, 0.200000003, 0)
            ToggleButton.Size = UDim2.new(0.647000015, 0, 0.649999976, 0)
            ToggleButton.Image = "rbxassetid://7072706620"
            ToggleButton.ImageColor3 = Color3.fromRGB(115, 168, 190)

            local CurrentSelect

            if Selected then
                CurrentSelect = true
            elseif not Selected then
                CurrentSelect = false
                ToggleButton.ImageTransparency = 1
            end

            ToggleButton.MouseButton1Click:Connect(function()
                if CurrentSelect then
                    CurrentSelect = false
                    ToggleButton.ImageTransparency = 1
                else
                    CurrentSelect = true
                    ToggleButton.ImageTransparency = 0
                end
                Toggle1["Function"](CurrentSelect)
            end)
        end,
        ["Slider"] = function(Slider1,Parent1,Main)
            local SliderInfo = Slider1["Info"]
            local SliderName = SliderInfo["Text"]
            local Mini = SliderInfo["Minimum"]
            local Maxi = SliderInfo["Maximum"]
            local StartVal = SliderInfo["StartValue"] or Mini
            local FireWhenEnd = SliderInfo["FireWhenEnd"] or true

            local StartPos = ((StartVal-Mini)/(Maxi-Mini))
            local Decimals
            do
                local DecimalTable = {}
                for _ = 1,SliderInfo["Decimals"] do
                    table.insert(DecimalTable,0)
                end
                Decimals = table.concat(DecimalTable)
            end

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

            Slider.Name = randomNameNumber(10,20)
            Slider.Parent = Parent1
            Slider.BackgroundTransparency = 1.000
            Slider.Size = UDim2.new(0.999166846, 0, 0.209161252, 0)
            Slider.SizeConstraint = Enum.SizeConstraint.RelativeXX
            UICorner_10.CornerRadius = UDim.new(0.200000003, 0)
            UICorner_10.Parent = Slider
            UIStroke_5.Parent = Slider
            UIStroke_5.Thickness = 2.000
            
            SliderLabel.Name = randomNameNumber(10,20)
            SliderLabel.Parent = Slider
            SliderLabel.BackgroundTransparency = 1.000
            SliderLabel.Position = UDim2.new(0.0250896066, 0, 0.111111112, 0)
            SliderLabel.Size = UDim2.new(0.953002632, 0, 0.375, 0)
            SliderLabel.Font = Enum.Font.Gotham
            SliderLabel.Text = SliderName
            SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderLabel.TextScaled = true
            SliderLabel.TextWrapped = true
            SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            Bar.Name = randomNameNumber(10,20)
            Bar.Parent = Slider
            Bar.BackgroundTransparency = 1.000
            Bar.ClipsDescendants = true
            Bar.Position = UDim2.new(0.0251104683, 0, 0.569444418, 0)
            Bar.Size = UDim2.new(0.95039165, 0, 0.291666657, 0)
            UICorner_11.CornerRadius = UDim.new(0.200000003, 0)
            UICorner_11.Parent = Bar
            UIStroke_6.Parent = Bar
            UIStroke_6.Thickness = 2.000
            
            Val.Name = randomNameNumber(10,20)
            Val.Parent = Bar
            Val.BackgroundTransparency = 1.000
            Val.Position = UDim2.new(0.225274727, 0, 0, 0)
            Val.Size = UDim2.new(0.549450636, 0, 1, 0)
            Val.ZIndex = 2
            Val.Font = Enum.Font.Gotham
            Val.Text = StartVal
            Val.TextColor3 = Color3.fromRGB(255, 255, 255)
            Val.TextScaled = true
            Val.TextWrapped = true
            
            Fill.Name = randomNameNumber(10,20)
            Fill.Parent = Bar
            Fill.BackgroundColor3 = Color3.fromRGB(115, 168, 190)
            Fill.Size = UDim2.new(StartPos, 0, 1, 0)
            UICorner_12.CornerRadius = UDim.new(0.25, 0)
            UICorner_12.Parent = Fill

            do
                local Clicked = false
                local Entered = false
                local Entered_1 = false
                
                local SliderVal = tonumber(StartVal)

                local function updateBar()
                    if Clicked and Entered then
                        local Val1 = math.clamp(((userInput:GetMouseLocation().X)-Bar.AbsolutePosition.X)/Bar.AbsoluteSize.X,0,1)
                        SliderVal = math.floor((((Maxi-Mini)*Val1)+Mini)*((1)..tonumber(Decimals)))/((1)..tonumber(Decimals))
                        Fill.Size = UDim2.new(Val1,0,1,0)
                        Val.Text = SliderVal
                        if not FireWhenEnd then
                            Slider1["Function"](SliderVal)
                        end
                    end
                end

                Bar.MouseEnter:Connect(function()
                    Entered = true
                    Entered_1 = true
                    Main.Selectable = false
                    Main.Draggable = false
                end)
                Bar.MouseLeave:Connect(function()
                    if not Clicked then
                        Entered = false
                        Main.Selectable = true
                        Main.Draggable = true
                    end
                    Entered_1 = false
                end)

                userInput.InputBegan:Connect(function(input)
                    if (input.UserInputType == Enum.UserInputType.MouseButton1) and not Clicked then
                        if Entered then
                            Clicked = true
                        end
                        updateBar()
                    end
                end)
                userInput.InputEnded:Connect(function(input)
                    if (input.UserInputType == Enum.UserInputType.MouseButton1) and Clicked then
                        Clicked = false
                        if not Entered_1 then
                            Entered = false
                            Main.Selectable = true
                            Main.Draggable = true
                        end
                        if FireWhenEnd then
                            Slider1["Function"](SliderVal)
                        end
                    end
                end)
                userInput.InputChanged:Connect(updateBar)
            end
        end
    }
    
    local WindowInfo = Table["Info"]
    if (WindowInfo["ClassName"] == "Window") then
        local ScreenGui = Instance.new("ScreenGui")
        local Main = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local Side = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local Title = Instance.new("TextLabel")
        local Seperator = Instance.new("Frame")
        local UICorner_3 = Instance.new("UICorner")
        local DiscordButton = Instance.new("ImageButton")
        local DiscordLabel = Instance.new("TextButton")
        local Holder = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local Top = Instance.new("Frame")
        local Close = Instance.new("ImageButton")
        local UICorner_4 = Instance.new("UICorner")
        local Logo = Instance.new("ImageLabel")
        local UIStroke_7 = Instance.new("UIStroke")

        ScreenGui.Name = randomNameNumber(10,20)
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        Main.Name = randomNameNumber(10,20)
        Main.Parent = ScreenGui
        Main.BackgroundColor3 = Color3.fromRGB(21, 23, 36)
        Main.BorderColor3 = Color3.fromRGB(112, 162, 193)
        Main.BorderSizePixel = 0
        Main.ClipsDescendants = true
        Main.Position = UDim2.new(0.191025868, 0, 0.137556449, 0)
        Main.Size = UDim2.new(0.389483929, 0, 0.500834703, 0)
        UICorner.CornerRadius = UDim.new(0.0299999993, 0)
        UICorner.Parent = Main
        
        Main.Selectable = true
        Main.Active = true
        Main.Draggable = true

        Side.Name = randomNameNumber(10,20)
        Side.Parent = Main
        Side.BackgroundColor3 = Color3.fromRGB(30, 34, 53)
        Side.Size = UDim2.new(0.256830603, 0, 1, 0)
        UICorner_2.CornerRadius = UDim.new(0.100000001, 0)
        UICorner_2.Parent = Side

        Title.Name = randomNameNumber(10,20)
        Title.Parent = Side
        Title.BackgroundTransparency = 1
        Title.Position = UDim2.new(0.0495946333, 0, 0.226666719, 0)
        Title.Size = UDim2.new(0.900810719, 0, 0.0599999987, 0)
        Title.Font = Enum.Font.Gotham
        Title.Text = "be nice okay?"
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextScaled = true
        Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextWrapped = true
        
        Seperator.Name = randomNameNumber(10,20)
        Seperator.Parent = Side
        Seperator.BackgroundColor3 = Color3.fromRGB(115, 168, 190)
        Seperator.BorderSizePixel = 0
        Seperator.Position = UDim2.new(0.0495946333, 0, 0.290113151, 0)
        Seperator.Size = UDim2.new(0.900810719, 0, 0.0199999996, 0)
        UICorner_3.CornerRadius = UDim.new(1, 0)
        UICorner_3.Parent = Seperator

        DiscordButton.Name = randomNameNumber(10,20)
        DiscordButton.Parent = Side
        DiscordButton.BackgroundTransparency = 1
        DiscordButton.Position = UDim2.new(0.736999989, 0, 0.921999931, 0)
        DiscordButton.Size = UDim2.new(0.154150546, 0, 0.050999999, 0)
        DiscordButton.Image = "rbxassetid://7072718185"
        DiscordButton.ImageColor3 = Color3.fromRGB(154, 154, 154)
        
        DiscordLabel.Name = randomNameNumber(10,20)
        DiscordLabel.Parent = Side
        DiscordLabel.BackgroundTransparency = 1
        DiscordLabel.Position = UDim2.new(0.0799999982, 0, 0.921999991, 0)
        DiscordLabel.Size = UDim2.new(0.638000011, 0, 0.0489999987, 0)
        DiscordLabel.Font = Enum.Font.Gotham
        DiscordLabel.Text = "Discord Link"
        DiscordLabel.TextColor3 = Color3.fromRGB(154, 154, 154)
        DiscordLabel.TextScaled = true
        DiscordLabel.TextWrapped = true
        
        Holder.Name = randomNameNumber(10,20)
        Holder.Parent = Side
        Holder.BackgroundTransparency = 1
        Holder.Position = UDim2.new(0, 0, 0.32100001, 0)
        Holder.Size = UDim2.new(1, 0, 0.574000001, 0)
        UIListLayout.Parent = Holder
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0.0299999993, 0)

        Top.Name = randomNameNumber(10,20)
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(30, 34, 53)
        Top.ClipsDescendants = true
        Top.Size = UDim2.new(100024, 0, 0.0710470453, 0)
        Top.ZIndex = 3
        
        Close.Name = randomNameNumber(10,20)
        Close.Parent = Top
        Close.BackgroundTransparency = 1
        Close.Position = UDim2.new(0.949999988, 0, 0.200000003, 0)
        Close.Size = UDim2.new(0, 19, 0, 19)
        Close.Image = "rbxassetid://7072725342"
        Close.ImageColor3 = Color3.fromRGB(115, 168, 190)
        UICorner_4.CornerRadius = UDim.new(0.400000006, 0)
        UICorner_4.Parent = Top

        Logo.Name = randomNameNumber(10,20)
        Logo.Parent = Main
        Logo.BackgroundTransparency = 1
        Logo.Position = UDim2.new(-0.018889999, 0, 0.0142093981, 0)
        Logo.Size = UDim2.new(0.313889951, 0, 0.295903742, 0)
        Logo.Image = "rbxassetid://8223199719"
        Logo.ScaleType = Enum.ScaleType.Crop
        UIStroke_7.Parent = Main
        UIStroke_7.Color = Color3.fromRGB(115, 168, 190)
        UIStroke_7.Thickness = 2

        Close.MouseButton1Click:Connect(function()
            ScreenGui:Destroy()
        end)

        DiscordButton.MouseButton1Click:Connect(function()
            setclipboard("https://discord.gg/zpFpWqBqCn")
        end)
        DiscordLabel.MouseButton1Click:Connect(function()
            setclipboard("https://discord.gg/zpFpWqBqCn")
        end)

        local WindowChildren = Table["Children"]
        local WindowParent = Holder

        for _,part in pairs(WindowChildren) do
            GuiParts[part["Info"]["ClassName"]](part,WindowParent,Main)
        end

        ScreenGui.Parent = game.CoreGui
    else
        warn("No Window to be created.")
    end
end

CreateWindow(({...})[1])