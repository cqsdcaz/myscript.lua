local targetPosition = Vector3.new(3243.28516, 900.335388, -7151.17285, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)

-- Speed of flight (studs per second)
local flightSpeed = 200

-- TweenService for smooth movement
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Calculate flight duration based on distance and speed
local distance = (targetPosition - humanoidRootPart.Position).Magnitude
local time = distance / flightSpeed

-- Tween the character to the target position
local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = CFrame.new(targetPosition)})
tween:Play()
