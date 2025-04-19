-- Load OrionLib (if you already have it loaded, skip this part)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- UI Window
local Window = OrionLib:MakeWindow({Name = "Blox Fruits Teleport GUI", HidePremium = false, SaveConfig = true, ConfigFolder = "BF_TP"})

-- Tabs
local TeleTab = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- TP2 Function
function TP2(cf)
    local plr = game.Players.LocalPlayer
    if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        plr.Character.HumanoidRootPart.CFrame = cf
    end
end

-- Sea Check
local PlaceId = game.PlaceId
local NewWorld = false
local ThreeWorld = false
if PlaceId == 4442272183 then
    NewWorld = true
elseif PlaceId == 7449423635 then
    ThreeWorld = true
end

-- Island Options
local FirstSeaIslands = {
    "Windmill Village", "Marine", "Middle Town", "Jungle", "Pirate Village",
    "Desert", "Snow Island", "Frozen Village", "Colosseum", "Prison",
    "Magma Village", "Underwater City", "Fountain City", "Sky Island"
}

local SecondSeaIslands = {
    "The Cafe", "Frontal Island", "Kingdom of Rose", "Green Zone", "Dark Arena",
    "Usoap Island", "Ice Castle", "Hot and Cold", "Cursed Ship", "Forgotten Island", "Snow Mountain"
}

local ThirdSeaIslands = {
    "Port Town", "Hydra Island", "Great Tree", "Floating Turtle",
    "Castle on the Sea", "Haunted Castle", "Sea of Treats"
}

-- Set Dropdown Options
local islandOptions = {}
if ThreeWorld then
    islandOptions = ThirdSeaIslands
elseif NewWorld then
    islandOptions = SecondSeaIslands
else
    islandOptions = FirstSeaIslands
end

-- Global Island Storage
_G.SelectIsland = ""

-- Dropdown UI
TeleTab:AddDropdown({
    Name = "Select Island",
    Default = "",
    Options = islandOptions,
    Callback = function(value)
        _G.SelectIsland = value
    end
})

-- Teleport Button
TeleTab:AddButton({
    Name = "Teleport!",
    Callback = function()
        local island = _G.SelectIsland
        if not island or island == "" then
            warn("Please select an island.")
            return
        end

        local locations = {
            -- First Sea
            ["Windmill Village"] = CFrame.new(116.9, 18.5, 1414.7),
            ["Marine"] = CFrame.new(-2705.3, 21.7, 2056.7),
            ["Middle Town"] = CFrame.new(484.2, 16.3, 1436.1),
            ["Jungle"] = CFrame.new(-1253.4, 11.3, 340.1),
            ["Pirate Village"] = CFrame.new(-1122.9, 5.7, 3856.6),
            ["Desert"] = CFrame.new(931.8, 6.5, 4488.3),
            ["Snow Island"] = CFrame.new(1420.5, 24.8, -1500.4),
            ["Frozen Village"] = CFrame.new(1145.4, 27.0, -1322.1),
            ["Colosseum"] = CFrame.new(-1866.2, 10.7, 1353.7),
            ["Prison"] = CFrame.new(4986.3, 5.1, 3152.8),
            ["Magma Village"] = CFrame.new(-5200.1, 6.4, 8500.2),
            ["Underwater City"] = CFrame.new(3870.2, 5.4, -1870.6),
            ["Fountain City"] = CFrame.new(5235.2, 38.4, 4050.3),
            ["Sky Island"] = CFrame.new(-4934.2, 716.3, -2622.4),

            -- Second Sea
            ["The Cafe"] = CFrame.new(-385.3, 73.2, 295.8),
            ["Frontal Island"] = CFrame.new(-2815.3, 75.2, 1470.1),
            ["Kingdom of Rose"] = CFrame.new(1080.6, 123.9, 1272.4),
            ["Green Zone"] = CFrame.new(-2250.7, 90.3, -2501.6),
            ["Dark Arena"] = CFrame.new(-3770.4, 65.2, -3025.7),
            ["Usoap Island"] = CFrame.new(-4600.1, 65.2, 420.3),
            ["Ice Castle"] = CFrame.new(-5550.1, 100.3, -690.5),
            ["Hot and Cold"] = CFrame.new(-6100.2, 15.4, -1510.1),
            ["Cursed Ship"] = CFrame.new(-6200.1, 15.4, -2450.4),
            ["Forgotten Island"] = CFrame.new(3450.3, 45.4, -4600.4),
            ["Snow Mountain"] = CFrame.new(1500.2, 90.3, -5300.1),

            -- Third Sea
            ["Port Town"] = CFrame.new(-284.4, 43.9, 5456.8),
            ["Hydra Island"] = CFrame.new(5549.3, 84.9, -650.6),
            ["Great Tree"] = CFrame.new(2250.4, 30.1, -6400.2),
            ["Floating Turtle"] = CFrame.new(-11000.1, 350.2, -900.1),
            ["Castle on the Sea"] = CFrame.new(-5350.3, 314.9, -2900.7),
            ["Haunted Castle"] = CFrame.new(-9500.4, 140.1, 6200.1),
            ["Sea of Treats"] = CFrame.new(-12000.3, 50.2, -11000.5)
        }

        local cf = locations[island]
        if cf then
            TP2(cf)
        else
            warn("Unknown island: " .. tostring(island))
        end
    end
})
