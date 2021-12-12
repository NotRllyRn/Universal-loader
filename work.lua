
local function CreateWindow(Table)
    local WindowInfo = Table["Info"]
    if (WindowInfo["ClassName"] = "Window") then
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
        
        Side.Name = randomNameNumber(10,20)
        Side.Parent = Main
        Side.BackgroundColor3 = Color3.fromRGB(30, 34, 53)
        Side.Size = UDim2.new(0.256830603, 0, 1, 0)
        UICorner_2.CornerRadius = UDim.new(0.100000001, 0)
        UICorner_2.Parent = Side

        Title.Name = randomNameNumber(10,20)
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
        DiscordButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DiscordButton.BackgroundTransparency = 1.000
        DiscordButton.Position = UDim2.new(0.736999989, 0, 0.921999931, 0)
        DiscordButton.Size = UDim2.new(0.154150546, 0, 0.050999999, 0)
        DiscordButton.Image = "rbxassetid://7072718185"
        DiscordButton.ImageColor3 = Color3.fromRGB(154, 154, 154)
        
        DiscordLabel.Name = randomNameNumber(10,20)
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
        
        Holder.Name = randomNameNumber(10,20)
        Holder.Parent = Side
        Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Holder.BackgroundTransparency = 1.000
        Holder.Position = UDim2.new(0, 0, 0.32100001, 0)
        Holder.Size = UDim2.new(1, 0, 0.574000001, 0)
        UIListLayout.Parent = Holder
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0.0299999993, 0)

        Top.Name = randomNameNumber(10,20)
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(30, 34, 53)
        Top.ClipsDescendants = true
        Top.Size = UDim2.new(1.00000024, 0, 0.0710470453, 0)
        Top.ZIndex = 3
        
        Close.Name = randomNameNumber(10,20)
        Close.Parent = Top
        Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Close.BackgroundTransparency = 1.000
        Close.Position = UDim2.new(0.949999988, 0, 0.200000003, 0)
        Close.Size = UDim2.new(0, 19, 0, 19)
        Close.Image = "rbxassetid://7072725342"
        Close.ImageColor3 = Color3.fromRGB(115, 168, 190)
        UICorner_4.CornerRadius = UDim.new(0.400000006, 0)
        UICorner_4.Parent = Top

        Logo.Name = randomNameNumber(10,20)
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
    else
        warn("No Window to be created.")
    end
end