local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyCustomGUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 513, 0, 378)
Frame.Position = UDim2.new(0.236, 0, 0.183, 0)
Frame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local function createButton(name, text, pos)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Text = text
	btn.Parent = Frame
	btn.Size = UDim2.new(0, 142, 0, 37)
	btn.Position = pos
	btn.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
	btn.BorderSizePixel = 0
	btn.Font = Enum.Font.DenkOne
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 14
	return btn
end

-- Title label
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(0, 87, 0, 35)
Title.Position = UDim2.new(0.0169, 0, 0.004, 0)
Title.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Title.BorderColor3 = Color3.fromRGB(34, 34, 34)
Title.BorderSizePixel = 0
Title.Font = Enum.Font.DenkOne
Title.Text = "My Menu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

-- Close Button
local CloseButton = createButton("Close", "X", UDim2.new(0.912, 0, 0, 0))
CloseButton.Size = UDim2.new(0, 45, 0, 37)
CloseButton.Font = Enum.Font.LuckiestGuy
CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Scrolling Frame
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = Frame
ScrollingFrame.Position = UDim2.new(0.276, 0, 0.091, 0)
ScrollingFrame.Size = UDim2.new(0, 371, 0, 336)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.Visible = false

-- Main Farm Button
local MainFarm = createButton("MainFarm", "Main Farm", UDim2.new(0, 0, 0.140, 0))
MainFarm.MouseButton1Click:Connect(function()
	ScrollingFrame.Visible = not ScrollingFrame.Visible
end)

-- Other Buttons (no functionality yet)
createButton("Teleport", "Teleport", UDim2.new(0, 0, 0.238, 0))
createButton("Fruits", "Fruits", UDim2.new(0, 0, 0.336, 0))
createButton("FarmMaterial", "Farm Material", UDim2.new(0, 0, 0.452, 0))
createButton("PvpSettings", "Pvp Settings", UDim2.new(0, 0, 0.550, 0))
createButton("Esp", "Esp", UDim2.new(0, 0, 0.648, 0))
createButton("Hop", "Hop", UDim2.new(0, 0, 0.746, 0))
createButton("SeaEvent", "Sea Event", UDim2.new(0, 0, 0.844, 0))

local UserInputService = game:GetService("UserInputService")

local function makeDraggable(frame)
	local dragToggle = nil
	local dragInput = nil
	local dragStart = nil
	local startPos = nil

	local function update(input)
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
								   startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			update(input)
		end
	end)
end

-- Call this after creating the Frame
makeDraggable(Frame)


