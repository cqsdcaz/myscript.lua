local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Create the ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "TeleportGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Create a Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 210)  -- Increased height to accommodate the new button
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Round the frame
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = frame

-- Title
local title = Instance.new("TextLabel")
title.Text = "Teleport GUI"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 30)
title.Parent = frame

-- Place ID Input
local placeInput = Instance.new("TextBox")
placeInput.PlaceholderText = "Enter Place ID"
placeInput.Text = ""
placeInput.Size = UDim2.new(1, -20, 0, 30)
placeInput.Position = UDim2.new(0, 10, 0, 40)
placeInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
placeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
placeInput.Font = Enum.Font.SourceSans
placeInput.TextSize = 16
placeInput.Parent = frame

-- Job ID Input
local jobInput = Instance.new("TextBox")
jobInput.PlaceholderText = "Enter Job ID (optional)"
jobInput.Text = ""
jobInput.Size = UDim2.new(1, -20, 0, 30)
jobInput.Position = UDim2.new(0, 10, 0, 80)
jobInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
jobInput.TextColor3 = Color3.fromRGB(255, 255, 255)
jobInput.Font = Enum.Font.SourceSans
jobInput.TextSize = 16
jobInput.Parent = frame

-- Teleport Button
local tpButton = Instance.new("TextButton")
tpButton.Text = "Teleport"
tpButton.Size = UDim2.new(1, -20, 0, 40)
tpButton.Position = UDim2.new(0, 10, 0, 125)
tpButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
tpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
tpButton.Font = Enum.Font.SourceSansBold
tpButton.TextSize = 18
tpButton.Parent = frame

-- Round button
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = tpButton

-- Copy ID Button
local copyIdButton = Instance.new("TextButton")
copyIdButton.Text = "Copy Place ID"
copyIdButton.Size = UDim2.new(1, -20, 0, 40)
copyIdButton.Position = UDim2.new(0, 10, 0, 170)
copyIdButton.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
copyIdButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyIdButton.Font = Enum.Font.SourceSansBold
copyIdButton.TextSize = 18
copyIdButton.Parent = frame

-- Round button for copy ID
local copyButtonCorner = Instance.new("UICorner")
copyButtonCorner.CornerRadius = UDim.new(0, 6)
copyButtonCorner.Parent = copyIdButton

-- Button click action for teleport
tpButton.MouseButton1Click:Connect(function()
	local placeId = tonumber(placeInput.Text)
	local jobId = jobInput.Text ~= "" and jobInput.Text or nil

	if not placeId then
		tpButton.Text = "Invalid Place ID!"
		task.wait(1.5)
		tpButton.Text = "Teleport"
		return
	end

	if jobId then
		TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
	else
		TeleportService:Teleport(placeId, player)
	end
end)

-- Button click action for copy ID
copyIdButton.MouseButton1Click:Connect(function()
	local placeId = tonumber(placeInput.Text)

	if not placeId then
		copyIdButton.Text = "Invalid Place ID!"
		task.wait(1.5)
		copyIdButton.Text = "Copy Place ID"
		return
	end

	-- Copy place ID to clipboard
	local success, message = pcall(function()
		setclipboard(tostring(placeId)) -- Copies the place ID to the clipboard
	end)

	if success then
		copyIdButton.Text = "ID Copied!"
		task.wait(1.5)
		copyIdButton.Text = "Copy Place ID"
	else
		copyIdButton.Text = "Failed to Copy!"
		task.wait(1.5)
		copyIdButton.Text = "Copy Place ID"
	end
end)
