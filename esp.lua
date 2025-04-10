--[[ Fruit Notifier with ESP and GUI Toggle | Supports English + pt-br ]]--

--// Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer

--// UI Elements
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FruitNotifier"

local frame = Instance.new("Frame", screenGui)
frame.Position = UDim2.new(0.01, 0, 0.4, 0)
frame.Size = UDim2.new(0, 200, 0, 80)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.2
frame.Visible = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0.4, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Fruit Notifier"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)

local switch = Instance.new("TextButton", frame)
switch.Size = UDim2.new(0.6, 0, 0.4, 0)
switch.Position = UDim2.new(0.05, 0, 0.5, 0)
switch.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
switch.Text = ""
switch.TextTransparency = 1

local led = Instance.new("Frame", switch)
led.Size = UDim2.new(0.2, 0, 0.8, 0)
led.Position = UDim2.new(0.05, 0, 0.1, 0)
led.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

local switchText = Instance.new("TextLabel", switch)
switchText.Size = UDim2.new(0.7, 0, 1, 0)
switchText.Position = UDim2.new(0.3, 0, 0, 0)
switchText.BackgroundTransparency = 1
switchText.Text = "OFF"
switchText.Font = Enum.Font.SourceSans
switchText.TextSize = 16
switchText.TextColor3 = Color3.fromRGB(255, 255, 255)

--// Localization
local language = "en" -- Change to "pt-br" if desired

local phrases = {
    ["en"] = {
        collected = "Fruit collected!",
        notifier_enabled = "Fruit Notifier Enabled",
        notifier_disabled = "Fruit Notifier Disabled",
        script_enabled = "Script Enabled",
        location = "Fruit Spawned: ",
        on = "ON",
        off = "OFF",
        magnitude = " studs"
    },
    ["pt-br"] = {
        collected = "Fruta coletada!",
        notifier_enabled = "Notificador Ativado",
        notifier_disabled = "Notificador Desativado",
        script_enabled = "Script Ativado",
        location = "Fruta Apareceu: ",
        on = "LIGADO",
        off = "DESLIGADO",
        magnitude = " metros"
    }
}

--// Phrase shortcuts
local collected = phrases[language].collected
local notifier_enabled = phrases[language].notifier_enabled
local notifier_disabled = phrases[language].notifier_disabled
local script_enabled = phrases[language].script_enabled
local location = phrases[language].location
local on = phrases[language].on
local off = phrases[language].off
local magnitude = phrases[language].magnitude

--// Fruit Mapping
local FruitsId = {
	["rbxassetid://15124425041"] = "Rocket-Rocket",
	["rbxassetid://15123685330"] = "Spin-Spin",
	["rbxassetid://15123613404"] = "Blade-Blade",
	["rbxassetid://15123689268"] = "Spring-Spring",
	["rbxassetid://15123595806"] = "Bomb-Bomb",
	["rbxassetid://15123677932"] = "Smoke-Smoke",
	["rbxassetid://15124220207"] = "Spike-Spike",
	["rbxassetid://15123629861"] = "Flame-Flame",
	["rbxassetid://15123627377"] = "Falcon-Falcon",
	["rbxassetid://15100433167"] = "Ice-Ice",
	["rbxassetid://15123673019"] = "Sand-Sand",
	["rbxassetid://15123618591"] = "Dark-Dark",
	["rbxassetid://15112600534"] = "Diamond-Diamond",
	["rbxassetid://15123640714"] = "Light-Light",
	["rbxassetid://15123668008"] = "Rubber-Rubber",
	["rbxassetid://15100485671"] = "Barrier-Barrier",
	["rbxassetid://15123662036"] = "Ghost-Ghost",
	["rbxassetid://15123645682"] = "Magma-Magma",
	["rbxassetid://15123606541"] = "Quake-Quake",
	["rbxassetid://15123643097"] = "Love-Love",
	["rbxassetid://15123681598"] = "Spider-Spider",
	["rbxassetid://15123679712"] = "Sound-Sound",
	["rbxassetid://15123654553"] = "Phoenix-Phoenix",
	["rbxassetid://15123656798"] = "Portal-Portal",
	["rbxassetid://15123670514"] = "Rumble-Rumble",
	["rbxassetid://15123652069"] = "Pain-Pain",
	["rbxassetid://15123587371"] = "Blizzard-Blizzard",
	["rbxassetid://15123633312"] = "Gravity-Gravity",
	["rbxassetid://15123648309"] = "Mammoth-Mammoth",
	["rbxassetid://15123624401"] = "Dough-Dough",
	["rbxassetid://15123675904"] = "Shadow-Shadow",
	["rbxassetid://10773719142"] = "Venom-Venom",
	["rbxassetid://15123616275"] = "Control-Control",
	["rbxassetid://11911905519"] = "Spirit-Spirit",
	["rbxassetid://15123638064"] = "Leopard-Leopard",
	["rbxassetid://15487764876"] = "Kitsune-Kitsune",
	["rbxassetid://115276580506154"] = "Yeti-Yeti",
	["rbxassetid://118054805452821"] = "Gas-Gas",
	["rbxassetid://95749033139458"] = "Dragon East-Dragon East"
}

--// Functions
local function showText(text, duration)
    local msg = Instance.new("Message", workspace)
    msg.Text = text
    task.delay(duration, function()
        msg:Destroy()
    end)
end

local function playSound(id, pitch)
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = id
    sound.PlaybackSpeed = pitch or 1
    sound.Volume = 1
    sound:Play()
    game.Debris:AddItem(sound, 3)
end

local function enableNotifier(fruit)
    local fruit_alive = true
    local handle = fruit:WaitForChild("Handle", 2)
    if not handle then return end

    -- Billboard GUI
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FruitESP"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.Adornee = handle
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 10000
    billboard.Parent = handle

    local nameLabel = Instance.new("TextLabel", billboard)
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.Text = FruitsId[handle.Texture] or "Unknown Fruit"
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.SourceSansBold

    local distanceLabel = nameLabel:Clone()
    distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distanceLabel.Text = ""
    distanceLabel.Parent = billboard

    coroutine.wrap(function()
        while fruit_alive and fruit:IsDescendantOf(workspace) do
            local dist = math.floor((handle.Position - player.Character.HumanoidRootPart.Position).Magnitude)
            distanceLabel.Text = tostring(dist) .. magnitude
            task.wait(1)
        end
    end)()

    playSound("rbxassetid://9118823102", 1.2)
    showText(location .. nameLabel.Text, 3)

    fruit.AncestryChanged:Connect(function(_, parent)
        if not parent then
            fruit_alive = false
            showText(collected, 2)
        end
    end)
end

local workspace_connection

local function toggleNotifier()
    local enabled = switchText.Text == off
    if enabled then
        switchText.Text = on
        led.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        showText(notifier_enabled, 2)
        workspace_connection = workspace.ChildAdded:Connect(function(child)
            if child:IsA("Tool") and child:FindFirstChild("Handle") and FruitsId[child.Handle.Texture] then
                enableNotifier(child)
            end
        end)
    else
        switchText.Text = off
        led.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        showText(notifier_disabled, 2)
        if workspace_connection then
            workspace_connection:Disconnect()
        end
    end
end

--// Connect toggle
switch.MouseButton1Click:Connect(toggleNotifier)

--// Initial message
showText(script_enabled, 2)
