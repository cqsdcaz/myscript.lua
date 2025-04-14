local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyCustomGUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 513, 0, 378)
Frame.Position = UDim2.new(0.236, 0, 0.183, 0)
Frame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Frame.BorderSizePixel = 0
Frame.Active = true

-- Create a button utility function
local function createButton(name, text, pos)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Text = text
    btn.Parent = Frame
    btn.Size = UDim2.new(0, 142, 0, 37)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.DenkOne
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    return btn
end

-- Title label
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(0, 87, 0, 35)
Title.Position = UDim2.new(0.0169, 0, 0.004, 0)
Title.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Title.BorderColor3 = Color3.fromRGB(34, 34, 34)
Title.BorderSizePixel = 0
Title.Font = Enum.Font.DenkOne
Title.Text = "My Menu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

-- Close Button
local CloseButton = createButton("Close", "X", UDim2.new(0.912, 0, 0, 0))
CloseButton.Size = UDim2.new(0, 45, 0, 37)
CloseButton.Font = Enum.Font.LuckiestGuy
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Scrolling Frame
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = Frame
ScrollingFrame.Position = UDim2.new(0.276, 0, 0.091, 0)
ScrollingFrame.Size = UDim2.new(0, 371, 0, 336)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.Visible = false
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0) -- Allow scrolling if needed

-- Main Farm Button
local MainFarm = createButton("MainFarm", "Main Farm", UDim2.new(0, 0, 0.140, 0))
MainFarm.MouseButton1Click:Connect(function()
    ScrollingFrame.Visible = not ScrollingFrame.Visible
end)

-- Other Buttons
createButton("Teleport", "Teleport", UDim2.new(0, 0, 0.238, 0))
createButton("Fruits", "Fruits", UDim2.new(0, 0, 0.336, 0))
createButton("FarmMaterial", "Farm Material", UDim2.new(0, 0, 0.452, 0))
createButton("PvpSettings", "Pvp Settings", UDim2.new(0, 0, 0.550, 0))
createButton("Esp", "Esp", UDim2.new(0, 0, 0.648, 0))
createButton("Hop", "Hop", UDim2.new(0, 0, 0.746, 0))
createButton("SeaEvent", "Sea Event", UDim2.new(0, 0, 0.844, 0))

-- Make frame draggable
local UserInputService = game:GetService("UserInputService")

local function makeDraggable(frame)
    local dragToggle = nil
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                    startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            update(input)
        end
    end)
end

makeDraggable(Frame)

-- 🔘 Circle Toggle Function
local function createCircleToggle(name, pos, parent, onToggle)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Name = name
    ToggleFrame.Size = UDim2.new(0, 60, 0, 30)
    ToggleFrame.Position = pos
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(90, 60, 60)
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = parent
    ToggleFrame.ClipsDescendants = true

    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.new(0, 26, 0, 26)
    Circle.Position = UDim2.new(0, 2, 0, 2)
    Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Circle.BorderSizePixel = 0
    Circle.Parent = ToggleFrame
    Circle.AnchorPoint = Vector2.new(0, 0)
    Circle.ZIndex = 2
    Circle.Name = "Circle"

    local UICornerToggle = Instance.new("UICorner")
    UICornerToggle.CornerRadius = UDim.new(1, 0)
    UICornerToggle.Parent = ToggleFrame

    local UICornerCircle = Instance.new("UICorner")
    UICornerCircle.CornerRadius = UDim.new(1, 0)
    UICornerCircle.Parent = Circle

    local isOn = false

    local function updateVisual()
        if isOn then
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(60, 160, 60)
            Circle:TweenPosition(UDim2.new(0, 32, 0, 2), "Out", "Quad", 0.2, true)
        else
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(90, 60, 60)
            Circle:TweenPosition(UDim2.new(0, 2, 0, 2), "Out", "Quad", 0.2, true)
        end
    end

    ToggleFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isOn = not isOn
            updateVisual()
            if onToggle then
                onToggle(isOn)
            end
        end
    end)

    updateVisual()
    return ToggleFrame
end

-- ✅ Add Toggle & Label to Scrolling Frame
local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Parent = ScrollingFrame
ToggleLabel.Size = UDim2.new(0, 200, 0, 30)
ToggleLabel.Position = UDim2.new(0, 10, 0, 20)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Text = "Auto Farm:"
ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.Font = Enum.Font.DenkOne
ToggleLabel.TextSize = 18
ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

createCircleToggle("AutoFarmToggle", UDim2.new(0, 220, 0, 20), ScrollingFrame, function(state)
    print("Auto Farm:", state and "ON" or "OFF")
end)

-- Add another toggle for "Auto Cheats" below your existing Auto Farm toggle
createCircleToggle("AutoCheatsToggle", UDim2.new(0, 220, 0, 70), ScrollingFrame, function(state)
    print("Auto Cheats:", state and "ON" or "OFF")
end)

-- Add a label for the Auto Cheats toggle to differentiate it
local AutoCheatsLabel = Instance.new("TextLabel")
AutoCheatsLabel.Parent = ScrollingFrame
AutoCheatsLabel.Size = UDim2.new(0, 200, 0, 30)
AutoCheatsLabel.Position = UDim2.new(0, 10, 0, 60)  -- Adjust this to fit below Auto Farm
AutoCheatsLabel.BackgroundTransparency = 1
AutoCheatsLabel.Text = "Auto Cheats:"
AutoCheatsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoCheatsLabel.Font = Enum.Font.DenkOne
AutoCheatsLabel.TextSize = 18
AutoCheatsLabel.TextXAlignment = Enum.TextXAlignment.Left
