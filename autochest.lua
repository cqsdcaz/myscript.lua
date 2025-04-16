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
	locations:GetChildren()[9],  -- You can name these if needed
	locations:GetChildren()[15],
	locations["Underwater City"],
	locations.Whirlpool,
}

local function getCharacterHRP()
	local character = player.Character or player.CharacterAdded:Wait()
	return character:WaitForChild("HumanoidRootPart")
end

local function tweenToPosition(hrp, targetPos)
	local distance = (hrp.Position - targetPos).Magnitude
	local speed = 200
	local duration = distance / speed
	if duration < 0.1 then duration = 0.1 end

	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
	local goal = {CFrame = CFrame.new(targetPos)}
	local tween = TweenService:Create(hrp, tweenInfo, goal)
	tween:Play()
	tween.Completed:Wait()
end

local function findChests()
	local chests = {}
	for _, obj in ipairs(chestFolder:GetChildren()) do
		if obj:IsA("Model") and obj:FindFirstChild("PrimaryPart") then
			table.insert(chests, obj)
		end
	end
	return chests
end

local function getClosestLocation(hrp)
	local closest = nil
	local minDist = math.huge
	for _, loc in ipairs(locationList) do
		if loc and loc:IsA("Part") then
			local dist = (hrp.Position - loc.Position).Magnitude
			if dist < minDist then
				minDist = dist
				closest = loc
			end
		end
	end
	return closest
end

local function flyToChests()
	local hrp = getCharacterHRP()
	local searchedLocations = {}

	while true do
		local chests = findChests()
		if #chests > 0 then
			for _, chest in ipairs(chests) do
				local pos = chest.PrimaryPart.Position + Vector3.new(0, 5, 0)
				print("✅ Flying to chest:", chest.Name)
				tweenToPosition(hrp, pos)
			end
			break -- Done once all visible chests are visited
		else
			-- Go to the nearest unexplored location
			local nextLocation = getClosestLocation(hrp)
			if nextLocation and not searchedLocations[nextLocation] then
				local targetPos = nextLocation.Position + Vector3.new(0, 50, 0) -- Add Y 50 here
				print("🔍 No chests found, going to:", nextLocation.Name)
				tweenToPosition(hrp, targetPos)
				searchedLocations[nextLocation] = true
				wait(1) -- Give time for new chests to load in (if needed)
			else
				print("❌ All locations searched, no chests found.")
				break
			end
		end
	end
end

-- Auto run when player spawns
if player.Character then
	task.delay(2, flyToChests)
end
player.CharacterAdded:Connect(function()
	task.delay(2, flyToChests)
end)
