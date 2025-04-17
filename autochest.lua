local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local chestFolder = workspace:WaitForChild("ChestModels")
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

-- Chest finder
local function findChests()
	local results = {}
	for _, name in ipairs({"DiamondChest", "GoldChest", "SilverChest"}) do
		local chest = chestFolder:FindFirstChild(name)
		if chest and chest:IsA("Model") and chest.PrimaryPart then
			table.insert(results, chest)
		end
	end
	return results
end

-- Get second closest location
local function getSecondClosestLocation(hrp)
	local currentPos = hrp.Position
	local distances = {}

	for _, loc in ipairs(locationList) do
		if loc and loc:IsA("BasePart") then
			local dist = (loc.Position - currentPos).Magnitude
			table.insert(distances, {location = loc, distance = dist})
		end
	end

	table.sort(distances, function(a, b)
		return a.distance < b.distance
	end)

	if #distances >= 2 then
		return distances[2].location
	elseif #distances >= 1 then
		return distances[1].location
	else
		return nil
	end
end

-- Tween with mid-check for chests
local function tweenToPosition(hrp, targetPos, onStepCheck)
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
				tweenToPosition(hrp, chest.PrimaryPart.Position + Vector3.new(0, 5, 0))
			end
		end
	end)

	tween.Completed:Wait()
	if conn and conn.Connected then
		conn:Disconnect()
	end
end

-- Main chest-searching loop
local function startChestSearch(character)
	local hrp = character:WaitForChild("HumanoidRootPart")

	task.spawn(function()
		while character.Parent ~= nil do
			local chests = findChests()
			if #chests > 0 then
				for _, chest in ipairs(chests) do
					print("✅ Found chest:", chest.Name)
					tweenToPosition(hrp, chest.PrimaryPart.Position + Vector3.new(0, 5, 0))
					task.wait(1)
				end
			else
				local location = getSecondClosestLocation(hrp)
				if location then
					local targetPos = location.Position + Vector3.new(0, 50, 0)
					print("📍 No chests. Flying to:", location.Name)
					tweenToPosition(hrp, targetPos, function()
						local c = findChests()
						if #c > 0 then
							print("🚨 Chest found mid-flight!")
							return c[1]
						end
					end)
				else
					warn("❌ No valid locations to fly to.")
				end
			end

			task.wait(2)
		end
	end)
end

-- On first load
if player.Character then
	startChestSearch(player.Character)
end

-- On respawn
player.CharacterAdded:Connect(function(character)
	task.wait(1)
	startChestSearch(character)
end)
