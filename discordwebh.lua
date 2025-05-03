local HttpService = game:GetService("HttpService")


local webhookUrl = "https://discord.com/api/webhooks/1366820449543000186/kSlzHmE3tej96cmjX36BppUzS_X3S-bDwr4KWiTKtWjXNWlq1AhF_xFArNdGD67xMX-y"


local fruitMeshes = {
    ["rbxassetid://15116696973"] = "Smoke Fruit",
    ["rbxassetid://15111517529"] = "Sand Fruit",
    ["rbxassetid://15116747420"] = "Rumble Fruit",
    ["rbxassetid://15100283484"] = "Light Fruit",
    ["rbxassetid://15112215862"] = "Portal Fruit",
}


local function sendToDiscord(message)
    local data = {
        content = message
    }

    local jsonData = HttpService:JSONEncode(data)

    local headers = {
        ["Content-Type"] = "application/json"
    }

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


local playerCount = #game:GetService("Players"):GetPlayers()


local serverID = game.JobId


local fruitModel = workspace:FindFirstChild("Fruit ")
if fruitModel then
    print("Found Fruit object in workspace")
    local fruitName = "Fruit not found"
    local meshId = nil

    if fruitModel:FindFirstChild("Fruit") and fruitModel.Fruit:FindFirstChild("Fruit") then
        local fruit = fruitModel.Fruit.Fruit
        if fruit:IsA("MeshPart") then
            meshId = fruit.MeshId
        elseif fruit:FindFirstChildOfClass("SpecialMesh") then
            meshId = fruit:FindFirstChildOfClass("SpecialMesh").MeshId
        end

        if meshId then
            print("Fruit MeshId: " .. meshId)
        end

        if meshId and fruitMeshes[meshId] then
            fruitName = fruitMeshes[meshId]
        end
    end


    local message = "**🍉 Fruit Finder**\n\n" ..
                    "Players: /" .. playerCount .. "\n" ..
                    "World: Sea\n" ..
                    "Server ID: `" .. serverID .. "`\n" ..
                    "Detected Fruit: `" .. fruitName .. "`\n" ..
                    (meshId and ("MeshId: `" .. meshId .. "`") or "MeshId: Not found")

    sendToDiscord(message)
else
    print("Fruit object not found in workspace")
end
