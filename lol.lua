local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")
    :WaitForChild("Main")
local label = gui:WaitForChild("[OLD]Radar")
local codes_button = gui:WaitForChild("Code")
local settings_button = gui:WaitForChild("Settings")
local dmg_counter_button = settings_button:WaitForChild("Buttons")
    :WaitForChild("DmgCounterButton")
local script_enabled = "Script enabled successfully."
local notifier_enabled = "Notifier enabled successfully."
local notifier_disabled = "Notifier disabled successfully."
local description = "Shows spawned fruits location."
local on = "Notifier (ON)"
local off = "Notifier (OFF)"
local location = "FRUIT DETECTED: "
local magnitude = "m away."
local collected = "Fruit despawned/collected."

if (game:GetService("LocalizationService").RobloxLocaleId == "pt-br") then
    script_enabled = "Script ativado com sucesso."
    notifier_enabled = "Notificador ativado com sucesso."
    notifier_disabled = "Notificador desativado com sucesso."
    description = "Mostra a localização das frutas spawnadas."
    on = "Notificador (ATIVADO)"
    off = "Notificador (DESATIVADO)"
    location = "FRUTA DETECTADA: "
    magnitude = "m de distância."
    collected = "Fruta despawnada/coletada."
end

-- if executed twice or more
if codes_button:FindFirstChild("NotifierLed") then
    return
end

-- creates led to indicate notifier status
local led = Instance.new("Frame")
led.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
led.BackgroundTransparency = 0.3
led.Position = UDim2.new(1.3, 0, 0.35, 0)
led.Size = UDim2.new(0, 8, 0, 8)
led.Name = "NotifierLed"
led.Parent = codes_button
local border = Instance.new("UICorner", led)
border.CornerRadius = UDim.new(1)

-- creates notifier switch by making a copy of an existent blox fruits switch
local switch = dmg_counter_button:Clone()
switch.Notify.Text = description
switch.TextLabel.Text = off
switch.Name = "NotifierSwitch"
switch.Parent = dmg_counter_button.Parent

settings_button.Activated:Connect(function()
    switch.Visible = dmg_counter_button.Visible
end)

-- stores the connection, so after we can disconnect
-- on switch click (also used to check switch state)
local workspace_connection

-- displays text on the label that locates fruits
local function showText(text, time)
    label.Text = text
    label.Visible = true
    if (time ~= 0) then
        task.wait(time)
        label.Visible = false
    end
end

-- used when a fruit spawns
local function playSound(asset_id, pb_speed)
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = asset_id
    sound.Volume = 1
    sound.PlaybackSpeed = pb_speed
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- called when a fruit spawns
local function enableNotifier(fruit)
    local handle = fruit:WaitForChild("Handle")
    local fruit_alive = true
    playSound("rbxassetid://3997124966", 4)

    -- keeps updating the distance if fruit is alive and switch is on
    while fruit_alive and workspace_connection do
        local dist = math.floor((player.Character:WaitForChild("HumanoidRootPart").Position - handle.Position)
            .Magnitude * 0.15)
        showText(location .. dist .. magnitude, 0)
        task.wait(0.2)
        fruit_alive = workspace:FindFirstChild(fruit.Name)
    end

    if not fruit_alive then
        playSound("rbxassetid://4612375233", 1)
        showText(collected, 3)
    end
end

local function onSwitchClick()
    -- enables/disables workspace connection listening for children added
    if workspace_connection then          -- check if we are connected
        workspace_connection:Disconnect() -- disconnect the event and stop listening
        workspace_connection = nil
        led.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        switch.TextLabel.Text = off
        showText(notifier_disabled, 2)
    else
        led.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        switch.TextLabel.Text = on
        showText(notifier_enabled, 2)

        -- connect event and starts listening
        workspace_connection = workspace.ChildAdded:Connect(function(child)
            if child.Name == "Fruit " then -- intended space
                task.spawn(enableNotifier, child)
            end
        end)

        -- looks for an already spawned fruit (need workspace_connection)
        local fruit = workspace:FindFirstChild("Fruit ") -- intended space
        if fruit then
            task.spawn(enableNotifier, fruit)
        end
    end
end

showText(script_enabled, 3)
onSwitchClick()
switch.Activated:Connect(onSwitchClick)
-- === ESP Setup with Name Label ===

-- Function to create the ESP (Box + Name label)
local function createESP(part, fruitName)
    -- Create Box ESP
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "FruitESP"
    box.Adornee = part
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Size = part.Size + Vector3.new(0.2, 0.2, 0.2)
    box.Color3 = Color3.fromRGB(255, 200, 0)
    box.Transparency = 0.5
    box.Parent = part

    -- Create BillboardGui for fruit name label
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FruitLabel"
    billboard.Adornee = part
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)  -- Adjust offset to make it float above
    billboard.AlwaysOnTop = true
    billboard.Parent = part

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = fruitName
    label.TextColor3 = Color3.new(1, 1, 0)
    label.TextStrokeTransparency = 0.5
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Parent = billboard
end

-- Function to remove ESP
local function removeESP(fruit)
    local handle = fruit:FindFirstChild("Handle")
    if handle then
        local box = handle:FindFirstChild("FruitESP")
        if box then box:Destroy() end

        local label = handle:FindFirstChild("FruitLabel")
        if label then label:Destroy() end
    end
end

-- Add ESP to all existing fruits
for _, fruit in pairs(workspace:GetChildren()) do
    if fruit.Name == "Fruit " and fruit:FindFirstChild("Handle") then
        createESP(fruit.Handle, fruit.Name)
    end
end

-- ESP on fruit spawn (new fruit added to the workspace)
workspace.ChildAdded:Connect(function(child)
    if child.Name == "Fruit " and child:FindFirstChild("Handle") then
        local handle = child:WaitForChild("Handle", 5)
        if handle then
            createESP(handle, child.Name)
        end
    end
end)

-- Cleanup on fruit despawn (fruit removed from the workspace)
workspace.ChildRemoved:Connect(function(child)
    if child.Name == "Fruit " then
        removeESP(child)
    end
end)
