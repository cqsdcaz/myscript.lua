local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create GUI
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "ScriptLogger"
screenGui.ResetOnSpawn = false

-- Main draggable frame
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0.4, 0, 0.5, 0)
frame.Position = UDim2.new(0.3, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 25)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.Text = "Script Logger"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 18

-- Scrolling area
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Position = UDim2.new(0, 0, 0, 25)
scroll.Size = UDim2.new(1, 0, 1, -25)
scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
scroll.ScrollBarThickness = 8
scroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

-- UI list layout
local layout = Instance.new("UIListLayout", scroll)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 2)

-- Helper to log
local function logAction(text)
	local label = Instance.new("TextLabel", scroll)
	label.Size = UDim2.new(1, -10, 0, 20)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(0, 255, 0)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Text = text
	label.TextSize = 14
	label.Font = Enum.Font.Code
end

-- 🟩 Example: Log movement
local humanoid = player.Character:WaitForChild("Humanoid")
local rootPart = player.Character:WaitForChild("HumanoidRootPart")
local lastPosition = rootPart.Position

game:GetService("RunService").Heartbeat:Connect(function()
	local newPos = rootPart.Position
	if (newPos - lastPosition).Magnitude > 3 then
		logAction("MoveTo(Vector3.new(" .. math.floor(newPos.X) .. ", " .. math.floor(newPos.Y) .. ", " .. math.floor(newPos.Z) .. "))")
		lastPosition = newPos
	end
end)

-- 🟨 Jump log
humanoid.StateChanged:Connect(function(_, new)
	if new == Enum.HumanoidStateType.Jumping then
		logAction("Jump()")
	end
end)

-- 🟧 Tool equipped
player.Character.ChildAdded:Connect(function(child)
	if child:IsA("Tool") then
		logAction("EquipTool('" .. child.Name .. "')")
	end
end)

-- 🟦 Chat messages
player.Chatted:Connect(function(message)
	logAction('Chat("' .. message .. '")')
end)

-- 🟥 UI Button Clicks
-- This listens to *all* buttons in GUI
playerGui.DescendantAdded:Connect(function(desc)
	if desc:IsA("TextButton") or desc:IsA("ImageButton") then
		desc.MouseButton1Click:Connect(function()
			local path = desc:GetFullName()
			logAction("Clicked: " .. path)
		end)
	end
end)

-- 🟫 GUI openings
playerGui.ChildAdded:Connect(function(child)
	logAction("Opened GUI: " .. child.Name)
end)
