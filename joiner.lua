-- ONE SCRIPT TO SET UP EVERYTHING
-- Put this in ServerScriptService

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MessagingService = game:GetService("MessagingService")
local TeleportService = game:GetService("TeleportService")

-- RemoteEvent setup
local remote = ReplicatedStorage:FindFirstChild("RequestJoinPlayer")
if not remote then
	remote = Instance.new("RemoteEvent")
	remote.Name = "RequestJoinPlayer"
	remote.Parent = ReplicatedStorage
end

-- GUI + LocalScript setup
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Wait()

	local gui = Instance.new("ScreenGui")
	gui.Name = "JoinPlayerGUI"
	gui.ResetOnSpawn = false
	gui.Parent = player:WaitForChild("PlayerGui")

	-- TextBox
	local textBox = Instance.new("TextBox")
	textBox.Name = "UsernameBox"
	textBox.Size = UDim2.new(0, 250, 0, 40)
	textBox.Position = UDim2.new(0.5, -125, 0.4, -20)
	textBox.PlaceholderText = "Enter username"
	textBox.Text = ""
	textBox.Font = Enum.Font.SourceSans
	textBox.TextSize = 20
	textBox.Parent = gui

	-- Button
	local button = Instance.new("TextButton")
	button.Name = "JoinButton"
	button.Size = UDim2.new(0, 250, 0, 40)
	button.Position = UDim2.new(0.5, -125, 0.4, 30)
	button.Text = "Join Player"
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 22
	button.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Parent = gui

	-- LocalScript
	local localScript = Instance.new("LocalScript")
	localScript.Source = [[
		local Players = game:GetService("Players")
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local remote = ReplicatedStorage:WaitForChild("RequestJoinPlayer")
		local player = Players.LocalPlayer

		local gui = script.Parent.Parent
		local textBox = gui:WaitForChild("UsernameBox")
		local button = script.Parent

		button.MouseButton1Click:Connect(function()
			local name = textBox.Text
			if name and name ~= "" then
				remote:FireServer(name)
			else
				button.Text = "Enter a username!"
				wait(1)
				button.Text = "Join Player"
			end
		end)
	]]
	localScript.Parent = button
end)

-- Register current server when players join
Players.PlayerAdded:Connect(function(player)
	local topic = "PlayerServer_" .. player.UserId
	local jobId = game.JobId
	pcall(function()
		MessagingService:PublishAsync(topic, jobId)
	end)
end)

-- Handle incoming join requests
remote.OnServerEvent:Connect(function(requestingPlayer, targetUsername)
	if typeof(targetUsername) ~= "string" or targetUsername == "" then return end

	local success, userId = pcall(function()
		return Players:GetUserIdFromNameAsync(targetUsername)
	end)

	if not success then return end

	local topic = "PlayerServer_" .. userId
	local gotResponse = false

	local connection
	connection = MessagingService:SubscribeAsync(topic, function(message)
		gotResponse = true
		local jobId = message.Data
		TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId, requestingPlayer)
		connection:Disconnect()
	end)

	task.delay(5, function()
		if not gotResponse and connection then
			connection:Disconnect()
		end
	end)
end)
