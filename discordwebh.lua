local HttpService = game:GetService("HttpService")

-- Discord Webhook URL
local webhookUrl = "https://discord.com/api/webhooks/1366820449543000186/kSlzHmE3tej96cmjX36BppUzS_X3S-bDwr4KWiTKtWjXNWlq1AhF_xFArNdGD67xMX-y"

-- Known MeshIds and their corresponding fruit names
local fruitMeshes = {
    ["rbxassetid://15116696973"] = "Smoke Fruit",
    ["rbxassetid://15111517529"] = "Sand Fruit",
    ["rbxassetid://15116747420"] = "Rumble Fruit",
    ["rbxassetid://15100283484"] = "Light Fruit",
    ["rbxassetid://15112215862"] = "Portal Fruit",
    ["rbxassetid://15104782377"] = "Blade Fruit"
}

-- Function to send a message to Discord Webhook
local function sendToDiscord(message)
    local data = {
        content = message
    }

    local jsonData = HttpService:JSONEncode(data)

    local headers = {
        ["Content-Type"] = "application/json"
    }

    -- Send the request to Discord
    local requestFunc = syn and syn.request or http_request or request or (fluxus and fluxus.request)

    if requestFunc then
        requestFunc({
            Url = webhookUrl,
            Method = "POST",
            Headers = headers,
            Body = jsonData
        })
        print("✅ Message sent to Discord!")
    else
        warn("❌ No supported HTTP request function found.")
    end
end

-- Function to check the fruit MeshId and send the corresponding message to Discord
local function checkFruitAndSendToDiscord()
    local fruit = workspace:FindFirstChild("Fruit")  -- Find "Fruit" in workspace

    if fruit and fruit:FindFirstChild("Fruit") then
        local fruitPart = fruit.Fruit  -- Access the Fruit part

        if fruitPart:IsA("MeshPart") then
            local fruitMeshId = fruitPart.MeshId
            print("Fruit MeshId: " .. fruitMeshId)  -- Print the MeshId for debug

            -- Check if the MeshId matches any known fruit
            for meshId, fruitName in pairs(fruitMeshes) do
                if fruitMeshId == meshId then
                    local message = fruitName .. " spawned at: " .. tostring(fruitPart.Position) .. "\nMeshId: " .. fruitMeshId
                    sendToDiscord(message)  -- Send the message to Discord
                    print(fruitName .. " found and message sent to Discord!")
                    return  -- Stop after sending the message for the first match
                end
            end

            print("Fruit MeshId does not match any known fruits.")
        else
            print("The part is not a MeshPart.")
        end
    else
        print("Fruit part not found in workspace.")
    end
end

-- Call the function to check the fruit and send the message
checkFruitAndSendToDiscord()
