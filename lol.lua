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

if codes_button:FindFirstChild("NotifierLed") then
    return
end

local led = Instance.new("Frame")
led.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
led.BackgroundTransparency = 0.3
led.Position = UDim2.new(1.3, 0, 0.35, 0)
led.Size = UDim2.new(0, 8, 0, 8)
led.Name = "NotifierLed"
led.Parent = codes_button
local border = Instance.new("UICorner", led)
border.CornerRadius = UDim.new(1)

local switch = dmg_counter_button:Clone()
switch.Notify.Text = description
switch.TextLabel.Text = off
switch.Name = "NotifierSwitch"
switch.Parent = dmg_counter_button.Parent

settings_button.Activated:Connect(function()
    switch.Visible = dmg_counter_button.Visible
end)

local workspace_connection

local function showText(text, time)
    label.Text = text
    label.Visible = true
    if (time ~= 0) then
        task.wait(time)
        label.Visible = false
    end
end

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

local function enableNotifier(fruit)
    local handle = fruit:WaitForChild("Handle")
    local fruit_alive = true
    playSound("rbxassetid://3997124966", 4)

    -- Makes player fly toward the fruit (once when detected)
    local function flyToFruit()
        local hrp = player.Character:WaitForChild("HumanoidRootPart")
        local direction = (handle.Position - hrp.Position).Unit
        local speed = 60 -- Adjust speed if needed

        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = direction * speed
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.P = 1250
        bodyVelocity.Parent = hrp

        task.spawn(function()
            local reached = false
            while not reached and workspace:FindFirstChild(fruit.Name) do
                local distance = (hrp.Position - handle.Position).Magnitude
                if distance < 5 then
                    reached = true
                end
                task.wait(0.1)
            end
            bodyVelocity:Destroy()
        end)
    end

    flyToFruit()

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
    if workspace_connection then
        workspace_connection:Disconnect()
        workspace_connection = nil
        led.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        switch.TextLabel.Text = off
        showText(notifier_disabled, 2)
    else
        led.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        switch.TextLabel.Text = on
        showText(notifier_enabled, 2)

        workspace_connection = workspace.ChildAdded:Connect(function(child)
            if child.Name == "Fruit " then
                task.spawn(enableNotifier, child)
            end
        end)

        local fruit = workspace:FindFirstChild("Fruit ")
        if fruit then
            task.spawn(enableNotifier, fruit)
        end
    end
end

showText(script_enabled, 3)
onSwitchClick()
switch.Activated:Connect(onSwitchClick)
