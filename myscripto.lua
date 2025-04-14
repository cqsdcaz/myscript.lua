task.spawn(function()
    local player = game:GetService("Players").LocalPlayer
    repeat task.wait() until player and player:FindFirstChild("PlayerGui")
local SkillsTime = {}

-- Require SkillsTime wrapper
local SkillsTime_REQUIRE = require;
local SkillsTime_MODULES = {};
local function require(Module:ModuleScript)
    local ModuleState = SkillsTime_MODULES[Module];
    if ModuleState then
        if not ModuleState.Required then
            ModuleState.Required = true;
            ModuleState.Value = ModuleState.Closure();
        end
        return ModuleState.Value;
    end;
    return SkillsTime_REQUIRE(Module);
end


--[[
    Instances:
--]]

--ScreenGui
SkillsTime["0"] = Instance.new("ScreenGui")

--ScreenGui.Frame
SkillsTime["1"] = Instance.new("Frame")

--ScreenGui.Frame.TextLabel
SkillsTime["2"] = Instance.new("TextLabel")

--ScreenGui.Frame.X
SkillsTime["3"] = Instance.new("TextButton")

--ScreenGui.Frame.X.LocalScript
SkillsTime["4"] = Instance.new("LocalScript")

--ScreenGui.Frame.Main Farm
SkillsTime["5"] = Instance.new("TextButton")

--ScreenGui.Frame.Main Farm.LocalScript
SkillsTime["6"] = Instance.new("LocalScript")

--ScreenGui.Frame.Teleport
SkillsTime["7"] = Instance.new("TextButton")

--ScreenGui.Frame.Fruits
SkillsTime["8"] = Instance.new("TextButton")

--ScreenGui.Frame.Farm Material
SkillsTime["9"] = Instance.new("TextButton")

--ScreenGui.Frame.Pvp Settings
SkillsTime["10"] = Instance.new("TextButton")

--ScreenGui.Frame.Esp
SkillsTime["11"] = Instance.new("TextButton")

--ScreenGui.Frame.Hop
SkillsTime["12"] = Instance.new("TextButton")

--ScreenGui.Frame.Sea Event
SkillsTime["13"] = Instance.new("TextButton")

--ScreenGui.Frame.-
SkillsTime["14"] = Instance.new("TextButton")

--ScreenGui.Frame.ScrollingFrame
SkillsTime["15"] = Instance.new("ScrollingFrame")

--ScreenGui.Frame.LocalScript
SkillsTime["16"] = Instance.new("LocalScript")



--[[
    Properties:
--]]
--ScreenGui
SkillsTime["0"].Name = [[ScreenGui]]
SkillsTime["0"].Enabled = true
SkillsTime["0"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SkillsTime["0"].Parent = game.Players.LocalPlayer.PlayerGui

--ScreenGui.Frame
SkillsTime["1"].Name = [[Frame]]
SkillsTime["1"].Active = false
SkillsTime["1"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["1"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["1"].BackgroundTransparency = 0
SkillsTime["1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["1"].BorderSizePixel = 0
SkillsTime["1"].ClipsDescendants = false
SkillsTime["1"].Draggable = false
SkillsTime["1"].Position = UDim2.new(0.23638232, 0, 0.18363939, 0)
SkillsTime["1"].Rotation = 0
SkillsTime["1"].Selectable = false
SkillsTime["1"].SelectionOrder = 0
SkillsTime["1"].Size = UDim2.new(0, 513, 0, 378)
SkillsTime["1"].Visible = true
SkillsTime["1"].ZIndex = 1
SkillsTime["1"].Parent = SkillsTime["0"]

--ScreenGui.Frame.TextLabel
SkillsTime["2"].Name = [[TextLabel]]
SkillsTime["2"].FontFace = Font.new([[rbxasset://fonts/families/Jura.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SkillsTime["2"].Text = [[SkillsTime]]
SkillsTime["2"].TextColor3 = Color3.fromRGB(255, 255, 255)
SkillsTime["2"].TextScaled = false
SkillsTime["2"].TextSize = 14
SkillsTime["2"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["2"].TextStrokeTransparency = 1
SkillsTime["2"].TextWrapped = false
SkillsTime["2"].TextXAlignment = Enum.TextXAlignment.Center
SkillsTime["2"].TextYAlignment = Enum.TextYAlignment.Center
SkillsTime["2"].Active = false
SkillsTime["2"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["2"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["2"].BackgroundTransparency = 0
SkillsTime["2"].BorderColor3 = Color3.fromRGB(34, 34, 34)
SkillsTime["2"].BorderSizePixel = 0
SkillsTime["2"].ClipsDescendants = false
SkillsTime["2"].Draggable = false
SkillsTime["2"].Position = UDim2.new(0.016920064, 0, 0.003968254, 0)
SkillsTime["2"].Rotation = 0
SkillsTime["2"].Selectable = false
SkillsTime["2"].SelectionOrder = 0
SkillsTime["2"].Size = UDim2.new(0, 87, 0, 35)
SkillsTime["2"].Visible = true
SkillsTime["2"].ZIndex = 1
SkillsTime["2"].Parent = SkillsTime["1"]

--ScreenGui.Frame.X
SkillsTime["3"].Name = [[X]]
SkillsTime["3"].FontFace = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SkillsTime["3"].Text = [[X]]
SkillsTime["3"].TextColor3 = Color3.fromRGB(255, 255, 255)
SkillsTime["3"].TextScaled = false
SkillsTime["3"].TextSize = 14
SkillsTime["3"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["3"].TextStrokeTransparency = 1
SkillsTime["3"].TextWrapped = false
SkillsTime["3"].TextXAlignment = Enum.TextXAlignment.Center
SkillsTime["3"].TextYAlignment = Enum.TextYAlignment.Center
SkillsTime["3"].Active = true
SkillsTime["3"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["3"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["3"].BackgroundTransparency = 0
SkillsTime["3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["3"].BorderSizePixel = 0
SkillsTime["3"].ClipsDescendants = false
SkillsTime["3"].Draggable = false
SkillsTime["3"].Position = UDim2.new(0.9122807, 0, 0, 0)
SkillsTime["3"].Rotation = 0
SkillsTime["3"].Selectable = true
SkillsTime["3"].SelectionOrder = 0
SkillsTime["3"].Size = UDim2.new(0, 45, 0, 37)
SkillsTime["3"].Visible = true
SkillsTime["3"].ZIndex = 1
SkillsTime["3"].Parent = SkillsTime["1"]

--ScreenGui.Frame.X.LocalScript
SkillsTime["4"].Name = [[LocalScript]]
SkillsTime["4"].Parent = SkillsTime["3"]

--ScreenGui.Frame.Main Farm
SkillsTime["5"].Name = [[Main Farm]]
SkillsTime["5"].FontFace = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SkillsTime["5"].Text = [[Main Farm]]
SkillsTime["5"].TextColor3 = Color3.fromRGB(255, 255, 255)
SkillsTime["5"].TextScaled = false
SkillsTime["5"].TextSize = 14
SkillsTime["5"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["5"].TextStrokeTransparency = 1
SkillsTime["5"].TextWrapped = false
SkillsTime["5"].TextXAlignment = Enum.TextXAlignment.Center
SkillsTime["5"].TextYAlignment = Enum.TextYAlignment.Center
SkillsTime["5"].Active = false
SkillsTime["5"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["5"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["5"].BackgroundTransparency = 0
SkillsTime["5"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["5"].BorderSizePixel = 0
SkillsTime["5"].ClipsDescendants = false
SkillsTime["5"].Draggable = false
SkillsTime["5"].Position = UDim2.new(0, 0, 0.14021164, 0)
SkillsTime["5"].Rotation = 0
SkillsTime["5"].Selectable = true
SkillsTime["5"].SelectionOrder = 0
SkillsTime["5"].Size = UDim2.new(0, 142, 0, 37)
SkillsTime["5"].Visible = true
SkillsTime["5"].ZIndex = 1
SkillsTime["5"].Parent = SkillsTime["1"]

--ScreenGui.Frame.Main Farm.LocalScript
SkillsTime["6"].Name = [[LocalScript]]
SkillsTime["6"].Parent = SkillsTime["5"]

--ScreenGui.Frame.Teleport
SkillsTime["7"].Name = [[Teleport]]
SkillsTime["7"].FontFace = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SkillsTime["7"].Text = [[Teleport]]
SkillsTime["7"].TextColor3 = Color3.fromRGB(255, 255, 255)
SkillsTime["7"].TextScaled = false
SkillsTime["7"].TextSize = 14
SkillsTime["7"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["7"].TextStrokeTransparency = 1
SkillsTime["7"].TextWrapped = false
SkillsTime["7"].TextXAlignment = Enum.TextXAlignment.Center
SkillsTime["7"].TextYAlignment = Enum.TextYAlignment.Center
SkillsTime["7"].Active = true
SkillsTime["7"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["7"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["7"].BackgroundTransparency = 0
SkillsTime["7"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["7"].BorderSizePixel = 0
SkillsTime["7"].ClipsDescendants = false
SkillsTime["7"].Draggable = false
SkillsTime["7"].Position = UDim2.new(0, 0, 0.23809524, 0)
SkillsTime["7"].Rotation = 0
SkillsTime["7"].Selectable = true
SkillsTime["7"].SelectionOrder = 0
SkillsTime["7"].Size = UDim2.new(0, 142, 0, 37)
SkillsTime["7"].Visible = true
SkillsTime["7"].ZIndex = 1
SkillsTime["7"].Parent = SkillsTime["1"]

--ScreenGui.Frame.Fruits
SkillsTime["8"].Name = [[Fruits]]
SkillsTime["8"].FontFace = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SkillsTime["8"].Text = [[Fruits]]
SkillsTime["8"].TextColor3 = Color3.fromRGB(255, 255, 255)
SkillsTime["8"].TextScaled = false
SkillsTime["8"].TextSize = 14
SkillsTime["8"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["8"].TextStrokeTransparency = 1
SkillsTime["8"].TextWrapped = false
SkillsTime["8"].TextXAlignment = Enum.TextXAlignment.Center
SkillsTime["8"].TextYAlignment = Enum.TextYAlignment.Center
SkillsTime["8"].Active = true
SkillsTime["8"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["8"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["8"].BackgroundTransparency = 0
SkillsTime["8"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["8"].BorderSizePixel = 0
SkillsTime["8"].ClipsDescendants = false
SkillsTime["8"].Draggable = false
SkillsTime["8"].Position = UDim2.new(0, 0, 0.33597884, 0)
SkillsTime["8"].Rotation = 0
SkillsTime["8"].Selectable = true
SkillsTime["8"].SelectionOrder = 0
SkillsTime["8"].Size = UDim2.new(0, 142, 0, 37)
SkillsTime["8"].Visible = true
SkillsTime["8"].ZIndex = 1
SkillsTime["8"].Parent = SkillsTime["1"]

--ScreenGui.Frame.Farm Material
SkillsTime["9"].Name = [[Farm Material]]
SkillsTime["9"].FontFace = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SkillsTime["9"].Text = [[Farm Material]]
SkillsTime["9"].TextColor3 = Color3.fromRGB(255, 255, 255)
SkillsTime["9"].TextScaled = false
SkillsTime["9"].TextSize = 14
SkillsTime["9"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["9"].TextStrokeTransparency = 1
SkillsTime["9"].TextWrapped = false
SkillsTime["9"].TextXAlignment = Enum.TextXAlignment.Center
SkillsTime["9"].TextYAlignment = Enum.TextYAlignment.Center
SkillsTime["9"].Active = true
SkillsTime["9"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["9"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["9"].BackgroundTransparency = 0
SkillsTime["9"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["9"].BorderSizePixel = 0
SkillsTime["9"].ClipsDescendants = false
SkillsTime["9"].Draggable = false
SkillsTime["9"].Position = UDim2.new(0, 0, 0.45238096, 0)
SkillsTime["9"].Rotation = 0
SkillsTime["9"].Selectable = true
SkillsTime["9"].SelectionOrder = 0
SkillsTime["9"].Size = UDim2.new(0, 142, 0, 37)
SkillsTime["9"].Visible = true
SkillsTime["9"].ZIndex = 1
SkillsTime["9"].Parent = SkillsTime["1"]

--ScreenGui.Frame.Pvp Settings
SkillsTime["10"].Name = [[Pvp Settings]]
SkillsTime["10"].FontFace = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SkillsTime["10"].Text = [[Pvp Settings]]
SkillsTime["10"].TextColor3 = Color3.fromRGB(255, 255, 255)
SkillsTime["10"].TextScaled = false
SkillsTime["10"].TextSize = 14
SkillsTime["10"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["10"].TextStrokeTransparency = 1
SkillsTime["10"].TextWrapped = false
SkillsTime["10"].TextXAlignment = Enum.TextXAlignment.Center
SkillsTime["10"].TextYAlignment = Enum.TextYAlignment.Center
SkillsTime["10"].Active = true
SkillsTime["10"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["10"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["10"].BackgroundTransparency = 0
SkillsTime["10"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["10"].BorderSizePixel = 0
SkillsTime["10"].ClipsDescendants = false
SkillsTime["10"].Draggable = false
SkillsTime["10"].Position = UDim2.new(0, 0, 0.55026454, 0)
SkillsTime["10"].Rotation = 0
SkillsTime["10"].Selectable = true
SkillsTime["10"].SelectionOrder = 0
SkillsTime["10"].Size = UDim2.new(0, 142, 0, 37)
SkillsTime["10"].Visible = true
SkillsTime["10"].ZIndex = 1
SkillsTime["10"].Parent = SkillsTime["1"]

--ScreenGui.Frame.Esp
SkillsTime["11"].Name = [[Esp]]
SkillsTime["11"].FontFace = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SkillsTime["11"].Text = [[Esp]]
SkillsTime["11"].TextColor3 = Color3.fromRGB(255, 255, 255)
SkillsTime["11"].TextScaled = false
SkillsTime["11"].TextSize = 14
SkillsTime["11"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["11"].TextStrokeTransparency = 1
SkillsTime["11"].TextWrapped = false
SkillsTime["11"].TextXAlignment = Enum.TextXAlignment.Center
SkillsTime["11"].TextYAlignment = Enum.TextYAlignment.Center
SkillsTime["11"].Active = true
SkillsTime["11"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["11"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["11"].BackgroundTransparency = 0
SkillsTime["11"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["11"].BorderSizePixel = 0
SkillsTime["11"].ClipsDescendants = false
SkillsTime["11"].Draggable = false
SkillsTime["11"].Position = UDim2.new(0, 0, 0.6481481, 0)
SkillsTime["11"].Rotation = 0
SkillsTime["11"].Selectable = true
SkillsTime["11"].SelectionOrder = 0
SkillsTime["11"].Size = UDim2.new(0, 142, 0, 37)
SkillsTime["11"].Visible = true
SkillsTime["11"].ZIndex = 1
SkillsTime["11"].Parent = SkillsTime["1"]

--ScreenGui.Frame.Hop
SkillsTime["12"].Name = [[Hop]]
SkillsTime["12"].FontFace = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SkillsTime["12"].Text = [[Hop]]
SkillsTime["12"].TextColor3 = Color3.fromRGB(255, 255, 255)
SkillsTime["12"].TextScaled = false
SkillsTime["12"].TextSize = 14
SkillsTime["12"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["12"].TextStrokeTransparency = 1
SkillsTime["12"].TextWrapped = false
SkillsTime["12"].TextXAlignment = Enum.TextXAlignment.Center
SkillsTime["12"].TextYAlignment = Enum.TextYAlignment.Center
SkillsTime["12"].Active = true
SkillsTime["12"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["12"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["12"].BackgroundTransparency = 0
SkillsTime["12"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["12"].BorderSizePixel = 0
SkillsTime["12"].ClipsDescendants = false
SkillsTime["12"].Draggable = false
SkillsTime["12"].Position = UDim2.new(0, 0, 0.74603176, 0)
SkillsTime["12"].Rotation = 0
SkillsTime["12"].Selectable = true
SkillsTime["12"].SelectionOrder = 0
SkillsTime["12"].Size = UDim2.new(0, 142, 0, 37)
SkillsTime["12"].Visible = true
SkillsTime["12"].ZIndex = 1
SkillsTime["12"].Parent = SkillsTime["1"]

--ScreenGui.Frame.Sea Event
SkillsTime["13"].Name = [[Sea Event]]
SkillsTime["13"].FontFace = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
SkillsTime["13"].Text = [[Sea Event]]
SkillsTime["13"].TextColor3 = Color3.fromRGB(255, 255, 255)
SkillsTime["13"].TextScaled = false
SkillsTime["13"].TextSize = 14
SkillsTime["13"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["13"].TextStrokeTransparency = 1
SkillsTime["13"].TextWrapped = false
SkillsTime["13"].TextXAlignment = Enum.TextXAlignment.Center
SkillsTime["13"].TextYAlignment = Enum.TextYAlignment.Center
SkillsTime["13"].Active = true
SkillsTime["13"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["13"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["13"].BackgroundTransparency = 0
SkillsTime["13"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["13"].BorderSizePixel = 0
SkillsTime["13"].ClipsDescendants = false
SkillsTime["13"].Draggable = false
SkillsTime["13"].Position = UDim2.new(0, 0, 0.84391534, 0)
SkillsTime["13"].Rotation = 0
SkillsTime["13"].Selectable = true
SkillsTime["13"].SelectionOrder = 0
SkillsTime["13"].Size = UDim2.new(0, 142, 0, 37)
SkillsTime["13"].Visible = true
SkillsTime["13"].ZIndex = 1
SkillsTime["13"].Parent = SkillsTime["1"]

--ScreenGui.Frame.-
SkillsTime["14"].Name = [[-]]
SkillsTime["14"].FontFace = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
SkillsTime["14"].Text = [[-]]
SkillsTime["14"].TextColor3 = Color3.fromRGB(255, 255, 255)
SkillsTime["14"].TextScaled = false
SkillsTime["14"].TextSize = 14
SkillsTime["14"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["14"].TextStrokeTransparency = 1
SkillsTime["14"].TextWrapped = false
SkillsTime["14"].TextXAlignment = Enum.TextXAlignment.Center
SkillsTime["14"].TextYAlignment = Enum.TextYAlignment.Center
SkillsTime["14"].Active = true
SkillsTime["14"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["14"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["14"].BackgroundTransparency = 0
SkillsTime["14"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["14"].BorderSizePixel = 0
SkillsTime["14"].ClipsDescendants = false
SkillsTime["14"].Draggable = false
SkillsTime["14"].Position = UDim2.new(0.82351166, 0, -0.00034005303, 0)
SkillsTime["14"].Rotation = 0
SkillsTime["14"].Selectable = true
SkillsTime["14"].SelectionOrder = 0
SkillsTime["14"].Size = UDim2.new(0, 45, 0, 37)
SkillsTime["14"].Visible = true
SkillsTime["14"].ZIndex = 1
SkillsTime["14"].Parent = SkillsTime["1"]

--ScreenGui.Frame.ScrollingFrame
SkillsTime["15"].Name = [[ScrollingFrame]]
SkillsTime["15"].BottomImage = [[rbxasset://textures/ui/Scroll/scroll-bottom.png]]
SkillsTime["15"].CanvasSize = UDim2.new(0, 0, 2, 0)
SkillsTime["15"].HorizontalScrollBarInset = Enum.ScrollBarInset.None
SkillsTime["15"].ScrollBarThickness = 12
SkillsTime["15"].TopImage = [[rbxasset://textures/ui/Scroll/scroll-top.png]]
SkillsTime["15"].Active = true
SkillsTime["15"].AnchorPoint = Vector2.new(0, 0)
SkillsTime["15"].BackgroundColor3 = Color3.fromRGB(56, 56, 56)
SkillsTime["15"].BackgroundTransparency = 0
SkillsTime["15"].BorderColor3 = Color3.fromRGB(0, 0, 0)
SkillsTime["15"].BorderSizePixel = 0
SkillsTime["15"].ClipsDescendants = true
SkillsTime["15"].Draggable = false
SkillsTime["15"].Position = UDim2.new(0.2768031, 0, 0.09127, 0)
SkillsTime["15"].Rotation = 0
SkillsTime["15"].Selectable = true
SkillsTime["15"].SelectionOrder = 0
SkillsTime["15"].Size = UDim2.new(0, 371, 0, 336)
SkillsTime["15"].Visible = false
SkillsTime["15"].ZIndex = 1
SkillsTime["15"].Parent = SkillsTime["1"]

--ScreenGui.Frame.LocalScript
SkillsTime["16"].Name = [[LocalScript]]
SkillsTime["16"].Parent = SkillsTime["1"]

--[[
    Scripts
--]]
--ScreenGui.Frame.X.LocalScript
local function C_SkillsTime_4()
local script = SkillsTime["4"]
local button = script.Parent
local frame = button.Parent

button.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

end
task.spawn(C_SkillsTime_4)


--ScreenGui.Frame.Main Farm.LocalScript
local function C_SkillsTime_6()
local script = SkillsTime["6"]
local button = script.Parent
local frame = button.Parent:WaitForChild("ScrollingFrame")

button.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)

end
task.spawn(C_SkillsTime_6)


--ScreenGui.Frame.LocalScript
local function C_SkillsTime_16()
local script = SkillsTime["16"]
ocal frame = script.Parent

frame.Active = true
frame.Draggable = true

end
task.spawn(C_SkillsTime_16)



return SkillsTime["0"], require;
end)
