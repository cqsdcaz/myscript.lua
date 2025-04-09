local QuestsData = {QuestsNames, Quests}

local Quests = {
    -- First Sea
    Bandit = {
        Enemy = "Bandit [Lv. 5]",
        QuestName = "BanditQuest1",
        EnemyName = "Bandit",
        LevelQuest = 1,
        CFramePos = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544),
        QuestGiver = "Bandit Quest Giver",
        World = 1
    },
    Monkey = {
        Enemy = "Monkey [Lv. 14]",
        QuestName = "JungleQuest",
        EnemyName = "Monkey",
        LevelQuest = 1,
        CFramePos = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0),
        QuestGiver = "Adventurer",
        World = 1
    },
    Gorilla = {
        Enemy = "Gorilla [Lv. 20]",
        QuestName = "JungleQuest",
        EnemyName = "Gorilla",
        LevelQuest = 2,
        CFramePos = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0),
        QuestGiver = "Adventurer",
        World = 1
    },
    Pirate = {
        Enemy = "Pirate [Lv. 35]",
        QuestName = "BuggyQuest1",
        EnemyName = "Pirate",
        LevelQuest = 1,
        CFramePos = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627),
        QuestGiver = "Pirate Adventurer",
        World = 1
    },
    -- Add more quests here as needed
}

-- Auto-enable the button to activate the script
local AutoActivateButton = Instance.new("TextButton")
AutoActivateButton.Size = UDim2.new(0, 200, 0, 50)
AutoActivateButton.Position = UDim2.new(0.5, -100, 0.5, -25)
AutoActivateButton.Text = "Activate Quest"

AutoActivateButton.MouseButton1Click:Connect(function()
    -- Automatically activate quests
    print("Quests activated!")
    -- You can put the logic for enabling the quests here
    -- For example, you could start quest activities for the player
end)

-- Button to exit the script
local ExitButton = Instance.new("TextButton")
ExitButton.Size = UDim2.new(0, 200, 0, 50)
ExitButton.Position = UDim2.new(0.5, -100, 0.5, 25)
ExitButton.Text = "Exit Script"

ExitButton.MouseButton1Click:Connect(function()
    -- Logic to safely exit the script
    print("Exiting script...")
    game:Shutdown()  -- This line will shut down the game
end)

-- Parent buttons to the screen (or specific GUI)
AutoActivateButton.Parent = game.Players.LocalPlayer.PlayerGui
ExitButton.Parent = game.Players.LocalPlayer.PlayerGui
