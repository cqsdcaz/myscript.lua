local P, T, U = game:GetService("Players"), game:GetService("TeleportService"), game:GetService("UserInputService")
local player = P.LocalPlayer or P.PlayerAdded:Wait()
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

local f = Instance.new("Frame", gui)
f.Size, f.Position, f.BackgroundColor3 = UDim2.new(0, 250, 0, 160), UDim2.new(0.5, -125, 0.5, -80), Color3.fromRGB(40,40,40)

local t = Instance.new("TextLabel", f)
t.Text, t.Size, t.BackgroundColor3, t.TextColor3 = "Join by Job ID", UDim2.new(1,0,0,30), Color3.fromRGB(25,25,25), Color3.new(1,1,1)

local box = Instance.new("TextBox", f)
box.PlaceholderText, box.Size, box.Position, box.BackgroundColor3, box.TextColor3 = "Enter Job ID", UDim2.new(1,-20,0,40), UDim2.new(0,10,0,40), Color3.fromRGB(60,60,60), Color3.new(1,1,1)

local btn = Instance.new("TextButton", f)
btn.Text, btn.Size, btn.Position, btn.BackgroundColor3, btn.TextColor3 = "Join Job", UDim2.new(1,-20,0,40), UDim2.new(0,10,0,100), Color3.fromRGB(0,120,255), Color3.new(1,1,1)

local dragging, dragInput, dragStart, startPos = false

btn.MouseButton1Click:Connect(function()
	if box.Text ~= "" then
		pcall(function()
			T:TeleportToPlaceInstance(4442272183, box.Text, player)
		end)
	end
end)

t.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = f.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)

t.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)

U.InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		local delta = input.Position - dragStart
		f.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
