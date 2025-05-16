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


local function checkFruitAndSendToDiscord()
    local fruitContainer = workspace:FindFirstChild("Fruit ")  -- With space in the name
    if not fruitContainer then
        print("❌ Fruit model not found.")
        return
    end

    local fruitModel = fruitContainer:FindFirstChild("Fruit")
    if not fruitModel then
        print("❌ 'Fruit' child not found inside 'Fruit '.")
        return
    end

    local fruitPart = fruitModel:FindFirstChild("Fruit")
    if not fruitPart or not fruitPart:IsA("MeshPart") then
        print("❌ MeshPart not found at expected path.")
        return
    end

    local meshId = fruitPart.MeshId
    print("🔍 Found MeshId: " .. meshId)

    local fruitName = fruitMeshes[meshId]
    local position = tostring(fruitPart.Position)

    if fruitName then
        local message = "🍇 **" .. fruitName .. "** has spawned!\n📍 Location: " .. position .. "\n🧬 MeshId: " .. meshId
        sendToDiscord(message)
        print("✅ Known fruit sent to Discord.")
    else
        local message = "❓ **Unknown Fruit** detected!\n📍 Location: " .. position .. "\n🧬 MeshId: " .. meshId
        sendToDiscord(message)
        print("⚠️ Unknown fruit MeshId: " .. meshId .. " - message sent.")
    end
end


while true do
    checkFruitAndSendToDiscord()
    wait(1) -- wait 10 seconds before checking again
end
