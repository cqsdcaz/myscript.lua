local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Webhook
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

-- Sea Name
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

-- Webhook sender
local function sendToDiscord(message)
    local data = { content = message }
    local jsonData = HttpService:JSONEncode(data)
    local headers = { ["Content-Type"] = "application/json" }

    local requestFunc = syn and syn.request or http_request or request or (fluxus and fluxus.request)
    if requestFunc then
        pcall(function()
            requestFunc({
                Url = webhookUrl,
                Method = "POST",
                Headers = headers,
                Body = jsonData
            })
        end)
    end
end

-- GUI
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FruitESP"
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

-- ESP label
local billboardGui = Instance.new("BillboardGui")
billboardGui.Size = UDim2.new(0, 200, 0, 50)
billboardGui.StudsOffset = Vector3.new(0, 3, 0)
billboardGui.AlwaysOnTop = true

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.new(1, 1, 1)
label.TextStrokeTransparency = 0
label.Font = Enum.Font.SourceSansBold
label.TextScaled = true
label.Parent = billboardGui

-- Track state
local lastKnownFruit = nil
local alreadySent = false

-- Fruit detection
local function checkFruit()
    local fruitContainer = workspace:FindFirstChild("Fruit ")
    if fruitContainer then
        local fruitModel = fruitContainer:FindFirstChild("Fruit")
        if fruitModel then
            local fruitPart = fruitModel:FindFirstChild("Fruit") or fruitModel:FindFirstChild("Face")
            if fruitPart and fruitPart:IsA("MeshPart") then
                local meshId = fruitPart.MeshId
                local position = fruitPart.Position
                local fruitName = fruitMeshes[meshId] or "Unknown Fruit"
                local placeId = game.PlaceId
                local seaName = getSeaName(placeId)
                local jobId = game.JobId

                local distance = math.floor((humanoidRootPart.Position - position).Magnitude)

                if fruitPart ~= lastKnownFruit then
                    lastKnownFruit = fruitPart
                    alreadySent = false
                end

                if not alreadySent then
                    local message = string.format("🍇 **%s** has spawned!\n📍 Location: `%s`\n🧬 MeshId: `%s`\n%s\n🆔 PlaceId: `%s`\n🔁 JobId: `%s`",
                        fruitName, tostring(position), meshId, seaName, placeId, jobId)
                    sendToDiscord(message)
                    teleportButton.Visible = true
                    fruitPosition = position
                    alreadySent = true

                    -- ESP
                    billboardGui:Clone().Parent = fruitPart
                    fruitPart:FindFirstChildOfClass("BillboardGui").TextLabel.Text = string.format("%s\n📏 %d meters", fruitName, distance)
                end

                -- Update ESP distance live
                local gui = fruitPart:FindFirstChildOfClass("BillboardGui")
                if gui then
                    gui.TextLabel.Text = string.format("%s\n📏 %d meters", fruitName, distance)
                end

                return
            end
        end
    end

    -- Despawned
    if lastKnownFruit ~= nil then
        sendToDiscord("❌ Fruit has despawned or was picked up.")
        if lastKnownFruit:FindFirstChildOfClass("BillboardGui") then
            lastKnownFruit:FindFirstChildOfClass("BillboardGui"):Destroy()
        end
        lastKnownFruit = nil
        alreadySent = false
        teleportButton.Visible = false
        fruitPosition = nil
    end
end

-- Loop
while true do
    pcall(checkFruit)
    wait(1)
end
