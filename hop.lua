--[[ SETTINGS ]]--
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui"):WaitForChild("Main")
local label = gui:WaitForChild("[OLD]Radar")
local codes_button = gui:WaitForChild("Code")
local settings_button = gui:WaitForChild("Settings")
local dmg_counter_button = settings_button:WaitForChild("Buttons"):WaitForChild("DmgCounterButton")

local script_enabled = "Script enabled successfully."
local notifier_enabled = "Notifier enabled successfully."
local notifier_disabled = "Notifier disabled successfully."
local description = "Shows spawned fruits location."
local on = "Notifier (ON)"
local off = "Notifier (OFF)"
local location = "FRUIT DETECTED: "
local magnitude = "m away."
local collected = "Fruit despawned/collected."

if game:GetService("LocalizationService").RobloxLocaleId == "pt-br" then
	script_enabled = "Script ativado com sucesso."
	notifier_enabled = "Notificador ativado com sucesso."
	notifier_disabled = "Notificador desativado com sucesso."
	description = "Mostra a localização das frutas spawnadas."
	on = "Notificador (ATIVADO)"
	off = "Notificador (DESATIVADO)"
	location = "FRUTA DETECTADA: "
	magnitude = "m de distância."
	collected = "Fruta despawnada/coletada."
end

if codes_button:FindFirstChild("NotifierLed") then return end

local led = Instance.new("Frame")
led.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
led.BackgroundTransparency = 0.3
led.Position = UDim2.new(1.3, 0, 0.35, 0)
led.Size = UDim2.new(0, 8, 0, 8)
led.Name = "NotifierLed"
led.Parent = codes_button
Instance.new("UICorner", led).CornerRadius = UDim.new(1)

local switch = dmg_counter_button:Clone()
switch.Notify.Text = description
switch.TextLabel.Text = off
switch.Name = "NotifierSwitch"
switch.Parent = dmg_counter_button.Parent

settings_button.Activated:Connect(function()
	switch.Visible = dmg_counter_button.Visible
end)

local workspace_connection

local function showText(text, time)
	label.Text = text
	label.Visible = true
	if time ~= 0 then
		task.wait(time)
		label.Visible = false
	end
end

local function playSound(asset_id, pb_speed)
	local sound = Instance.new("Sound", workspace)
	sound.SoundId = asset_id
	sound.Volume = 1
	sound.PlaybackSpeed = pb_speed
	sound:Play()
	sound.Ended:Connect(function() sound:Destroy() end)
end

local function enableNotifier(fruit)
	local handle = fruit:WaitForChild("Handle")
	local fruit_alive = true
	playSound("rbxassetid://3997124966", 4)
	while fruit_alive and workspace_connection do
		local dist = math.floor((player.Character:WaitForChild("HumanoidRootPart").Position - handle.Position).Magnitude * 0.15)
		showText(location .. dist .. magnitude, 0)
		task.wait(0.2)
		fruit_alive = workspace:FindFirstChild(fruit.Name)
	end
	if not fruit_alive then
		playSound("rbxassetid://4612375233", 1)
		showText(collected, 3)
	end
end

local function onSwitchClick()
	if workspace_connection then
		workspace_connection:Disconnect()
		workspace_connection = nil
		led.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		switch.TextLabel.Text = off
		showText(notifier_disabled, 2)
	else
		led.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		switch.TextLabel.Text = on
		showText(notifier_enabled, 2)
		workspace_connection = workspace.ChildAdded:Connect(function(child)
			if child.Name == "Fruit " then
				task.spawn(enableNotifier, child)
			end
		end)
		local fruit = workspace:FindFirstChild("Fruit ")
		if fruit then
			task.spawn(enableNotifier, fruit)
		end
	end
end

showText(script_enabled, 3)
onSwitchClick()
switch.Activated:Connect(onSwitchClick)

-- ESP Section
local function createESP(part, fruitName)
	local box = Instance.new("BoxHandleAdornment")
	box.Name = "FruitESP"
	box.Adornee = part
	box.AlwaysOnTop = true
	box.ZIndex = 10
	box.Size = part.Size + Vector3.new(0.2, 0.2, 0.2)
	box.Color3 = Color3.fromRGB(255, 200, 0)
	box.Transparency = 0.5
	box.Parent = part

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "FruitLabel"
	billboard.Adornee = part
	billboard.Size = UDim2.new(0, 100, 0, 40)
	billboard.StudsOffset = Vector3.new(0, 2.5, 0)
	billboard.AlwaysOnTop = true
	billboard.Parent = part

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = fruitName
	label.TextColor3 = Color3.new(1, 1, 0)
	label.TextStrokeTransparency = 0.5
	label.TextScaled = true
	label.Font = Enum.Font.GothamBold
	label.Parent = billboard
end

local function removeESP(fruit)
	local handle = fruit:FindFirstChild("Handle")
	if handle then
		local box = handle:FindFirstChild("FruitESP")
		if box then box:Destroy() end
		local label = handle:FindFirstChild("FruitLabel")
		if label then label:Destroy() end
	end
end

for _, fruit in pairs(workspace:GetChildren()) do
	if fruit.Name == "Fruit " and fruit:FindFirstChild("Handle") then
		createESP(fruit.Handle, fruit.Name)
	end
end

workspace.ChildAdded:Connect(function(child)
	if child.Name == "Fruit " and child:FindFirstChild("Handle") then
		local handle = child:WaitForChild("Handle", 5)
		if handle then
			createESP(handle, child.Name)
		end
	end
end)

workspace.ChildRemoved:Connect(function(child)
	if child.Name == "Fruit " then
		removeESP(child)
	end
end)

-- Server hop logic
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local placeID = game.PlaceId

local function hopServer()
	local success, servers = pcall(function()
		local response = game:HttpGet("https://games.roblox.com/v1/games/"..placeID.."/servers/Public?sortOrder=Asc&limit=100")
		return HttpService:JSONDecode(response)
	end)

	if success and servers and servers.data then
		for _, server in pairs(servers.data) do
			if server.playing < server.maxPlayers then
				TeleportService:TeleportToPlaceInstance(placeID, server.id)
				break
			end
		end
	end
end

-- Delay + fruit check before hopping
task.spawn(function()
	while true do
		local fruit = workspace:FindFirstChild("Fruit ")
		if not fruit then
			local found = false
			for i = 1, 10 do
				task.wait(0.5)
				if workspace:FindFirstChild("Fruit ") then
					found = true
					break
				end
			end
			if not found then
				hopServer()
			end
		end
		task.wait(10)
	end
end)

-- Services
local UserInputService = game:GetService("UserInputService")
local camera = game.Workspace.CurrentCamera

-- Target Position (X: 1000, Z: 400)
local targetPosition = Vector3.new(1000, 10, 400)  -- Y: 10 is the height for ground level

-- Function to simulate mouse click at the target position
local function simulateClickAtTarget(targetPosition)
    -- Convert the 3D world position to 2D screen space
    local screenPosition, onScreen = camera:WorldToScreenPoint(targetPosition)

    -- If the target position is within the screen bounds, simulate a click
    if onScreen then
        -- Create a virtual mouse event (simulate left-click)
        local mouseEvent = Instance.new("InputObject")
        mouseEvent.UserInputType = Enum.UserInputType.MouseButton1
        mouseEvent.Position = Vector2.new(screenPosition.X, screenPosition.Y)
        
        -- Fire the input event to simulate the mouse click
        UserInputService.InputBegan:Fire(mouseEvent)
        print("Simulated mouse click at:", targetPosition)
    else
        print("Target is not on the screen.")
    end
end

-- Call the function to simulate the click at the specified position
simulateClickAtTarget(targetPosition)
