-- Make sure this is in a LocalScript
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

-- Create a frame to display tool names
local toolDisplayFrame = Instance.new("Frame")
toolDisplayFrame.Size = UDim2.new(0, 200, 0, 400)
toolDisplayFrame.Position = UDim2.new(0.5, -100, 0.5, -200)
toolDisplayFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toolDisplayFrame.BackgroundTransparency = 0.5
toolDisplayFrame.Parent = gui

-- Create a UIListLayout to organize the tool names
local listLayout = Instance.new("UIListLayout")
listLayout.Parent = toolDisplayFrame
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Function to update the tool list
local function updateToolList()
    -- Clear previous tool names
    for _, child in pairs(toolDisplayFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end

    -- Loop through the player's inventory and add tool names to the list
    for _, item in pairs(player.Backpack:GetChildren()) do
        if item:IsA("Tool") then
            local toolNameLabel = Instance.new("TextLabel")
            toolNameLabel.Text = item.Name
            toolNameLabel.Size = UDim2.new(1, 0, 0, 30)
            toolNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            toolNameLabel.BackgroundTransparency = 1
            toolNameLabel.TextSize = 20
            toolNameLabel.Parent = toolDisplayFrame
        end
    end
end

-- Update the tool list when the script starts
updateToolList()

-- Update the tool list whenever the player changes their inventory
player.Backpack.ChildAdded:Connect(updateToolList)
player.Backpack.ChildRemoved:Connect(updateToolList)
