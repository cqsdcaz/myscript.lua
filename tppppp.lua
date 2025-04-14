--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

--// Player Setup
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

--// Teleport Locations
local teleportLocations = {
    ["Sky Base"] = CFrame.new(3243.28516, 900.335388, -7151.17285) * CFrame.Angles(0, math.rad(160), 0),
    ["Mountain Top"] = CFrame.new(-361, 615.127991, 111.557007, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.Angles(0, math.rad(90), 0),
    ["Secret Cave"] = CFrame.new(1800, 100, -7200) * CFrame.Angles(0, math.rad(0), 0),
}

local flightSpeed = 200

--// Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 200)
frame.Position = UDim2.new(0, 10, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.2
frame.Parent = screenGui

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.FillDirection = Enum.FillDirection.Vertical
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center
layout.Parent = frame

--// Create Buttons for Each Location
for name, cframe in pairs(teleportLocations) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Text = name
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        local distance = (cframe.Position - humanoidRootPart.Position).Magnitude
        local time = distance / flightSpeed

        local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
        local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = cframe})
        tween:Play()
    end)
end
