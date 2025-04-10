local function createGui()
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create the button
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0.5, -25)
    button.Text = "Click Me to TP to Galley Captain"
    button.Parent = screenGui

    -- Galley Captain's teleport details
    local Galley_Captain = {
        Enemy = "Galley Captain [Lv. 650]",
        QuestName = "FountainQuest",
        EnemyName = "Galley Captain",
        LevelQuest = 2,
        CFramePos = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381),
        QuestGiver = "Freezeburg Quest Giver",
        World = 1
    }

    -- Button click event to teleport player
    button.MouseButton1Click:Connect(function()
        -- Teleport to Galley Captain's position
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(Galley_Captain.CFramePos)
        print("Teleported to Galley Captain!")
    end)
end

-- Create the GUI when the script runs
createGui()
