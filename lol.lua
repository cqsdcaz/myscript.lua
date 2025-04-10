-- Anti-AFK
for i, v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

-- Tool list
local tools = {}

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(tools, v.Name)
    end
end

-- AutoFarm Variables
local Ms, NM, LQ, NQ, CQ

function CheckQuest()
    local Lv = game.Players.LocalPlayer.Data.Level.Value
    if Lv == 0 or Lv <= 10 then
        Ms = "Bandit [Lv. 5]"
        NM = "Bandit"
        LQ = 1
        NQ = "BanditQuest1"
        CQ = CFrame.new(1062.647, 16.517, 1546.552)
    end
end

function TP(P)
    local Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed = 300

    if Distance < 10 then
        Speed = 1000
    elseif Distance < 170 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
        Speed = 350
    elseif Distance < 1000 then
        Speed = 350
    end

    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
        {CFrame = P}
    ):Play()
end

spawn(function()
    while task.wait() do
        if _G.AutoFarm then
            CheckQuest()
            if not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
                TP(CQ)
                task.wait(0.9)
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NQ, LQ)
            else
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == Ms then
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    end
                end
            end
        end
    end
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoFarm then
            pcall(function()
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 1, 0, 1))
            end)
        end
    end)
end)

-- UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("BloxFruits Script Test", "Ocean")

-- Main Tab
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")

local toolDropdown = MainSection:NewDropdown("Weapon", "Choose your tool to use!", tools, function(weapon)
    -- You can use the selected weapon variable here if needed
end)

-- Auto update tool list
game.Players.LocalPlayer.Backpack.DescendantAdded:Connect(function(tool)
    if tool:IsA("Tool") then
        table.insert(tools, tool.Name)
        toolDropdown:Refresh(tools)
    end
end)

game.Players.LocalPlayer.Backpack.DescendantRemoving:Connect(function(tool)
    if tool:IsA("Tool") then
        for i, v in pairs(tools) do
            if v == tool.Name then
                table.remove(tools, i)
                break
            end
        end
        toolDropdown:Refresh(tools)
    end
end)

MainSection:NewToggle("AutoFarm", "AutoFarm Test", function(state)
    _G.AutoFarm = state
end)

MainSection:NewTextBox("Fake Level", "Sets fake level value", function(fakeLevel)
    game.Players.LocalPlayer.Data.Level.Value = tonumber(fakeLevel)
end)

-- Stats Tab
local Stats = Window:NewTab("Stats")
local StatsSection = Stats:NewSection("Stats")

StatsSection:NewToggle("Melee", "Auto Stats", function(state)
    _G.autoMeeleStats = state
    while _G.autoMeeleStats do
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
        task.wait(30)
    end
end)

StatsSection:NewToggle("Defense", "Auto Stats", function(state)
    _G.autoDefenseStats = state
    while _G.autoDefenseStats do
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Defense", 1)
        task.wait(30)
    end
end)

StatsSection:NewToggle("Sword", "Auto Stats", function(state)
    _G.autoSword = state
    while _G.autoSword do
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Sword", 1)
        task.wait(30)
    end
end)

StatsSection:NewToggle("Gun", "Auto Stats", function(state)
    _G.autoGun = state
    while _G.autoGun do
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Gun", 1)
        task.wait(30)
    end
end)

StatsSection:NewToggle("Devil Fruit", "Auto Stats", function(state)
    _G.autoDevilFruit = state
    while _G.autoDevilFruit do
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", 1)
        task.wait(30)
    end
end)

-- Teleport Tab
local Teleport = Window:NewTab("Teleport")
local TeleportSection = Teleport:NewSection("Teleport")

local function createTeleportButton(name, pos)
    TeleportSection:NewButton(name, "Teleport you there", function()
        local tweenService = game:GetService("TweenService")
        local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Linear)
        tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, {CFrame = pos}):Play()
    end)
end

createTeleportButton("Pirate Island", CFrame.new(1041.886, 16.273, 1424.937))
createTeleportButton("Marine Island", CFrame.new(-2896.686, 41.489, 2009.275))
createTeleportButton("Colosseum", CFrame.new(-1541.088, 7.389, -2987.406))
createTeleportButton("Desert", CFrame.new(1094.321, 6.570, 4231.636))
createTeleportButton("Fountain City", CFrame.new(5529.724, 429.357, 4245.550))
createTeleportButton("Jungle", CFrame.new(-1615.188, 36.852, 150.805))
createTeleportButton("Marine Fort", CFrame.new(-4846.150, 20.652, 4393.651))
createTeleportButton("Middle Town", CFrame.new(-705.998, 7.852, 1547.169)) -- Adjusted last coord
