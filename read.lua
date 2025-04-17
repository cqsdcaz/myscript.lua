-- Gui to Lua
-- Paste this in your Executor and attach to a game

-- SERVICES
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI SETUP
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local RunButton = Instance.new("TextButton")
local SaveButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "ScriptRunnerUI"

-- Frame
Frame.Size = UDim2.new(0, 500, 0, 300)
Frame.Position = UDim2.new(0.5, -250, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

-- TextBox
TextBox.Size = UDim2.new(1, -20, 1, -60)
TextBox.Position = UDim2.new(0, 10, 0, 10)
TextBox.MultiLine = true
TextBox.Text = "-- Paste your script here"
TextBox.TextWrapped = true
TextBox.ClearTextOnFocus = false
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 14
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.Parent = Frame

-- Run Button
RunButton.Size = UDim2.new(0.5, -15, 0, 40)
RunButton.Position = UDim2.new(0, 10, 1, -45)
RunButton.Text = "▶ Run"
RunButton.Font = Enum.Font.SourceSansBold
RunButton.TextSize = 18
RunButton.BackgroundColor3 = Color3.fromRGB(60, 180, 75)
RunButton.TextColor3 = Color3.new(1, 1, 1)
RunButton.Parent = Frame

-- Save Button
SaveButton.Size = UDim2.new(0.5, -15, 0, 40)
SaveButton.Position = UDim2.new(0.5, 5, 1, -45)
SaveButton.Text = "💾 Save to File"
SaveButton.Font = Enum.Font.SourceSansBold
SaveButton.TextSize = 18
SaveButton.BackgroundColor3 = Color3.fromRGB(0, 130, 200)
SaveButton.TextColor3 = Color3.new(1, 1, 1)
SaveButton.Parent = Frame

-- Function: Run Script
RunButton.MouseButton1Click:Connect(function()
    local src = TextBox.Text
    local func, err = loadstring(src)
    if func then
        pcall(func)
    else
        warn("Error loading script:", err)
    end
end)

-- Function: Save to File (Synapse X Only)
SaveButton.MouseButton1Click:Connect(function()
    if writefile then
        writefile("DecryptedScript.lua", TextBox.Text)
        print("✅ Script saved as 'DecryptedScript.lua'")
    else
        warn("❌ writefile not supported in your executor")
    end
end)
