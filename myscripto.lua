local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local workspace = game:GetService("Workspace")

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyCustomGUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 513, 0, 378)
Frame.Position = UDim2.new(0.236, 0, 0.183, 0)
Frame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Frame.BorderSizePixel = 0
Frame.Active = true

-- Draggable
local function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
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
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

makeDraggable(Frame)

-- Title
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(0, 87, 0, 35)
Title.Position = UDim2.new(0.0169, 0, 0.004, 0)
Title.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Title.BorderSizePixel = 0
Title.Font = Enum.Font.DenkOne
Title.Text = "My Menu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

-- Button Utility
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
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)

-- Menu Buttons
local MainFarm = createButton("MainFarm", "Main Farm", UDim2.new(0, 0, 0.140, 0))
MainFarm.MouseButton1Click:Connect(function()
    ScrollingFrame.Visible = not ScrollingFrame.Visible
end)

createButton("Teleport", "Teleport", UDim2.new(0, 0, 0.238, 0))
createButton("Fruits", "Fruits", UDim2.new(0, 0, 0.336, 0))
createButton("FarmMaterial", "Farm Material", UDim2.new(0, 0, 0.452, 0))
createButton("PvpSettings", "Pvp Settings", UDim2.new(0, 0, 0.550, 0))
createButton("Esp", "Esp", UDim2.new(0, 0, 0.648, 0))
createButton("Hop", "Hop", UDim2.new(0, 0, 0.746, 0))
createButton("SeaEvent", "Sea Event", UDim2.new(0, 0, 0.844, 0))

-- Toggle Utility
local function createCircleToggle(name, pos, parent, labelText, callback)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Size = UDim2.new(0, 200, 0, 30)
    label.Position = pos - UDim2.new(0, 220, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.DenkOne
    label.TextSize = 18
    label.TextXAlignment = Enum.TextXAlignment.Left

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
    Circle.ZIndex = 2

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
            if callback then
                callback(isOn)
            end
        end
    end)

    updateVisual()
    return ToggleFrame
end

-- Toggle States
_G.autoCheatsEnabled = false
local autoCheatsScript = nil

createCircleToggle("AutoCheatsToggle", UDim2.new(0, 250, 0, 70), ScrollingFrame, "Auto Cheats:", function(state)
    print("Auto Cheats:", state and "ON" or "OFF")
    _G.autoCheatsEnabled = state

    if state then
        -- Start script directly here
        _G.AutoChestRunning = true

        task.spawn(function()
            local chestFolder = workspace:WaitForChild("ChestModels")
            local locations = workspace._WorldOrigin.Locations

            local locationList = {}

            if game.PlaceId == 2753915549 then
                locationList = {
                    locations.Colosseum,
                    locations.Desert,
                    locations.FrozenVillage,
                    locations.Jungle,
                    locations.MarineBase,
                    locations.MarineStart,
                    locations.MiddleTown,
                    locations.PirateStarterIsland,
                    locations.PirateVillage,
                    locations.SkyIsland1,
                    locations.SkyIsland2,
                    locations.SkyIsland3,
                    locations.UsoppIsland
                }
            end

            local function getNearestChest()
                local closestChest = nil
                local shortestDistance = math.huge
                for _, chest in pairs(chestFolder:GetChildren()) do
                    if chest:IsA("Model") and chest:FindFirstChild("TouchInterest") then
                        local primary = chest.PrimaryPart or chest:FindFirstChild("Main") or chest:FindFirstChildWhichIsA("BasePart")
                        if primary then
                            local distance = (primary.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                            if distance < shortestDistance then
                                shortestDistance = distance
                                closestChest = primary
                            end
                        end
                    end
                end
                return closestChest
            end

            local function moveTo(position)
                local char = LocalPlayer.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                local root = char.HumanoidRootPart
                local tween = TweenService:Create(root, TweenInfo.new(1.2, Enum.EasingStyle.Linear), {CFrame = CFrame.new(position)})
                tween:Play()
                tween.Completed:Wait()
            end

            while _G.AutoChestRunning and task.wait(1) do
                local chest = getNearestChest()
                if chest then
                    moveTo(chest.Position + Vector3.new(0, 3, 0))
                    wait(1.2)
                end
            end
        end)
    else
        -- Stop the chest auto interaction
        _G.AutoChestRunning = false
    end
end)
