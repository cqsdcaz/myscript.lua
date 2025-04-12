local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui"):WaitForChild("Main")
local label = gui:WaitForChild("[OLD]Radar")
local codes_button = gui:WaitForChild("Code")
local settings_button = gui:WaitForChild("Settings")
local dmg_counter_button = settings_button:WaitForChild("Buttons"):WaitForChild("DmgCounterButton")

local script_enabled = "Script enabled successfully."
local notifier_enabled = "Notifier enabled successfully."
local notifier_disabled = "Notifier disabled successfully."
local description = "Shows spawned fruits location."
local on = "Notifier (ON)"
local off = "Notifier (OFF)"
local location = "FRUIT DETECTED: "
local magnitude = "m away."
local collected = "Fruit despawned/collected."

if game:GetService("LocalizationService").RobloxLocaleId == "pt-br" then
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

if codes_button:FindFirstChild("NotifierLed") then return end

local led = Instance.new("Frame")
led.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
led.BackgroundTransparency = 0.3
led.Position = UDim2.new(1.3, 0, 0.35, 0)
led.Size = UDim2.new(0, 8, 0, 8)
led.Name = "NotifierLed"
led.Parent = codes_button
Instance.new("UICorner", led).CornerRadius = UDim.new(1)

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
    if time ~= 0 then
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
    sound.Ended:Connect(function() sound:Destroy() end)
end

local function enableNotifier(fruit)
    local handle = fruit:WaitForChild("Handle")
    local fruit_alive = true
    playSound("rbxassetid://3997124966", 4)
    while fruit_alive and workspace_connection do
        local dist = math.floor((player.Character:WaitForChild("HumanoidRootPart").Position - handle.Position).Magnitude * 0.15)
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

-- === ESP Setup ===
local function createESP(part, fruitName)
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "FruitESP"
    box.Adornee = part
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Size = part.Size + Vector3.new(0.2, 0.2, 0.2)
    box.Color3 = Color3.fromRGB(255, 200, 0)
    box.Transparency = 0.5
    box.Parent = part

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FruitLabel"
    billboard.Adornee = part
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
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

local function removeESP(fruit)
    local handle = fruit:FindFirstChild("Handle")
    if handle then
        local box = handle:FindFirstChild("FruitESP")
        if box then box:Destroy() end
        local label = handle:FindFirstChild("FruitLabel")
        if label then label:Destroy() end
    end
end

for _, fruit in pairs(workspace:GetChildren()) do
    if fruit.Name == "Fruit " and fruit:FindFirstChild("Handle") then
        createESP(fruit.Handle, fruit.Name)
    end
end

workspace.ChildAdded:Connect(function(child)
    if child.Name == "Fruit " and child:FindFirstChild("Handle") then
        local handle = child:WaitForChild("Handle", 5)
        if handle then
            createESP(handle, child.Name)
        end
    end
end)

workspace.ChildRemoved:Connect(function(child)
    if child.Name == "Fruit " then
        removeESP(child)
    end
end)

-- === SERVER HOP, COPY, AND JOIN SETUP ===
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local placeId = game.PlaceId

-- Hop Button
local hopButton = Instance.new("TextButton")
hopButton.Name = "HopButton"
hopButton.Text = "Hop Server"
hopButton.Size = UDim2.new(0, 120, 0, 30)
hopButton.Position = UDim2.new(0, 10, 0, 250)
hopButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
hopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
hopButton.Font = Enum.Font.GothamBold
hopButton.TextScaled = true
hopButton.Parent = gui
Instance.new("UICorner", hopButton).CornerRadius = UDim.new(0, 6)

local function getDifferentServer()
    local servers = HttpService:JSONDecode(game:HttpGet(
        "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
    ))
    for _, server in pairs(servers.data) do
        if server.id ~= game.JobId and server.playing < server.maxPlayers then
            return server.id
        end
    end
    return nil
end

hopButton.MouseButton1Click:Connect(function()
    local serverId = getDifferentServer()
    if serverId then
        TeleportService:TeleportToPlaceInstance(placeId, serverId, player)
    else
        showText("No other server found!", 3)
    end
end)

-- Copy Server ID Button
local copyButton = hopButton:Clone()
copyButton.Name = "CopyButton"
copyButton.Text = "Copy Server ID"
copyButton.Position = UDim2.new(0, 10, 0, 290)
copyButton.Parent = gui

copyButton.MouseButton1Click:Connect(function()
    setclipboard(game.JobId)
    showText("Server ID copied!", 2)
end)

-- Join Server Input
local inputBox = Instance.new("TextBox")
inputBox.Name = "ServerInput"
inputBox.PlaceholderText = "Enter Server ID"
inputBox.Size = UDim2.new(0, 200, 0, 30)
inputBox.Position = UDim2.new(0, 10, 0, 330)
inputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.Font = Enum.Font.Gotham
inputBox.TextScaled = true
inputBox.Parent = gui
Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 6)

-- Join Server Button
local joinButton = hopButton:Clone()
joinButton.Text = "Join by ID"
joinButton.Position = UDim2.new(0, 10, 0, 370)
joinButton.Parent = gui

joinButton.MouseButton1Click:Connect(function()
    local id = inputBox.Text
    if id and #id > 10 then
        TeleportService:TeleportToPlaceInstance(placeId, id, player)
    else
        showText("Invalid Server ID", 2)
    end
end)
