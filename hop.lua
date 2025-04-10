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
frame.Size = UDim2.new(0, 300, 0, 180)
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

-- Button click action
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
