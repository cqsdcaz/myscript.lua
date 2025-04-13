-- StarterGui > ScreenGui > JoinButton > LocalScript

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local MessagingService = game:GetService("MessagingService")

local localPlayer = Players.LocalPlayer
local placeId = game.PlaceId

local usernameBox = script.Parent.Parent:FindFirstChild("UsernameBox")
local joinButton = script.Parent

joinButton.MouseButton1Click:Connect(function()
	local username = usernameBox.Text
	if username == "" then
		warn("Please enter a username.")
		return
	end

	local success, userId = pcall(function()
		return Players:GetUserIdFromNameAsync(username)
	end)

	if not success then
		warn("Invalid username!")
		return
	end

	local topic = "PlayerServer_" .. userId
	local gotResponse = false

	local connection
	connection = MessagingService:SubscribeAsync(topic, function(message)
		gotResponse = true
		local jobId = message.Data
		TeleportService:TeleportToPlaceInstance(placeId, jobId, localPlayer)
		connection:Disconnect()
	end)

	task.delay(5, function()
		if not gotResponse then
			warn("Could not find player or they're offline.")
			connection:Disconnect()
		end
	end)
end)
