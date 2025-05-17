-- SERVICES
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- PLAYER REFERENCES
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- DISCORD WEBHOOK
local webhookUrl = "https://discord.com/api/webhooks/1366820449543000186/kSlzHmE3tej96cmjX36BppUzS_X3S-bDwr4KWiTKtWjXNWlq1AhF_xFArNdGD67xMX-y"

-- FRUIT MESH ID TABLE
local fruitMeshes = {
    ["rbxassetid://15116696973"] = "Smoke Fruit",
    ["rbxassetid://15116740364"] = "Bomb Fruit",
    ["rbxassetid://15111517529"] = "Sand Fruit",
    ["rbxassetid://15116747420"] = "Rumble Fruit",
    ["rbxassetid://15100283484"] = "Light Fruit",
    ["rbxassetid://15112215862"] = "Portal Fruit",
    ["rbxassetid://15104782377"] = "Blade Fruit",
    ["rbxassetid://15100433167"] = "Ice Fruit",
    ["rbxassetid://15104817760"] = "Rubber Fruit",
    ["rbxassetid://15060012861"] = "Rocket Fruit",
    ["rbxassetid://15107005807"] = "Spike Fruit",
    ["rbxassetid://15116721173"] = "Pain Fruit",
    ["rbxassetid://15116967784"] = "Spider Fruit",
    ["rbxassetid://15100246632"] = "Phoenix Fruit",
    ["rbxassetid://15105350415"] = "Magma Fruit",
    ["rbxassetid://15057718441"] = "Quake Fruit",
    ["rbxassetid://15116730102"] = "Love Fruit",
    ["rbxassetid://128089773105475"] = "Eagle Fruit",
    ["rbxassetid://84599223955940"] = "Flame Fruit",
    ["rbxassetid://14661837634"] = "Mammoth Fruit",
    ["rbxassetid://15100273645"] = "Dough Fruit",
    ["rbxassetid://15112263502"] = "Shadow Fruit",
    ["rbxassetid://10395895511"] = "Vemon Fruit",
    ["rbxassetid://104856271432800"] = "Gas Fruit",
    ["rbxassetid://15100184583"] = "Control Fruit",
    ["rbxassetid://96747665551647"] = "Yeti Fruit",
    ["rbxassetid://15106768588"] = "Leopard Fruit",
    ["rbxassetid://15482881956"] = "Kitsune Fruit",
    ["rbxassetid://89477866336962"] = "Creation Fruit",
    ["rbxassetid://90582921962686"] = "Gravity Fruit",
    ["rbxassetid://15057683975"] = "Spin Fruit"
    -- Add mesh ID for Flame Fruit here if known
}

-- GUI: TELEPORT BUTTON
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 160, 0, 40)
teleportButton.Position = UDim2.new(0.5, -80, 0.9, 0)
teleportButton.Text = "Teleport to Fruit"
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
teleportButton.TextColor3 = Color3.new(1, 1, 1)
teleportButton.Visible = false
teleportButton.Parent = player:WaitForChild("PlayerGui")

-- VARIABLES
local lastKnownFruit = nil
local alreadySent = false
local fruitPosition = nil

-- DISCORD WEBHOOK FUNCTION
local function sendToDiscord(message)
    local data = {
        ["content"] = message
    }
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local success, response = pcall(function()
        HttpService:PostAsync(webhookUrl, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson, false, headers)
    end)
end

-- GET SEA NAME (OPTIONAL)
local function getSeaName(placeId)
    if placeId == 123 then
        return "🌊 Sea 1"
    elseif placeId == 456 then
        return "🌊 Sea 2"
    else
        return "🌊 Unknown Sea"
    end
end

-- ESP GENERATOR
local function createESP(part, name, distance)
    local gui = Instance.new("BillboardGui")
    gui.Name = "FruitESP"
    gui.Size = UDim2.new(0, 200, 0, 50)
    gui.AlwaysOnTop = true
    gui.StudsOffset = Vector3.new(0, 3, 0)
    gui.Adornee = part

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 0)
    label.TextStrokeTransparency = 0.5
    label.Text = name .. "\n📏 " .. tostring(distance) .. " meters"
    label.Font = Enum.Font.SourceSansBold
    label.TextScaled = true
    label.Parent = gui

    gui.Parent = part
end

-- MAIN FRUIT CHECK FUNCTION
local function checkFruit()
    local fruitContainer = workspace:FindFirstChild("Fruit")
    if not fruitContainer then return end

    local candidates = {
        fruitContainer:FindFirstChild("Fruit"),
        fruitContainer:FindFirstChild("BSurfaceMesh.001"),
        fruitContainer:FindFirstChild("Fruit") and fruitContainer.Fruit:FindFirstChild("Falcon")
    }

    for _, folder in pairs(candidates) do
        if folder then
            local fruitPart = folder:FindFirstChild("Fruit") or folder:FindFirstChild("Face")
            if fruitPart and fruitPart:IsA("MeshPart") then
                local meshId = fruitPart.MeshId
                local fruitName = fruitMeshes[meshId] or "Unknown Fruit"
                local position = fruitPart.Position
                local distance = math.floor((humanoidRootPart.Position - position).Magnitude)

                if fruitPart ~= lastKnownFruit then
                    lastKnownFruit = fruitPart
                    alreadySent = false
                end

                if not alreadySent then
                    local msg = string.format("🍇 **%s** has spawned!\n📍 Location: %s\n🧬 MeshId: %s\n%s\n🆔 PlaceId: %s\n🔁 JobId: %s",
                        fruitName, tostring(position), meshId, getSeaName(game.PlaceId), game.PlaceId, game.JobId)
                    sendToDiscord(msg)
                    teleportButton.Visible = true
                    fruitPosition = position
                    alreadySent = true

                    createESP(fruitPart, fruitName, distance)
                end

                local espGui = fruitPart:FindFirstChild("FruitESP")
                if espGui and espGui:FindFirstChildOfClass("TextLabel") then
                    espGui.TextLabel.Text = fruitName .. "\n📏 " .. tostring(distance) .. " meters"
                end

                return
            end
        end
    end
-- ADDITIONAL SPECIFIC SEARCH FOR workspace.Fruit.Fruit.Gas
local gasFruit = workspace:FindFirstChild("Fruit")
    and workspace.Fruit:FindFirstChild("Fruit")
    and workspace.Fruit.Fruit:FindFirstChild("Gas")

if gasFruit and gasFruit:IsA("MeshPart") then
    local meshId = gasFruit.MeshId
    local fruitName = fruitMeshes[meshId] or "Gas Fruit"
    local position = gasFruit.Position
    local distance = math.floor((humanoidRootPart.Position - position).Magnitude)

    if gasFruit ~= lastKnownFruit then
        lastKnownFruit = gasFruit
        alreadySent = false
    end

    if not alreadySent then
        local msg = string.format("🌫️ **%s** has spawned!\n📍 Location: %s\n🧬 MeshId: %s\n%s\n🆔 PlaceId: %s\n🔁 JobId: %s",
            fruitName, tostring(position), meshId, getSeaName(game.PlaceId), game.PlaceId, game.JobId)
        sendToDiscord(msg)
        teleportButton.Visible = true
        fruitPosition = position
        alreadySent = true

        createESP(gasFruit, fruitName, distance)
    end

    local espGui = gasFruit:FindFirstChild("FruitESP")
    if espGui and espGui:FindFirstChildOfClass("TextLabel") then
        espGui.TextLabel.Text = fruitName .. "\n📏 " .. tostring(distance) .. " meters"
    end

    return
end

    -- Additional specific search for workspace.Fruit.Fruit.Neon
local neonFruit = workspace:FindFirstChild("Fruit")
    and workspace.Fruit:FindFirstChild("Fruit")
    and workspace.Fruit.Fruit:FindFirstChild("Neon")

if neonFruit and neonFruit:IsA("MeshPart") then
    local meshId = neonFruit.MeshId
    local fruitName = fruitMeshes[meshId] or "Yeti Fruit"
    local position = neonFruit.Position
    local distance = math.floor((humanoidRootPart.Position - position).Magnitude)

    if neonFruit ~= lastKnownFruit then
        lastKnownFruit = neonFruit
        alreadySent = false
    end

    if not alreadySent then
        local msg = string.format("✨ **%s** has spawned!\n📍 Location: %s\n🧬 MeshId: %s\n%s\n🆔 PlaceId: %s\n🔁 JobId: %s",
            fruitName, tostring(position), meshId, getSeaName(game.PlaceId), game.PlaceId, game.JobId)
        sendToDiscord(msg)
        teleportButton.Visible = true
        fruitPosition = position
        alreadySent = true

        createESP(neonFruit, fruitName, distance)
    end

    local espGui = neonFruit:FindFirstChild("FruitESP")
    if espGui and espGui:FindFirstChildOfClass("TextLabel") then
        espGui.TextLabel.Text = fruitName .. "\n📏 " .. tostring(distance) .. " meters"
    end

    return
end

    
    -- Additional specific search for workspace.Fruit.Fruit.Flame
   -- Additional specific search for workspace.Fruit.Fruit.Flame
local flameFruit = workspace:FindFirstChild("Fruit")
    and workspace.Fruit:FindFirstChild("Fruit")
    and workspace.Fruit.Fruit:FindFirstChild("Flame")

if flameFruit and flameFruit:IsA("MeshPart") then
    local meshId = flameFruit.MeshId
    local fruitName = fruitMeshes[meshId] or "Flame Fruit"
    local position = flameFruit.Position
    local distance = math.floor((humanoidRootPart.Position - position).Magnitude)

    if flameFruit ~= lastKnownFruit then
        lastKnownFruit = flameFruit
        alreadySent = false
    end

    if not alreadySent then
        local msg = string.format("🔥 **%s** has spawned!\n📍 Location: %s\n🧬 MeshId: %s\n%s\n🆔 PlaceId: %s\n🔁 JobId: %s",
            fruitName, tostring(position), meshId, getSeaName(game.PlaceId), game.PlaceId, game.JobId)
        sendToDiscord(msg)
        teleportButton.Visible = true
        fruitPosition = position
        alreadySent = true

        createESP(flameFruit, fruitName, distance)
    end

    local espGui = flameFruit:FindFirstChild("FruitESP")
    if espGui and espGui:FindFirstChildOfClass("TextLabel") then
        espGui.TextLabel.Text = fruitName .. "\n📏 " .. tostring(distance) .. " meters"
    end

    return
end


    -- Despawn detection
    if lastKnownFruit then
        sendToDiscord("❌ Fruit has despawned or was picked up.")
        if lastKnownFruit:FindFirstChild("FruitESP") then
            lastKnownFruit.FruitESP:Destroy()
        end
        lastKnownFruit = nil
        alreadySent = false
        teleportButton.Visible = false
        fruitPosition = nil
    end
end

-- TELEPORT BUTTON FUNCTION
teleportButton.MouseButton1Click:Connect(function()
    if fruitPosition and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(fruitPosition + Vector3.new(0, 3, 0))
    end
end)

-- MAIN LOOP
RunService.RenderStepped:Connect(function()
    pcall(checkFruit)
end)
