-- LocalScript placed in StarterPlayer -> StarterPlayerScripts or StarterGui

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui to hold the buttons
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Create the Quest Activate Button
local questButton = Instance.new("TextButton")
questButton.Parent = screenGui
questButton.Size = UDim2.new(0, 200, 0, 50)  -- Size of the button
questButton.Position = UDim2.new(0.5, -100, 0.4, -25)  -- Position of the button (center)
questButton.Text = "Activate Quest"
questButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Green Button
questButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text

-- Create the Exit Button
local exitButton = Instance.new("TextButton")
exitButton.Parent = screenGui
exitButton.Size = UDim2.new(0, 200, 0, 50)  -- Size of the button
exitButton.Position = UDim2.new(0.5, -100, 0.5, -25)  -- Position of the button (center)
exitButton.Text = "Exit Script"
exitButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red Button
exitButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text

-- Function for activating the quest (you can customize this)
questButton.MouseButton1Click:Connect(function()
    print("Quest Activated!")  -- Placeholder: replace with actual quest logic
    -- You can trigger any quest function here instead of print
end)

-- Function to exit the script or shutdown the game
exitButton.MouseButton1Click:Connect(function()
    game:Shutdown()  -- This will close the game
    -- Alternatively, if you just want to hide the GUI instead of shutting down the game:
    -- screenGui:Destroy()  -- This would remove the GUI
end)
