--[[ SETTINGS ]]--
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui"):WaitForChild("Main")
local codes_button = gui:WaitForChild("Code")
local settings_button = gui:WaitForChild("Settings")
local dmg_counter_button = settings_button:WaitForChild("Buttons"):WaitForChild("DmgCounterButton")

local script_enabled = "Script enabled successfully."
local notifier_enabled = "Notifier enabled successfully."
local notifier_disabled = "Notifier disabled successfully."
local description = "Shows spawned fruits location."
local on = "Notifier (ON)"
local off = "Notifier (OFF)"

if game:GetService("LocalizationService").RobloxLocaleId == "pt-br" then
	script_enabled = "Script ativado com sucesso."
	notifier_enabled = "Notificador ativado com sucesso."
	notifier_disabled = "Notificador desativado com sucesso."
	description = "Mostra a localização das frutas spawnadas."
	on = "Notificador (ATIVADO)"
	off = "Notificador (DESATIVADO)"
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

local fruitNames = {
	"Rocket Fruit", "Spin Fruit", "Chop Fruit", "Spring Fruit", "Bomb Fruit", "Smoke Fruit",
	"Spike Fruit", "Flame Fruit", "Falcon Fruit", "Ice Fruit", "Sand Fruit", "Dark Fruit",
	"Diamond Fruit", "Light Fruit", "Rubber Fruit", "Barrier Fruit", "Ghost Fruit", "Magma Fruit",
	"Quake Fruit", "Buddha Fruit", "Love Fruit", "Spider Fruit", "Sound Fruit", "Phoenix Fruit",
	"Rumble Fruit", "Portal Fruit", "Pain Fruit", "Blizzard Fruit", "Gravity Fruit", "Mammoth Fruit",
	"T-Rex Fruit", "Dough Fruit", "Shadow Fruit", "Venom Fruit", "Control Fruit", "Spirit Fruit",
	"Dragon Fruit", "Leopard Fruit", "Kitsune Fruit"
}

local function isFruit(name)
	for _, fruitName in ipairs(fruitNames) do
		if name == fruitName then return true end
	end
	return false
end

local TweenService = game:GetService("TweenService")

local function showText(text, time)
	-- Hidden
end

local function playSound(asset_id, speed)
	local sound = Instance.new("Sound", workspace)
	sound.SoundId = asset_id
	sound.Volume = 1
	sound.PlaybackSpeed = speed
	sound:Play()
	sound.Ended:Connect(function() sound:Destroy() end)
end

local function enableNotifier(fruit)
	local handle = fruit:WaitForChild("Handle", 5)
	if not handle then return end
	playSound("rbxassetid://3997124966", 4)

	while fruit:IsDescendantOf(workspace) and workspace_connection do
		local char = player.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			local hrp = char.HumanoidRootPart
			local dist = (handle.Position - hrp.Position).Magnitude
			local duration = dist / 200
			local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
				CFrame = CFrame.new(handle.Position + Vector3.new(0, 5, 0))
			})
			tween:Play()
		end
		task.wait(0.2)
	end

	if not fruit:IsDescendantOf(workspace) then
		playSound("rbxassetid://4612375233", 1)
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
			if isFruit(child.Name) then
				task.spawn(enableNotifier, child)
				task.spawn(createESP, child:WaitForChild("Handle", 5), child.Name)
			end
		end)
		for _, child in pairs(workspace:GetChildren()) do
			if isFruit(child.Name) then
				task.spawn(enableNotifier, child)
				task.spawn(createESP, child:WaitForChild("Handle", 5), child.Name)
			end
		end
	end
end

-- ESP
local function createESP(part, fruitName)
	if not part then return end
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

workspace.ChildRemoved:Connect(function(child)
	if isFruit(child.Name) then
		removeESP(child)
	end
end)

-- Server Hop
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

task.spawn(function()
	while true do
		local found = false
		for _, obj in pairs(workspace:GetChildren()) do
			if isFruit(obj.Name) then
				found = true
				break
			end
		end

		if not found then
			for i = 1, 10 do
				task.wait(0.5)
				for _, obj in pairs(workspace:GetChildren()) do
					if isFruit(obj.Name) then
						found = true
						break
					end
				end
				if found then break end
			end
			if not found then hopServer() end
		end
		task.wait(10)
	end
end)

-- Init
showText(script_enabled, 3)
onSwitchClick()
switch.Activated:Connect(onSwitchClick)
