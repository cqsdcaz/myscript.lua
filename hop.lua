local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui"):WaitForChild("Main")
local label = gui:WaitForChild("[OLD]Radar")
local codes_button = gui:WaitForChild("Code")
local settings_button = gui:WaitForChild("Settings")
local dmg_counter_button = settings_button:WaitForChild("Buttons"):WaitForChild("DmgCounterButton")

-- Localization
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

-- Notifier LED
local led = Instance.new("Frame")
led.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
led.BackgroundTransparency = 0.3
led.Position = UDim2.new(1.3, 0, 0.35, 0)
led.Size = UDim2.new(0, 8, 0, 8)
led.Name = "NotifierLed"
led.Parent = codes_button
Instance.new("UICorner", led).CornerRadius = UDim.new(1)

-- Clone switch
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

-- ESP
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

-- === GUI: Server Tools (Bottom of Screen) ===
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "ServerToolsGui"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(1, -310, 1, -160)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.3
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local hopButton = Instance.new("TextButton", frame)
hopButton.Size = UDim2.new(1, -20, 0, 30)
hopButton.Position = UDim2.new(0, 10, 0, 10)
hopButton.Text = "Hop to Random Server"
hopButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", hopButton)

local copyButton = Instance.new("TextButton", frame)
copyButton.Size = UDim2.new(1, -20, 0, 30)
copyButton.Position = UDim2.new(0, 10, 0, 50)
copyButton.Text = "Copy This Server ID"
copyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", copyButton)

local inputBox = Instance.new("TextBox", frame)
inputBox.Size = UDim2.new(1, -20, 0, 30)
inputBox.Position = UDim2.new(0, 10, 0, 90)
inputBox.PlaceholderText = "Enter Server ID..."
inputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", inputBox)

local joinButton = Instance.new("TextButton", frame)
joinButton.Size = UDim2.new(1, -20, 0, 30)
joinButton.Position = UDim2.new(0, 10, 0, 130)
joinButton.Text = "Join Server by ID"
joinButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", joinButton)

-- === Server Actions ===
hopButton.MouseButton1Click:Connect(function()
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local success, result = pcall(function()
        return HttpService:GetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
    end)

    if success then
        local servers = HttpService:JSONDecode(result)
        for _, server in ipairs(servers.data) do
            if server.id ~= game.JobId and server.playing < server.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id)
                break
            end
        end
    else
        warn("Failed to get server list.")
    end
end)

copyButton.MouseButton1Click:Connect(function()
    setclipboard(game.JobId)
end)

joinButton.MouseButton1Click:Connect(function()
    local id = inputBox.Text
    if id and id ~= "" then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, id)
    end
end)
