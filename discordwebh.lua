local HttpService = game:GetService("HttpService")


local webhookUrl = "https://discord.com/api/webhooks/1366820449543000186/kSlzHmE3tej96cmjX36BppUzS_X3S-bDwr4KWiTKtWjXNWlq1AhF_xFArNdGD67xMX-y"


local fruitMeshes = {
    ["rbxassetid://15116696973"] = "Smoke Fruit",
    ["rbxassetid://15111517529"] = "Sand Fruit",
    ["rbxassetid://15116747420"] = "Rumble Fruit",
    ["rbxassetid://15100283484"] = "Light Fruit",
    ["rbxassetid://15112215862"] = "Portal Fruit",
    ["rbxassetid://15104782377"] = "Blade Fruit",
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

-- Track last known fruit MeshId and if it's currently present
local lastMeshId = nil
local fruitPresent = false

local function checkFruit()
    local fruitContainer = workspace:FindFirstChild("Fruit ")
    if fruitContainer and fruitContainer:FindFirstChild("Fruit") and fruitContainer.Fruit:FindFirstChild("Fruit") then
        local fruitPart = fruitContainer.Fruit.Fruit
        if fruitPart:IsA("MeshPart") then
            local meshId = fruitPart.MeshId

            -- Only notify if the fruit is new
            if meshId ~= lastMeshId then
                lastMeshId = meshId
                fruitPresent = true

                local fruitName = fruitMeshes[meshId] or "Unknown Fruit"
                local position = tostring(fruitPart.Position)
                local message = "🍇 **" .. fruitName .. "** has spawned!\n📍 Location: " .. position .. "\n🧬 MeshId: " .. meshId
                sendToDiscord(message)
                print("✅ Fruit spawned: " .. fruitName)
            end
        end
    else
        -- Fruit is not present, but was previously — send despawn notice
        if fruitPresent then
            sendToDiscord("❌ The fruit has despawned or been taken from the map.")
            print("⚠️ Fruit despawned.")
            lastMeshId = nil
            fruitPresent = false
        end
    end
end

while true do
    checkFruit()
    wait(5)
end
