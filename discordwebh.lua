local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local webhookUrl = "https://discord.com/api/webhooks/1366820449543000186/kSlzHmE3tej96cmjX36BppUzS_X3S-bDwr4KWiTKtWjXNWlq1AhF_xFArNdGD67xMX-y"

local placeId = game.PlaceId
local jobId = game.JobId

-- PlaceId to Sea mapping
local seaName = ({
    [2753915549] = "Sea 1",
    [4442272183] = "Sea 2",
    [7449423635] = "Sea 3"
})[placeId] or "Unknown Sea"

local fruitMeshes = {
    ["rbxassetid://15116696973"] = "Smoke Fruit",
    ["rbxassetid://15105281957"] = "Spring Fruit",
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

local function flyTo(position)
    RunService:BindToRenderStep("FlyToFruit", Enum.RenderPriority.Character.Value, function()
        if character and humanoidRootPart then
            local direction = (position - humanoidRootPart.Position).Unit
            humanoidRootPart.Velocity = direction * 250
        end
    end)
end

local lastKnownFruit = nil
local alreadySent = false

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

                if fruitPart ~= lastKnownFruit then
                    lastKnownFruit = fruitPart
                    alreadySent = false
                end

                if not alreadySent then
                    local locationInfo = string.format("📍 Location: %s\n🌊 %s | 🗺️ PlaceId: %d\n🧾 JobId: %s", tostring(position), seaName, placeId, jobId)
                    if fruitName then
                        sendToDiscord(string.format("🍇 **%s** has spawned!\n%s\n🧬 MeshId: %s", fruitName, locationInfo, meshId))
                    else
                        sendToDiscord(string.format("❓ **Unknown Fruit** detected!\n%s\n🧬 MeshId: %s", locationInfo, meshId))
                    end
                    flyTo(position)
                    alreadySent = true
                end
                return
            end
        end
    end

    if lastKnownFruit ~= nil then
        sendToDiscord("❌ Fruit has despawned or was picked up.")
        lastKnownFruit = nil
        alreadySent = false
        RunService:UnbindFromRenderStep("FlyToFruit")
    end
end

while true do
    pcall(checkFruit)
    wait(1)
end
