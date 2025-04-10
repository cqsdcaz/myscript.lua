-- Get the necessary services
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local gui = player.PlayerGui

-- Create the GUI
local partNameGui = Instance.new("ScreenGui")
partNameGui.Name = "PartNameGui"
partNameGui.Parent = gui

-- Create a TextLabel to show the part's name
local partNameLabel = Instance.new("TextLabel")
partNameLabel.Name = "PartNameLabel"
partNameLabel.Size = UDim2.new(0, 300, 0, 50)
partNameLabel.Position = UDim2.new(0.5, -150, 0.1, 0)  -- Position at the top of the screen
partNameLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
partNameLabel.BackgroundTransparency = 0.5
partNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
partNameLabel.TextScaled = true
partNameLabel.Text = "Click a part to get its name!"
partNameLabel.Parent = partNameGui

-- Function to show part name when clicked
local function onMouseClick()
    -- Get the part the mouse is pointing at
    local target = mouse.Target
    
    -- Check if there's a part the mouse is pointing at
    if target then
        -- Get the part's name and display it on the GUI label
        partNameLabel.Text = "Clicked Part: " .. target.Name
    else
        partNameLabel.Text = "No part clicked."
    end
end

-- Connect the mouse click event to the function
mouse.Button1Click:Connect(onMouseClick)
