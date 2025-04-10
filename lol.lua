-- Create a simple GUI to test
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Create a frame to hold the button
local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

-- Create a button inside the frame
local button = Instance.new("TextButton")
button.Parent = frame
button.Size = UDim2.new(0, 180, 0, 40)
button.Position = UDim2.new(0, 10, 0, 30)
button.Text = "Click Me"
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)

-- Add a function to handle button click
button.MouseButton1Click:Connect(function()
    print("Button clicked! GUI is working.")
end)
