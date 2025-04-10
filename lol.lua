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

    -- Function to make the player fly to the target position
    local function flyToTarget(targetPosition)
        local character = game.Players.LocalPlayer.Character
        local humanoid = character:WaitForChild("Humanoid")
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Disable gravity and make the player fly
        humanoid.PlatformStand = true
        humanoid.UseJumpPower = false
        humanoidRootPart.Anchored = false
        
        -- Create a BodyVelocity to move the player
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)  -- Allow strong movement
        bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- Fly upwards initially
        bodyVelocity.Parent = humanoidRootPart

        -- Move towards the target position while flying
        local startPos = humanoidRootPart.Position
        local targetPos = targetPosition
        local distance = (targetPos - startPos).Magnitude
        local speed = 50 -- Speed at which the player flies (change as needed)

        while (humanoidRootPart.Position - startPos).Magnitude < distance do
            wait(0.03) -- Update every frame
            local direction = (targetPos - humanoidRootPart.Position).Unit
            bodyVelocity.Velocity = direction * speed + Vector3.new(0, 50, 0)  -- Apply the flying speed
        end
        
        -- Stop the BodyVelocity and place the player at the target position
        bodyVelocity:Destroy()
        humanoidRootPart.CFrame = CFrame.new(targetPos)
        
        -- Reset player gravity and jumping
        humanoid.PlatformStand = false
        humanoid.UseJumpPower = true
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
