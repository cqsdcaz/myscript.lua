local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local botToken = "MTM2NzIzMjk1MDE4NTIzMDQyNg.G_cviT._MGBY66XGKsPAOzFAStezj3iiml09AQRq3YogM"  -- Replace with your Discord bot's token
local channelID = "1366820410884362270"  -- Replace with your channel's ID
local function sendWebhook(msg)
    local url = "https://discord.com/api/v10/channels/"..channelID.."/messages"
    local headers = {
        ["Authorization"] = "Bot " .. botToken,
        ["Content-Type"] = "application/json"
    }
    local body = HttpService:JSONEncode({
        content = msg
    })
    pcall(function()
        HttpService:PostAsync(url, body, Enum.HttpContentType.ApplicationJson, false, headers)
    end)
end
local function hop()
    local id = game.PlaceId
    local ok, s = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..id.."/servers/Public?sortOrder=Asc&limit=100"))
    end)
    if ok and s and s.data then
        for _, v in ipairs(s.data) do
            if v.playing < 5 and v.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(id, v.id, player)
                return
            end
        end
    end
end
local f = workspace:FindFirstChild("Fruit")
if not f then 
    sendWebhook(":x: Fruit not found!")
    hop()
    return
end
local i = f:FindFirstChild("Fruit")
if not i or not i:FindFirstChild("RootPart") then 
    sendWebhook(":x: Fruit not found!")
    hop()
    return
end
sendWebhook(":pineapple: Fruit found!")
local c = player.Character or player.CharacterAdded:Wait()
local h = c:WaitForChild("HumanoidRootPart")
local t = i.RootPart
local s = 150
local conn
conn = RunService.RenderStepped:Connect(function()
    if not c or not t or not t:IsDescendantOf(workspace) then
        conn:Disconnect()
        return
    end
    local d = (t.Position - h.Position).Unit
    h.Velocity = d * s
    if (h.Position - t.Position).Magnitude < 5 then
        h.Velocity = Vector3.zero
        conn:Disconnect()
    end
end)
