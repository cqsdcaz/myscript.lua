local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "FruitFinder"

local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0, 200, 0, 50)
toggle.Position = UDim2.new(0, 20, 0, 100)
toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 20
toggle.Text = "🍇 Fruit Finder: OFF"

local enabled = false
local flyingToFruits = false
local workspace_connection = nil

-- Fruit names
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
	for _, fruit in ipairs(fruitNames) do
		if name == fruit then
			return true
		end
	end
	return false
end

local function playSound(id, volume)
	local sound = Instance.new("Sound", workspace)
	sound.SoundId = id
	sound.Volume = volume
	sound:Play()
	game:GetService("Debris"):AddItem(sound, 3)
end

local function createESP(part, name)
	if not part then return end

	local billboard = Instance.new("BillboardGui", part)
	billboard.Size = UDim2.new(0, 100, 0, 20)
	billboard.AlwaysOnTop = true
	billboard.StudsOffset = Vector3.new(0, 2, 0)

	local text = Instance.new("TextLabel", billboard)
	text.Size = UDim2.new(1, 0, 1, 0)
	text.BackgroundTransparency = 1
	text.TextColor3 = Color3.new(1, 1, 0)
	text.Font = Enum.Font.GothamBold
	text.TextSize = 14
	text.Text = name
end

local function flyToFruit(fruit)
	local handle = fruit:FindFirstChild("Handle")
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
			tween.Completed:Wait()
			break
		end
		task.wait(0.2)
	end

	if not fruit:IsDescendantOf(workspace) then
		playSound("rbxassetid://4612375233", 1)
	end
end

local function hopServer()
	local PlaceID = game.PlaceId
	local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Asc&limit=100")).data
	for _, server in ipairs(servers) do
		if server.playing < server.maxPlayers then
			TeleportService:TeleportToPlaceInstance(PlaceID, server.id)
			break
		end
	end
end

local function enableNotifierQueue()
	if flyingToFruits then return end
	flyingToFruits = true

	while flyingToFruits do
		local fruits = {}
		for _, child in pairs(workspace:GetChildren()) do
			if isFruit(child.Name) then
				table.insert(fruits, child)
			end
		end

		if #fruits > 0 then
			for _, fruit in ipairs(fruits) do
				if not workspace_connection then break end
				task.spawn(createESP, fruit:WaitForChild("Handle", 5), fruit.Name)
				flyToFruit(fruit)
				task.wait(0.5)
			end
		else
			local found = false
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

		task.wait(2)
	end
end

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		toggle.Text = "🍇 Fruit Finder: ON"
		toggle.BackgroundColor3 = Color3.fromRGB(20, 200, 20)
		workspace_connection = true
		task.spawn(enableNotifierQueue)
	else
		toggle.Text = "🍇 Fruit Finder: OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		flyingToFruits = false
		workspace_connection = nil
	end
end)
