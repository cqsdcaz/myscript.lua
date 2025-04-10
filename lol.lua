local function createGui()
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create the fly-to button
    local flyButton = Instance.new("TextButton")
    flyButton.Size = UDim2.new(0, 200, 0, 50)
    flyButton.Position = UDim2.new(0.5, -100, 0.5, -25)
    flyButton.Text = "Click Me to Fly to Galley Captain"
    flyButton.Parent = screenGui

    -- Create the exit button
    local exitButton = Instance.new("TextButton")
    exitButton.Size = UDim2.new(0, 200, 0, 50)
    exitButton.Position = UDim2.new(0.5, -100, 0.5, 35)
    exitButton.Text = "Exit Script"
    exitButton.Parent = screenGui

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
    flyButton.MouseButton1Click:Connect(function()
        -- Start flying to Galley Captain's position
        flyToTarget(Galley_Captain.CFramePos.Position)
        print("Flying to Galley Captain!")
    end)

    -- Button click event to exit/close the script
    exitButton.MouseButton1Click:Connect(function()
        -- Remove the GUI (effectively "exit" the script)
        screenGui:Destroy()
        print("Exiting script and removing GUI.")
    end)

    -- Make the entire GUI draggable
    local dragging, dragInput, dragStart, startPos

    local function onInputBegan(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = screenGui.Position
        end
    end

    local function onInputChanged(input)
        if dragging then
            local delta = input.Position - dragStart
            screenGui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end

    local function onInputEnded(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end

    -- Connect input events to handle the drag logic for the entire GUI
    screenGui.InputBegan:Connect(onInputBegan)
    screenGui.InputChanged:Connect(onInputChanged)
    screenGui.InputEnded:Connect(onInputEnded)
end

-- Create the GUI when the script runs
createGui()
