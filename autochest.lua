local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local chestFolder = workspace:WaitForChild("ChestModels")
local locations = workspace._WorldOrigin.Locations

if game.PlaceId == 2753915549 then
	locationList = {
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

elseif game.PlaceId == 4442272183 then
	locationList = {
		locations["Kingdom of Rose"],
		locations["Green Zone"],
		locations["Dark Arena"],
		locations["Usoap's Island"],
		locations["Cursed Ship"],
		locations["Ice Castle"],
		locations["Forgotten Island"],
		locations["Hot and Cold"],
		locations["Colosseum"], -- reuse if exists here
		locations["Mansion"],
	}

elseif game.PlaceId == 7449423635 then
	locationList = {
		locations["Port Town"],
		locations["Great Tree"],
		locations["Floating Turtle"],
		locations["Hydra Island"],
		locations["Castle on the Sea"],
		locations["Haunted Castle"],
		locations["Sea of Treats"],
	}

else
	warn("This PlaceId is not recognized: " .. game.PlaceId)
end

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

-- Get random location that's not the farthest
local function getRandomNearbyLocation(hrp)
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

	if #distances <= 2 then
		return distances[1].location
	else
		local trimmed = {}
		for i = 1, #distances - 1 do
			table.insert(trimmed, distances[i].location)
		end
		return trimmed[math.random(1, #trimmed)]
	end
end

-- Tween with mid-flight chest check
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

-- Main search loop
local function startChestSearch(character)
	local hrp = character:WaitForChild("HumanoidRootPart")

	task.spawn(function()
		while character.Parent ~= nil do
			local chests = findChests()
			if #chests > 0 then
				for _, chest in ipairs(chests) do
					print("✅ Found chest:", chest.Name)
					tweenToPosition(hrp, chest.PrimaryPart.Position + Vector3.new(0, 5, 0))
					task.wait(0.3)
				end
			else
				local randomLoc = getRandomNearbyLocation(hrp)
				if randomLoc then
					local targetPos = randomLoc.Position + Vector3.new(0, 50, 0)
					print("📍 No chests. Flying to:", randomLoc.Name)
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

-- Handle first load
if player.Character then
	startChestSearch(player.Character)
end

-- Handle respawn
player.CharacterAdded:Connect(function(char)
	task.wait(1)
	startChestSearch(char)
end)
