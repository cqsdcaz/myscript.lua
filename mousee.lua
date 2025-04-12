local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- GUI setup to display mouse position (you can modify this as per your needs)
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 200, 0, 50)
label.Position = UDim2.new(0, 10, 0, 10)
label.BackgroundTransparency = 0.5
label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 20
label.Text = "X: 0, Z: 0"
label.Parent = screenGui

-- Function to update the mouse position
local function updateMousePosition()
    local mouseX = mouse.X
    local mouseZ = mouse.Y

    -- Update the label with the current X and Z coordinates
    label.Text = string.format("X: %d, Z: %d", mouseX, mouseZ)
end

-- Connect the update function to the MouseMove event
UserInputService.InputChanged:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        updateMousePosition()
    end
end)
