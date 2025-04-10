local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Your fruit ID dictionary
local FruitsId = {
	["rbxassetid://15124425041"] = "Rocket-Rocket",
	["rbxassetid://15123685330"] = "Spin-Spin",
	["rbxassetid://15123613404"] = "Blade-Blade",
	["rbxassetid://15123689268"] = "Spring-Spring",
	["rbxassetid://15123595806"] = "Bomb-Bomb",
	["rbxassetid://15123677932"] = "Smoke-Smoke",
	["rbxassetid://15124220207"] = "Spike-Spike",
	["rbxassetid://15123629861"] = "Flame-Flame",
	["rbxassetid://15123627377"] = "Falcon-Falcon",
	["rbxassetid://15100433167"] = "Ice-Ice",
	["rbxassetid://15123673019"] = "Sand-Sand",
	["rbxassetid://15123618591"] = "Dark-Dark",
	["rbxassetid://15112600534"] = "Diamond-Diamond",
	["rbxassetid://15123640714"] = "Light-Light",
	["rbxassetid://15123668008"] = "Rubber-Rubber",
	["rbxassetid://15100485671"] = "Barrier-Barrier",
	["rbxassetid://15123662036"] = "Ghost-Ghost",
	["rbxassetid://15123645682"] = "Magma-Magma",
	["rbxassetid://15123606541"] = "Quake-Quake",
	["rbxassetid://15123643097"] = "Love-Love",
	["rbxassetid://15123681598"] = "Spider-Spider",
	["rbxassetid://15123679712"] = "Sound-Sound",
	["rbxassetid://15123654553"] = "Phoenix-Phoenix",
	["rbxassetid://15123656798"] = "Portal-Portal",
	["rbxassetid://15123670514"] = "Rumble-Rumble",
	["rbxassetid://15123652069"] = "Pain-Pain",
	["rbxassetid://15123587371"] = "Blizzard-Blizzard",
	["rbxassetid://15123633312"] = "Gravity-Gravity",
	["rbxassetid://15123648309"] = "Mammoth-Mammoth",
	["rbxassetid://15123624401"] = "Dough-Dough",
	["rbxassetid://15123675904"] = "Shadow-Shadow",
	["rbxassetid://10773719142"] = "Venom-Venom",
	["rbxassetid://15123616275"] = "Control-Control",
	["rbxassetid://11911905519"] = "Spirit-Spirit",
	["rbxassetid://15123638064"] = "Leopard-Leopard",
	["rbxassetid://15487764876"] = "Kitsune-Kitsune",
	["rbxassetid://115276580506154"] = "Yeti-Yeti",
	["rbxassetid://118054805452821"] = "Gas-Gas",
	["rbxassetid://95749033139458"] = "Dragon East-Dragon East"
}

-- Function to create ESP Billboard
local function createESP(part, fruitName)
	if part:FindFirstChild("FruitESP") then return end -- Prevent duplicates

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "FruitESP"
	billboard.Size = UDim2.new(0, 200, 0, 50)
	billboard.AlwaysOnTop = true
	billboard.Adornee = part
	billboard.StudsOffset = Vector3.new(0, 3, 0)
	billboard.Parent = part

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = fruitName
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
	textLabel.TextStrokeTransparency = 0
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SourceSansBold
	textLabel.Parent = billboard
end

-- Scan workspace for fruit parts
local function scanForFruits()
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("MeshPart") or obj:IsA("Part") then
			local textureId = obj.TextureID or obj.MeshId or obj:FindFirstChild("Mesh") and obj.Mesh.TextureId
			if textureId and FruitsId[textureId] then
				createESP(obj, FruitsId[textureId])
			end
		end
	end
end

-- Re-scan every few seconds in case new fruits spawn
while true do
	pcall(scanForFruits)
	task.wait(5)
end
