local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local fruits = {
    "Rocket Fruit", "Spin Fruit", "Chop Fruit", "Spring Fruit", "Bomb Fruit", "Smoke Fruit",
    "Spike Fruit", "Flame Fruit", "Falcon Fruit", "Ice Fruit", "Sand Fruit", "Dark Fruit",
    "Diamond Fruit", "Light Fruit", "Rubber Fruit", "Barrier Fruit", "Ghost Fruit", "Magma Fruit",
    "Quake Fruit", "Buddha Fruit", "Love Fruit", "Spider Fruit", "Sound Fruit", "Phoenix Fruit",
    "Rumble Fruit", "Portal Fruit", "Pain Fruit", "Blizzard Fruit", "Gravity Fruit", "Mammoth Fruit",
    "T-Rex Fruit", "Dough Fruit", "Shadow Fruit", "Venom Fruit", "Control Fruit", "Spirit Fruit",
    "Dragon Fruit", "Leopard Fruit", "Kitsune Fruit"
}

-- Function to check if the fruit is in the player's backpack
local function hasFruitInBackpack()
    for _, item in pairs(player.Backpack:GetChildren()) do
        if isFruit(item.Name) then
            return true
        end
    end
    return false
end

-- Function to check if the fruit is in the fruits list
local function isFruit(name)
    for _, fruit in ipairs(fruits) do
        if name == fruit then return true end
    end
    return false
end

-- Function to fly to a fruit
local function flyToFruit(fruit)
    local handle = fruit:FindFirstChild("Handle")
    if not handle then return end

    -- Create a simple flying animation to move towards the fruit
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local hrp = character.HumanoidRootPart
        local distance = (handle.Position - hrp.Position).Magnitude
        local duration = distance / 100  -- Adjust speed of flight
        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
        
        local goal = {CFrame = CFrame.new(handle.Position + Vector3.new(0, 5, 0))}
        local tween = TweenService:Create(hrp, tweenInfo, goal)
        tween:Play()
        tween.Completed:Wait()
    end
end

-- Function to hop servers if no fruits are found and the player doesn't have one in their backpack
local function hopServer()
    if hasFruitInBackpack() then
        print("Player already has a fruit, skipping server hop.")
        return
    end
    
    local PlaceID = game.PlaceId
    local minPlayers = 8  -- Minimum number of players you want in a server
    local maxPlayers = 12  -- Maximum number of players for the server to be considered

    local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Asc&limit=100")).data

    for _, server in ipairs(servers) do
        -- Check if the server has between 8 and 12 players
        if server.playing >= minPlayers and server.playing <= maxPlayers then
            TeleportService:TeleportToPlaceInstance(PlaceID, server.id)
            break
        end
    end
end

-- Function to create a GUI button to trigger server hop
local function createHopButton()
    -- Create a simple GUI button
    local screenGui = Instance.new("ScreenGui", player.PlayerGui)
    local hopButton = Instance.new("TextButton", screenGui)
    hopButton.Size = UDim2.new(0, 200, 0, 50)
    hopButton.Position = UDim2.new(0.5, -100, 0.5, -25)
    hopButton.Text = "Hop Server"
    hopButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    hopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    hopButton.Font = Enum.Font.Gotham
    hopButton.TextSize = 24
    
    -- Connect button click event to server hop
    hopButton.MouseButton1Click:Connect(function()
        -- If the player has a fruit in their backpack, skip hopping and fly to the fruit
        local fruitsFound = {}
        for _, obj in pairs(workspace:GetChildren()) do
            if isFruit(obj.Name) then
                table.insert(fruitsFound, obj)
            end
        end

        if #fruitsFound > 0 then
            for _, fruit in ipairs(fruitsFound) do
                if fruit and fruit:IsDescendantOf(workspace) then
                    flyToFruit(fruit)
                    break
                end
            end
        else
            hopServer()  -- Trigger server hop if no fruits found
        end
    end)
end

-- Create the button when the script starts
createHopButton()
