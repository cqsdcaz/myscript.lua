local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")

local fruits = {
    "Rocket Fruit", "Spin Fruit", "Chop Fruit", "Spring Fruit", "Bomb Fruit", "Smoke Fruit",
    "Spike Fruit", "Flame Fruit", "Falcon Fruit", "Ice Fruit", "Sand Fruit", "Dark Fruit",
    "Diamond Fruit", "Light Fruit", "Rubber Fruit", "Barrier Fruit", "Ghost Fruit", "Magma Fruit",
    "Quake Fruit", "Buddha Fruit", "Love Fruit", "Spider Fruit", "Sound Fruit", "Phoenix Fruit",
    "Rumble Fruit", "Portal Fruit", "Pain Fruit", "Blizzard Fruit", "Gravity Fruit", "Mammoth Fruit",
    "T-Rex Fruit", "Dough Fruit", "Shadow Fruit", "Venom Fruit", "Control Fruit", "Spirit Fruit",
    "Dragon Fruit", "Leopard Fruit", "Kitsune Fruit"
}

-- Function to check if the fruit is in the fruits list
local function isFruit(name)
    for _, fruit in ipairs(fruits) do
        if name == fruit then return true end
    end
    return false
end

-- Function to play a sound (for effect when fruit is found)
local function playSound(id, volume)
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = id
    sound.Volume = volume
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 3)
end

-- Function to create ESP for a fruit
local function createESP(part, name)
    if not part then return end
    local billboard = Instance.new("BillboardGui", part)
    billboard.Size = UDim2.new(0, 100, 0, 20)
    billboard.AlwaysOnTop = true
    billboard.StudsOffset = Vector3.new(0, 2, 0)

    local text = Instance.new("TextLabel", billboard)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.new(1, 1, 0)
    text.Font = Enum.Font.GothamBold
    text.TextSize = 14
    text.Text = name
end

-- Function to fly to the fruit
local function flyToFruit(fruit)
    local handle = fruit:FindFirstChild("Handle")
    if not handle then return end
    playSound("rbxassetid://3997124966", 4)

    while fruit:IsDescendantOf(workspace) do
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            local dist = (handle.Position - hrp.Position).Magnitude
            local duration = dist / 200
            local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
                CFrame = CFrame.new(handle.Position + Vector3.new(0, 5, 0))
            })
            tween:Play()
            tween.Completed:Wait()
            break
        end
        task.wait(0.2)
    end

    if not fruit:IsDescendantOf(workspace) then
        playSound("rbxassetid://4612375233", 1)
    end
end

-- Function to hop servers if no fruits are found
local function hopServer()
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


-- Function to scan for fruits and fly to them
local function scanAndFly()
    while true do
        local fruitsFound = {}

        for _, obj in pairs(workspace:GetChildren()) do
            if isFruit(obj.Name) or obj:IsA("Model") and obj.Name == "Fruit" then
                table.insert(fruitsFound, obj)
            end
        end

        if #fruitsFound > 0 then
            for _, fruit in ipairs(fruitsFound) do
                if fruit and fruit:IsDescendantOf(workspace) then
                    createESP(fruit:FindFirstChild("Handle"), fruit.Name)
                    flyToFruit(fruit)
                    task.wait(0.5)
                end
            end
        else
            task.wait(3)
            hopServer()  -- Hop server if no fruits found
        end

        task.wait(2)
    end
end

-- 🚀 Start auto scan and fly
task.spawn(scanAndFly)
