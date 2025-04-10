-- Get the necessary services
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Function to show part name when clicked
local function onMouseClick()
    -- Get the part the mouse is pointing at
    local target = mouse.Target
    
    -- Check if there's a part the mouse is pointing at
    if target then
        -- Get the part's name and print it to the console
        print("You clicked on: " .. target.Name)
        
        -- Optionally, show the name in a GUI or elsewhere
        local label = player.PlayerGui:FindFirstChild("PartNameLabel")
        if not label then
            -- Create a simple GUI to show the name if it doesn't exist
            label = Instance.new("TextLabel")
            label.Name = "PartNameLabel"
            label.Size = UDim2.new(0, 200, 0, 50)
            label.Position = UDim2.new(0.5, -100, 0.1, 0)
            label.BackgroundTransparency = 0.5
            label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextScaled = true
            label.Text = "Clicked Part: " .. target.Name
            label.Parent = player.PlayerGui
        else
            -- Update the label text
            label.Text = "Clicked Part: " .. target.Name
        end
    end
end

-- Connect the mouse click event to the function
mouse.Button1Click:Connect(onMouseClick)
