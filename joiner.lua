-- ⚠️ Run this in the Command Bar (View > Command Bar) while in Studio

-- Create RemoteEvent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = Instance.new("RemoteEvent")
Remote.Name = "RequestJoinPlayer"
Remote.Parent = ReplicatedStorage

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "JoinPlayerGUI"
gui.ResetOnSpawn = false

local textBox = Instance.new("TextBox")
textBox.Name = "UsernameBox"
textBox.Size = UDim2.new(0, 200, 0, 40)
textBox.Position = UDim2.new(0.5, -100, 0.5, -60)
textBox.PlaceholderText = "Enter Username"
textBox.Text = ""
textBox.Parent = gui

local button = Instance.new("TextButton")
button.Name = "JoinButton"
button.Size = UDim2.new(0, 200, 0, 40)
button.Position = UDim2.new(0.5, -100, 0.5, 0)
button.Text = "Join Player"
button.Parent = gui

local localScript = Instance.new("LocalScript")
localScript.Parent = button

localScript.Source = [[
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RequestJoinPlayer")

local textBox = script.Parent.Parent:FindFirstChild("UsernameBox")
local button = script.Parent

button.MouseButton1Click:Connect(function()
	local username = textBox.Text
	if username and username ~= "" then
		remote:FireServer(username)
	end
end)
]]

gui.Parent = game:GetService("StarterGui")

-- Create Server Script
local serverScript = Instance.new("Script")
serverScript.Name = "HandleJoinRequestScript"
serverScript.Parent = game:GetService("ServerScriptService")

serverScript.Source = [[
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MessagingService = game:GetService("MessagingService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local remote = ReplicatedStorage:WaitForChild("RequestJoinPlayer")
local placeId = game.PlaceId

-- Register each player’s server
Players.PlayerAdded:Connect(function(player)
	local topic = "PlayerServer_" .. player.UserId
	local jobId = game.JobId

	pcall(function()
		MessagingService:PublishAsync(topic, jobId)
	end)
end)

-- Listen to join requests
remote.OnServerEvent:Connect(function(requestingPlayer, targetUsername)
	if typeof(targetUsername) ~= "string" or targetUsername == "" then
		warn("No username provided")
		return
	end

	local success, userId = pcall(function()
		return Players:GetUserIdFromNameAsync(targetUsername)
	end)

	if not success then
		warn("Invalid username")
		return
	end

	local topic = "PlayerServer_" .. userId
	local gotResponse = false

	local connection
	connection = MessagingService:SubscribeAsync(topic, function(message)
		gotResponse = true
		local jobId = message.Data

		TeleportService:TeleportToPlaceInstance(placeId, jobId, requestingPlayer)
		connection:Disconnect()
	end)

	task.delay(5, function()
		if not gotResponse and connection then
			connection:Disconnect()
		end
	end)
end)
]]

print("✅ Everything set up! GUI, RemoteEvent, and Server Script created.")
