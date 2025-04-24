local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Load item data
local robuxItemsModule = ReplicatedStorage:WaitForChild("ShopService"):WaitForChild("Library"):WaitForChild("RobuxItems")
local success, robuxItems = pcall(require, robuxItemsModule)

if not success or typeof(robuxItems) ~= "table" then
	warn("Failed to load RobuxItems.")
	return
end

local selectedItem = robuxItems[1] -- Edit first item for demo
if not selectedItem then
	warn("No Robux items found.")
	return
end

-- GUI creation
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "RobuxItemEditor"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 160)
frame.Position = UDim2.new(0.5, -150, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Visible = false

local nameBox = Instance.new("TextBox", frame)
nameBox.Size = UDim2.new(1, -20, 0, 30)
nameBox.Position = UDim2.new(0, 10, 0, 10)
nameBox.PlaceholderText = "Item Name"
nameBox.Text = ""

local priceBox = Instance.new("TextBox", frame)
priceBox.Size = UDim2.new(1, -20, 0, 30)
priceBox.Position = UDim2.new(0, 10, 0, 50)
priceBox.PlaceholderText = "Item Price"
priceBox.Text = ""

local saveBtn = Instance.new("TextButton", frame)
saveBtn.Size = UDim2.new(1, -20, 0, 30)
saveBtn.Position = UDim2.new(0, 10, 0, 90)
saveBtn.Text = "Save"
saveBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
saveBtn.TextColor3 = Color3.new(1, 1, 1)
saveBtn.Font = Enum.Font.SourceSansBold
saveBtn.TextSize = 20

local toggleBtn = Instance.new("TextButton", screenGui)
toggleBtn.Size = UDim2.new(0, 140, 0, 40)
toggleBtn.Position = UDim2.new(0, 20, 0, 20)
toggleBtn.Text = "Edit Robux Item"
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextSize = 18

-- Load data into text boxes
local function loadItem()
	nameBox.Text = selectedItem.Name or ""
	priceBox.Text = tostring(selectedItem.Price or 0)
end

-- Save changes
saveBtn.MouseButton1Click:Connect(function()
	selectedItem.Name = nameBox.Text
	selectedItem.Price = tonumber(priceBox.Text) or selectedItem.Price
	print("Updated item:", selectedItem.Name, selectedItem.Price)
end)

-- Toggle editor
toggleBtn.MouseButton1Click:Connect(function()
	if frame.Visible then
		frame.Visible = false
	else
		loadItem()
		frame.Visible = true
	end
end)
