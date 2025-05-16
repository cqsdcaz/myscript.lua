local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

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

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local lastKnownFruit = nil
local alreadySent = false

-- 🧃 Send Discord Message
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
            print("✅ Sent to Discord!")
        else
            warn("❌ Failed to send message:", response)
        end
    else
        warn("❌ No HTTP request method found.")
    end
end

-- ✈️ Move to fruit
local function flyTo(position)
    RunService:BindToRenderStep("FlyToFruit", Enum.RenderPriority.Character.Value + 1, function()
        if not character or not character.Parent then return end

        local direction = (position - humanoidRootPart.Position).Unit
        local distance = (position - humanoidRootPart.Position).Magnitude

        humanoidRootPart.Velocity = direction * 60

        if distance < 5 then
            humanoidRootPart.Velocity = Vector3.zero
            RunService:UnbindFromRenderStep("FlyToFruit")
        end
    end)
end

-- 🍇 Check fruit
local function checkFruit()
    local fruitContainer = workspace:FindFirstChild("Fruit ")
    if fruitContainer and fruitContainer:FindFirstChild("Fruit") and fruitContainer.Fruit:FindFirstChild("Fruit") then
        local fruitPart = fruitContainer.Fruit.Fruit
        if fruitPart:IsA("MeshPart") then
            local meshId = fruitPart.MeshId
            local position = fruitPart.Position
            local fruitName = fruitMeshes[meshId]

            if fruitPart ~= lastKnownFruit then
                lastKnownFruit = fruitPart
                alreadySent = false
            end

            if fruitName and not alreadySent then
                local message = "🍇 **" .. fruitName .. "** has spawned!\n📍 Location: " .. tostring(position) .. "\n🧬 MeshId: " .. meshId
                sendToDiscord(message)
                flyTo(position)
                alreadySent = true
            elseif not fruitName and not alreadySent then
                local message = "❓ **Unknown Fruit** detected!\n📍 Location: " .. tostring(position) .. "\n🧬 MeshId: " .. meshId
                sendToDiscord(message)
                flyTo(position)
                alreadySent = true
            end
        end
    else
        if lastKnownFruit ~= nil then
            sendToDiscord("❌ Fruit has despawned or was picked up.")
            lastKnownFruit = nil
            alreadySent = false
            RunService:UnbindFromRenderStep("FlyToFruit")
        end
    end
end

-- 🔁 Loop check
while true do
    pcall(checkFruit)
    wait(1)
end
