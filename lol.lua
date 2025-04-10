local function createGui()
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create the button
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0.5, -25)
    button.Text = "Click Me to Fly to Galley Captain"
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

    -- Function to fly to the target position
    local function flyToTarget(targetPosition)
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = character.HumanoidRootPart
            local startPos = humanoidRootPart.Position
            local endPos = targetPosition
            local distance = (endPos - startPos).Magnitude
            local speed = 50 -- Speed at which the player flies (change as needed)
            
            -- Fly to the target position
            local direction = (endPos - startPos).Unit
            local traveled = 0
            while traveled < distance do
                wait(0.03) -- Update every frame
                local move = direction * speed * 0.03
                humanoidRootPart.CFrame = humanoidRootPart.CFrame + move
                traveled = (humanoidRootPart.Position - startPos).Magnitude
            end
            -- Set final position to the target
            humanoidRootPart.CFrame = CFrame.new(endPos)
        end
    end

    -- Button click event to start flying
    button.MouseButton1Click:Connect(function()
        -- Start flying to Galley Captain's position
        flyToTarget(Galley_Captain.CFramePos.Position)
        print("Flying to Galley Captain!")
    end)
end

-- Create the GUI when the script runs
createGui()
