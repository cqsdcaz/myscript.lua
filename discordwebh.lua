local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Discord Webhook URL
local webhookUrl = "https://discord.com/api/webhooks/1366820449543000186/kSlzHmE3tej96cmjX36BppUzS_X3S-bDwr4KWiTKtWjXNWlq1AhF_xFArNdGD67xMX-y"

-- Fruit MeshId lookup
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
    ["rbxassetid://89477866336962"] = "Creation Fruit",
    ["rbxassetid://15057683975"] = "Spin Fruit"
}

-- Determine Sea from PlaceId
local function getSeaName(placeId)
    if placeId == 2753915549 then
        return "🌊 Sea 1"
    elseif placeId == 4442272183 then
        return "🌊 Sea 2"
    elseif placeId == 7449423635 then
        return "🌊 Sea 3"
    else
        return "🌍 Unknown Sea"
    end
end

-- Discord Webhook Sender
local function sendToDiscord(message)
    local data = { content = message }
    local jsonData = HttpService:JSONEncode(data)
    local headers = { ["Content-Type"] = "application/json" }

    local requestFunc = syn and syn.request or http_request or request or (fluxus and fluxus.request)
    if requestFunc then
        local success, response = pcall(function()
            return requestFunc({
                Url = webhookUrl,
                Method = "POST",
                Headers = headers,
                Body = jsonData
            })
        end)

        if success then
            print("✅ Message sent to Discord!")
        else
            warn("❌ Failed to send message to Discord:", response)
        end
    else
        warn("❌ No supported HTTP request function found.")
    end
end

-- Auto Fly to Fruit
local function flyTo(position)
    RunService:BindToRenderStep("FlyToFruit", Enum.RenderPriority.Character.Value, function()
        if character and humanoidRootPart then
            local direction = (position - humanoidRootPart.Position).Unit
            humanoidRootPart.Velocity = direction * 250 -- Change speed here if needed
        end
    end)
end

-- GUI Setup
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FruitTeleportGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 200, 0, 50)
teleportButton.Position = UDim2.new(0.5, -100, 0.9, 0)
teleportButton.Text = "Teleport to Fruit"
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
teleportButton.TextColor3 = Color3.new(1, 1, 1)
teleportButton.Font = Enum.Font.SourceSansBold
teleportButton.TextSize = 24
teleportButton.Visible = false
teleportButton.Parent = screenGui

local fruitPosition = nil
teleportButton.MouseButton1Click:Connect(function()
    if fruitPosition and humanoidRootPart then
        humanoidRootPart.CFrame = CFrame.new(fruitPosition + Vector3.new(0, 5, 0))
    end
end)

-- Track state
local lastKnownFruit = nil
local alreadySent = false

-- Fruit Detection
local function checkFruit()
    local fruitContainer = workspace:FindFirstChild("Fruit ")
    if fruitContainer then
        local fruitModel = fruitContainer:FindFirstChild("Fruit")
        if fruitModel then
            local fruitPart = fruitModel:FindFirstChild("Fruit") or fruitModel:FindFirstChild("Face")
            if fruitPart and fruitPart:IsA("MeshPart") then
                local meshId = fruitPart.MeshId
                local position = fruitPart.Position
                local fruitName = fruitMeshes[meshId]
                local placeId = game.PlaceId
                local seaName = getSeaName(placeId)
                local jobId = game.JobId

                if fruitPart ~= lastKnownFruit then
                    lastKnownFruit = fruitPart
                    alreadySent = false
                end

                if fruitName and not alreadySent then
                    local message = string.format("🍇 **%s** has spawned!\n📍 Location: `%s`\n🧬 MeshId: `%s`\n%s\n🆔 PlaceId: `%s`\n🔁 JobId: `%s`",
                        fruitName, tostring(position), meshId, seaName, placeId, jobId)
                    sendToDiscord(message)
                    flyTo(position)
                    fruitPosition = position
                    teleportButton.Visible = true
                    alreadySent = true
                elseif not fruitName and not alreadySent then
                    local message = string.format("❓ **Unknown Fruit** detected!\n📍 Location: `%s`\n🧬 MeshId: `%s`\n%s\n🆔 PlaceId: `%s`\n🔁 JobId: `%s`",
                        tostring(position), meshId, seaName, placeId, jobId)
                    sendToDiscord(message)
                    flyTo(position)
                    fruitPosition = position
                    teleportButton.Visible = true
                    alreadySent = true
                end
                return
            end
        end
    end

    -- Despawned
    if lastKnownFruit ~= nil then
        sendToDiscord("❌ Fruit has despawned or was picked up.")
        lastKnownFruit = nil
        alreadySent = false
        RunService:UnbindFromRenderStep("FlyToFruit")
        teleportButton.Visible = false
        fruitPosition = nil
    end
end

-- Loop to keep checking
while true do
    pcall(checkFruit)
    wait(1)
end
