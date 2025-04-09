local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 120)
frame.Position = UDim2.new(0.5, -150, 0.5, -60)
frame.BackgroundTransparency = 0.5

-- Level Up Button
local levelUpButton = Instance.new("TextButton", frame)
levelUpButton.Size = UDim2.new(0, 100, 0, 30)
levelUpButton.Position = UDim2.new(0.5, -50, 0, 10)
levelUpButton.Text = "Auto Level Up"

-- Quest Take Button
local takeQuestButton = Instance.new("TextButton", frame)
takeQuestButton.Size = UDim2.new(0, 100, 0, 30)
takeQuestButton.Position = UDim2.new(0.5, -50, 0, 50)
takeQuestButton.Text = "Take Quest"

-- Auto Leveling Logic
levelUpButton.MouseButton1Click:Connect(function()
    -- Example of auto-leveling the player
    local playerStats = player:FindFirstChild("leaderstats") -- Assuming "leaderstats" holds player stats like level
    if playerStats then
        local levelStat = playerStats:FindFirstChild("Level")
        if levelStat then
            levelStat.Value = levelStat.Value + 1  -- Increase level by 1 (adjust based on your game's mechanics)
            print("Level increased to: " .. levelStat.Value)
        end
    end
end)

-- Auto Quest Taking Logic
takeQuestButton.MouseButton1Click:Connect(function()
    -- Example of auto-taking a quest (replace with your specific game logic)
    local questSystem = player:FindFirstChild("QuestSystem")  -- This is just an example, adjust based on your system
    if questSystem then
        local questButton = questSystem:FindFirstChild("QuestButton")
        if questButton then
            questButton:Click()  -- Simulates pressing the button to take the quest
            print("Quest taken!")
        end
    end
end)
