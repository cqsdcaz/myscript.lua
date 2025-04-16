local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local hrp = player.Character:WaitForChild("HumanoidRootPart")

local chestFolder = workspace:WaitForChild("ChestModels")

-- Your location list
local locations = workspace._WorldOrigin.Locations
local locationList = {
	locations.Colosseum,
	locations.Desert,
	locations["Fountain City"],
	locations["Frozen Village"],
	locations.Jungle,
	locations["Magma Village"],
	locations["Marine Fortress"],
	locations["Marine Starter"],
	locations["Middle Town"],
	locations["Pirate Starter"],
	locations["Pirate Village"],
	locations.Prison,
	locations.Sea,
	locations.Skylands,
	locations:GetChildren()[9],
	locations:GetChildren()[15],
	locations["Underwater City"],
	locations.Whirlpool,
}

-- Tween to position with optional callback on the way
local function tweenToPosition(targetPos, onStepCheck)
	local duration = (hrp.Position - targetPos).Magnitude / 200
	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
	local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(targetPos)})
	tween:Play()

	local conn
	conn = RunService.RenderStepped:Connect(function()
		if onStepCheck then
			local chest = onStepCheck()
			if chest then
				tween:Cancel()
				conn:Disconnect()
				tweenToPosition(chest.PrimaryPart.Position + Vector3.new(0, 5, 0))
			end
		end
	end)

	tween.Completed:Wait()
	if conn.Connected then conn:Disconnect() end
end

-- Get available chests
local function findChests()
	local results = {}
	for _, name in ipairs({"DiamondChest", "GoldChest", "SilverChest"}) do
		local chest = chestFolder:FindFirstChild(name)
		if chest and chest.PrimaryPart then
			table.insert(results, chest)
		end
	end
	return results
end

-- Get a random far location
local function getFarLocation()
	local currentPos = hrp.Position
	local farthest = nil
	local maxDist = -1
	for _, loc in ipairs(locationList) do
		local dist = (loc.Position - currentPos).Magnitude
		if dist > maxDist then
			maxDist = dist
			farthest = loc
		end
	end
	return farthest
end

-- Main loop
task.spawn(function()
	while true do
		local chests = findChests()
		if #chests > 0 then
			for _, chest in ipairs(chests) do
				print("✅ Chest found:", chest.Name)
				tweenToPosition(chest.PrimaryPart.Position + Vector3.new(0, 5, 0))
				wait(1)
			end
		else
			local location = getFarLocation()
			print("📍 No chests found. Flying to location:", location.Name)

			tweenToPosition(location.Position + Vector3.new(0, 50, 0), function()
				local c = findChests()
				if #c > 0 then
					print("🚨 Chest found while flying! Redirecting...")
					return c[1]
				end
			end)

			wait(1)
		end

		task.wait(2)
	end
end)
