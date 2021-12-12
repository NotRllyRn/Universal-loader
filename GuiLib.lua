
local libary = {}

function libary:CreateWindow(namee)
    local ScreenGui = Instance.new("ScreenGui")
    local WaterMark = Instance.new("ImageLabel")
    local Top = Instance.new("Frame")
    local op = Instance.new("TextButton")
    local Bg = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local Seperator = Instance.new("Frame")
    local Name = Instance.new("TextLabel")
    local lr = Instance.new("Frame")
    local br = Instance.new("Frame")

    if syn.protect_gui() then
        syn.protect_gui(ScreenGui)
    end

    ScreenGui.Name = randomNameNumber(10,20)

    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Top.Name = randomNameNumber(10,20)
    Top.Parent = ScreenGui
    Top.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Top.BorderSizePixel = 0
    Top.Position = UDim2.new(0.0366808474, 0, 0.057309933, 0)
    Top.Size = UDim2.new(0.135888293, 0, 0.0209754519, 0)
    Top.Draggable = true
    Top.Selectable = true
    Top.Active = true
    
    op.Name = randomNameNumber(10,20)
    op.Parent = Top
    op.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    op.BackgroundTransparency = 1.000
    op.BorderSizePixel = 0
    op.Position = UDim2.new(0.851674616, 0, 0, 0)
    op.Size = UDim2.new(0.148325354, 0, 1, 0)
    op.Font = Enum.Font.SourceSans
    op.Text = "-"
    op.TextColor3 = Color3.fromRGB(255, 255, 255)
    op.TextScaled = true
    op.TextSize = 14.000
    op.TextWrapped = true
    
    Bg.Name = randomNameNumber(10,20)
    Bg.Parent = Top
    Bg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Bg.BorderColor3 = Color3.fromRGB(40, 40, 40)
    Bg.BorderSizePixel = 0
    Bg.ClipsDescendants = true
    Bg.Position = UDim2.new(7.24446494e-08, 0, 0.982672095, 0)
    Bg.Size = UDim2.new(0.999999881, 0, 0, 0)
    Bg.ClipsDescendants = true

    UIListLayout.Parent = Bg
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    Seperator.Name = randomNameNumber(10,20)
    Seperator.Parent = Top
    Seperator.BackgroundColor3 = Color3.fromRGB(16, 92, 255)
    Seperator.BorderSizePixel = 0
    Seperator.Position = UDim2.new(0, 0, 1.00000036, 0)
    Seperator.Size = UDim2.new(1, 0, 0.100000001, 0)
    
    Name.Name = randomNameNumber(10,20)
    Name.Parent = Top
    Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Name.BackgroundTransparency = 1.000
    Name.Position = UDim2.new(0.38364172, 0, 0, 0)
    Name.Size = UDim2.new(0.231208354, 0, 1, 0)
    Name.Font = Enum.Font.RobotoCondensed
    Name.Text = namee
    Name.TextColor3 = Color3.fromRGB(255, 255, 255)
    Name.TextSize = 14.000
    
    lr.Name = randomNameNumber(10,20)
    lr.Parent = Top
    lr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    lr.BackgroundTransparency = 1.000
    lr.BorderSizePixel = 0
    lr.Position = UDim2.new(1.40869915, 0, 0.96801579, 0)
    lr.Size = UDim2.new(0.5, 0, 1.45202363, 0)
    
    br.Name = randomNameNumber(10,20)
    br.Parent = Top
    br.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    br.BackgroundTransparency = 1.000
    br.BorderSizePixel = 0
    br.Position = UDim2.new(1.40869915, 0, 4.15745068, 0)
    br.Size = UDim2.new(1.00720918, 0, 2.29660439, 0)

    local ye = true
    
    op.MouseButton1Click:Connect(function()
        if ye == true then
            op.Text = "+"
            Bg:TweenSize(UDim2.new(1,0,0,0), "InOut","Linear",0.1)
            ye = false
        else
            op.Text = "-"
            Bg:TweenSize(UDim2.new(1,0,0,UIListLayout.AbsoluteContentSize.Y+math.floor(6 / UIListLayout.AbsoluteContentSize.Y * 100 + 0.5)), "InOut","Linear",0.1)
            ye = true
        end
    end)

    local buttons = {}

    function buttons:CreateToggle(name1,callback)
        local OnOffLabel = Instance.new("TextLabel")
        local OnOff = Instance.new("TextButton")
        local enabled = false
        local callback = callback or function() end

        OnOffLabel.Name = randomNameNumber(10,20)
        OnOffLabel.Parent = Bg
        OnOffLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        OnOffLabel.BackgroundTransparency = 1.000
        OnOffLabel.Position = UDim2.new(-0.00833702181, 0, 0.0154843125, 0)
        OnOffLabel.Size = UDim2.new(0.5, 0, 0, 18)
        OnOffLabel.Font = Enum.Font.SourceSans
        OnOffLabel.Text = name1
        OnOffLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        OnOffLabel.TextSize = 14.000
        
        OnOff.Name = randomNameNumber(10,20)
        OnOff.Parent = OnOffLabel
        OnOff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        OnOff.BackgroundTransparency = 1.000
        OnOff.Position = UDim2.new(1.46157289, 0, 0.0668381751, 0)
        OnOff.Size = UDim2.new(0.552845538, 0, 0.800000012, 0)
        OnOff.Font = Enum.Font.RobotoMono
        OnOff.Text = "OFF"
        OnOff.TextColor3 = Color3.fromRGB(16, 92, 255)
        OnOff.TextSize = 15.000

        OnOffLabel.Size = UDim2.new(OnOffLabel.Size.X.Scale, 0, 0, tonumber(math.floor(lr.AbsoluteSize.Y)))

        Bg.Size = UDim2.new(1,0,0,UIListLayout.AbsoluteContentSize.Y+math.floor(0.06*UIListLayout.AbsoluteContentSize.Y))


        OnOff.MouseButton1Click:Connect(function()
            enabled = not enabled
            if enabled == true then
                OnOff.Text = "ON"
            else
                OnOff.Text = "OFF"
            end
            pcall(callback, enabled)
        end)
    end

    function buttons:CreateSlider(nm,max,callback)
        local SliderLabel = Instance.new("TextLabel")
        local Line = Instance.new("Frame")
        local Drag = Instance.new("TextButton")
        local Value = Instance.new("TextLabel")

        local max = max or 100
        local uis = game:GetService("UserInputService")
        local dra = false

        local callback = callback or function() end

        SliderLabel.Name = randomNameNumber(10,20)
        SliderLabel.Parent = Bg
        SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderLabel.BackgroundTransparency = 1.000
        SliderLabel.Position = UDim2.new(-0.00833702181, 0, 0.12842384, 0)
        SliderLabel.Size = UDim2.new(0.499949157, 0, 0, 18)
        SliderLabel.Font = Enum.Font.SourceSans
        SliderLabel.Text = nm
        SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderLabel.TextSize = 14.000
        
        Line.Name = randomNameNumber(10,20)
        Line.Parent = SliderLabel
        Line.BackgroundColor3 = Color3.fromRGB(16, 92, 255)
        Line.BorderColor3 = Color3.fromRGB(16, 92, 255)
        Line.BorderSizePixel = 0
        Line.Position = UDim2.new(1.16631222, 0, 0.387096584, 0)
        Line.Size = UDim2.new(0.770640373, 0, 0.0967742056, 0)
        
        Value.Name = randomNameNumber(10,20)
        Value.Parent = Line
        Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Value.BackgroundTransparency = 1.000
        Value.Position = UDim2.new(0.32152313, 0, -1.33333337, 0)
        Value.Size = UDim2.new(0.340604514, 0, 3.63333297, 0)
        Value.ZIndex = 2
        Value.Font = Enum.Font.RobotoMono
        Value.Text = "0"
        Value.TextColor3 = Color3.fromRGB(255, 255, 255)
        Value.TextSize = 15.000
        
        Drag.Name = randomNameNumber(10,20)
        Drag.Parent = Line
        Drag.BackgroundColor3 = Color3.fromRGB(16, 92, 255)
        Drag.BorderSizePixel = 0
        Drag.Position = UDim2.new(0, 0, -2.66700006, 0)
        Drag.Size = UDim2.new(0.0489999987, 0, 6.30000019, 0)
        Drag.Font = Enum.Font.SourceSans
        Drag.Text = ""
        Drag.TextColor3 = Color3.fromRGB(0, 0, 0)
        Drag.TextSize = 14.000

        SliderLabel.Size = UDim2.new(SliderLabel.Size.X.Scale, 0, 0, tonumber(math.floor(lr.AbsoluteSize.Y)))

        Bg.Size = UDim2.new(1,0,0,UIListLayout.AbsoluteContentSize.Y+math.floor(0.06*UIListLayout.AbsoluteContentSize.Y))

        Drag.MouseButton1Down:Connect(function()
            dra = true
        end)

        uis.InputChanged:Connect(function()
            if dra == true then
                local m1 = uis:GetMouseLocation()+Vector2.new(0,36)
                local m2 = m1-Line.AbsolutePosition
                local m3 = math.clamp(m2.X/Line.AbsoluteSize.X,0,1)
                Drag.Position = UDim2.new(m3,0,-2.667,0)
                Value.Text = math.floor(m3*max)
                pcall(callback,m3*max)
            end
        end)

        uis.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dra = false
            end
        end)
    end

    function buttons:CreateButton(nae,callback)
        local buttonf = Instance.new("Frame")
        local button = Instance.new("TextButton")

        local callback = callback or function() end
        
        buttonf.Name = randomNameNumber(10,20)
        buttonf.Parent = Bg
        buttonf.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        buttonf.BackgroundTransparency = 1.000
        buttonf.BorderSizePixel = 0
        buttonf.Position = UDim2.new(0, 0, 0.249043182, 0)
        buttonf.Size = UDim2.new(1.00710702, 0, 0, 28)
        
        button.Name = randomNameNumber(10,20)
        button.Parent = buttonf
        button.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
        button.BorderColor3 = Color3.fromRGB(27, 42, 53)
        button.BorderSizePixel = 0
        button.Position = UDim2.new(0.0376546271, 0, 0.157002911, 0)
        button.Size = UDim2.new(0.909319103, 0, 0.842996597, 0)
        button.Font = Enum.Font.Code
        button.Text = nae
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 14.000

        button.MouseButton1Click:Connect(function()
            pcall(callback)
        end)
    end
    return buttons
end

return libary