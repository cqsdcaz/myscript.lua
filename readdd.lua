local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Logger UI
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "UIWatcher"
screenGui.ResetOnSpawn = false

local logFrame = Instance.new("ScrollingFrame", screenGui)
logFrame.Size = UDim2.new(0.4, 0, 0.5, 0)
logFrame.Position = UDim2.new(0.55, 0, 0.45, 0)
logFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
logFrame.BackgroundTransparency = 0.3
logFrame.BorderSizePixel = 0
logFrame.CanvasSize = UDim2.new(0, 0, 10, 0)
logFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
logFrame.ScrollBarThickness = 8
logFrame.ClipsDescendants = true

local layout = Instance.new("UIListLayout", logFrame)
layout.Padding = UDim.new(0, 2)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Function to add logs
local function log(text)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -10, 0, 20)
	label.Text = os.date("[%H:%M:%S] ") .. text
	label.TextColor3 = Color3.fromRGB(0, 255, 0)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.Code
	label.TextSize = 14
	label.Parent = logFrame
end

-- Watch buttons and frames for changes
local function watchGuiElement(instance)
	if instance:IsA("TextButton") or instance:IsA("ImageButton") then
		instance.MouseButton1Click:Connect(function()
			log("Clicked: " .. instance:GetFullName() .. " [" .. (instance.Text or "No Text") .. "]")
		end)
	end

	if instance:IsA("GuiObject") then
		instance:GetPropertyChangedSignal("Visible"):Connect(function()
			log("Visibility changed: " .. instance:GetFullName() .. " → " .. tostring(instance.Visible))
		end)

		instance:GetPropertyChangedSignal("Active"):Connect(function()
			log("Active changed: " .. instance:GetFullName() .. " → " .. tostring(instance.Active))
		end)
	end
end

-- Recursively watch all existing GUIs
local function scanUI(folder)
	for _, descendant in ipairs(folder:GetDescendants()) do
		watchGuiElement(descendant)
	end
end

-- Initial scan
scanUI(playerGui)

-- Watch for new GUI elements
playerGui.DescendantAdded:Connect(function(descendant)
	watchGuiElement(descendant)
	log("New UI element added: " .. descendant:GetFullName())
end)

log("🟢 UI Reader started.")
