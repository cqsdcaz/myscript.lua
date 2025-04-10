-- LocalPlayer and PlayerGui setup
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- === Function to Create ESP for Fruits ===
local function createESP(fruit)
    -- Ensure fruit has a 'Handle' part
    local handle = fruit:FindFirstChild("Handle")
    if not handle then return end

    -- Create a Box ESP (Visible Box around the fruit)
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "FruitESP"
    box.Adornee = handle
    box.AlwaysOnTop = true
    box.Size = handle.Size + Vector3.new(0.2, 0.2, 0.2) -- Slightly larger box
    box.Color3 = Color3.fromRGB(255, 200, 0)  -- Yellow-orange color
    box.Transparency = 0.5  -- Semi-transparent
    box.ZIndex = 10
    box.Parent = handle

    -- Create BillboardGui for fruit name
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FruitLabel"
    billboard.Adornee = handle
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)  -- Float the label above the fruit
    billboard.AlwaysOnTop = true
    billboard.Parent = handle

    -- Create the text label for the fruit name
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = fruit.Name  -- Use fruit's name as the label text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text color
    label.TextStrokeTransparency = 0.5  -- Slight border around text
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Parent = billboard
end

-- === Function to Remove ESP ===
local function removeESP(fruit)
    local handle = fruit:FindFirstChild("Handle")
    if handle then
        local box = handle:FindFirstChild("FruitESP")
        if box then box:Destroy() end

        local label = handle:FindFirstChild("FruitLabel")
        if label then label:Destroy() end
    end
end

-- === Add ESP to Existing Fruits ===
for _, fruit in pairs(workspace:GetChildren()) do
    if fruit.Name:find("Fruit ") and fruit:FindFirstChild("Handle") then
        createESP(fruit)
    end
end

-- === Add ESP to Fruits as They Spawn ===
workspace.ChildAdded:Connect(function(child)
    if child.Name:find("Fruit ") and child:FindFirstChild("Handle") then
        createESP(child)
    end
end)

-- === Remove ESP When Fruits Despawn ===
workspace.ChildRemoved:Connect(function(child)
    if child.Name:find("Fruit ") then
        removeESP(child)
    end
end)
