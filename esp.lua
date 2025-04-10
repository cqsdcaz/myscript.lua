local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Fruit asset ID to name map
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

-- ESP creation
local function createESP(part, label, color)
	if not part or part:FindFirstChild("ESPLabel") then return end

	local gui = Instance.new("BillboardGui")
	gui.Name = "ESPLabel"
	gui.Size = UDim2.new(0, 200, 0, 40)
	gui.StudsOffset = Vector3.new(0, 3, 0)
	gui.AlwaysOnTop = true
	gui.Adornee = part
	gui.Parent = part

	local text = Instance.new("TextLabel")
	text.Size = UDim2.new(1, 0, 1, 0)
	text.BackgroundTransparency = 1
	text.Text = label
	text.TextColor3 = color or Color3.fromRGB(255, 255, 0)
	text.TextStrokeTransparency = 0.5
	text.TextScaled = true
	text.Font = Enum.Font.SourceSansBold
	text.Parent = gui
end

-- Scanner
local function scanWorld()
	for _, obj in pairs(workspace:GetDescendants()) do
		-- Fruit ESP
		if obj:IsA("MeshPart") or obj:IsA("Part") then
			local textureId = obj.TextureID or obj.MeshId or (obj:FindFirstChild("Mesh") and obj.Mesh.TextureId)
			if textureId and FruitsId[textureId] then
				createESP(obj, FruitsId[textureId], Color3.fromRGB(255, 255, 0)) -- Yellow for fruit
			end
		end

		-- Chest ESP (match name or appearance)
		if obj:IsA("Part") and obj.Name:lower():find("chest") then
			createESP(obj, "Chest", Color3.fromRGB(0, 255, 255)) -- Cyan for chest
		elseif obj:IsA("Model") and obj.Name:lower():find("chest") and obj:FindFirstChildWhichIsA("BasePart") then
			createESP(obj:FindFirstChildWhichIsA("BasePart"), "Chest", Color3.fromRGB(0, 255, 255))
		end
	end
end

-- Loop
while true do
	pcall(scanWorld)
	task.wait(5)
end
