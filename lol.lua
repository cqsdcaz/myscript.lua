

for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
	v:Disable()
end
local tools = {}

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	if v:IsA("Tool") then
		table.insert(tools, v.Name)
	end
end

---autofarm Level
---lv 0-10
function CheckQuest()
	local Lv = game.Players.LocalPlayer.Data.Level.Value
	 if Lv == 0 or Lv <= 10 then
	 Ms = "Bandit [Lv. 5]"
	 NM = "Bandit"
	 LQ = 1
	 NQ = "BanditQuest1"
	 CQ = CFrame.new(1062.64697265625, 16.516624450683594, 1546.55224609375)
	 end
 end
 function TP(P)
	 Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	 if Distance < 10 then
		 Speed = 1000
	 elseif Distance < 170 then
		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
		 Speed = 350
	 elseif Distance < 1000 then
		 Speed = 350
	 elseif Distance >= 1000 then
		 Speed = 300
	 end
	 game:GetService("TweenService"):Create(
		 game.Players.LocalPlayer.Character.HumanoidRootPart,
		 TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
		 {CFrame = P}
	 ):Play()
 end
 
 spawn(function()
	while task.wait() do
		if _G.AutoFarm then
			CheckQuest()
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				 TP(CQ)
				 task.wait(0.9)
				 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQ,LQ)
				 elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					 for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						 if v.Name == Ms then
						 TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
						 v.HumanoidRootPart.Size = Vector3.new(60,60,60)
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
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
end)





local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
        local Window = Library.CreateLib("BloxFruits Script Test", "Ocean")
      
      ---Main
        local Main = Window:NewTab("Main")
        local MainSection = Main:NewSection("Main")


        local toolDropdown = MainSection:NewDropdown("Weapon", "Choose your tool to use!", tools, function(weapon)
        end)
        
game.Players.LocalPlayer.Backpack.DescendantAdded:Connect(function(tool)
	local toolName = tool.Name
	if tool:IsA("Tool") then
		table.insert(tools, toolName)
		toolDropdown:Refresh(tools)
	end
end)
game.Players.LocalPlayer.Backpack.DescendantRemoving:Connect(function(tool)
	local toolName = tool.Name
	if tool:IsA("Tool") then
		for i,v in pairs(tools) do
			if v == toolName then
				table.remove(tools, i)
			end
		end	
	end
	toolDropdown:Refresh(tools)
end)

        MainSection:NewToggle("AutoFarm", "AutoFarm Test", function(state)
            if state then
                _G.AutoFarm = true
            else
                _G.AutoFarm = false
            end
        end)
        

        
        local FakeBeliTextBox MainSection:NewTextBox("Fake Beli", "Fake Beli", function(fakebeli)
            game.Players.LocalPlayer.Data.Level.Value = fakebeli
        end)
        

        ---Stats
        local Stats = Window:NewTab("Stats")
        local StatsSection = Stats:NewSection("Stats")

        StatsSection:NewToggle("Meele", "Auto Stats", function(state)
            if state then
                _G.autoMeeleStats = true
                while _G.autoMeeleStats == true do
local args = {
    [1] = "AddPoint",
    [2] = "Melee",
    [3] = 1
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    task.wait(30)
                end
            else
                print("Toggle Off")
            end
        end)

        StatsSection:NewToggle("Defense", "Auto Stats", function(state)
            if state then
                _G.autoDefenseStats = true
                while _G.autoDefenseStats == true do
local args = {
    [1] = "AddPoint",
    [2] = "Defense",
    [3] = 1
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    task.wait(30)
                end
            else
                print("Toggle Off")
            end
        end)

        StatsSection:NewToggle("Sword", "Auto Stats", function(state)
            if state then
                _G.autoSword = true
                while _G.autoSword == true do
local args = {
    [1] = "AddPoint",
    [2] = "Sword",
    [3] = 1
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    task.wait(30)
                end
            else
                print("Toggle Off")
            end
        end)

        StatsSection:NewToggle("Gun", "Auto Stats", function(state)
            if state then
                _G.autoGun = true
                while _G.autoGun == true do
local args = {
    [1] = "AddPoint",
    [2] = "Gun",
    [3] = 1
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    task.wait(30)
                end
            else
                print("Toggle Off")
            end
        end)

        StatsSection:NewToggle("Devil Fruit", "Auto Stats", function(state)
            if state then
                _G.autoDevilFruit = true
                while _G.autoDevilFruit == true do
local args = {
    [1] = "AddPoint",
    [2] = "Demon Fruit",
    [3] = 1
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    task.wait(30)
                end
            else
                print("Toggle Off")
            end
        end)

        ---Teleport
        local Teleport = Window:NewTab("Teleport")
        local TeleportSection = Teleport:NewSection("Teleport")

        TeleportSection:NewButton("Pirate Island", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(1041.8861083984375, 16.273563385009766, 1424.93701171875)}):Play()
        end)

        TeleportSection:NewButton("Marine Island", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-2896.6865234375, 41.488861083984375, 2009.27490234375)}):Play()
        end)

        TeleportSection:NewButton("Colosseum", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-1541.0882568359375, 7.389348983764648, -2987.40576171875)}):Play()
        end)

        TeleportSection:NewButton("Desert", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(1094.3209228515625, 6.569626808166504, 4231.6357421875)}):Play()
        end)
        TeleportSection:NewButton("Fouatin City ", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(5529.7236328125, 429.35748291015625, 4245.5498046875)}):Play()
        end)
        TeleportSection:NewButton("Jungle", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-1615.1883544921875, 36.85209655761719, 150.80490112304688)}):Play()
        end)
        TeleportSection:NewButton("Marine Fort", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-4846.14990234375, 20.652048110961914, 4393.65087890625)}):Play()
        end)
        TeleportSection:NewButton("Middle Town", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-705.99755859375, 7.852255344390869, 1547.5216064453125)}):Play()
        end)
        TeleportSection:NewButton("Prison", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(4841.84423828125, 5.651970863342285, 741.329833984375)}):Play()
        end)
        TeleportSection:NewButton("Pirate Village", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-1146.42919921875, 4.752060890197754, 3818.503173828125)}):Play()
        end)
        TeleportSection:NewButton("Sky 1", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
            tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-4967.8369140625, 717.6719970703125, -2623.84326171875)}):Play()
        end)
        TeleportSection:NewButton("Sky 2", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-7876.0771484375, 5545.58154296875, -381.19927978515625)}):Play()
        end)
        TeleportSection:NewButton("Snow", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(1100.361328125, 5.290674209594727, -1151.5418701171875)}):Play()
        end)
        TeleportSection:NewButton("Under Water", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(61135.29296875, 18.47164535522461, 1597.6827392578125)}):Play()
        end)
        TeleportSection:NewButton("Magma Village", "Teleport you there", function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(45, Enum.EasingStyle.Linear)
            tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-5248.27197265625, 8.699088096618652, 8452.890625)}):Play()
        end)
