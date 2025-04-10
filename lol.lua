repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui
repeat wait() until game:GetService("ReplicatedStorage").Effect.Container

if not game:IsLoaded() then
	local GameLoadGui = Instance.new("Message",workspace);
	GameLoadGui.Text = 'Wait Game Loading';
	game.Loaded:Wait();
	GameLoadGui:Destroy();
	task.wait(10);
end;


_G.Team = "Marine"
_G.Settings = {
  Main = {
    ["Auto Farm Level"] = false,
    ["Fast Auto Farm Level"] = false,
    ["Auto Farm Bone"] = false,
    ["Auto Ectoplasm"] = false,

--[Near Farm]
    ["Near Farm"] = false,

--[World 1]
    ["Auto New World"] = false,
    ["Auto Saber"] = false,
    ["Auto Pole"] = false,
    ["Auto Buy Ablility"] = false,

--[World 2]
    ["Auto Third Sea"] = false,
    ["Auto Factory"] = false,
    ["Auto Factory Hop"] = false,
    ["Auto Bartilo Quest"] = false,

    ["Auto True Triple Katana"] = false,
    ["Auto Rengoku"] = false,
    ["Auto Swan Glasses"] = false,
    ["Auto Dark Coat"] = false,

    ["Auto Buy Legendary Sword"] = false,
    ["Auto Buy Enchanment Haki"] = false,

--[World 3]
    ["Auto Holy Torch"] = false,
    ["Auto Buddy Swords"] = false,
    ["Auto Farm Boss Hallow"] = false,
    ["Auto Rainbow Haki"] = false,
    ["Auto Elite Hunter"] = false,
    ["Auto Musketeer Hat"] = false,
    ["Auto Buddy Sword"] = false,
    ["Auto Ken-Haki V2"] = false,
    ["Auto Cavander"] = false,
    ["Auto Yama Sword"] = false,
    ["Auto Tushita Sword"] = false,
    ["Auto Serpent Bow"] = false,
    ["Auto Dark Dagger"] = false,
    ["Auto Cake Prince"] = false,
    ["Auto Dough V2"] = false,
    ["Auto Random Bone"] = false,

--[For God Human]

    ["Auto Fish Tail Sea 1"] = false,
    ["Auto Fish Tail Sea 3"] = false,
    ["Auto Magma Ore Sea 2"] = false,
    ["Auto Magma Ore Sea 1"] = false,
    ["Auto Mystic Droplet"] = false,
    ["Auto Dragon Scales"] = false,

  },
  FightingStyle = {
    ["Auto God Human"] = false,
    ["Auto Superhuman"] = false,
    ["Auto Electric Claw"] = false,
    ["Auto Death Step"] = false,
    ["Auto Fully Death Step"] = false,
    ["Auto SharkMan Karate"] = false,
    ["Auto Fully SharkMan Karate"] = false,
    ["Auto Dragon Talon"] = false,
  },
  Boss = {
    ["Auto All Boss"] = false,
    ["Auto Boss Select"] = false,
    ["Select Boss"] = {},
    ["Auto Quest"] = false,
  },
  Mastery = {
    ["Select Multi Sword"] = {},
    ["Farm Mastery SwordList"] = false,
    ["Auto Farm Fruit Mastery"] = false,
    ["Auto Farm Gun Mastery"] = false,
    ["Mob Health (%)"] = 15,
  },
  Configs = {
    ["Double Quest"] = false,
    ["Bypass TP"] = false,
    ["Select Team"] = {
      "Pirate"
    }, --{Pirate,Marine}


    ["Fast Attack"] = true,
    ["Select Weapon"] = {
      "Sword"
    },


--[Misc Configs]
    ["Auto Haki"] = true,
    ["Distance Auto Farm"] = 30, --{Max : 50}
    ["Camera Shaker"] = false,

--[Skill Configs]
    ["Skill Z"] = true,
    ["Skill X"] = true,
    ["Skill C"] = true,
    ["Skill V"] = true,

--[Mob Configs]
    ["Show Hitbox"] = false,
    ["Bring Mob"] = true,
    ["Disabled Damage"] = false,

  },
  Stat = {
--[Auto Stats]
    ["Enabled Auto Stats"] = false,
    ["Auto Stats Kaitun"] = false,

    ["Select Stats"] = {
      "Melee"
    }, --{Max Stats,Melee,Defense,Sword,Devil Fruit,Gun}
    ["Point Select"] = 3, --{Recommended , Max : 9}

--[Auto Redeem Code]

    ["Enabled Auto Redeem Code"] = false,
    ["Select Level Redeem Code"] = 1, --{Max : 2400}
  },

  Misc = {
    ["No Soru Cooldown"] = false,
    ["No Dash Cooldown"] = false,

    ["Infinities Geppo"] = false,
    ["Infinities Energy"] = false,

    ["No Fog"] = false,
    ["Wall-TP"] = false,

    ["Fly"] = false,
    ["Fly Speed"] = 1,

--[Server]
    ["Auto Rejoin"] = true,
  },
  Teleport = {
    ["Teleport to Sea Beast"] = false,
  },

  Raids = {
    ["Auto Raids"] = false,

    ["Kill Aura"] = false,
    ["Auto Awakened"] = false,
    ["Auto Next Place"] = false,

    ["Select Raids"] = {}, -- {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"},
  },

  Combat = {
    ["Fov Size"] = 200,
    ["Show Fov"] = false,
    ["Aimbot Skill"] = false,
  },

  HUD = {
    ["FPS"] = 60,
    ["LockFPS"] = true,
    ["Boost FPS Windows"] = false,
    ['White Screen'] = false,
  }
}

_G.ShowItem = {
  ["Check Swords"] = {
    ["Enabled Check"] = true,
  },
  ["Check Fighting Style"] = {
    ["Enabled Check"] = true,
  },
  ["Check Awakening Fruits"] = {
    ["Enabled Check"] = true,
  },
  ["Check Fruits"] = {
    ["Enabled Check"] = true,
  },
}

function LoadSettings()
if readfile and writefile and isfile and isfolder then
if not isfolder("ZenSave") then
makefolder("ZenSave")
end
if not isfolder("ZenSave/Blox Fruits/") then
makefolder("ZenSave/Blox Fruits/")
end
if not isfile("ZenSave/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json") then
writefile("ZenSave/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(_G.Settings))
else
  local Decode = game:GetService("HttpService"):JSONDecode(readfile("ZenSave/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"))
for i,v in pairs(Decode) do
_G.Settings[i] = v
end
end
else
  return warn("Status : Undetected Executor")
end
end

function SaveSettings()
if readfile and writefile and isfile and isfolder then
if not isfile("ZenSave/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json") then
LoadSettings()
else
  local Decode = game:GetService("HttpService"):JSONDecode(readfile("ZenSave/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"))
local Array = {}
for i,v in pairs(_G.Settings) do
Array[i] = v
end
writefile("ZenSave/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(Array))
end
else
  return warn("Status : Undetected Executor")
end
end

LoadSettings()

if not game:IsLoaded() then
	local Loaded = Instance.new("Message",workspace)
	Loaded.Text = 'Wait Game Loading'
	game.Loaded:Wait()
	Loaded:Destroy()
	task.wait(10)
end

repeat
pcall(
  function()
  task.wait()
  if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
  if _G.Team == "Pirate" then
  for r, v in pairs(
    getconnections(
      game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated
    )
  ) do
  v.Function()
  end
  elseif _G.Team == "Marine" then
  for r, v in pairs(
    getconnections(
      game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated
    )
  ) do
  v.Function()
  end
  else
    for r, v in pairs(
    getconnections(
      game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated
    )
  ) do
  v.Function()
  end
  end
  end
  end)
until game.Players.LocalPlayer.Team ~= nil

-- [Place Id Check]
local id = game.PlaceId
if id == 2753915549 then World1 = true; elseif id == 4442272183 then World2 = true; elseif id == 7449423635 then World3 = true; else game:Shutdown() end;

-- [Anti AFK]

game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- [Functions Equip Weapon]
function EquipWeapon(Tool)
	pcall(function()
		if game.Players.LocalPlayer.Backpack:FindFirstChild(Tool) then 
			local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(Tool) 
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
		end
	end)
end

function EquipWeaponSword()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Sword" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end

spawn(function()
	pcall(function()
		game:GetService("RunService").Stepped:Connect(function()
 --[World 1]
      if _G.Settings.Main["Auto Farm Level"] or _G.Settings.Main["Auto New World"] or
      _G.Settings.Main["Auto Saber"] or _G.Settings.Main["Auto Pople"] or
--[World 2]
      _G.Settings.Main["Auto Third Sea"] or _G.Settings.Main["Auto Bartilo Quest"] or _G.Settings.Main["Auto Dark Coat"] or _G.Settings.Main["Auto Swan Glasses"] or
      _G.Settings.Main["Auto True Triple Katana"] or _G.Settings.Main["Auto Rengoku"] or _G.Settings.Main["Auto Ectoplasm"] or _G.Settings.FightingStyle["Auto Fully Death Step"] or
      _G.Settings.FightingStyle["Auto Fully SharkMan Karate"] or
--[World 3]
      _G.Settings.Main["Auto Rainbow Haki"] or _G.Settings.Main["Auto Elite Hunter"] or _G.Settings.Main["Auto Musketeer Hat"] or _G.Settings.Main["Auto Buddy Sword"] or
      _G.Settings.Main["Auto Farm Bone"] or _G.Settings.Main["Auto Ken-Haki V2"] or _G.Settings.FightingStyle["Auto God Human"] or _G.Settings.Main["Auto Cavander"] or
      _G.Settings.Main["Auto Cursed Dual Katana"] or _G.Settings.Main["Auto Yama Sword"] or _G.Settings.Main["Auto Tushita Sword"] or _G.Settings.Main["Auto Serpent Bow"] or
      _G.Settings.Main["Auto Dark Dagger"] or _G.Settings.Main["Auto Cake Prince"] or _G.Settings.Main["Auto Dough V2"] or _G.Settings.Main["Auto Holy Torch"] or
      _G.Settings.Main["Auto Buddy Swords"] or _G.Settings.Main["Auto Farm Boss Hallow"] or _G.Settings.Main["Near Farm"] or _G.Settings.Main["Auto Material Soul Guitar"] or _G.Settings.Main["Auto Quest Soul Guitar"] or YamaQuest2 or YamaQuest1 or Auto_Cursed_Dual_Katana or
      Tushita_Quest2 or Tushita_Quest1 or AutoFarmMaterial or teleporttop or AutoFarmChest or _G.AutoPirateRaid or
--[For God Human]
--_G.Settings.Main["Auto Fish Tail Sea 1"] or _G.Settings.Main["Auto Fish Tail Sea 3"] or _G.Settings.Main["Auto Magma Ore Sea 2"] or
--_G.Settings.Main["Auto Magma Ore Sea 1"] or _G.Settings.Main["Auto Mystic Droplet"] or _G.Settings.Main["Auto Dragon Scales"] or
--[Boss]
      _G.Settings.Boss["Auto All Boss"] or _G.Settings.Boss["Auto Boss Select"] or
--[Mastery]
      _G.Settings.Mastery["Auto Farm Fruit Mastery"] or _G.Settings.Mastery["Auto Farm Gun Mastery"] or _G.Settings.Mastery["Farm Mastery SwordList"] or
--[Teleport]
      _G.Settings.Teleport["Teleport to Sea Beast"] or
--[Raids]
      _G.Settings.Raids["Auto Raids"] or _G.Settings.Raids["Auto Next Place"] or _G.AutoQuestRace or _G.Mirrage or _G.TeleportRace or _G.TweenMGear or _G.GrabChestMirrage or _G.SelectIslandRace or _G.TeleportIsland or _G.TeleportNPC
      then
			 	if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					local Noclip = Instance.new("BodyVelocity")
					Noclip.Name = "BodyClip"
					Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
					Noclip.MaxForce = Vector3.new(100000,100000,100000)
					Noclip.Velocity = Vector3.new(0,0,0)
			 	end
		  	else	
			 	if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
			 	end
		  	end
		end)
	end)
end)
 
spawn(function()
	pcall(function()
		game:GetService("RunService").Stepped:Connect(function()
--[World 1]
      if _G.Settings.Main["Auto Farm Level"] or _G.Settings.Main["Auto New World"] or
      _G.Settings.Main["Auto Saber"] or _G.Settings.Main["Auto Pople"] or
--[World 2]
      _G.Settings.Main["Auto Third Sea"] or _G.Settings.Main["Auto Bartilo Quest"] or _G.Settings.Main["Auto Dark Coat"] or _G.Settings.Main["Auto Swan Glasses"] or
      _G.Settings.Main["Auto True Triple Katana"] or _G.Settings.Main["Auto Rengoku"] or _G.Settings.Main["Auto Ectoplasm"] or _G.Settings.FightingStyle["Auto Fully Death Step"] or
      _G.Settings.FightingStyle["Auto Fully SharkMan Karate"] or
--[World 3]
      _G.Settings.Main["Auto Rainbow Haki"] or _G.Settings.Main["Auto Elite Hunter"] or _G.Settings.Main["Auto Musketeer Hat"] or _G.Settings.Main["Auto Buddy Sword"] or
      _G.Settings.Main["Auto Farm Bone"] or _G.Settings.Main["Auto Ken-Haki V2"] or _G.Settings.FightingStyle["Auto God Human"] or _G.Settings.Main["Auto Cavander"] or
      _G.Settings.Main["Auto Cursed Dual Katana"] or _G.Settings.Main["Auto Yama Sword"] or _G.Settings.Main["Auto Tushita Sword"] or _G.Settings.Main["Auto Serpent Bow"] or
      _G.Settings.Main["Auto Dark Dagger"] or _G.Settings.Main["Auto Cake Prince"] or _G.Settings.Main["Auto Dough V2"] or _G.Settings.Main["Auto Holy Torch"] or
      _G.Settings.Main["Auto Buddy Swords"] or _G.Settings.Main["Auto Farm Boss Hallow"] or _G.Settings.Main["Near Farm"] or _G.Settings.Main["Auto Material Soul Guitar"] or _G.Settings.Main["Auto Quest Soul Guitar"] or YamaQuest2 or YamaQuest1 or Auto_Cursed_Dual_Katana or
      Tushita_Quest2 or Tushita_Quest1 or AutoFarmMaterial or teleporttop or AutoFarmChest or _G.AutoPirateRaid or
--[For God Human]
--_G.Settings.Main["Auto Fish Tail Sea 1"] or _G.Settings.Main["Auto Fish Tail Sea 3"] or _G.Settings.Main["Auto Magma Ore Sea 2"] or
--_G.Settings.Main["Auto Magma Ore Sea 1"] or _G.Settings.Main["Auto Mystic Droplet"] or _G.Settings.Main["Auto Dragon Scales"] or
--[Boss]
      _G.Settings.Boss["Auto All Boss"] or _G.Settings.Boss["Auto Boss Select"] or
--[Mastery]
      _G.Settings.Mastery["Auto Farm Fruit Mastery"] or _G.Settings.Mastery["Auto Farm Gun Mastery"] or _G.Settings.Mastery["Farm Mastery SwordList"] or
--[Teleport]
      _G.Settings.Teleport["Teleport to Sea Beast"] or
--[Raids]
      _G.Settings.Raids["Auto Raids"] or _G.Settings.Raids["Auto Next Place"] or _G.AutoQuestRace or _G.Mirrage or _G.TeleportRace or _G.TweenMGear or _G.GrabChestMirrage or _G.SelectIslandRace or _G.TeleportIsland or _G.TeleportNPC
      then
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false    
					end
				end
			end
		end)
	end)
end)

-- [Bring Mob]

task.spawn(function()
  while true do wait()
  if setscriptable then
  setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
  end
  if sethiddenproperty then
  sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
  end
  end
  end)

task.spawn(function()
  while task.wait() do
  pcall(function()
    if StartMagnet then
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
    if InMyNetWork(v.HumanoidRootPart) then
    v.HumanoidRootPart.CFrame = PosMon
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    v.HumanoidRootPart.Transparency = 1
    v.HumanoidRootPart.CanCollide = false
    v.Head.CanCollide = false
    if v.Humanoid:FindFirstChild("Animator") then
    v.Humanoid.Animator:Destroy()
    end
    v.Humanoid:ChangeState(11)
    v.Humanoid:ChangeState(14)
    end
    end
    end
    end
    end)
  end
  end)

-- [No Stun]

task.spawn(function()
  if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
  game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
    pcall(function()
      if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
      game.Players.LocalPlayer.Character.Stun.Value = 0
      end
      end)
    end)
  end
  end)

-- [Deleted Effect Auto]

task.spawn(function()
  while wait() do
  for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
  pcall(function()
    if v.Name == ("CurvedRing") or v.Name == ("SlashHit") or v.Name == ("SwordSlash") or v.Name == ("SlashTail") or v.Name == ("Sounds") then
    v:Destroy()
    end
    end)
  end
  end
  end)

-- [require module]

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()

-- [Disabled Damage Interface]
function DisabledDamage()
task.spawn(function()
  while wait() do
  pcall(function()
    if _G.Settings.Configs["Disabled Damage"] then
    game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
    else
      game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
    end
    end)
  end
  end)
end

-- [Camera Shaker Function]
function CameraShaker()
task.spawn(function()
  local Camera = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
  while wait() do
  pcall(function()
    if _G.Settings.Configs["Camera Shaker"] then
    Camera.CameraShakeInstance.CameraShakeState.Inactive = 0
    else
      Camera.CameraShakeInstance.CameraShakeState.Inactive = 3
    end
    end)
  end
  end)
end

--[Function RmFzdCBBdHRhY2s=]

function CurrentWeapon()
local ac = CombatFrameworkR.activeController
local ret = ac.blades[1]
if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
pcall(function()
  while ret.Parent ~= game.Players.LocalPlayer.Character do ret = ret.Parent end
  end)
if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
return ret
end

function getAllBladeHitsPlayers(Sizes)
local Hits = {}
local Client = game.Players.LocalPlayer
local Characters = game:GetService("Workspace").Characters:GetChildren()
for i = 1,#Characters do local v = Characters[i]
local Human = v:FindFirstChildOfClass("Humanoid")
if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
table.insert(Hits,Human.RootPart)
end
end
return Hits
end

function getAllBladeHits(Sizes)
local Hits = {}
local Client = game.Players.LocalPlayer
local Enemies = game:GetService("Workspace").Enemies:GetChildren()
for i = 1,#Enemies do local v = Enemies[i]
local Human = v:FindFirstChildOfClass("Humanoid")
if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
table.insert(Hits,Human.RootPart)
end
end
return Hits
end

function AttackFunction()
local ac = CombatFrameworkR.activeController
if ac and ac.equipped then
for indexincrement = 1, 1 do
local bladehit = getAllBladeHits(60)
if #bladehit > 0 then
local AcAttack8 = debug.getupvalue(ac.attack, 5)
local AcAttack9 = debug.getupvalue(ac.attack, 6)
local AcAttack7 = debug.getupvalue(ac.attack, 4)
local AcAttack10 = debug.getupvalue(ac.attack, 7)
local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
local NumberAc13 = AcAttack7 * 798405
(function()
  NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
  AcAttack8 = math.floor(NumberAc12 / AcAttack9)
  AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
  end)()
AcAttack10 = AcAttack10 + 1
debug.setupvalue(ac.attack, 5, AcAttack8)
debug.setupvalue(ac.attack, 6, AcAttack9)
debug.setupvalue(ac.attack, 4, AcAttack7)
debug.setupvalue(ac.attack, 7, AcAttack10)
for k, v in pairs(ac.animator.anims.basic) do
v:Play(0.01,0.01,0.01)
end
if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
end
end
end
end
end

function AttackPlayers()
local ac = CombatFrameworkR.activeController
if ac and ac.equipped then
for indexincrement = 1, 1 do
local bladehit = getAllBladeHitsPlayers(60)
if #bladehit > 0 then
local AcAttack8 = debug.getupvalue(ac.attack, 5)
local AcAttack9 = debug.getupvalue(ac.attack, 6)
local AcAttack7 = debug.getupvalue(ac.attack, 4)
local AcAttack10 = debug.getupvalue(ac.attack, 7)
local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
local NumberAc13 = AcAttack7 * 798405
(function()
  NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
  AcAttack8 = math.floor(NumberAc12 / AcAttack9)
  AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
  end)()
AcAttack10 = AcAttack10 + 1
debug.setupvalue(ac.attack, 5, AcAttack8)
debug.setupvalue(ac.attack, 6, AcAttack9)
debug.setupvalue(ac.attack, 4, AcAttack7)
debug.setupvalue(ac.attack, 7, AcAttack10)
for k, v in pairs(ac.animator.anims.basic) do
v:Play(0.01,0.01,0.01)
end
if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
end
end
end
end
end

-- [Isnetwork Owner]

function InMyNetWork(object)
if isnetworkowner then
return isnetworkowner(object)
else
  if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 200 then
return true
end
return false
end
end

-- [Function (Abandoned Quest , Others)]

function Com(com,...)
local Remote = game:GetService('ReplicatedStorage').Remotes:FindFirstChild("Comm"..com)
if Remote:IsA("RemoteEvent") then
Remote:FireServer(...)
elseif Remote:IsA("RemoteFunction") then
Remote:InvokeServer(...)
end
end

-- [Tween Functions]

local function GetIsLand(...)
local RealtargetPos = {
  ...
}
local targetPos = RealtargetPos[1]
local RealTarget
if type(targetPos) == "vector" then
RealTarget = targetPos
elseif type(targetPos) == "userdata" then
RealTarget = targetPos.Position
elseif type(targetPos) == "number" then
RealTarget = CFrame.new(unpack(RealtargetPos))
RealTarget = RealTarget.p
end

local ReturnValue
local CheckInOut = math.huge;
if game.Players.LocalPlayer.Team then
for i,v in pairs(game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(game.Players.LocalPlayer.Team)):GetChildren()) do
local ReMagnitude = (RealTarget - v:GetModelCFrame().p).Magnitude;
if ReMagnitude < CheckInOut then
CheckInOut = ReMagnitude;
ReturnValue = v.Name
end
end
if ReturnValue then
return ReturnValue
end
end
end

--BTP

function BTP(Position)
game.Players.LocalPlayer.Character.Head:Destroy()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
end

-- [Tween Functions (toTarget)]

local function toTarget(...)
local RealtargetPos = {
  ...
}
local targetPos = RealtargetPos[1]
local RealTarget
if type(targetPos) == "vector" then
RealTarget = CFrame.new(targetPos)
elseif type(targetPos) == "userdata" then
RealTarget = targetPos
elseif type(targetPos) == "number" then
RealTarget = CFrame.new(unpack(RealtargetPos))
end

if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then if tween then tween:Cancel() end repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0; wait(0.2) end

local tweenfunc = {}
local Distance = (RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
if Distance < 1000 then
Speed = 315
elseif Distance >= 1000 then
Speed = 300
end

if _G.Settings.Configs["Bypass TP"] then
if Distance > 3000 and not AutoFarmMaterial and not _G.Settings.FightingStyle["Auto God Human"] and not _G.Settings.Raids["Auto Raids"] and not (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")) and not (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") then
pcall(function()
  tween:Cancel()
  fkwarp = false

  if game:GetService("Players")["LocalPlayer"].Data:FindFirstChild("SpawnPoint").Value == tostring(GetIsLand(RealTarget)) then
  wait(.1)
  Com("F_","TeleportToSpawn")
  elseif game:GetService("Players")["LocalPlayer"].Data:FindFirstChild("LastSpawnPoint").Value == tostring(GetIsLand(RealTarget)) then
  game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
  wait(0.1)
  repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
  else
    if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
  if fkwarp == false then
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = RealTarget
  end
  fkwarp = true
  end
  wait(.08)
  game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
  repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
  wait(.1)
  Com("F_","SetSpawnPoint")
  end
  wait(0.2)

  return
  end)
end
end

local tween_s = game:service"TweenService"
local info = TweenInfo.new((RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude/Speed, Enum.EasingStyle.Linear)
local tweenw, err = pcall(function()
  tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {
    CFrame = RealTarget
  })
  tween:Play()
  end)

function tweenfunc:Stop()
tween:Cancel()
end

function tweenfunc:Wait()
tween.Completed:Wait()
end

return tweenfunc
end

function toTargetP(CFgo)
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude <= 150 then
pcall(function()
  tween:Cancel()

  game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = CFgo

  return
  end)
end
local tween_s = game:service"TweenService"
local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/325, Enum.EasingStyle.Linear)
tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {
  CFrame = CFgo
})
tween:Play()

local tweenfunc = {}

function tweenfunc:Stop()
tween:Cancel()
end

return tweenfunc
end

-- [Infinites Energy]

function InfinitiesEnergy()
game:GetService('Players').LocalPlayer.Character.Energy.Changed:connect(function()
  if _G.Settings.Misc["Infinities Energy"] then
  game:GetService('Players').LocalPlayer.Character.Energy.Value = game:GetService('Players').LocalPlayer.Character.Energy.MaxValue
  end
  end)
end

--// Dodge No CD
function NoCooldown()
    if _G.Settings.Misc["No Dash Cooldown"] then
        for i,v in next, getgc() do
            if typeof(v) == "function" then
                if getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Dodge") then
                    for i2,v2 in next, getupvalues(v) do
                        if tostring(v2) == "0.4" then
                            repeat wait()
                                setupvalue(v,i2,0)
                            until not _G.Settings.Misc["No Dash Cooldown"]
                        end
                    end
                end
            end
        end
    end
end

-- [No Cooldown , Infinities Geppo]

function NoCooldown()
for i,v in next, getgc() do
if typeof(v) == "function" then
if getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Dodge") and _G.Noting then
for i2,v2 in next, getupvalues(v) do
if tostring(v2) == "0.4" then
repeat wait(.1)
setupvalue(v,i2,0)
until not _G.Settings.Misc["No Dash Cooldown"]
end
end
end
if getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Geppo") and _G.Settings.Misc["Infinities Geppo"] then
for i2,v2 in next, getupvalues(v) do
if tostring(v2) == "0" then
repeat wait(.1)
setupvalue(v,i2,0)
until not _G.Settings.Misc["Infinities Geppo"]
end
end
end
if getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Soru") and _G.Settings.Misc["No Soru Cooldown"] then
for i2,v2 in pairs(debug.getupvalues(v)) do
if type(v2) == 'table' then
if v2.LastUse then
repeat wait()
setupvalue(v, i2, {
  LastAfter = 0,LastUse = 0
})
until not _G.Settings.Misc["No Soru Cooldown"]
end
end
end
end
end
end
end

-- [Xray Function]

function xray(v)
if v then
for _,i in pairs(workspace:GetDescendants()) do
if i:IsA("BasePart") and not i.Parent:FindFirstChildOfClass('Humanoid') and not i.Parent.Parent:FindFirstChildOfClass('Humanoid') then
i.LocalTransparencyModifier = 0.5
end
end
else
  for _,i in pairs(workspace:GetDescendants()) do
if i:IsA("BasePart") and not i.Parent:FindFirstChildOfClass('Humanoid') and not i.Parent.Parent:FindFirstChildOfClass('Humanoid') then
i.LocalTransparencyModifier = 0
end
end
end
end

-- [Get Players Character]

function getRoot(char)
local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
return rootPart
end

function r15(plr)
if plr.Character:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R15 then
return true
end
end

-- [Functions Click]

function ClickCamera()
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
function Click()
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
end

function RemoveFruit(str)
return str:gsub(" Fruit", "")
end

-- [Code Api]

local CodeApi = loadstring(game:HttpGet('https://pastebin.com/raw/EK13Njf3'))()

-- [Comma Value]

function comma_value(p1)
local v1 = p1;
while true do
local v2, v3 = string.gsub(v1, "^(-?%d+)(%d%d%d)", "%1,%2");
v1 = v2;
if v3 ~= 0 then else
  --break;
end;
end;
return v1;
end;

-- [Check Fruit 1M]


_G.CheckFruitLocal1M = false
function CheckFruit1M()
for i,v in pairs(game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("getInventoryFruits")) do
if v.Price >= 1000000 then
_G.CheckFruitLocal1M = true
end
end
end

-- [Get FightingStyle]

function GetFightingStyle(Style)
ReturnText = ""
for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") then
if v.ToolTip == Style then
ReturnText = v.Name
end
end
end
for i ,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
if v.ToolTip == Style then
ReturnText = v.Name
end
end
end
if ReturnText ~= "" then
return ReturnText
else
  return "Not Have"
end
end

local placeId = game.PlaceId
if placeId == 2753915549 then
World1 = true
elseif placeId == 4442272183 then
World2 = true
elseif placeId == 7449423635 then
ThreeWorld = true
else
  game.Players.LocalPlayer:Kick("Not in Blox Fruit .l.")
end

-- [CheckMasteryWeapon]

function CheckMasteryWeapon(NameWe,MasNum)
if game.Players.LocalPlayer.Backpack:FindFirstChild(NameWe) then
if tonumber(game.Players.LocalPlayer.Backpack:FindFirstChild(NameWe).Level.Value) < tonumber(MasNum) then
return "true DownTo"
elseif tonumber(game.Players.LocalPlayer.Backpack:FindFirstChild(NameWe).Level.Value) >= tonumber(MasNum) then
return "true UpTo"
end
end
if game.Players.LocalPlayer.Character:FindFirstChild(NameWe) then
if tonumber(game.Players.LocalPlayer.Character:FindFirstChild(NameWe).Level.Value) < tonumber(MasNum) then
return "true DownTo"
elseif tonumber(game.Players.LocalPlayer.Character:FindFirstChild(NameWe).Level.Value) >= tonumber(MasNum) then
return "true UpTo"
end
end
return "else"
end

--[GetWeaponInventory]

function GetWeaponInventory(Weaponname)
for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
if type(v) == "table" then
if v.Type == "Sword" then
if v.Name == Weaponname then
return true
end
end
end
end
return false
end

-- [GetMaterial]

function GetMaterial(matname)
for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
if type(v) == "table" then
if v.Type == "Material" then
if v.Name == matname then
return v.Count
end
end
end
end
return 0
end

local AllMaterial
if World1 then
AllMaterial = {
  "Magma Ore",
  "Leather",
  "Scrap Metal",
  "Angel Wings",
  "Fish Tail"
} elseif World2 then
AllMaterial = {
  "Magma Ore",
  "Scrap Metal",
  "Radioactive Material",
  "Vampire Fang",
  "Mystic Droplet",
} elseif World3 then
AllMaterial = {
  "Mini Tusk",
  "Fish Tail",
  "Scrap Metal",
  "Dragon Scale",
  "Conjured Cocoa",
  "Demonic Wisp",
  "Gunpowder",
}
end

table.sort(AllMaterial)

-- [CustomFindFirstChild]

local function CustomFindFirstChild(tablename)
for i,v in pairs(tablename) do
if game:GetService("Workspace").Enemies:FindFirstChild(v) then
return true
end
end
return false
end

-- [IsNumber]

function isNumber(str)
if tonumber(str) ~= nil or str == 'inf' then
return true
end
end


-- [Invisible]

local Player = game:GetService('Players').LocalPlayer

local function CheckRig()
if Player.Character then
local Humanoid = Player.Character:WaitForChild('Humanoid')
if Humanoid.RigType == Enum.HumanoidRigType.R15 then
return 'R15'
else
  return 'R6'
end
end
end

local function InitiateInvis()
local Character = Player.Character
local StoredCF = Character.PrimaryPart.CFrame

if CheckRig() == 'R6' then
local Clone = Character.HumanoidRootPart:Clone()
Character.HumanoidRootPart:Destroy()
Clone.Parent = Character
else
  local Clone = Character.LowerTorso.Root:Clone()
Character.LowerTorso.Root:Destroy()
Clone.Parent = Character.LowerTorso
end

end

-- [CheckMaterial]

local function CheckMaterial(v1)
if World1 then
if (v1 == "Magma Ore") then
MaterialMob = {
  "Military Soldier [Lv. 300]","Military Spy [Lv. 325]"
};
CFrameMon = CFrame.new(-5815,84,8820);
elseif ((v1 == "Leather") or (v1 == "Scrap Metal")) then
MaterialMob = {
  "Brute [Lv. 45]"
};
CFrameMon = CFrame.new(-1145,15,4350);
elseif (v1 == "Angel Wings") then
MaterialMob = {
  "God's Guard [Lv. 450]"
};
CFrameMon = CFrame.new(-4698,845, -1912);
elseif (v1 == "Fish Tail") then
MaterialMob = {
  "Fishman Warrior [Lv. 375]","Fishman Commando [Lv. 400]"
};
CFrameMon = CFrame.new(61123,19,1569);
end
end
if World2 then
if (v1 == "Magma Ore") then
MaterialMob = {
  "Magma Ninja [Lv. 1175]"
};
CFrameMon = CFrame.new(-5428,78, -5959);
elseif (v1 == "Scrap Metal") then
MaterialMob = {
  "Swan Pirate [Lv. 775]"
};
CFrameMon = CFrame.new(878,122,1235);
elseif (v1 == "Radioactive Material") then
MaterialMob = {
  "Factory Staff [Lv. 800]"
};
CFrameMon = CFrame.new(295,73, -56);
elseif (v1 == "Vampire Fang") then
MaterialMob = {
  "Vampire [Lv. 975]"
};
CFrameMon = CFrame.new(-6033,7, -1317);
elseif (v1 == "Mystic Droplet") then
MaterialMob = {
  "Water Fighter [Lv. 1450]","Sea Soldier [Lv. 1425]"
};
CFrameMon = CFrame.new(-3385,239, -10542);
end
end
if World3 then
if (v1 == "Mini Tusk") then
MaterialMob = {
  "Mythological Pirate [Lv. 1850]"
};
CFrameMon = CFrame.new(-13545,470, -6917);
elseif (v1 == "Fish Tail") then
MaterialMob = {
  "Fishman Raider [Lv. 1775]","Fishman Captain [Lv. 1800]"
};
CFrameMon = CFrame.new(-10993,332, -8940);
elseif (v1 == "Scrap Metal") then
MaterialMob = {
  "Jungle Pirate [Lv. 1900]"
};
CFrameMon = CFrame.new(-12107,332, -10549);
elseif (v1 == "Dragon Scale") then
MaterialMob = {
  "Dragon Crew Archer [Lv. 1600]","Dragon Crew Warrior [Lv. 1575]"
};
CFrameMon = CFrame.new(6594,383,139);
elseif (v1 == "Conjured Cocoa") then
MaterialMob = {
  "Cocoa Warrior [Lv. 2300]","Chocolate Bar Battler [Lv. 2325]","Sweet Thief [Lv. 2350]","Candy Rebel [Lv. 2375]"
};
CFrameMon = CFrame.new(620.6344604492188,78.93644714355469, -12581.369140625);
elseif (v1 == "Demonic Wisp") then MaterialMob = {
  "Demonic Soul [Lv. 2025]"
};
CFrameMon = CFrame.new(-9507,172,6158);
elseif (v1 == "Gunpowder") then MaterialMob = {
  "Pistol Billionaire [Lv. 1525]"
};
CFrameMon = CFrame.new(-469,74,5904);
end
end
end

-- [Check Quest]

function CheckQuest()
local MyLevel = game.Players.LocalPlayer.Data.Level.Value
if World1 then
if MyLevel == 1 or MyLevel <= 9 then -- Bandit
LevelFarm = 1

Name = "Bandit [Lv. 5]"
QuestName = "BanditQuest1"

LevelQuest = 1
NameMon = "Bandit"

CFrameMon = CFrame.new(1145, 17, 1634)
VectorMon = Vector3.new(1145, 17, 1634)

CFrameQuest = CFrame.new(1060, 17, 1547)
VectorQuest = Vector3.new(1060, 17, 1547)
elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
LevelFarm = 2

Name = "Monkey [Lv. 14]"
QuestName = "JungleQuest"

LevelQuest = 1
NameMon = "Monkey"

CFrameMon = CFrame.new(-1496, 39, 35)
VectorMon = Vector3.new(-1496, 39, 35)

CFrameQuest = CFrame.new(-1602, 37, 152)
VectorQuest = Vector3.new(-1602, 37, 152)
elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
LevelFarm = 3

Name = "Gorilla [Lv. 20]"
QuestName = "JungleQuest"

LevelQuest = 2
NameMon = "Gorilla"

CFrameMon = CFrame.new(-1237, 6, -486)
VectorMon = Vector3.new(-1237, 7, -486)

CFrameQuest = CFrame.new(-1602, 37, 152)
VectorQuest = Vector3.new(-1602, 37, 152)
elseif MyLevel == 30 or MyLevel <= 39 then -- Pirate
LevelFarm = 4

Name = "Pirate [Lv. 35]"
QuestName = "BuggyQuest1"

LevelQuest = 1
NameMon = "Pirate"

CFrameMon = CFrame.new(-1115, 14, 3938)
VectorMon = Vector3.new(-1115, 14, 3938)

CFrameQuest = CFrame.new(-1140, 5, 3828)
VectorQuest = Vector3.new(-1140, 5, 3828)
elseif MyLevel == 40 or MyLevel <= 59 then -- Brute
LevelFarm = 5

Name = "Brute [Lv. 45]"
QuestName = "BuggyQuest1"

LevelQuest = 2
NameMon = "Brute"

CFrameMon = CFrame.new(-1145, 15, 4350)
VectorMon = Vector3.new(-1146, 15, 4350)

CFrameQuest = CFrame.new(-1140, 5, 3828)
VectorQuest = Vector3.new(-1140, 5, 3828)
elseif MyLevel == 60 or MyLevel <= 74 then -- Desert Bandit
LevelFarm = 6

Name = "Desert Bandit [Lv. 60]"
QuestName = "DesertQuest"

LevelQuest = 1
NameMon = "Desert Bandit"

CFrameMon = CFrame.new(932, 7, 4484)
VectorMon = Vector3.new(932, 7, 4484)

CFrameQuest = CFrame.new(897, 7, 4388)
VectorQuest = Vector3.new(897, 7, 4388)
elseif MyLevel == 75 or MyLevel <= 89 then -- Desert Officre
LevelFarm = 7

Name = "Desert Officer [Lv. 70]"
QuestName = "DesertQuest"

LevelQuest = 2
NameMon = "Desert Officer"

CFrameMon = CFrame.new(1572, 10, 4373)
VectorMon = Vector3.new(1572, 10, 4373)

CFrameQuest = CFrame.new(897, 7, 4388)
VectorQuest = Vector3.new(897, 7, 4388)
elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits
LevelFarm = 8

Name = "Snow Bandit [Lv. 90]"
QuestName = "SnowQuest"

LevelQuest = 1
NameMon = "Snow Bandits"

CFrameMon = CFrame.new(1289, 150, -1442)
VectorMon = Vector3.new(1289, 106, -1442)

CFrameQuest = CFrame.new(1386, 87, -1297)
VectorQuest = Vector3.new(1386, 87, -1297)
elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman
LevelFarm = 9

Name = "Snowman [Lv. 100]"
QuestName = "SnowQuest"

LevelQuest = 2
NameMon = "Snowman"

CFrameMon = CFrame.new(1289, 150, -1442)
VectorMon = Vector3.new(1289, 106, -1442)

CFrameQuest = CFrame.new(1386, 87, -1297)
VectorQuest = Vector3.new(1386, 87, -1297)
elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer
LevelFarm = 10

Name = "Chief Petty Officer [Lv. 120]"
QuestName = "MarineQuest2"

LevelQuest = 1
NameMon = "Chief Petty Officer"

CFrameMon = CFrame.new(-4855, 23, 4308)
VectorMon = Vector3.new(-4855, 23, 4308)

CFrameQuest = CFrame.new(-5036, 29, 4325)
VectorQuest = Vector3.new(-5036, 29, 4325)
elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit
LevelFarm = 11

Name = "Sky Bandit [Lv. 150]"
QuestName = "SkyQuest"

LevelQuest = 1
NameMon = "Sky Bandit"

CFrameMon = CFrame.new(-4981, 278, -2830)
VectorMon = Vector3.new(-4981, 278, -2830)

CFrameQuest = CFrame.new(-4842, 718, -2623)
VectorQuest = Vector3.new(-4842, 718, -2623)
elseif MyLevel == 175 or MyLevel <= 189 then -- Dark Master
LevelFarm = 12

Name = "Dark Master [Lv. 175]"
QuestName = "SkyQuest"

LevelQuest = 2
NameMon = "Dark Master"

CFrameMon = CFrame.new(-5250, 389, -2272)
VectorMon = Vector3.new(-5250, 389, -2272)

CFrameQuest = CFrame.new(-4842, 718, -2623)
VectorQuest = Vector3.new(-4842, 718, -2623)
elseif MyLevel == 190 or MyLevel <= 209 then -- Dark Master
LevelFarm = 13

Name = "Prisoner [Lv. 190]"
QuestName = "PrisonerQuest"

LevelQuest = 1
NameMon = "Prisoner"

CFrameMon = CFrame.new(5411, 96, 690)
VectorMon = Vector3.new(5411, 96, 690)

CFrameQuest = CFrame.new(5308, 2, 474)
VectorQuest = Vector3.new(5308, 2, 474)
elseif MyLevel == 210 or MyLevel <= 249 then -- Dark Master
LevelFarm = 14

Name = "Dangerous Prisoner [Lv. 210]"
QuestName = "PrisonerQuest"

LevelQuest = 2
NameMon = "Dangerous Prisoner"

CFrameMon = CFrame.new(5411, 96, 690)
VectorMon = Vector3.new(5411, 96, 690)

CFrameQuest = CFrame.new(5308, 2, 474)
VectorQuest = Vector3.new(5308, 2, 474)
elseif MyLevel == 250 or MyLevel <= 299 then -- Toga Warrior
LevelFarm = 15

Name = "Toga Warrior [Lv. 250]"
QuestName = "ColosseumQuest"

LevelQuest = 1
NameMon = "Toga Warrior"

CFrameMon = CFrame.new(-1824, 50, -2743)
VectorMon = Vector3.new(-1824, 50, -2743)

CFrameQuest = CFrame.new(-1576, 8, -2985)
VectorQuest = Vector3.new(-1576, 8, -2985)
elseif MyLevel == 300 or MyLevel <= 329 then -- Military Soldier
LevelFarm = 16

Name = "Military Soldier [Lv. 300]"
QuestName = "MagmaQuest"

LevelQuest = 1
NameMon = "Military Soldier"

CFrameMon = CFrame.new(-5408, 11, 8447)
VectorMon = Vector3.new(-5408, 11, 8447)

CFrameQuest = CFrame.new(-5316, 12, 8517)
VectorQuest = Vector3.new(-5316, 12, 8517)
elseif MyLevel == 330 or MyLevel <= 374 then -- Military Spy
LevelFarm = 17

Name = "Military Spy [Lv. 325]"
QuestName = "MagmaQuest"

LevelQuest = 2
NameMon = "Military Spy"

CFrameMon = CFrame.new(-5815, 84, 8820)
VectorMon = Vector3.new(-5815, 84, 8820)

CFrameQuest = CFrame.new(-5316, 12, 8517)
VectorQuest = Vector3.new(-5316, 12, 8517)
elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior
LevelFarm = 18

Name = "Fishman Warrior [Lv. 375]"
QuestName = "FishmanQuest"

LevelQuest = 1
NameMon = "Fishman Warrior"

CFrameMon = CFrame.new(60859, 19, 1501)
VectorMon = Vector3.new(60859, 19, 1501)

CFrameQuest = CFrame.new(61123, 19, 1569)
VectorQuest = Vector3.new(61123, 19, 1569)
elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando
LevelFarm = 19

Name = "Fishman Commando [Lv. 400]"
QuestName = "FishmanQuest"

LevelQuest = 2
NameMon = "Fishman Commando"

CFrameMon = CFrame.new(61891, 19, 1470)
VectorMon = Vector3.new(61891, 19, 1470)

CFrameQuest = CFrame.new(61123, 19, 1569)
VectorQuest = Vector3.new(61123, 19, 1569)
elseif MyLevel == 450 or MyLevel <= 474 then -- God's Guards
LevelFarm = 20

Name = "God's Guard [Lv. 450]"
QuestName = "SkyExp1Quest"

LevelQuest = 1
NameMon = "God's Guards"

CFrameMon = CFrame.new(-4698, 845, -1912)
VectorMon = Vector3.new(-4698, 845, -1912)

CFrameQuest = CFrame.new(-4722, 845, -1954)
VectorQuest = Vector3.new(-4722, 846, -1954)
elseif MyLevel == 475 or MyLevel <= 524 then -- Shandas
LevelFarm = 21

Name = "Shanda [Lv. 475]"
QuestName = "SkyExp1Quest"

LevelQuest = 2
NameMon = "Shandas"

CFrameMon = CFrame.new(-7685, 5567, -502)
VectorMon = Vector3.new(-7685, 5567, -502)

CFrameQuest = CFrame.new(-7862, 5546, -380)
VectorQuest = Vector3.new(-7862, 5546, -380)
elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad
LevelFarm = 22

Name = "Royal Squad [Lv. 525]"
QuestName = "SkyExp2Quest"

LevelQuest = 1
NameMon = "Royal Squad"

CFrameMon = CFrame.new(-7670, 5607, -1460)
VectorMon = Vector3.new(-7670, 5607, -1460)

CFrameQuest = CFrame.new(-7904, 5636, -1412)
VectorQuest = Vector3.new(-7904, 5636, -1412)
elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier
LevelFarm = 23

Name = "Royal Soldier [Lv. 550]"
QuestName = "SkyExp2Quest"

LevelQuest = 2
NameMon = "Royal Soldier"

CFrameMon = CFrame.new(-7828, 5607, -1744)
VectorMon = Vector3.new(-7828, 5607, -1744)

CFrameQuest = CFrame.new(-7904, 5636, -1412)
VectorQuest = Vector3.new(-7904, 5636, -1412)
elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate
LevelFarm = 24

Name = "Galley Pirate [Lv. 625]"
QuestName = "FountainQuest"

LevelQuest = 1
NameMon = "Galley Pirate"

CFrameMon = CFrame.new(5589, 45, 3996)
VectorMon = Vector3.new(5589, 45, 3996)

CFrameQuest = CFrame.new(5256, 39, 4050)
VectorQuest = Vector3.new(5256, 39, 4050)
elseif MyLevel >= 650 then -- Galley Captain
LevelFarm = 25

Name = "Galley Captain [Lv. 650]"
QuestName = "FountainQuest"

LevelQuest = 2
NameMon = "Galley Captain"

CFrameMon = CFrame.new(5649, 39, 4936)
VectorMon = Vector3.new(5649, 39, 4936)

CFrameQuest = CFrame.new(5256, 39, 4050)
VectorQuest = Vector3.new(5256, 39, 4050)
end
end
if World2 then
if MyLevel == 700 or MyLevel <= 724 then -- Raider [Lv. 700]
LevelFarm = 1

Name = "Raider [Lv. 700]"
QuestName = "Area1Quest"

LevelQuest = 1
NameMon = "Raider"

CFrameQuest = CFrame.new(-425, 73, 1837)
VectorQuest = Vector3.new(-425, 73, 1837)

CFrameMon = CFrame.new(-746, 39, 2390)
VectorMon = Vector3.new(-746, 39, 2389)
elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary [Lv. 725]
LevelFarm = 2

Name = "Mercenary [Lv. 725]"
QuestName = "Area1Quest"

LevelQuest = 2
NameMon = "Mercenary"

CFrameQuest = CFrame.new(-425, 73, 1837)
VectorQuest = Vector3.new(-425, 73, 1837)

CFrameMon = CFrame.new(-874, 141, 1312)
VectorMon = Vector3.new(-874, 141, 1312)
elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate [Lv. 775]
LevelFarm = 3

Name = "Swan Pirate [Lv. 775]"
QuestName = "Area2Quest"

LevelQuest = 1
NameMon = "Swan Pirate"

CFrameQuest = CFrame.new(634, 73, 918)
VectorQuest = Vector3.new(634, 73, 918)

CFrameMon = CFrame.new(878, 122, 1235)
VectorMon = Vector3.new(878, 122, 1235)
elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff [Lv. 800]
LevelFarm = 4

Name = "Factory Staff [Lv. 800]"
QuestName = "Area2Quest"

LevelQuest = 2
NameMon = "Factory Staff"

CFrameQuest = CFrame.new(634, 73, 918)
VectorQuest = Vector3.new(634, 73, 918)

CFrameMon = CFrame.new(295, 73, -56)
VectorMon = Vector3.new(295, 73, -56)
elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant [Lv. 875]
LevelFarm = 5

Name = "Marine Lieutenant [Lv. 875]"
QuestName = "MarineQuest3"

LevelQuest = 1
NameMon = "Marine Lieutenant"

CFrameMon = CFrame.new(-2806, 73, -3038)
VectorMon = Vector3.new(-2806, 73, -3038)

CFrameQuest = CFrame.new(-2443, 73, -3219)
VectorQuest = Vector3.new(-2443, 73, -3219)
elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain [Lv. 900]
LevelFarm = 6

Name = "Marine Captain [Lv. 900]"
QuestName = "MarineQuest3"

LevelQuest = 2
NameMon = "Marine Captain"

CFrameMon = CFrame.new(-1869, 73, -3320)
VectorMon = Vector3.new(-1869, 73, -3320)

CFrameQuest = CFrame.new(-2443, 73, -3219)
VectorQuest = Vector3.new(-2443, 73, -3219)
elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie [Lv. 950]
LevelFarm = 7

Name = "Zombie [Lv. 950]"
QuestName = "ZombieQuest"

LevelQuest = 1
NameMon = "Zombie"

CFrameMon = CFrame.new(-5736, 126, -728)
VectorMon = Vector3.new(-5736, 126, -728)

CFrameQuest = CFrame.new(-5494, 49, -795)
VectorQuest = Vector3.new(-5494, 49, -794)
elseif MyLevel == 975 or MyLevel <= 999 then -- Vampire [Lv. 975]
LevelFarm = 8

Name = "Vampire [Lv. 975]"
QuestName = "ZombieQuest"

LevelQuest = 2
NameMon = "Vampire"

CFrameMon = CFrame.new(-6033, 7, -1317)
VectorMon = Vector3.new(-6033, 7, -1317)

CFrameQuest = CFrame.new(-5494, 49, -795)
VectorQuest = Vector3.new(-5494, 49, -795)
elseif MyLevel == 1000 or MyLevel <= 1049 then -- Snow Trooper [Lv. 1000] **
LevelFarm = 9

Name = "Snow Trooper [Lv. 1000]"
QuestName = "SnowMountainQuest"

LevelQuest = 1
NameMon = "Snow Trooper"

CFrameMon = CFrame.new(478, 402, -5362)
VectorMon = Vector3.new(478, 402, -5362)

CFrameQuest = CFrame.new(605, 402, -5371)
VectorQuest = Vector3.new(605, 402, -5371)
elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior [Lv. 1050]
LevelFarm = 10

Name = "Winter Warrior [Lv. 1050]"
QuestName = "SnowMountainQuest"

LevelQuest = 2
NameMon = "Winter Warrior"

CFrameMon = CFrame.new(1157, 430, -5188)
VectorMon = Vector3.new(1157, 430, -5188)

CFrameQuest = CFrame.new(605, 402, -5371)
VectorQuest = Vector3.new(605, 402, -5371)
elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate [Lv. 1100]
LevelFarm = 11

Name = "Lab Subordinate [Lv. 1100]"
QuestName = "IceSideQuest"

LevelQuest = 1
NameMon = "Lab Subordinate"

CFrameMon = CFrame.new(-5782, 42, -4484)
VectorMon = Vector3.new(-5782, 42, -4484)

CFrameQuest = CFrame.new(-6060, 16, -4905)
VectorQuest = Vector3.new(-6060, 16, -4905)
elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior [Lv. 1125]
LevelFarm = 12

Name = "Horned Warrior [Lv. 1125]"
QuestName = "IceSideQuest"

LevelQuest = 2
NameMon = "Horned Warrior"

CFrameMon = CFrame.new(-6406, 24, -5805)
VectorMon = Vector3.new(-6406, 24, -5805)

CFrameQuest = CFrame.new(-6060, 16, -4905)
VectorQuest = Vector3.new(-6060, 16, -4905)
elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja [Lv. 1175]
LevelFarm = 13

Name = "Magma Ninja [Lv. 1175]"
QuestName = "FireSideQuest"
LevelQuest = 1
NameMon = "Magma Ninja"

CFrameMon = CFrame.new(-5428, 78, -5959)
VectorMon = Vector3.new(-5428, 78, -5959)

CFrameQuest = CFrame.new(-5430, 16, -5295)
VectorQuest = Vector3.new(-5430, 16, -5296)
elseif MyLevel == 1200 or MyLevel <= 1249 then -- Lava Pirate [Lv. 1200]
LevelFarm = 14

Name = "Lava Pirate [Lv. 1200]"
QuestName = "FireSideQuest"

LevelQuest = 2
NameMon = "Lava Pirate"

CFrameMon = CFrame.new(-5270, 42, -4800)
VectorMon = Vector3.new(-5270, 42, -4800)

CFrameQuest = CFrame.new(-5430, 16, -5295)
VectorQuest = Vector3.new(-5430, 16, -5296)
elseif MyLevel == 1250 or MyLevel <= 1274 then -- Ship Deckhand [Lv. 1250]
LevelFarm = 15

Name = "Ship Deckhand [Lv. 1250]"
QuestName = "ShipQuest1"

LevelQuest = 1
NameMon = "Ship Deckhand"

CFrameMon = CFrame.new(1198, 126, 33031)
VectorMon = Vector3.new(1198, 126, 33031)

CFrameQuest = CFrame.new(1038, 125, 32913)
VectorQuest = Vector3.new(1038, 125, 32913)
elseif MyLevel == 1275 or MyLevel <= 1299 then -- Ship Engineer [Lv. 1275]
LevelFarm = 16

Name = "Ship Engineer [Lv. 1275]"
QuestName = "ShipQuest1"

LevelQuest = 2
NameMon = "Ship Engineer"

CFrameMon = CFrame.new(918, 44, 32787)
VectorMon = Vector3.new(918, 44, 32787)

CFrameQuest = CFrame.new(1038, 125, 32913)
VectorQuest = Vector3.new(1038, 125, 32913)
elseif MyLevel == 1300 or MyLevel <= 1324 then -- Ship Steward [Lv. 1300]
LevelFarm = 17

Name = "Ship Steward [Lv. 1300]"
QuestName = "ShipQuest2"

LevelQuest = 1
NameMon = "Ship Steward"

CFrameMon = CFrame.new(915, 130, 33419)
VectorMon = Vector3.new(915, 130, 33419)

CFrameQuest = CFrame.new(969, 125, 33245)
VectorQuest = Vector3.new(969, 125, 33245)
elseif MyLevel == 1325 or MyLevel <= 1349 then -- Ship Officer [Lv. 1325]
LevelFarm = 18

Name = "Ship Officer [Lv. 1325]"
QuestName = "ShipQuest2"

LevelQuest = 2
NameMon = "Ship Officer"

CFrameMon = CFrame.new(916, 181, 33335)
VectorMon = Vector3.new(916, 181, 33335)

CFrameQuest = CFrame.new(969, 125, 33245)
VectorQuest = Vector3.new(969, 125, 33245)
elseif MyLevel == 1350 or MyLevel <= 1374 then -- Arctic Warrior [Lv. 1350]
LevelFarm = 19

Name = "Arctic Warrior [Lv. 1350]"
QuestName = "FrostQuest"

LevelQuest = 1
NameMon = "Arctic Warrior"

CFrameMon = CFrame.new(6038, 29, -6231)
VectorMon = Vector3.new(6038, 29, -6231)

VectorQuest = Vector3.new(5669, 28, -6482)
CFrameQuest = CFrame.new(5669, 28, -6482)
elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker [Lv. 1375]
LevelFarm = 20

Name = "Snow Lurker [Lv. 1375]"
QuestName = "FrostQuest"

LevelQuest = 2
NameMon = "Snow Lurker"

CFrameMon = CFrame.new(5560, 42, -6826)
VectorMon = Vector3.new(5560, 42, -6826)

VectorQuest = Vector3.new(5669, 28, -6482)
CFrameQuest = CFrame.new(5669, 28, -6482)
elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier [Lv. 1425]
LevelFarm = 21
Name = "Sea Soldier [Lv. 1425]"
QuestName = "ForgottenQuest"

LevelQuest = 1
NameMon = "Sea Soldier"

CFrameMon = CFrame.new(-3022, 16, -9722)
VectorMon = Vector3.new(-3022, 16, -9722)

CFrameQuest = CFrame.new(-3054, 237, -10148)
VectorQuest = Vector3.new(-3054, 237, -10148)
elseif MyLevel >= 1450 then -- Water Fighter [Lv. 1450]
LevelFarm = 22
Name = "Water Fighter [Lv. 1450]"
QuestName = "ForgottenQuest"

LevelQuest = 2
NameMon = "Water Fighter"

CFrameMon = CFrame.new(-3385, 239, -10542)
VectorMon = Vector3.new(-3385, 239, -10542)

CFrameQuest = CFrame.new(-3054, 237, -10148)
VectorQuest = Vector3.new(-3054, 237, -10148)
end
end
if World3 then
if MyLevel == 1500 or MyLevel <= 1524 then
LevelFarm = 1

Name = "Pirate Millionaire [Lv. 1500]"
QuestName = "PiratePortQuest"

LevelQuest = 1
NameMon = "Pirate"

CFrameMon = CFrame.new(-373, 75, 5550)
VectorMon = Vector3.new(-373, 75, 5550)

CFrameQuest = CFrame.new(-288, 44, 5576)
VectorQuest = Vector3.new(-288, 44, 5576)
elseif MyLevel == 1525 or MyLevel <= 1574 then
LevelFarm = 2

Name = "Pistol Billionaire [Lv. 1525]"
QuestName = "PiratePortQuest"

LevelQuest = 2
NameMon = "Pistol"

CFrameMon = CFrame.new(-469, 74, 5904)
VectorMon = Vector3.new(-469, 74, 5904)

CFrameQuest = CFrame.new(-288, 44, 5576)
VectorQuest = Vector3.new(-288, 44, 5576)
elseif MyLevel == 1575 or MyLevel <= 1599 then
LevelFarm = 3

Name = "Dragon Crew Warrior [Lv. 1575]"
QuestName = "AmazonQuest"

LevelQuest = 1
NameMon = "Warrior"

CFrameMon = CFrame.new(6339, 52, -1213)
VectorMon = Vector3.new(6338, 52, -1213)

CFrameQuest = CFrame.new(5835, 52, -1105)
VectorQuest = Vector3.new(5835, 52, -1105)
elseif MyLevel == 1600 or MyLevel <= 1624 then
LevelFarm = 4

Name = "Dragon Crew Archer [Lv. 1600]"
QuestName = "AmazonQuest"

LevelQuest = 2
NameMon = "Archer"

CFrameMon = CFrame.new(6594, 383, 139)
VectorMon = Vector3.new(6594, 383, 139)

CFrameQuest = CFrame.new(5835, 52, -1105)
VectorQuest = Vector3.new(5835, 52, -1105)
elseif MyLevel == 1625 or MyLevel <= 1649 then
LevelFarm = 5

Name = "Female Islander [Lv. 1625]"
QuestName = "AmazonQuest2"

LevelQuest = 1
NameMon = "Female"

CFrameMon = CFrame.new(5308, 819, 1047)
VectorMon = Vector3.new(5308, 819, 1047)

CFrameQuest = CFrame.new(5443, 602, 751)
VectorQuest = Vector3.new(5443, 602, 751)
elseif MyLevel == 1650 or MyLevel <= 1699 then
LevelFarm = 6

Name = "Giant Islander [Lv. 1650]"
QuestName = "AmazonQuest2"

LevelQuest = 2
NameMon = "Giant Islanders"

CFrameMon = CFrame.new(4951, 602, -68)
VectorMon = Vector3.new(4951, 602, -68)

CFrameQuest = CFrame.new(5443, 602, 751)
VectorQuest = Vector3.new(5443, 602, 751)
elseif MyLevel == 1700 or MyLevel <= 1724 then
LevelFarm = 7

Name = "Marine Commodore [Lv. 1700]"
QuestName = "MarineTreeIsland"

LevelQuest = 1
NameMon = "Marine Commodore"

CFrameMon = CFrame.new(2447, 73, -7470)
VectorMon = Vector3.new(2447, 73, -7470)

CFrameQuest = CFrame.new(2180, 29, -6737)
VectorQuest = Vector3.new(2180, 29, -6737)
elseif MyLevel == 1725 or MyLevel <= 1774 then
LevelFarm = 8

Name = "Marine Rear Admiral [Lv. 1725]"
QuestName = "MarineTreeIsland"

LevelQuest = 2
NameMon = "Marine Rear Admiral"

CFrameMon = CFrame.new(3671, 161, -6932)
VectorMon = Vector3.new(3671, 161, -6932)

CFrameQuest = CFrame.new(2180, 29, -6737)
VectorQuest = Vector3.new(2180, 29, -6737)
elseif MyLevel == 1775 or MyLevel <= 1800 then
LevelFarm = 9

Name = "Fishman Raider [Lv. 1775]"
QuestName = "DeepForestIsland3"

LevelQuest = 1
NameMon = "Fishman Raider"

CFrameMon = CFrame.new(-10560, 332, -8466)
VectorMon = Vector3.new(-10560, 332, -8466)

CFrameQuest = CFrame.new(-10584, 332, -8758)
VectorQuest = Vector3.new(-10584, 332, -8758)
elseif MyLevel == 1800 or MyLevel <= 1824 then
LevelFarm = 10

Name = "Fishman Captain [Lv. 1800]"
QuestName = "DeepForestIsland3"

LevelQuest = 2
NameMon = "Fishman Captain"

CFrameMon = CFrame.new(-10993, 332, -8940)
VectorMon = Vector3.new(-10993, 332, -8940)

CFrameQuest = CFrame.new(-10584, 332, -8758)
VectorQuest = Vector3.new(-10584, 332, -8758)
elseif MyLevel == 1825 or MyLevel <= 1849 then
LevelFarm = 11

Name = "Forest Pirate [Lv. 1825]"
QuestName = "DeepForestIsland"

LevelQuest = 1
NameMon = "Forest Pirate"

CFrameMon = CFrame.new(-13479, 333, -7905)
VectorMon = Vector3.new(-13479, 333, -7905)

CFrameQuest = CFrame.new(-13232, 333, -7627)
VectorQuest = Vector3.new(-13232, 333, -7627)
elseif MyLevel == 1850 or MyLevel <= 1899 then
LevelFarm = 12

Name = "Mythological Pirate [Lv. 1850]"
QuestName = "DeepForestIsland"

LevelQuest = 2
NameMon = "Mythological Pirate"

CFrameMon = CFrame.new(-13545, 470, -6917)
VectorMon = Vector3.new(-13545, 470, -6917)

CFrameQuest = CFrame.new(-13232, 333, -7627)
VectorQuest = Vector3.new(-13232, 333, -7627)
elseif MyLevel == 1900 or MyLevel <= 1924 then
LevelFarm = 13

Name = "Jungle Pirate [Lv. 1900]"
QuestName = "DeepForestIsland2"

LevelQuest = 1
NameMon = "Jungle Pirate"

CFrameMon = CFrame.new(-12107, 332, -10549)
VectorMon = Vector3.new(-12106, 332, -10549)

CFrameQuest = CFrame.new(-12684, 391, -9902)
VectorQuest = Vector3.new(-12684, 391, -9902)
elseif MyLevel == 1925 or MyLevel <= 1974 then
LevelFarm = 14

Name = "Musketeer Pirate [Lv. 1925]"
QuestName = "DeepForestIsland2"

LevelQuest = 2
NameMon = "Musketeer Pirate"

CFrameMon = CFrame.new(-13286, 392, -9769)
VectorMon = Vector3.new(-13286, 392, -9768)

CFrameQuest = CFrame.new(-12684, 391, -9902)
VectorQuest = Vector3.new(-12684, 391, -9902)
elseif MyLevel == 1975 or MyLevel <= 1999 then
LevelFarm = 15
Name = "Reborn Skeleton [Lv. 1975]"
QuestName = "HauntedQuest1"

LevelQuest = 1
NameMon = "Reborn Skeleton"

CFrameMon = CFrame.new(-8760, 142, 6039)
VectorMon = Vector3.new(-8760, 142, 6039)

CFrameQuest = CFrame.new(-9482, 142, 5567)
VectorQuest = Vector3.new(-9482, 142, 5567)
elseif MyLevel == 2000 or MyLevel <= 2024 then
LevelFarm = 16

Name = "Living Zombie [Lv. 2000]"
QuestName = "HauntedQuest1"

LevelQuest = 2
NameMon = "Living Zombie"

CFrameMon = CFrame.new(-10144, 140, 5932)
VectorMon = Vector3.new(-10144, 140, 5932)

CFrameQuest = CFrame.new(-9482, 142, 5567)
VectorQuest = Vector3.new(-9482, 142, 5567)
elseif MyLevel == 2025 or MyLevel <= 2049 then
LevelFarm = 17

Name = "Demonic Soul [Lv. 2025]"
QuestName = "HauntedQuest2"

LevelQuest = 1
NameMon = "Demonic Soul"

CFrameMon = CFrame.new(-9507, 172, 6158)
VectorMon = Vector3.new(-9506, 172, 6158)

CFrameQuest = CFrame.new(-9513, 172, 6079)
VectorQuest = Vector3.new(-9513, 172, 6079)
elseif MyLevel == 2050 or MyLevel <= 2074 then
LevelFarm = 18

Name = "Posessed Mummy [Lv. 2050]"
QuestName = "HauntedQuest2"

LevelQuest = 2
NameMon = "Posessed Mummy"

CFrameMon = CFrame.new(-9577, 6, 6223)
VectorMon = Vector3.new(-9577, 6, 6223)

CFrameQuest = CFrame.new(-9513, 172, 6079)
VectorQuest = Vector3.new(-9513, 172, 6079)

elseif MyLevel == 2075 or MyLevel <= 2099 then
LevelFarm = 19

Name = "Peanut Scout [Lv. 2075]"
QuestName = "NutsIslandQuest"

LevelQuest = 1
NameMon = "Peanut Scout"

CFrameMon = CFrame.new(-2124, 123, -10435)
VectorMon = Vector3.new(-2124, 123, -10435)

CFrameQuest = CFrame.new(-2104, 38, -10192)
VectorQuest = Vector3.new(-2104, 38, -10192)
elseif MyLevel == 2100 or MyLevel <= 2124 then
LevelFarm = 20

Name = "Peanut President [Lv. 2100]"
QuestName = "NutsIslandQuest"

LevelQuest = 2
NameMon = "Peanut President"

CFrameMon = CFrame.new(-2124, 123, -10435)
VectorMon = Vector3.new(-2124, 123, -10435)

CFrameQuest = CFrame.new(-2104, 38, -10192)
VectorQuest = Vector3.new(-2104, 38, -10192)
elseif MyLevel == 2125 or MyLevel <= 2149 then
LevelFarm = 21

Name = "Ice Cream Chef [Lv. 2125]"
QuestName = "IceCreamIslandQuest"

LevelQuest = 1
NameMon = "Ice Cream Chef"

CFrameMon = CFrame.new(-641, 127, -11062)
VectorMon = Vector3.new(-641, 127, -11062)

CFrameQuest = CFrame.new(-822, 66, -10965)
VectorQuest = Vector3.new(-822, 66, -10965)
elseif MyLevel == 2150 or MyLevel <= 2199 then
LevelFarm = 22

Name = "Ice Cream Commander [Lv. 2150]"
QuestName = "IceCreamIslandQuest"

LevelQuest = 2
NameMon = "Ice Cream Commander"

CFrameMon = CFrame.new(-641, 127, -11062)
VectorMon = Vector3.new(-641, 127, -11062)

CFrameQuest = CFrame.new(-822, 66, -10965)
VectorQuest = Vector3.new(-822, 66, -10965)
---------------------------------------------------------------
elseif MyLevel == 2200 or MyLevel <= 2224 then
LevelFarm = 23

Name = "Cookie Crafter [Lv. 2200]"
QuestName = "CakeQuest1"

LevelQuest = 1
NameMon = "Cookie Crafter"

CFrameMon = CFrame.new(-2365, 38, -12099)
VectorMon = Vector3.new(-2365, 38, -12099)

CFrameQuest = CFrame.new(-2020, 38, -12025)
VectorQuest = Vector3.new(-2020, 38, -12025)
elseif MyLevel == 2225 or MyLevel <= 2249 then
LevelFarm = 24

Name = "Cake Guard [Lv. 2225]"
QuestName = "CakeQuest1"

LevelQuest = 2
NameMon = "Cake Guard"

CFrameMon = CFrame.new(-1651, 38, -12308)
VectorMon = Vector3.new(-1651, 38, -12308)

CFrameQuest = CFrame.new(-2020, 38, -12025)
VectorQuest = Vector3.new(-2020, 38, -12025)
elseif MyLevel == 2250 or MyLevel <= 2274 then
LevelFarm = 25

Name = "Baking Staff [Lv. 2250]"
QuestName = "CakeQuest2"

LevelQuest = 1
NameMon = "Baking Staff"

CFrameMon = CFrame.new(-1870, 38, -12938)
VectorMon = Vector3.new(-1870, 38, -12938)

CFrameQuest = CFrame.new(-1926, 38, -12850)
VectorQuest = Vector3.new(-1926, 38, -12850)
elseif MyLevel == 2275 or MyLevel <= 2299 then
LevelFarm = 26

Name = "Head Baker [Lv. 2275]"
QuestName = "CakeQuest2"

LevelQuest = 2
NameMon = "Head Baker"

CFrameMon = CFrame.new(-1926, 88, -12850)
VectorMon = CFrame.new(-1870, 38, -12938)

CFrameQuest = CFrame.new(-1926, 38, -12850)
VectorQuest = Vector3.new(-1926, 38, -12850)
---------------------------------------------------------------
elseif MyLevel == 2300 or MyLevel <= 2324 then
LevelFarm = 27

Name = "Cocoa Warrior [Lv. 2300]"
QuestName = "ChocQuest1"

LevelQuest = 1
NameMon = "Cocoa Warrior"

CFrameMon = CFrame.new(231, 23, -12194)
VectorMon = CFrame.new(231, 23, -12194)

CFrameQuest = CFrame.new(231, 23, -12194)
VectorQuest = Vector3.new(231, 23, -12194)
elseif MyLevel == 2325 or MyLevel <= 2349 then
LevelFarm = 28

Name = "Chocolate Bar Battler [Lv. 2325]"
QuestName = "ChocQuest1"

LevelQuest = 2
NameMon = "Chocolate Bar Battler"

CFrameMon = CFrame.new(231, 23, -12194)
VectorMon = CFrame.new(231, 23, -12194)

CFrameQuest = CFrame.new(231, 23, -12194)
VectorQuest = Vector3.new(231, 23, -12194)
elseif MyLevel == 2350 or MyLevel <= 2374 then
LevelFarm = 29

Name = "Sweet Thief [Lv. 2350]"
QuestName = "ChocQuest2"

LevelQuest = 1
NameMon = "Sweet Thief"

CFrameMon = CFrame.new(71, 77, -12632)
VectorMon = CFrame.new(71, 77, -12632)

CFrameQuest = CFrame.new(151, 23, -12774)
VectorQuest = Vector3.new(151, 23, -12774)
elseif MyLevel == 2375 or MyLevel <= 2400 then
LevelFarm = 30

Name = "Candy Rebel [Lv. 2375]"
QuestName = "ChocQuest2"

LevelQuest = 2
NameMon = "Candy Rebel"

CFrameMon = CFrame.new(134, 77, -12882)
VectorMon = CFrame.new(134, 77, -12882)

CFrameQuest = CFrame.new(151, 23, -12774)
VectorQuest = Vector3.new(151, 23, -12774)
elseif MyLevel == 2400 or MyLevel <= 2424 then
LevelFarm = 31
Name = "Candy Pirate [Lv. 2400]"
QuestName = "CandyQuest1"
LevelQuest = 1
NameMon = "Candy Pirate"
CFrameQuest = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
VectorQuest = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
VectorMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
elseif MyLevel >= 2425 then
LevelFarm = 32
Name = "Snow Demon [Lv. 2425]"
QuestName = "CandyQuest1"
LevelQuest = 2
NameMon = "Snow Demon"
CFrameQuest = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
VectorQuest = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
VectorMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
end
end
end

function CheckOldQuest(LevelFarm)
if World1 then
if LevelFarm == 1 then -- Bandit
Name = "Bandit [Lv. 5]"
QuestName = "BanditQuest1"

LevelQuest = 1
NameMon = "Bandit"

CFrameMon = CFrame.new(1145, 17, 1634)
VectorMon = Vector3.new(1145, 17, 1634)

CFrameQuest = CFrame.new(1060, 17, 1547)
VectorQuest = Vector3.new(1060, 17, 1547)
elseif LevelFarm == 2 then -- Monkey
Name = "Monkey [Lv. 14]"
QuestName = "JungleQuest"

LevelQuest = 1
NameMon = "Monkey"

CFrameMon = CFrame.new(-1496, 39, 35)
VectorMon = Vector3.new(-1496, 39, 35)

CFrameQuest = CFrame.new(-1602, 37, 152)
VectorQuest = Vector3.new(-1602, 37, 152)
elseif LevelFarm == 3 then -- Gorilla
Name = "Gorilla [Lv. 20]"
QuestName = "JungleQuest"

LevelQuest = 2
NameMon = "Gorilla"

CFrameMon = CFrame.new(-1237, 6, -486)
VectorMon = Vector3.new(-1237, 7, -486)

CFrameQuest = CFrame.new(-1602, 37, 152)
VectorQuest = Vector3.new(-1602, 37, 152)
elseif LevelFarm == 4 then -- Pirate
Name = "Pirate [Lv. 35]"
QuestName = "BuggyQuest1"

LevelQuest = 1
NameMon = "Pirate"

CFrameMon = CFrame.new(-1115, 14, 3938)
VectorMon = Vector3.new(-1115, 14, 3938)

CFrameQuest = CFrame.new(-1140, 5, 3828)
VectorQuest = Vector3.new(-1140, 5, 3828)
elseif LevelFarm == 5 then -- Brute
Name = "Brute [Lv. 45]"
QuestName = "BuggyQuest1"

LevelQuest = 2
NameMon = "Brute"

CFrameMon = CFrame.new(-1145, 15, 4350)
VectorMon = Vector3.new(-1146, 15, 4350)

CFrameQuest = CFrame.new(-1140, 5, 3828)
VectorQuest = Vector3.new(-1140, 5, 3828)
elseif LevelFarm == 6 then -- Desert Bandit
Name = "Desert Bandit [Lv. 60]"
QuestName = "DesertQuest"

LevelQuest = 1
NameMon = "Desert Bandit"

CFrameMon = CFrame.new(932, 7, 4484)
VectorMon = Vector3.new(932, 7, 4484)

CFrameQuest = CFrame.new(897, 7, 4388)
VectorQuest = Vector3.new(897, 7, 4388)
elseif LevelFarm == 7 then -- Desert Officre
Name = "Desert Officer [Lv. 70]"
QuestName = "DesertQuest"

LevelQuest = 2
NameMon = "Desert Officer"

CFrameMon = CFrame.new(1572, 10, 4373)
VectorMon = Vector3.new(1572, 10, 4373)

CFrameQuest = CFrame.new(897, 7, 4388)
VectorQuest = Vector3.new(897, 7, 4388)
elseif LevelFarm == 8 then -- Snow Bandits
Name = "Snow Bandit [Lv. 90]"
QuestName = "SnowQuest"

LevelQuest = 1
NameMon = "Snow Bandits"

CFrameMon = CFrame.new(1289, 150, -1442)
VectorMon = Vector3.new(1289, 106, -1442)

CFrameQuest = CFrame.new(1386, 87, -1297)
VectorQuest = Vector3.new(1386, 87, -1297)
elseif LevelFarm == 9 then -- Snowman
Name = "Snowman [Lv. 100]"
QuestName = "SnowQuest"

LevelQuest = 2
NameMon = "Snowman"

CFrameMon = CFrame.new(1289, 150, -1442)
VectorMon = Vector3.new(1289, 106, -1442)

CFrameQuest = CFrame.new(1386, 87, -1297)
VectorQuest = Vector3.new(1386, 87, -1297)
elseif LevelFarm == 10 then -- Chief Petty Officer
Name = "Chief Petty Officer [Lv. 120]"
QuestName = "MarineQuest2"

LevelQuest = 1
NameMon = "Chief Petty Officer"

CFrameMon = CFrame.new(-4855, 23, 4308)
VectorMon = Vector3.new(-4855, 23, 4308)

CFrameQuest = CFrame.new(-5036, 29, 4325)
VectorQuest = Vector3.new(-5036, 29, 4325)
elseif LevelFarm == 11 then -- Sky Bandit
Name = "Sky Bandit [Lv. 150]"
QuestName = "SkyQuest"

LevelQuest = 1
NameMon = "Sky Bandit"

CFrameMon = CFrame.new(-4981, 278, -2830)
VectorMon = Vector3.new(-4981, 278, -2830)

CFrameQuest = CFrame.new(-4842, 718, -2623)
VectorQuest = Vector3.new(-4842, 718, -2623)
elseif LevelFarm == 12 then -- Dark Master
Name = "Dark Master [Lv. 175]"
QuestName = "SkyQuest"

LevelQuest = 2
NameMon = "Dark Master"

CFrameMon = CFrame.new(-5250, 389, -2272)
VectorMon = Vector3.new(-5250, 389, -2272)

CFrameQuest = CFrame.new(-4842, 718, -2623)
VectorQuest = Vector3.new(-4842, 718, -2623)
elseif LevelFarm == 13 then -- Dark Master
Name = "Prisoner [Lv. 190]"
QuestName = "PrisonerQuest"

LevelQuest = 1
NameMon = "Prisoner"

CFrameMon = CFrame.new(5411, 96, 690)
VectorMon = Vector3.new(5411, 96, 690)

CFrameQuest = CFrame.new(5308, 2, 474)
VectorQuest = Vector3.new(5308, 2, 474)
elseif LevelFarm == 14 then -- Dark Master
Name = "Dangerous Prisoner [Lv. 210]"
QuestName = "PrisonerQuest"

LevelQuest = 2
NameMon = "Dangerous Prisoner"

CFrameMon = CFrame.new(5411, 96, 690)
VectorMon = Vector3.new(5411, 96, 690)

CFrameQuest = CFrame.new(5308, 2, 474)
VectorQuest = Vector3.new(5308, 2, 474)
elseif LevelFarm == 15 then -- Toga Warrior
Name = "Toga Warrior [Lv. 250]"
QuestName = "ColosseumQuest"

LevelQuest = 1
NameMon = "Toga Warrior"

CFrameMon = CFrame.new(-1770, 8, -2777)
VectorMon = Vector3.new(-1770, 8, -2777)

CFrameQuest = CFrame.new(-1576, 8, -2985)
VectorQuest = Vector3.new(-1576, 8, -2985)
elseif LevelFarm == 16 then -- Military Soldier
Name = "Military Soldier [Lv. 300]"
QuestName = "MagmaQuest"

LevelQuest = 1
NameMon = "Military Soldier"

CFrameMon = CFrame.new(-5408, 11, 8447)
VectorMon = Vector3.new(-5408, 11, 8447)

CFrameQuest = CFrame.new(-5316, 12, 8517)
VectorQuest = Vector3.new(-5316, 12, 8517)
elseif LevelFarm == 17 then -- Military Spy
Name = "Military Spy [Lv. 325]"
QuestName = "MagmaQuest"

LevelQuest = 2
NameMon = "Military Spy"

CFrameMon = CFrame.new(-5815, 84, 8820)
VectorMon = Vector3.new(-5815, 84, 8820)

CFrameQuest = CFrame.new(-5316, 12, 8517)
VectorQuest = Vector3.new(-5316, 12, 8517)
elseif LevelFarm == 18 then -- Fishman Warrior
Name = "Fishman Warrior [Lv. 375]"
QuestName = "FishmanQuest"

LevelQuest = 1
NameMon = "Fishman Warrior"

CFrameMon = CFrame.new(60859, 19, 1501)
VectorMon = Vector3.new(60859, 19, 1501)

CFrameQuest = CFrame.new(61123, 19, 1569)
VectorQuest = Vector3.new(61123, 19, 1569)
elseif LevelFarm == 19 then -- Fishman Commando
Name = "Fishman Commando [Lv. 400]"
QuestName = "FishmanQuest"

LevelQuest = 2
NameMon = "Fishman Commando"

CFrameMon = CFrame.new(61891, 19, 1470)
VectorMon = Vector3.new(61891, 19, 1470)

CFrameQuest = CFrame.new(61123, 19, 1569)
VectorQuest = Vector3.new(61123, 19, 1569)
elseif LevelFarm == 20 then -- God's Guards
Name = "God's Guard [Lv. 450]"
QuestName = "SkyExp1Quest"

LevelQuest = 1
NameMon = "God's Guards"

CFrameMon = CFrame.new(-4698, 845, -1912)
VectorMon = Vector3.new(-4698, 845, -1912)

CFrameQuest = CFrame.new(-4722, 845, -1954)
VectorQuest = Vector3.new(-4722, 846, -1954)
elseif LevelFarm == 21 then -- Shandas
Name = "Shanda [Lv. 475]"
QuestName = "SkyExp1Quest"

LevelQuest = 2
NameMon = "Shandas"

CFrameMon = CFrame.new(-7685, 5567, -502)
VectorMon = Vector3.new(-7685, 5567, -502)

CFrameQuest = CFrame.new(-7862, 5546, -380)
VectorQuest = Vector3.new(-7862, 5546, -380)
elseif LevelFarm == 22 then -- Royal Squad
Name = "Royal Squad [Lv. 525]"
QuestName = "SkyExp2Quest"

LevelQuest = 1
NameMon = "Royal Squad"

CFrameMon = CFrame.new(-7670, 5607, -1460)
VectorMon = Vector3.new(-7670, 5607, -1460)

CFrameQuest = CFrame.new(-7904, 5636, -1412)
VectorQuest = Vector3.new(-7904, 5636, -1412)
elseif LevelFarm == 23 then -- Royal Soldier
Name = "Royal Soldier [Lv. 550]"
QuestName = "SkyExp2Quest"

LevelQuest = 2
NameMon = "Royal Soldier"

CFrameMon = CFrame.new(-7828, 5607, -1744)
VectorMon = Vector3.new(-7828, 5607, -1744)

CFrameQuest = CFrame.new(-7904, 5636, -1412)
VectorQuest = Vector3.new(-7904, 5636, -1412)
elseif LevelFarm == 24 then -- Galley Pirate
Name = "Galley Pirate [Lv. 625]"
QuestName = "FountainQuest"

LevelQuest = 1
NameMon = "Galley Pirate"

CFrameMon = CFrame.new(5589, 45, 3996)
VectorMon = Vector3.new(5589, 45, 3996)

CFrameQuest = CFrame.new(5256, 39, 4050)
VectorQuest = Vector3.new(5256, 39, 4050)
elseif LevelFarm == 25 then -- Galley Captain
Name = "Galley Captain [Lv. 650]"
QuestName = "FountainQuest"

LevelQuest = 2
NameMon = "Galley Captain"

CFrameMon = CFrame.new(5649, 39, 4936)
VectorMon = Vector3.new(5649, 39, 4936)

CFrameQuest = CFrame.new(5256, 39, 4050)
VectorQuest = Vector3.new(5256, 39, 4050)
end
end
if World2 then
if LevelFarm == 1 then -- Raider [Lv. 700]
Name = "Raider [Lv. 700]"
QuestName = "Area1Quest"

LevelQuest = 1
NameMon = "Raider"

CFrameQuest = CFrame.new(-425, 73, 1837)
VectorQuest = Vector3.new(-425, 73, 1837)

CFrameMon = CFrame.new(-746, 39, 2390)
VectorMon = Vector3.new(-746, 39, 2389)
elseif LevelFarm == 2 then -- Mercenary [Lv. 725]
Name = "Mercenary [Lv. 725]"
QuestName = "Area1Quest"

LevelQuest = 2
NameMon = "Mercenary"

CFrameQuest = CFrame.new(-425, 73, 1837)
VectorQuest = Vector3.new(-425, 73, 1837)

CFrameMon = CFrame.new(-874, 141, 1312)
VectorMon = Vector3.new(-874, 141, 1312)
elseif LevelFarm == 3 then -- Swan Pirate [Lv. 775]
Name = "Swan Pirate [Lv. 775]"
QuestName = "Area2Quest"

LevelQuest = 1
NameMon = "Swan Pirate"

CFrameQuest = CFrame.new(634, 73, 918)
VectorQuest = Vector3.new(634, 73, 918)

CFrameMon = CFrame.new(878, 122, 1235)
VectorMon = Vector3.new(878, 122, 1235)
elseif LevelFarm == 4 then -- Factory Staff [Lv. 800]
Name = "Factory Staff [Lv. 800]"
QuestName = "Area2Quest"

LevelQuest = 2
NameMon = "Factory Staff"

CFrameQuest = CFrame.new(634, 73, 918)
VectorQuest = Vector3.new(634, 73, 918)

CFrameMon = CFrame.new(295, 73, -56)
VectorMon = Vector3.new(295, 73, -56)
elseif LevelFarm == 5 then -- Marine Lieutenant [Lv. 875]
Name = "Marine Lieutenant [Lv. 875]"
QuestName = "MarineQuest3"

LevelQuest = 1
NameMon = "Marine Lieutenant"

CFrameMon = CFrame.new(-2806, 73, -3038)
VectorMon = Vector3.new(-2806, 73, -3038)

CFrameQuest = CFrame.new(-2443, 73, -3219)
VectorQuest = Vector3.new(-2443, 73, -3219)
elseif LevelFarm == 6 then -- Marine Captain [Lv. 900]
Name = "Marine Captain [Lv. 900]"
QuestName = "MarineQuest3"

LevelQuest = 2
NameMon = "Marine Captain"

CFrameMon = CFrame.new(-1869, 73, -3320)
VectorMon = Vector3.new(-1869, 73, -3320)

CFrameQuest = CFrame.new(-2443, 73, -3219)
VectorQuest = Vector3.new(-2443, 73, -3219)
elseif LevelFarm == 7 then -- Zombie [Lv. 950]
Name = "Zombie [Lv. 950]"
QuestName = "ZombieQuest"

LevelQuest = 1
NameMon = "Zombie"

CFrameMon = CFrame.new(-5736, 126, -728)
VectorMon = Vector3.new(-5736, 126, -728)

CFrameQuest = CFrame.new(-5494, 49, -795)
VectorQuest = Vector3.new(-5494, 49, -794)
elseif LevelFarm == 8 then -- Vampire [Lv. 975]
Name = "Vampire [Lv. 975]"
QuestName = "ZombieQuest"

LevelQuest = 2
NameMon = "Vampire"

CFrameMon = CFrame.new(-6033, 7, -1317)
VectorMon = Vector3.new(-6033, 7, -1317)

CFrameQuest = CFrame.new(-5494, 49, -795)
VectorQuest = Vector3.new(-5494, 49, -795)
elseif LevelFarm == 9 then -- Snow Trooper [Lv. 1000] **
Name = "Snow Trooper [Lv. 1000]"
QuestName = "SnowMountainQuest"

LevelQuest = 1
NameMon = "Snow Trooper"

CFrameMon = CFrame.new(478, 402, -5362)
VectorMon = Vector3.new(478, 402, -5362)

CFrameQuest = CFrame.new(605, 402, -5371)
VectorQuest = Vector3.new(605, 402, -5371)
elseif LevelFarm == 10 then -- Winter Warrior [Lv. 1050]
Name = "Winter Warrior [Lv. 1050]"
QuestName = "SnowMountainQuest"

LevelQuest = 2
NameMon = "Winter Warrior"

CFrameMon = CFrame.new(1157, 430, -5188)
VectorMon = Vector3.new(1157, 430, -5188)

CFrameQuest = CFrame.new(605, 402, -5371)
VectorQuest = Vector3.new(605, 402, -5371)
elseif LevelFarm == 11 then -- Lab Subordinate [Lv. 1100]
Name = "Lab Subordinate [Lv. 1100]"
QuestName = "IceSideQuest"

LevelQuest = 1
NameMon = "Lab Subordinate"

CFrameMon = CFrame.new(-5782, 42, -4484)
VectorMon = Vector3.new(-5782, 42, -4484)

CFrameQuest = CFrame.new(-6060, 16, -4905)
VectorQuest = Vector3.new(-6060, 16, -4905)
elseif LevelFarm == 12 then -- Horned Warrior [Lv. 1125]
Name = "Horned Warrior [Lv. 1125]"
QuestName = "IceSideQuest"

LevelQuest = 2
NameMon = "Horned Warrior"

CFrameMon = CFrame.new(-6406, 24, -5805)
VectorMon = Vector3.new(-6406, 24, -5805)

CFrameQuest = CFrame.new(-6060, 16, -4905)
VectorQuest = Vector3.new(-6060, 16, -4905)
elseif LevelFarm == 13 then -- Magma Ninja [Lv. 1175]
Name = "Magma Ninja [Lv. 1175]"
QuestName = "FireSideQuest"
LevelQuest = 1
NameMon = "Magma Ninja"

CFrameMon = CFrame.new(-5428, 78, -5959)
VectorMon = Vector3.new(-5428, 78, -5959)

CFrameQuest = CFrame.new(-5430, 16, -5295)
VectorQuest = Vector3.new(-5430, 16, -5296)
elseif LevelFarm == 14 then -- Lava Pirate [Lv. 1200]
Name = "Lava Pirate [Lv. 1200]"
QuestName = "FireSideQuest"

LevelQuest = 2
NameMon = "Lava Pirate"

CFrameMon = CFrame.new(-5270, 42, -4800)
VectorMon = Vector3.new(-5270, 42, -4800)

CFrameQuest = CFrame.new(-5430, 16, -5295)
VectorQuest = Vector3.new(-5430, 16, -5296)
elseif LevelFarm == 15 then -- Ship Deckhand [Lv. 1250]
Name = "Ship Deckhand [Lv. 1250]"
QuestName = "ShipQuest1"

LevelQuest = 1
NameMon = "Ship Deckhand"

CFrameMon = CFrame.new(1198, 126, 33031)
VectorMon = Vector3.new(1198, 126, 33031)

CFrameQuest = CFrame.new(1038, 125, 32913)
VectorQuest = Vector3.new(1038, 125, 32913)
elseif LevelFarm == 16 then -- Ship Engineer [Lv. 1275]
Name = "Ship Engineer [Lv. 1275]"
QuestName = "ShipQuest1"

LevelQuest = 2
NameMon = "Ship Engineer"

CFrameMon = CFrame.new(918, 44, 32787)
VectorMon = Vector3.new(918, 44, 32787)

CFrameQuest = CFrame.new(1038, 125, 32913)
VectorQuest = Vector3.new(1038, 125, 32913)
elseif LevelFarm == 17 then -- Ship Steward [Lv. 1300]
Name = "Ship Steward [Lv. 1300]"
QuestName = "ShipQuest2"

LevelQuest = 1
NameMon = "Ship Steward"

CFrameMon = CFrame.new(915, 130, 33419)
VectorMon = Vector3.new(915, 130, 33419)

CFrameQuest = CFrame.new(969, 125, 33245)
VectorQuest = Vector3.new(969, 125, 33245)
elseif LevelFarm == 18 then -- Ship Officer [Lv. 1325]
Name = "Ship Officer [Lv. 1325]"
QuestName = "ShipQuest2"

LevelQuest = 2
NameMon = "Ship Officer"

CFrameMon = CFrame.new(916, 181, 33335)
VectorMon = Vector3.new(916, 181, 33335)

CFrameQuest = CFrame.new(969, 125, 33245)
VectorQuest = Vector3.new(969, 125, 33245)
elseif LevelFarm == 19 then -- Arctic Warrior [Lv. 1350]
Name = "Arctic Warrior [Lv. 1350]"
QuestName = "FrostQuest"

LevelQuest = 1
NameMon = "Arctic Warrior"

CFrameMon = CFrame.new(6038, 29, -6231)
VectorMon = Vector3.new(6038, 29, -6231)

VectorQuest = Vector3.new(5669, 28, -6482)
CFrameQuest = CFrame.new(5669, 28, -6482)
elseif LevelFarm == 20 then -- Snow Lurker [Lv. 1375]
Name = "Snow Lurker [Lv. 1375]"
QuestName = "FrostQuest"

LevelQuest = 2
NameMon = "Snow Lurker"

CFrameMon = CFrame.new(5560, 42, -6826)
VectorMon = Vector3.new(5560, 42, -6826)

VectorQuest = Vector3.new(5669, 28, -6482)
CFrameQuest = CFrame.new(5669, 28, -6482)
elseif LevelFarm == 21 then -- Sea Soldier [Lv. 1425]
Name = "Sea Soldier [Lv. 1425]"
QuestName = "ForgottenQuest"

LevelQuest = 1
NameMon = "Sea Soldier"

CFrameMon = CFrame.new(-3022, 16, -9722)
VectorMon = Vector3.new(-3022, 16, -9722)

CFrameQuest = CFrame.new(-3054, 237, -10148)
VectorQuest = Vector3.new(-3054, 237, -10148)
elseif LevelFarm == 22 then -- Water Fighter [Lv. 1450]
Name = "Water Fighter [Lv. 1450]"
QuestName = "ForgottenQuest"

LevelQuest = 2
NameMon = "Water Fighter"

CFrameMon = CFrame.new(-3385, 239, -10542)
VectorMon = Vector3.new(-3385, 239, -10542)

CFrameQuest = CFrame.new(-3054, 237, -10148)
VectorQuest = Vector3.new(-3054, 237, -10148)
end
end
if World3 then
if LevelFarm == 1 then
Name = "Pirate Millionaire [Lv. 1500]"
QuestName = "PiratePortQuest"

LevelQuest = 1
NameMon = "Pirate"

CFrameMon = CFrame.new(-373, 75, 5550)
VectorMon = Vector3.new(-373, 75, 5550)

CFrameQuest = CFrame.new(-288, 44, 5576)
VectorQuest = Vector3.new(-288, 44, 5576)
elseif LevelFarm == 2 then
Name = "Pistol Billionaire [Lv. 1525]"
QuestName = "PiratePortQuest"

LevelQuest = 2
NameMon = "Pistol"

CFrameMon = CFrame.new(-469, 74, 5904)
VectorMon = Vector3.new(-469, 74, 5904)

CFrameQuest = CFrame.new(-288, 44, 5576)
VectorQuest = Vector3.new(-288, 44, 5576)
elseif LevelFarm == 3 then
Name = "Dragon Crew Warrior [Lv. 1575]"
QuestName = "AmazonQuest"

LevelQuest = 1
NameMon = "Warrior"

CFrameMon = CFrame.new(6339, 52, -1213)
VectorMon = Vector3.new(6338, 52, -1213)

CFrameQuest = CFrame.new(5835, 52, -1105)
VectorQuest = Vector3.new(5835, 52, -1105)
elseif LevelFarm == 4 then
Name = "Dragon Crew Archer [Lv. 1600]"
QuestName = "AmazonQuest"

LevelQuest = 2
NameMon = "Archer"

CFrameMon = CFrame.new(6594, 383, 139)
VectorMon = Vector3.new(6594, 383, 139)

CFrameQuest = CFrame.new(5835, 52, -1105)
VectorQuest = Vector3.new(5835, 52, -1105)
elseif LevelFarm == 5 then
Name = "Female Islander [Lv. 1625]"
QuestName = "AmazonQuest2"

LevelQuest = 1
NameMon = "Female"

CFrameMon = CFrame.new(5308, 819, 1047)
VectorMon = Vector3.new(5308, 819, 1047)

CFrameQuest = CFrame.new(5443, 602, 751)
VectorQuest = Vector3.new(5443, 602, 751)
elseif LevelFarm == 6 then
Name = "Giant Islander [Lv. 1650]"
QuestName = "AmazonQuest2"

LevelQuest = 2
NameMon = "Giant Islanders"

CFrameMon = CFrame.new(4951, 602, -68)
VectorMon = Vector3.new(4951, 602, -68)

CFrameQuest = CFrame.new(5443, 602, 751)
VectorQuest = Vector3.new(5443, 602, 751)
elseif LevelFarm == 7 then
Name = "Marine Commodore [Lv. 1700]"
QuestName = "MarineTreeIsland"

LevelQuest = 1
NameMon = "Marine Commodore"

CFrameMon = CFrame.new(2447, 73, -7470)
VectorMon = Vector3.new(2447, 73, -7470)

CFrameQuest = CFrame.new(2180, 29, -6737)
VectorQuest = Vector3.new(2180, 29, -6737)
elseif LevelFarm == 8 then
Name = "Marine Rear Admiral [Lv. 1725]"
QuestName = "MarineTreeIsland"

LevelQuest = 2
NameMon = "Marine Rear Admiral"

CFrameMon = CFrame.new(3671, 161, -6932)
VectorMon = Vector3.new(3671, 161, -6932)

CFrameQuest = CFrame.new(2180, 29, -6737)
VectorQuest = Vector3.new(2180, 29, -6737)
elseif LevelFarm == 9 then
Name = "Fishman Raider [Lv. 1775]"
QuestName = "DeepForestIsland3"

LevelQuest = 1
NameMon = "Fishman Raider"

CFrameMon = CFrame.new(-10560, 332, -8466)
VectorMon = Vector3.new(-10560, 332, -8466)

CFrameQuest = CFrame.new(-10584, 332, -8758)
VectorQuest = Vector3.new(-10584, 332, -8758)
elseif LevelFarm == 10 then
Name = "Fishman Captain [Lv. 1800]"
QuestName = "DeepForestIsland3"

LevelQuest = 2
NameMon = "Fishman Captain"

CFrameMon = CFrame.new(-10993, 332, -8940)
VectorMon = Vector3.new(-10993, 332, -8940)

CFrameQuest = CFrame.new(-10584, 332, -8758)
VectorQuest = Vector3.new(-10584, 332, -8758)
elseif LevelFarm == 11 then
Name = "Forest Pirate [Lv. 1825]"
QuestName = "DeepForestIsland"

LevelQuest = 1
NameMon = "Forest Pirate"

CFrameMon = CFrame.new(-13479, 333, -7905)
VectorMon = Vector3.new(-13479, 333, -7905)

CFrameQuest = CFrame.new(-13232, 333, -7627)
VectorQuest = Vector3.new(-13232, 333, -7627)
elseif LevelFarm == 12 then
Name = "Mythological Pirate [Lv. 1850]"
QuestName = "DeepForestIsland"

LevelQuest = 2
NameMon = "Mythological Pirate"

CFrameMon = CFrame.new(-13545, 470, -6917)
VectorMon = Vector3.new(-13545, 470, -6917)

CFrameQuest = CFrame.new(-13232, 333, -7627)
VectorQuest = Vector3.new(-13232, 333, -7627)
elseif LevelFarm == 13 then
Name = "Jungle Pirate [Lv. 1900]"
QuestName = "DeepForestIsland2"

LevelQuest = 1
NameMon = "Jungle Pirate"

CFrameMon = CFrame.new(-12107, 332, -10549)
VectorMon = Vector3.new(-12106, 332, -10549)

CFrameQuest = CFrame.new(-12684, 391, -9902)
VectorQuest = Vector3.new(-12684, 391, -9902)
elseif LevelFarm == 14 then
Name = "Musketeer Pirate [Lv. 1925]"
QuestName = "DeepForestIsland2"

LevelQuest = 2
NameMon = "Musketeer Pirate"

CFrameMon = CFrame.new(-13286, 392, -9769)
VectorMon = Vector3.new(-13286, 392, -9768)

CFrameQuest = CFrame.new(-12684, 391, -9902)
VectorQuest = Vector3.new(-12684, 391, -9902)
elseif LevelFarm == 15 then
Name = "Reborn Skeleton [Lv. 1975]"
QuestName = "HauntedQuest1"

LevelQuest = 1
NameMon = "Reborn Skeleton"

CFrameMon = CFrame.new(-8760, 142, 6039)
VectorMon = Vector3.new(-8760, 142, 6039)

CFrameQuest = CFrame.new(-9482, 142, 5567)
VectorQuest = Vector3.new(-9482, 142, 5567)
elseif LevelFarm == 16 then
Name = "Living Zombie [Lv. 2000]"
QuestName = "HauntedQuest1"

LevelQuest = 2
NameMon = "Living Zombie"

CFrameMon = CFrame.new(-10144, 140, 5932)
VectorMon = Vector3.new(-10144, 140, 5932)

CFrameQuest = CFrame.new(-9482, 142, 5567)
VectorQuest = Vector3.new(-9482, 142, 5567)
elseif LevelFarm == 17 then
Name = "Demonic Soul [Lv. 2025]"
QuestName = "HauntedQuest2"

LevelQuest = 1
NameMon = "Demonic Soul"

CFrameMon = CFrame.new(-9507, 172, 6158)
VectorMon = Vector3.new(-9506, 172, 6158)

CFrameQuest = CFrame.new(-9513, 172, 6079)
VectorQuest = Vector3.new(-9513, 172, 6079)
elseif LevelFarm == 18 then
Name = "Posessed Mummy [Lv. 2050]"
QuestName = "HauntedQuest2"

LevelQuest = 2
NameMon = "Posessed Mummy"

CFrameMon = CFrame.new(-9577, 6, 6223)
VectorMon = Vector3.new(-9577, 6, 6223)

CFrameQuest = CFrame.new(-9513, 172, 6079)
VectorQuest = Vector3.new(-9513, 172, 6079)

elseif LevelFarm == 19 then
Name = "Peanut Scout [Lv. 2075]"
QuestName = "NutsIslandQuest"

LevelQuest = 1
NameMon = "Peanut Scout"

CFrameMon = CFrame.new(-2124, 123, -10435)
VectorMon = Vector3.new(-2124, 123, -10435)

CFrameQuest = CFrame.new(-2104, 38, -10192)
VectorQuest = Vector3.new(-2104, 38, -10192)
elseif LevelFarm == 20 then
Name = "Peanut President [Lv. 2100]"
QuestName = "NutsIslandQuest"

LevelQuest = 2
NameMon = "Peanut President"

CFrameMon = CFrame.new(-2124, 123, -10435)
VectorMon = Vector3.new(-2124, 123, -10435)

CFrameQuest = CFrame.new(-2104, 38, -10192)
VectorQuest = Vector3.new(-2104, 38, -10192)
elseif LevelFarm == 21 then
Name = "Ice Cream Chef [Lv. 2125]"
QuestName = "IceCreamIslandQuest"

LevelQuest = 1
NameMon = "Ice Cream Chef"

CFrameMon = CFrame.new(-641, 127, -11062)
VectorMon = Vector3.new(-641, 127, -11062)

CFrameQuest = CFrame.new(-822, 66, -10965)
VectorQuest = Vector3.new(-822, 66, -10965)
elseif LevelFarm == 22 then
Name = "Ice Cream Commander [Lv. 2150]"
QuestName = "IceCreamIslandQuest"

LevelQuest = 2
NameMon = "Ice Cream Commander"

CFrameMon = CFrame.new(-641, 127, -11062)
VectorMon = Vector3.new(-641, 127, -11062)

CFrameQuest = CFrame.new(-822, 66, -10965)
VectorQuest = Vector3.new(-822, 66, -10965)
---------------------------------------------------------------
elseif LevelFarm == 23 then
Name = "Cookie Crafter [Lv. 2200]"
QuestName = "CakeQuest1"

LevelQuest = 1
NameMon = "Cookie Crafter"

CFrameMon = CFrame.new(-2365, 38, -12099)
VectorMon = Vector3.new(-2365, 38, -12099)

CFrameQuest = CFrame.new(-2020, 38, -12025)
VectorQuest = Vector3.new(-2020, 38, -12025)
elseif LevelFarm == 24 then
Name = "Cake Guard [Lv. 2225]"
QuestName = "CakeQuest1"

LevelQuest = 2
NameMon = "Cake Guard"

CFrameMon = CFrame.new(-1651, 38, -12308)
VectorMon = Vector3.new(-1651, 38, -12308)

CFrameQuest = CFrame.new(-2020, 38, -12025)
VectorQuest = Vector3.new(-2020, 38, -12025)
elseif LevelFarm == 25 then
Name = "Baking Staff [Lv. 2250]"
QuestName = "CakeQuest2"

LevelQuest = 1
NameMon = "Baking Staff"

CFrameMon = CFrame.new(-1870, 38, -12938)
VectorMon = Vector3.new(-1870, 38, -12938)

CFrameQuest = CFrame.new(-1926, 38, -12850)
VectorQuest = Vector3.new(-1926, 38, -12850)
elseif LevelFarm == 26 then
Name = "Head Baker [Lv. 2275]"
QuestName = "CakeQuest2"

LevelQuest = 2
NameMon = "Head Baker"

CFrameMon = CFrame.new(-1926, 88, -12850)
VectorMon = CFrame.new(-1870, 38, -12938)

CFrameQuest = CFrame.new(-1926, 38, -12850)
VectorQuest = Vector3.new(-1926, 38, -12850)
---------------------------------------------------------------
elseif LevelFarm == 27 then
Name = "Cocoa Warrior [Lv. 2300]"
QuestName = "ChocQuest1"

LevelQuest = 1
NameMon = "Cocoa Warrior"

CFrameMon = CFrame.new(231, 23, -12194)
VectorMon = CFrame.new(231, 23, -12194)

CFrameQuest = CFrame.new(231, 23, -12194)
VectorQuest = Vector3.new(231, 23, -12194)
elseif LevelFarm == 28 then
Name = "Chocolate Bar Battler [Lv. 2325]"
QuestName = "ChocQuest1"

LevelQuest = 2
NameMon = "Chocolate Bar Battler"

CFrameMon = CFrame.new(231, 23, -12194)
VectorMon = CFrame.new(231, 23, -12194)

CFrameQuest = CFrame.new(231, 23, -12194)
VectorQuest = Vector3.new(231, 23, -12194)
elseif LevelFarm == 29 then
Name = "Sweet Thief [Lv. 2350]"
QuestName = "ChocQuest2"

LevelQuest = 1
NameMon = "Sweet Thief"

CFrameMon = CFrame.new(71, 77, -12632)
VectorMon = CFrame.new(71, 77, -12632)

CFrameQuest = CFrame.new(151, 23, -12774)
VectorQuest = Vector3.new(151, 23, -12774)
elseif LevelFarm == 30 then
Name = "Candy Rebel [Lv. 2375]"
QuestName = "ChocQuest2"

LevelQuest = 2
NameMon = "Candy Rebel"

CFrameMon = CFrame.new(134, 77, -12882)
VectorMon = CFrame.new(134, 77, -12882)

CFrameQuest = CFrame.new(151, 23, -12774)
VectorQuest = Vector3.new(151, 23, -12774)
elseif LevelFarm == 31 then
LevelFarm = 31
Name = "Candy Pirate [Lv. 2400]"
QuestName = "CandyQuest1"
LevelQuest = 1
NameMon = "Candy Pirate"
CFrameQuest = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
VectorQuest = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
VectorMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
elseif LevelFarm == 32 then
LevelFarm = 32
Name = "Snow Demon [Lv. 2425]"
QuestName = "CandyQuest1"
LevelQuest = 2
NameMon = "Snow Demon"
CFrameQuest = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
VectorQuest = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
VectorMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
end
end
end

function CheckBossQuest()
if _G.Settings.Boss["Select Boss"] == "Saber Expert [Lv. 200] [Boss]" then
MsBoss = "Saber Expert [Lv. 200] [Boss]"
NameBoss = "Saber Expert"
CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
elseif _G.Settings.Boss["Select Boss"] == "The Saw [Lv. 100] [Boss]" then
MsBoss = "The Saw [Lv. 100] [Boss]"
NameBoss = "The Saw"
CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
elseif _G.Settings.Boss["Select Boss"] == "Greybeard [Lv. 750] [Raid Boss]" then
MsBoss = "Greybeard [Lv. 750] [Raid Boss]"
NameBoss = "Greybeard"
CFrameBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666, -0.433646321, -1.03394289e-08, 0.901083171, -3.0443168e-08, 1, -3.17633075e-09, -0.901083171, -2.88092288e-08, -0.433646321)
elseif _G.Settings.Boss["Select Boss"] == "The Gorilla King [Lv. 25] [Boss]" then
MsBoss = "The Gorilla King [Lv. 25] [Boss]"
NameBoss = "The Gorilla King"
NameQuestBoss = "JungleQuest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
elseif _G.Settings.Boss["Select Boss"] == "Bobby [Lv. 55] [Boss]" then
MsBoss = "Bobby [Lv. 55] [Boss]"
NameBoss = "Bobby"
NameQuestBoss = "BuggyQuest1"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
elseif _G.Settings.Boss["Select Boss"] == "Yeti [Lv. 110] [Boss]" then
MsBoss = "Yeti [Lv. 110] [Boss]"
NameBoss = "Yeti"
NameQuestBoss = "SnowQuest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
elseif _G.Settings.Boss["Select Boss"] == "Mob Leader [Lv. 120] [Boss]" then
MsBoss = "Mob Leader [Lv. 120] [Boss]"
NameBoss = "Mob Leader"
CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.92824)
elseif _G.Settings.Boss["Select Boss"] == "Vice Admiral [Lv. 130] [Boss]" then
MsBoss = "Vice Admiral [Lv. 130] [Boss]"
NameBoss = "Vice Admiral"
NameQuestBoss = "MarineQuest2"
LevelQuestBoss = 2
CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
elseif _G.Settings.Boss["Select Boss"] == "Warden [Lv. 175] [Boss]" then
MsBoss = "Warden [Lv. 175] [Boss]"
NameBoss = "Warden"
NameQuestBoss = "ImpelQuest"
LevelQuestBoss = 1
CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
elseif _G.Settings.Boss["Select Boss"] == "Chief Warden [Lv. 200] [Boss]" then
MsBoss = "Chief Warden [Lv. 200] [Boss]"
NameBoss = "Chief Warden"
NameQuestBoss = "ImpelQuest"
LevelQuestBoss = 2
CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
elseif _G.Settings.Boss["Select Boss"] == "Swan [Lv. 225] [Boss]" then
MsBoss = "Swan [Lv. 225] [Boss]"
NameBoss = "Swan"
NameQuestBoss = "ImpelQuest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
elseif _G.Settings.Boss["Select Boss"] == "Magma Admiral [Lv. 350] [Boss]" then
MsBoss = "Magma Admiral [Lv. 350] [Boss]"
NameBoss = "Magma Admiral"
NameQuestBoss = "MagmaQuest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
elseif _G.Settings.Boss["Select Boss"] == "Fishman Lord [Lv. 425] [Boss]" then
MsBoss = "Fishman Lord [Lv. 425] [Boss]"
NameBoss = "Fishman Lord"
NameQuestBoss = "FishmanQuest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
elseif _G.Settings.Boss["Select Boss"] == "Wysper [Lv. 500] [Boss]" then
MsBoss = "Wysper [Lv. 500] [Boss]"
NameBoss = "Wysper"
NameQuestBoss = "SkyExp1Quest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
elseif _G.Settings.Boss["Select Boss"] == "Thunder God [Lv. 575] [Boss]" then
MsBoss = "Thunder God [Lv. 575] [Boss]"
NameBoss = "Thunder God"
NameQuestBoss = "SkyExp2Quest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
elseif _G.Settings.Boss["Select Boss"] == "Cyborg [Lv. 675] [Boss]" then
MsBoss = "Cyborg [Lv. 675] [Boss]"
NameBoss = "Cyborg"
NameQuestBoss = "FountainQuest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
-- New World
elseif _G.Settings.Boss["Select Boss"] == "Diamond [Lv. 750] [Boss]" then
MsBoss = "Diamond [Lv. 750] [Boss]"
NameBoss = "Diamond"
NameQuestBoss = "Area1Quest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
elseif _G.Settings.Boss["Select Boss"] == "Jeremy [Lv. 850] [Boss]" then
MsBoss = "Jeremy [Lv. 850] [Boss]"
NameBoss = "Jeremy"
NameQuestBoss = "Area2Quest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
elseif _G.Settings.Boss["Select Boss"] == "Fajita [Lv. 925] [Boss]" then
MsBoss = "Fajita [Lv. 925] [Boss]"
NameBoss = "Fajita"
NameQuestBoss = "MarineQuest3"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
elseif _G.Settings.Boss["Select Boss"] == "Don Swan [Lv. 1000] [Boss]" then
MsBoss = "Don Swan [Lv. 1000] [Boss]"
NameBoss = "Don Swan"
CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
elseif _G.Settings.Boss["Select Boss"] == "Smoke Admiral [Lv. 1150] [Boss]" then
MsBoss = "Smoke Admiral [Lv. 1150] [Boss]"
NameBoss = "Smoke Admiral"
NameQuestBoss = "IceSideQuest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
elseif _G.Settings.Boss["Select Boss"] == "Cursed Captain [Lv. 1325] [Raid Boss]" then
MsBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
NameBoss = "Cursed Captain"
CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
elseif _G.Settings.Boss["Select Boss"] == "Darkbeard [Lv. 1000] [Raid Boss]" then
MsBoss = "Darkbeard [Lv. 1000] [Raid Boss]"
NameBoss = "Darkbeard"
CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
elseif _G.Settings.Boss["Select Boss"] == "Order [Lv. 1250] [Raid Boss]" then
MsBoss = "Order [Lv. 1250] [Raid Boss]"
NameBoss = "Order"
CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
elseif _G.Settings.Boss["Select Boss"] == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
MsBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
NameBoss = "Awakened Ice Admiral"
NameQuestBoss = "FrostQuest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
elseif _G.Settings.Boss["Select Boss"] == "Tide Keeper [Lv. 1475] [Boss]" then
MsBoss = "Tide Keeper [Lv. 1475] [Boss]"
NameBoss = "Tide Keeper"
NameQuestBoss = "ForgottenQuest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
-- Thire World
elseif _G.Settings.Boss["Select Boss"] == "Stone [Lv. 1550] [Boss]" then
MsBoss = "Stone [Lv. 1550] [Boss]"
NameBoss = "Stone"
NameQuestBoss = "PiratePortQuest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-290, 44, 5577)
CFrameBoss = CFrame.new(-1085, 40, 6779)
elseif _G.Settings.Boss["Select Boss"] == "Island Empress [Lv. 1675] [Boss]" then
MsBoss = "Island Empress [Lv. 1675] [Boss]"
NameBoss = "Island Empress"
NameQuestBoss = "AmazonQuest2"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(5443, 602, 752)
CFrameBoss = CFrame.new(5659, 602, 244)
elseif _G.Settings.Boss["Select Boss"] == "Kilo Admiral [Lv. 1750] [Boss]" then
MsBoss = "Kilo Admiral [Lv. 1750] [Boss]"
NameBoss = "Kilo Admiral"
NameQuestBoss = "MarineTreeIsland"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(2178, 29, -6737)
CFrameBoss = CFrame.new(2846, 433, -7100)
elseif _G.Settings.Boss["Select Boss"] == "Captain Elephant [Lv. 1875] [Boss]" then
MsBoss = "Captain Elephant [Lv. 1875] [Boss]"
NameBoss = "Captain Elephant"
NameQuestBoss = "DeepForestIsland"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-13232, 333, -7631)
CFrameBoss = CFrame.new(-13221, 325, -8405)
elseif _G.Settings.Boss["Select Boss"] == "Beautiful Pirate [Lv. 1950] [Boss]" then
MsBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
NameBoss = "Beautiful Pirate"
NameQuestBoss = "DeepForestIsland2"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-12686, 391, -9902)
CFrameBoss = CFrame.new(5182, 23, -20)
elseif _G.Settings.Boss["Select Boss"] == "Cake Queen [Lv. 2175] [Boss]" then
MsBoss = "Cake Queen [Lv. 2175] [Boss]"
NameBoss = "Cake Queen"
NameQuestBoss = "IceCreamIslandQuest"
LevelQuestBoss = 3
CFrameQuestBoss = CFrame.new(-716, 382, -11010)
CFrameBoss = CFrame.new(-821, 66, -10965)
elseif _G.Settings.Boss["Select Boss"] == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
MsBoss = "rip_indra True Form [Lv. 5000] [Raid Boss]"
NameBoss = "rip_indra True Form"
CFrameBoss = CFrame.new(-5359, 424, -2735)
elseif _G.Settings.Boss["Select Boss"] == "Longma [Lv. 2000] [Boss]" then
MsBoss = "Longma [Lv. 2000] [Boss]"
NameBoss = "Longma"
CFrameBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
elseif _G.Settings.Boss["Select Boss"] == "Soul Reaper [Lv. 2100] [Raid Boss]" then
MsBoss = "Soul Reaper [Lv. 2100] [Raid Boss]"
NameBoss = "Soul Reaper"
CFrameBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
end
end

_G.GetBoss = false
function GetBossName()
for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
if not _G.GetBoss then
-- World 1
if v.Name == "The Gorilla King [Lv. 25] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 20 then
_G.Settings.Boss["Select Boss"] = "The Gorilla King [Lv. 25] [Boss]"
elseif v.Name == "Bobby [Lv. 55] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 55 then
_G.Settings.Boss["Select Boss"] = "Bobby [Lv. 55] [Boss]"
elseif v.Name == "Yeti [Lv. 110] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 105 then
_G.Settings.Boss["Select Boss"] = "Yeti [Lv. 110] [Boss]"
elseif v.Name == "Mob Leader [Lv. 120] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 120 then
_G.Settings.Boss["Select Boss"] = "Mob Leader [Lv. 120] [Boss]"
elseif v.Name == "Vice Admiral [Lv. 130] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 130 then
_G.Settings.Boss["Select Boss"] = "Vice Admiral [Lv. 130] [Boss]"
elseif v.Name == "Warden [Lv. 175] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 175 then
_G.Settings.Boss["Select Boss"] = "Warden [Lv. 175] [Boss]"
elseif v.Name == "Saber Expert [Lv. 200] [Boss]" and game.Workspace.Map.Jungle.Final.Part.Transparency == 1 then
_G.Settings.Boss["Select Boss"] = "Saber Expert [Lv. 200] [Boss]"
elseif v.Name == "Chief Warden [Lv. 200] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 200 then
_G.Settings.Boss["Select Boss"] = "Chief Warden [Lv. 200] [Boss]"
elseif v.Name == "Swan [Lv. 225] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 250 then
_G.Settings.Boss["Select Boss"] = "Swan [Lv. 225] [Boss]"
elseif v.Name == "Magma Admiral [Lv. 350] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 350 then
_G.Settings.Boss["Select Boss"] = "Magma Admiral [Lv. 350] [Boss]"
elseif v.Name == "Fishman Lord [Lv. 425] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 425 then
_G.Settings.Boss["Select Boss"] = "Fishman Lord [Lv. 425] [Boss]"
elseif v.Name == "Wysper [Lv. 500] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 500 then
_G.Settings.Boss["Select Boss"] = "Wysper [Lv. 500] [Boss]"
elseif v.Name == "Thunder God [Lv. 575] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 575 then
_G.Settings.Boss["Select Boss"] = "Thunder God [Lv. 575] [Boss]"
elseif v.Name == "Cyborg [Lv. 675] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 675 then
_G.Settings.Boss["Select Boss"] = "Cyborg [Lv. 675] [Boss]"
-- World2
elseif v.Name == "Diamond [Lv. 750] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 750 then
_G.Settings.Boss["Select Boss"] = "Diamond [Lv. 750] [Boss]"
elseif v.Name == "Jeremy [Lv. 850] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 850 then
_G.Settings.Boss["Select Boss"] = "Jeremy [Lv. 850] [Boss]"
elseif v.Name == "Fajita [Lv. 925] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 925 then
_G.Settings.Boss["Select Boss"] = "Fajita [Lv. 925] [Boss]"
elseif v.Name == "Don Swan [Lv. 1000] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1000 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") == 0 then
_G.Settings.Boss["Select Boss"] = "Don Swan [Lv. 1000] [Boss]"
elseif v.Name == "Smoke Admiral [Lv. 1150] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1150 then
_G.Settings.Boss["Select Boss"] = "Smoke Admiral [Lv. 1150] [Boss]"
elseif v.Name == "Cursed Captain [Lv. 1325] [Raid Boss]" and game.Players.localPlayer.Data.Level.Value >= 1325 then
_G.Settings.Boss["Select Boss"] = "Cursed Captain [Lv. 1325] [Raid Boss]"
elseif v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1400 then
_G.Settings.Boss["Select Boss"] = "Awakened Ice Admiral [Lv. 1400] [Boss]"
elseif v.Name == "Tide Keeper [Lv. 1475] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1475 then
_G.Settings.Boss["Select Boss"] = "Tide Keeper [Lv. 1475] [Boss]"
-- World3
elseif v.Name == "Stone [Lv. 1550] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1550 then
_G.Settings.Boss["Select Boss"] = "Stone [Lv. 1550] [Boss]"
elseif v.Name == "Island Empress [Lv. 1675] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1675 then
_G.Settings.Boss["Select Boss"] = "Island Empress [Lv. 1675] [Boss]"
elseif v.Name == "Kilo Admiral [Lv. 1750] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1750 then
_G.Settings.Boss["Select Boss"] = "Kilo Admiral [Lv. 1750] [Boss]"
elseif v.Name == "Captain Elephant [Lv. 1875] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1875 then
_G.Settings.Boss["Select Boss"] = "Captain Elephant [Lv. 1875] [Boss]"
elseif v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1950 then
_G.Settings.Boss["Select Boss"] = "Beautiful Pirate [Lv. 1950] [Boss]"
elseif v.Name == "Cake Queen [Lv. 2175] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 2175 then
_G.Settings.Boss["Select Boss"] = "Cake Queen [Lv. 2175] [Boss]"
end
end
end
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenHubTheBest/Main/main/alpwleoekebekelep0wbsbs",true))()

local Win = library:Evil()
local Tab1 = Win:Tab("Main/Boss",14477284625)
local Farms = Win:Tab("Item/Farms",14477543197)
local Tab2 = Win:Tab("Player/Stat",14477563495)
local RaceMirage = Win:Tab("Race/Mirrage",14477517268)
local Fruit = Win:Tab("DevilFruit",14537413902)
local Tab3 = Win:Tab("Travel/Raid",14477598542)
local Tab4 = Win:Tab("Shops/Sword",14477621526)
local Tab5 = Win:Tab("Misc/Server",14477663692)
local PlayerStatus = Win:Tab("Status",14477673361)

-------------[Tab1]-------------
local Page1 = Tab1:CraftPage(1)
Page1:Seperator("Main Farm")
local Nears = Tab1:CraftPage(1)
Nears:Seperator("Near Farm")
local Page6 = Tab1:CraftPage(1)
Page6:Seperator("Mastery Function")
local Page5 = Tab1:CraftPage("Bosses",1)
Page5:Seperator("Bosses")
local Farms1 = Farms:CraftPage(1)
local Farms2 = Farms:CraftPage(2)
Farms2:Seperator("Fighting Styles")
local Page3 = Tab1:CraftPage(2)
Page3:Seperator("Configs")
-------------[Tab2]-------------
local Page9 = Tab2:CraftPage(1)
local Page15 = Tab2:CraftPage(2)
-------------[Tab3]-------------
local Page10 = Tab3:CraftPage(1)
local Page11 = Tab3:CraftPage(2)
Page11:Seperator("Raids")

-------------[Tab5]-------------

--Page1:Line()

--[[local MobName = Page1:Label("[Mob] : ...")
local MobQuest = Page1:Label("[Quest] : ...".." | [Level] : ...")
spawn(function()
  while task.wait() do
  pcall(function()
    CheckQuest()
    if _G.Settings.Main["Auto Farm Level"] and _G.Settings.Configs["Double Quest"] then
    MobName:Set("[Mob] : "..Name)
    MobQuest:Set("[Quest] : "..NameMon.." | [Level] : "..QuestName)
    elseif not _G.Settings.Main["Auto Farm Level"] and _G.Settings.Configs["Double Quest"] then
      MobName:Set("[Mob] : "..Name)
    MobQuest:Set("[Quest] : "..NameMon.." | [Level] : "..QuestName)
    end
    end)
  end
  end)]]

Page1:Toggle('Auto Farm Level', _G.Settings.Main["Auto Farm Level"],function(value)
  _G.Settings.Main["Auto Farm Level"] = value
  Auto_Farm_Level = value
  if value == false then
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings()
  end)

if World1 then
Page1:Toggle(
  "Fast Auto Farm Level",
  _G.Settings.Main["Fast Auto Farm Level"],
  function(value)
  _G.Settings.Main["Fast Auto Farm Level"] = value
  SaveSettings()
  end)
end

if World3 then
Page1:Toggle('Auto Pirate Raid [Beta]', _G.AutoPirateRaid,function(value)
  _G.AutoPirateRaid = value
  if value == false then
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  end)
  
function PirateMons(p)
pcall(function()
    if (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 and not _G.AutoPirateRaid and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
    if QuestName == "FishmanQuest" then
--_G.Stop_Tween = true
    toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
--_G.Stop_Tween = nil
    elseif Name == "God's Guard [Lv. 450]" then
--_G.Stop_Tween = true
    toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
--_G.Stop_Tween = nil
    elseif QuestName == "SkyExp1Quest" then
--_G.Stop_Tween = true
    toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
--_G.Stop_Tween = nil
    elseif QuestName == "ShipQuest1" then
--_G.Stop_Tween = true
    toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
--_G.Stop_Tween = nil
    elseif QuestName == "ShipQuest2" then
--_G.Stop_Tween = true
    toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
--_G.Stop_Tween = nil
    elseif QuestName == "FrostQuest" then
--_G.Stop_Tween = true
    toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
--_G.Stop_Tween = nil
    else
        Mix_Farm = true
--_G.Stop_Tween = true
    repeat wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
    wait(.05)
    game.Players.LocalPlayer.Character.Head:Destroy()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
    until (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
    wait()
--_G.Stop_Tween = nil
    Mix_Farm = nil
    end
    end
    end)
end

spawn(function()
    while wait() do
    if _G.AutoPirateRaid then
    pcall(function()
      toTarget(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
        local PirateRaidMon = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
        if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if _G.AutoPirateRaid and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
        repeat wait()
        StartMagnet = true
        FastAttack = true
        if _G.Settings.Configs["Auto Haki"] then
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
        end
        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
        wait()
        EquipWeapon(_G.Settings.Configs["Select Weapon"])
        end
        PosMon = v.HumanoidRootPart.CFrame
        if not _G.Settings.Configs["Fast Attack"] then
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
        if _G.Settings.Configs["Show Hitbox"] then
        v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
        else
            v.HumanoidRootPart.Transparency = 1
        end
        v.HumanoidRootPart.CanCollide = false
        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
        until v.Humanoid.Health <= 0 or not v.Parent or _G.AutoPirateRaid == false
        FastAttack = false
        end
        end
        end
        else
            if ((PirateRaidMon).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1500 then
        toTarget(PirateRaidMon)
        else
            PirateMons(PirateRaidMon)
        end
        end
        end)
    end
    end
    end)
end

if World2 then
Page1:Toggle(
  "Auto Ectoplasm",
  _G.Settings.Main["Auto Ectoplasm"],
  function(value)
  _G.Settings.Main["Auto Ectoplasm"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Ectoplasm"] then
      if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Ship Deckhand [Lv. 1250]" or v.Name == "Ship Engineer [Lv. 1275]" or v.Name == "Ship Steward [Lv. 1300]" or v.Name == "Ship Officer [Lv. 1325]" or v.Name == "Arctic Warrior [Lv. 1350]" then
      if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Ectoplasm"] or not v.Parent or v.Humanoid.Health <= 0
      StartMagnet = false
      FastAttack = false
      end
      end
      end
      else
        StartMagnet = false
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
      end
      end
      end)
    end
    end)
  end)
end

Method = CFrame.new(0,25,0)
 
spawn(function()
   while wait(3) do
       if Methodnow == 1 then
        Methodnow = 2
        Method = CFrame.new(0,25,0)
        else
        Methodnow = 1
        Method = CFrame.new(0,0,25)
       end
    end
end)

if World3 then
Page1:Toggle(
  "Auto Farm Bone",
  _G.Settings.Main["Auto Farm Bone"],
  function(value)
  _G.Settings.Main["Auto Farm Bone"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Farm Bone"] then
      if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
      if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * Method)
      until not _G.Settings.Main["Auto Farm Bone"] or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
      StartMagnet = false
      FastAttack = false
      end
      end
      end
      else
        toTarget(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
      end
      end
      end)
    end
    end)
  end)
end

AttackRandomType = 1
task.spawn(function()
  while wait() do
  AttackRandomType = math.random(1,5)
  wait(0.3)
  end
  end)

_G.RedeemCodeLocalFastAutoFarm = false
function AutoFarmLevel()
GetQuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title
GetQuest = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
local MyLevel = game.Players.LocalPlayer.Data.Level.Value
if (MyLevel >= 15 and MyLevel <= 300) then
if _G.Settings.Configs["Auto Haki"] then
if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
end
end
if _G.RedeemCodeLocalFastAutoFarm == false then
function Redeem(value)
game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
end
for i,v in pairs(CodeApi) do
Redeem(v)
end
_G.RedeemCodeLocalFastAutoFarm = true
end
if MyLevel >= 15 and MyLevel <= 70 then
local CFrameMon = CFrame.new(-4698, 845, -1912)
if game:GetService("Workspace").Enemies:FindFirstChild("God's Guard [Lv. 450]") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if _G.Settings.Main["Fast Auto Farm Level"] and v.Name == "God's Guard [Lv. 450]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat wait()
FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,1))
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
if FarmtoTarget then FarmtoTarget:Stop() end
for i2,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if _G.Settings.Main["Fast Auto Farm Level"] and v2.Name == "God's Guard [Lv. 450]" and v2:FindFirstChild("HumanoidRootPart") and v2:FindFirstChild("Humanoid") and v2.Humanoid.Health > 0 then
if InMyNetWork(v2.HumanoidRootPart) then
v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
v2.Humanoid.JumpPower = 0
v2.Humanoid.WalkSpeed = 0
v2.HumanoidRootPart.CanCollide = false
v2.Humanoid:ChangeState(14)
v2.Humanoid:ChangeState(11)
v2.HumanoidRootPart.Size = Vector3.new(55,55,55)
end
end
end
if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
end
if AttackRandomType == 1 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 60, 1)
elseif AttackRandomType == 2 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 1, 60)
elseif AttackRandomType == 3 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(1, 1, -60)
elseif AttackRandomType == 4 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(60, 1, 0)
elseif AttackRandomType == 5 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(-60, 1, 0)
else
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 60, 1)
end
FastAttack = true
EquipWeapon(_G.Settings.Configs["Select Weapon"])
end
until not (game:GetService("Workspace").Enemies:FindFirstChild("God's Guard [Lv. 450]")) or not (_G.Settings.Main["Fast Auto Farm Level"] or _G.Settings.Main["Auto Farm Level"]) or v.Humanoid.Health <= 0 or not v.Parent
FastAttack = false
end
end
else
  Modstween = toTarget(CFrameMon)
if World1 and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
if Modstween then Modstween:Stop() end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
end
end
elseif MyLevel >= 70 and MyLevel <= 300 then
if GetQuest.Visible == false then
if not tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")):find("We heard some") then
local CFrameMon = CFrame.new(-4698, 845, -1912)
if game:GetService("Workspace").Enemies:FindFirstChild("God's Guard [Lv. 450]") then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if _G.Settings.Main["Fast Auto Farm Level"] and v.Name == "God's Guard [Lv. 450]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat wait()
FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,1))
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
if FarmtoTarget then FarmtoTarget:Stop() end
for i2,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if _G.Settings.Main["Fast Auto Farm Level"] and v2.Name == "God's Guard [Lv. 450]" and v2:FindFirstChild("HumanoidRootPart") and v2:FindFirstChild("Humanoid") and v2.Humanoid.Health > 0 then
if InMyNetWork(v2.HumanoidRootPart) then
v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
v2.Humanoid.JumpPower = 0
v2.Humanoid.WalkSpeed = 0
v2.HumanoidRootPart.CanCollide = false
v2.Humanoid:ChangeState(14)
v2.Humanoid:ChangeState(11)
v2.HumanoidRootPart.Size = Vector3.new(55,55,55)
end
end
end
if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
end
if AttackRandomType == 1 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 60, 1)
elseif AttackRandomType == 2 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 1, 60)
elseif AttackRandomType == 3 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(1, 1, -60)
elseif AttackRandomType == 4 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(60, 1, 0)
elseif AttackRandomType == 5 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(-60, 1, 0)
else
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 60, 1)
end
FastAttack = true
EquipWeapon(_G.Settings.Configs["Select Weapon"])
end
until not (game:GetService("Workspace").Enemies:FindFirstChild("God's Guard [Lv. 450]")) or not (_G.Settings.Main["Fast Auto Farm Level"] or _G.Settings.Main["Auto Farm Level"]) or v.Humanoid.Health <= 0 or not v.Parent
FastAttack = false
end
end
else
  Modstween = toTarget(CFrameMon)
if World1 and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
if Modstween then Modstween:Stop() end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
end
end
end
elseif GetQuest.Visible == true then
local AllPlayersTableSkipFarm = {}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
table.insert(AllPlayersTableSkipFarm,v.Name)
end
if table.find(AllPlayersTableSkipFarm,GetQuestTitle.Text:split(" ")[2]) then
for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
if _G.Settings.Main["Auto Farm Level"] and _G.Settings.Main["Fast Auto Farm Level"] and v.Name == GetQuestTitle.Text:split(" ")[2] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat wait()
if World1 and (Vector3.new(61163.8515625, 11.6796875, 1819.7841796875) - v.HumanoidRootPart.Position).magnitude < 5000 then
if FarmtoTarget then FarmtoTarget:Stop() end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 150 then
FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame)
elseif v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
if FarmtoTarget then FarmtoTarget:Stop() end
if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.PvpDisabled.Visible == true then
local args = {
  [1] = "EnablePvp"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
local args = {
  [1] = "Buso"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
game:GetService('VirtualUser'):CaptureController()
game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
if CombatFrameworkR.activeController.hitboxMagnitude ~= 55 and CombatFrameworkR.activeController and CombatFrameworkR.activeController.equipped then
CombatFrameworkR.activeController.hitboxMagnitude = 55
end
if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
end
if AttackRandomType == 1 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 1)
elseif AttackRandomType == 2 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 1, 7)
elseif AttackRandomType == 3 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(1, 1, -7)
elseif AttackRandomType == 4 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(7, 1, 0)
elseif AttackRandomType == 5 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(-7, 1, 0)
else
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 1)
end
EquipWeapon(_G.Settings.Configs["Select Weapon"])
AttackPlayers()
wait(.1)
-- game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
-- game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
end
until not _G.Settings.Main["Auto Farm Level"] or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) or v.Humanoid.Health <= 0 or not v.Parent or GetQuest.Visible == false
end
end
end
else
  if game:GetService("Workspace").Enemies:FindFirstChild(Name) then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if _G.Settings.Main["Auto Farm Level"] and v.Name == Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
if string.find(GetQuestTitle.Text, QuestName) then
repeat wait()
if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 150 then
FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,1))
elseif v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
if FarmtoTarget then FarmtoTarget:Stop() end
StartMagnet = true
PosMon = v.HumanoidRootPart.CFrame
if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
end
if AttackRandomType == 1 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
elseif AttackRandomType == 2 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 1, 30)
elseif AttackRandomType == 3 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(1, 1, -30)
elseif AttackRandomType == 4 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(30, 1, 0)
elseif AttackRandomType == 5 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(-30, 1, 0)
else
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
end
FastAttack = true
EquipWeapon(_G.Settings.Configs["Select Weapon"])
end
until not game:GetService("Workspace").Enemies:FindFirstChild(Name) or not _G.Settings.Main["Auto Farm Level"] or not string.find(GetQuestTitle.Text, QuestName) or v.Humanoid.Health <= 0 or not v.Parent or GetQuest.Visible == false
FastAttack = false
StartMagnet = false
else
  Com("F_","AbandonQuest");
end
end
end
else
  StartMagnet = false
if not string.find(GetQuestTitle.Text, NameCheckQuest) then Com("F_","AbandonQuest"); end
Modstween = toTarget(CFrameMon)
if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Questtween then Questtween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
elseif World1 and not (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Questtween then Questtween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Questtween then Questtween:Stop() end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Questtween then Questtween:Stop() end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
if Modstween then Modstween:Stop() end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
end
end
end
end
end
else
  if not string.find(GetQuestTitle.Text, NameMon) then game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest"); end
if GetQuest.Visible == false then
StartMagnet = false
FastAttack = false
Questtween = toTarget(CFrameQuest.Position,CFrameQuest)
if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Questtween then Questtween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
elseif World1 and not (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Questtween then Questtween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Questtween then Questtween:Stop() end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Questtween then Questtween:Stop() end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
if Questtween then Questtween:Stop() end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
wait(1)
if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
Com("F_","StartQuest", QuestName, LevelQuest)
Com("F_","SetSpawnPoint")
end
end
elseif GetQuest.Visible == true then
if game:GetService("Workspace").Enemies:FindFirstChild(Name) then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if _G.Settings.Main["Auto Farm Level"] and v.Name == Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
if string.find(GetQuestTitle.Text, NameMon) then
repeat wait()
FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
if FarmtoTarget then FarmtoTarget:Stop() end
if _G.Settings.Configs["Auto Haki"] then
if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
end
end
if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
wait()
EquipWeapon(_G.Settings.Configs["Select Weapon"])
end
StartMagnet = true
FastAttack = true
if game.Players.LocalPlayer.Data.Level.Value >= 20 and game.Players.LocalPlayer.Data.Level.Value <= 90 then
_G.Settings.Configs["Fast Attack Type"] = "Slow"
else
  _G.Settings.Configs["Fast Attack Type"] = "Fast"
end
if not _G.Settings.Configs["Fast Attack"] then
game:GetService'VirtualUser':CaptureController()
game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end
v.HumanoidRootPart.Size = Vector3.new(60,60,60)
v.HumanoidRootPart.Transparency = 1
v.Humanoid.JumpPower = 0
v.Humanoid.WalkSpeed = 0
v.HumanoidRootPart.CanCollide = false
v.Humanoid:ChangeState(11)
v.Humanoid:ChangeState(14)
PosMon = v.HumanoidRootPart.CFrame
if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0)
end
until not game:GetService("Workspace").Enemies:FindFirstChild(Name) or not _G.Settings.Main["Auto Farm Level"] or not string.find(GetQuestTitle.Text, NameMon) or v.Humanoid.Health <= 0 or not v.Parent or GetQuest.Visible == false
StartMagnet = false
FastAttack = false
else
  Com("F_","AbandonQuest");
end
end
end
else
  StartMagnet = false
FastAttack = false
if not string.find(GetQuestTitle.Text, NameMon) then Com("F_","AbandonQuest"); end
Modstween = toTarget(CFrameMon.Position,CFrameMon)
if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
elseif World1 and not (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
if Modstween then Modstween:Stop() end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
end
end
end
end
end

-- [Check Notification]

function CheckNotifyComplete()
for i, v in pairs(game:GetService("Players")["LocalPlayer"].PlayerGui:FindFirstChild("Notifications"):GetChildren()) do
if v.Name == "NotificationTemplate" then
if string.lower(v.Text):find("quest completed") then
pcall(function()
  v:Destroy()
  end)
return true
end
end
end
return false
end

local NoLoopDuplicate = false
local SubQuest = false
local oldmob = Name
local oldcheckquest = NameMon

task.spawn(function()
  while wait() do
  pcall(function()
    if _G.Settings.Main["Auto Farm Level"] then
    if _G.Settings.Configs["Double Quest"] then
    if SubQuest == true then
    if LevelFarm then
    if tonumber(LevelFarm-1) ~= 0 then
    CheckOldQuest(tonumber(LevelFarm-1))
    end
    end
    else
      CheckQuest()
    oldmob = Name
    oldcheckquest = NameMon
    spawn(function()
      pcall(function()
        if NoLoopDuplicate == false then
        if CheckNotifyComplete() and _G.Settings.Main["Auto Farm Level"] then
        NoLoopDuplicate = true
        while wait() do
        SubQuest = true
        if CheckNotifyComplete() or _G.Settings.Main["Auto Farm Level"] == false then
        --break;
        end
        end
        SubQuest = false
        NoLoopDuplicate = false
        end
        end
        end)
      end)
    if SubQuest == true then
    if LevelFarm then
    if tonumber(LevelFarm-1) ~= 0 then
    CheckOldQuest(tonumber(LevelFarm-1))
    end
    end
    end
    end
    else
      CheckQuest()
    end
    AutoFarmLevel()
    end
    end)
  end
  end)

--Page1:Line()
Page1:Toggle('Auto Farm Chest',AutoFarmChest,function(value)
  AutoFarmChest = value
--CancelTween(AutoFarmChest)
  if value == false then
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings()
end)

_G.MagnitudeAdd = 0
task.spawn(function()
  while wait() do
  if AutoFarmChest then
  for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
  if v.Name:find("Chest") then
  if game:GetService("Workspace"):FindFirstChild(v.Name) then
  if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000+_G.MagnitudeAdd then
  repeat wait()
  if game:GetService("Workspace"):FindFirstChild(v.Name) then
  toTargetP(v.CFrame)
  end
  until AutoFarmChest == false or not v.Parent
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  _G.MagnitudeAdd = _G.MagnitudeAdd+1500
  --break;
  end
  end
  end
  end
  end
  end
  end)

_G.DistanceNearFarm = 1000

Nears:Slider("Distance Near Farm",true,0,5000,_G.DistanceNearFarm,function(value)
  _G.DistanceNearFarm = value
  SaveSettings()
  end)

Nears:Toggle("Auto Farm Near",_G.Settings.Main["Near Farm"],function(value)
  _G.Settings.Main["Near Farm"] = value
  SaveSettings()
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Near Farm"] then
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if _G.Settings.Main["Near Farm"] and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= _G.DistanceNearFarm then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      MagnetMobAura = true
      if delay then
      delay(1,function()
        MagnetMobAura = true
        end)
      end
      until not _G.Settings.Main["Near Farm"] or not v.Parent or v.Humanoid.Health <= 0
      MagnetMobAura = false
      FastAttack = false
      StartMagnet = false
      end
      end
      end
      end)
    end
    end)
  end)

if not World1 then
--Page3:Line()
Page3:Toggle(
  "Double Quest",
  _G.Settings.Configs["Double Quest"],
  function(value)
  _G.Settings.Configs["Double Quest"] = value
  SaveSettings()
  end)
end
Page3:Toggle(
  "Bypass TP (Makes You Die)",
  _G.Settings.Configs["Bypass TP"],
  function(value)
  _G.Settings.Configs["Bypass TP"] = value
  SaveSettings()
  end)

--Page3:Line()

Page3:Toggle(
  "Fast Attack",
  _G.Settings.Configs["Fast Attack"],
  function(value)
  _G.Settings.Configs["Fast Attack"] = value
  SaveSettings()
  end)
  
  

Page3:Dropdown("Fast Attack Type",
  {
    "Fast","Normal","Slow"
  },_G.Settings.Configs["Fast Attack Type"],
  function(value)
  _G.Settings.Configs["Fast Attack Type"] = value
  SaveSettings()
  end)
  
coroutine.wrap(function()
  while task.wait(.1) do
  local ac = CombatFrameworkR.activeController
  if ac and ac.equipped then
  if FastAttack and _G.Settings.Configs["Fast Attack"] then
  AttackFunction()
  if _G.Settings.Configs["Fast Attack Type"] == "Normal" then
  if tick() - cooldownfastattack > .9 then wait(.1) cooldownfastattack = tick() end
  elseif _G.Settings.Configs["Fast Attack Type"] == "Fast" then
  if tick() - cooldownfastattack > 1.5 then wait(.01) cooldownfastattack = tick() end
  elseif _G.Settings.Configs["Fast Attack Type"] == "Slow" then
  if tick() - cooldownfastattack > .3 then wait(.7) cooldownfastattack = tick() end
  end
  elseif FastAttack and _G.Settings.Configs["Fast Attack"] == false then
  if ac.hitboxMagnitude ~= 55 then
  ac.hitboxMagnitude = 55
  end
  ac:attack()
  end
  end
  end
  end)()

--Page3:Line()

-- [Table Weapon]
Page3:Dropdown("Select Weapon",{
    "Melee",
  "Sword",
  "Fruit"},_G.Settings.Configs["Select Weapon"],
  function(value)
SelectWeapon = value
  _G.Settings.Configs["Select Weapon"] = value
  SaveSettings()
  end)

task.spawn(function()
  while wait() do
  pcall(function()
    if SelectWeapon == "Melee" then
    for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ToolTip == "Melee" then
    if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
    _G.Settings.Configs["Select Weapon"] = v.Name
    end
    end
    end
    elseif SelectWeapon == "Sword" then
    for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ToolTip == "Sword" then
    if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
    _G.Settings.Configs["Select Weapon"] = v.Name
    end
    end
    end
    elseif SelectWeapon == "Fruit" then
    for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ToolTip == "Blox Fruit" then
    if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
    _G.Settings.Configs["Select Weapon"] = v.Name
    end
    end
    end
    else
      for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.ToolTip == "Melee" then
    if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
    _G.Settings.Configs["Select Weapon"] = v.Name
    end
    end
    end
    end
    end)
  end
  end)

local Miscon = Tab1:CraftPage(2)
Miscon:Seperator("Misc Config")

Miscon:Toggle(
  "Auto Haki",
  _G.Settings.Configs["Auto Haki"],
  function(value)
  _G.Settings.Configs["Auto Haki"] = value
  SaveSettings()
  end)
task.spawn(function()
  while wait() do
  pcall(function()
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    end)
  end
  end)

Miscon:Slider(
  "Distance Auto Farm",true,
  0,
  60,
  _G.Settings.Configs["Distance Auto Farm"],
  function(value)
  _G.Settings.Configs["Distance Auto Farm"] = value
  SaveSettings()
  end)

Miscon:Toggle(
  "Camera Shaker",
  _G.Settings.Configs["Camera Shaker"],
  function(value)
  _G.Settings.Configs["Camera Shaker"] = value
  CameraShaker()
  SaveSettings()
  end)

local Mobcon = Tab1:CraftPage(2)
Mobcon:Seperator(
  "Mob Configs")

Mobcon:Toggle(
  "Bring Mob",
  _G.Settings.Configs["Bring Mob"],
  function(value)
  _G.Settings.Configs["Bring Mob"] = value
  SaveSettings()
  end)

Mobcon:Toggle(
  "Show Hitbox",
  _G.Settings.Configs["Show Hitbox"],
  function(value)
  _G.Settings.Configs["Show Hitbox"] = value
  SaveSettings()
  end)

Mobcon:Slider(
  "Hitbox Transparency",true,
  0,
  1,
  0.5,
  function(value)
  _G.Hitbox_LocalTransparency = value
  end)

Mobcon:Toggle(
  "Disabled Text Damage",
  _G.Settings.Configs["Disabled Damage"],
  function(value)
  _G.Settings.Configs["Disabled Damage"] = value
  DisabledDamage()
  SaveSettings()
  end)

local MasteryCon = Tab1:CraftPage(2)
MasteryCon:Seperator("Skill List")
MasteryCon:Toggle(
  "Skill Z",
  _G.Settings.Configs["Skill Z"],
  function(value)
  _G.Settings.Configs["Skill Z"] = value
  SaveSettings()
  end)

MasteryCon:Toggle(
  "Skill X",
  _G.Settings.Configs["Skill X"],
  function(value)
  _G.Settings.Configs["Skill X"] = value
  SaveSettings()
  end)

MasteryCon:Toggle(
  "Skill C",
  _G.Settings.Configs["Skill C"],
  function(value)
  _G.Settings.Configs["Skill C"] = value
  SaveSettings()
  end)

MasteryCon:Toggle(
  "Skill V",
  _G.Settings.Configs["Skill V"],
  function(value)
  _G.Settings.Configs["Skill V"] = value
  SaveSettings()
  end)

MasteryCon:Seperator("Hold Skill")

MasteryCon:Slider("Hold Skill Z",true,0,100,1,function(value)
  _G.HoldZ = value
  end)

MasteryCon:Slider("Hold Skill X",true,0,100,1,function(value)
  _G.HoldX = value
  end)

MasteryCon:Slider("Hold Skill C",true,0,100,1,function(value)
  _G.HoldC = value
  end)

MasteryCon:Slider("Hold Skill V",true,0,100,1,function(value)
  _G.HoldV = value
  end)

local Page8 = Tab1:CraftPage(2)
Page8:Seperator("Codes")

Page8:Toggle(
  "Redeem Code",
  _G.Settings.Stat["Enabled Auto Redeem Code"],
  function(value)
  _G.Settings.Stat["Enabled Auto Redeem Code"] = value
  SaveSettings()
  end)

Page8:Slider(
  "Redeem Select Level",true,
  0,
  2425,
  _G.Settings.Stat["Select Level Redeem Code"],
  function(value)
  _G.Settings.Stat["Select Level Redeem Code"] = value
  SaveSettings()
  end)

task.spawn(function()
  while wait() do
  pcall(function()
    local MyLevel = game.Players.LocalPlayer.Data.Level.Value
    if _G.Settings.Stat["Enabled Auto Redeem Code"] then
    if MyLevel >= _G.Settings.Stat["Select Level Redeem Code"] then
    function Redeem(value)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
    end
    for i,v in pairs(CodeApi) do
    Redeem(v)
    end
    wait(3)
    _G.Settings.Stat["Enabled Auto Redeem Code"] = false
    end
    end
    end)
  end
  end)



local SupComplete = false
local EClawComplete = false
local TalComplete = false
local SharkComplete = false
local DeathComplete = false
local GodComplete = false

function GetAllMeleeFarm()
if SupComplete == false then
local args = {
  [1] = "BuySuperhuman"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
if CheckMasteryWeapon("Superhuman",400) == "true UpTo" then
SupComplete = true
end
end
wait(.5)
if EClawComplete == false then
local string_1 = "BuyElectricClaw";
local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
Target:InvokeServer(string_1);

if CheckMasteryWeapon("Electric Claw",400) == "true UpTo" then
EClawComplete = true
end
end
wait(.5)
if TalComplete == false then
game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")

if CheckMasteryWeapon("Dragon Talon",400) == "true UpTo" then
TalComplete = true
end
end
wait(.5)
if SharkComplete == false then
local args = {
  [1] = "BuySharkmanKarate"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

if CheckMasteryWeapon("Sharkman Karate",400) == "true UpTo" then
SharkComplete = true
end
end
wait(.5)
if DeathComplete == false then
local args = {
  [1] = "BuyDeathStep"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

if CheckMasteryWeapon("Death Step",400) == "true UpTo" then
DeathComplete = true
end
end
if GodComplete == false then
local args = {
  [1] = "BuyGodhuman"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

if CheckMasteryWeapon("Godhuman",350) == "true UpTo" then
GodComplete = true
end
end
end

if World1 then
Farms1:Seperator("Farm Materail")

Farms1:Dropdown("Select Material", AllMaterial, {
  ""
},function(value)
  SelectModeMaterial = value
  end)

Farms1:Toggle("Auto Farm Material", AutoFarmMaterial,function(x)
  AutoFarmMaterial = x
--CancelTween(AutoFarmMaterial)
  if x == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  if x == false then
  toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  spawn(function()
    while wait() do
    if AutoFarmMaterial then
    xpcall(function()
      if (SelectModeMaterial ~= "") then
      CheckMaterial(SelectModeMaterial);
      if CustomFindFirstChild(MaterialMob) then
      for v0,v1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if (AutoFarmMaterial and table.find(MaterialMob,v1.Name) and v1:FindFirstChild("HumanoidRootPart") and v1:FindFirstChild("Humanoid") and (v1.Humanoid.Health > 0)) then
      repeat wait();
      FarmtoTarget = toTarget(v1.HumanoidRootPart.CFrame * CFrame.new(0,30,1));
      if (v1:FindFirstChild("HumanoidRootPart") and v1:FindFirstChild("Humanoid") and ((v1.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150)) then
      if FarmtoTarget then FarmtoTarget:Stop(); end
      FastAttack = true;
      EquipWeapon(_G.Settings.Configs["Select Weapon"]);
      spawn(function()for v4,v5 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if (v5.Name == v1.Name) then
        spawn(function()
          if InMyNetWork(v5.HumanoidRootPart) then
          v5.HumanoidRootPart.CFrame = v1.HumanoidRootPart.CFrame;
          v5.Humanoid.JumpPower = 0;
          v5.Humanoid.WalkSpeed = 0;
          v5.HumanoidRootPart.CanCollide = false;
          v5.Humanoid:ChangeState(14);
          v5.Humanoid:ChangeState(11);
          v5.HumanoidRootPart.Size = Vector3.new(55,55,55);
          end
          end);
        end
        end
        end);
      if (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150)) then
      game:service("VirtualInputManager"):SendKeyEvent(true,"V",false,game);
      game:service("VirtualInputManager"):SendKeyEvent(false,"V",false,game);
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1.HumanoidRootPart.CFrame * CFrame.new(0,30,1);
      end
      until not CustomFindFirstChild(MaterialMob) or not AutoFarmMaterial or (v1.Humanoid.Health <= 0) or not v1.Parent FastAttack = false;
      end
      end
      else
        FastAttack = false;
      Modstween = toTarget(CFrameMon);
      if (World1 and (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and ((CFrameMon.Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000)) then
      if Modstween then Modstween:Stop(); end wait(0.5);game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625,11.6796875,1819.7841796875));
      elseif (World1 and not (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and ((CFrameMon.Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000)) then
      if Modstween then Modstween:Stop();end wait(0.5);game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625,6.6796875, -1926.7841796875));
      elseif (World1 and (table.find(MaterialMob,"God's Guard [Lv. 450]")) and ((CFrameMon.Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000)) then
      if Modstween then Modstween:Stop();end wait(0.5);game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.8227539063,872.54248046875, -1667.5568847656));
      elseif ((CFrameMon.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
      if Modstween then Modstween:Stop();end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon;
      end
      end
      end
      end,function(x)
      print("Auto Farm Material Error : "..x)
      end)
    else
      --break;
    end
    end
    end)
  end)
elseif World2 then
Farms1:Seperator("Farm Materail")

Farms1:Dropdown("Select Material", AllMaterial, {
  ""
},function(value)
  SelectModeMaterial = value
  end)

Farms1:Toggle("Auto Farm Material", AutoFarmMaterial,function(x)
  AutoFarmMaterial = x
--CancelTween(AutoFarmMaterial)
  if x == false then
  toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  spawn(function()
    while wait() do
    if AutoFarmMaterial then
    xpcall(function()
      if (SelectModeMaterial ~= "") then
      CheckMaterial(SelectModeMaterial);
      if CustomFindFirstChild(MaterialMob) then
      for v0,v1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if (AutoFarmMaterial and table.find(MaterialMob,v1.Name) and v1:FindFirstChild("HumanoidRootPart") and v1:FindFirstChild("Humanoid") and (v1.Humanoid.Health > 0)) then
      repeat wait();
      FarmtoTarget = toTarget(v1.HumanoidRootPart.CFrame * CFrame.new(0,30,1));
      if (v1:FindFirstChild("HumanoidRootPart") and v1:FindFirstChild("Humanoid") and ((v1.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150)) then
      if FarmtoTarget then FarmtoTarget:Stop(); end
      FastAttack = true;
      EquipWeapon(_G.Settings.Configs["Select Weapon"]);
      spawn(function()for v4,v5 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if (v5.Name == v1.Name) then
        spawn(function()
          if InMyNetWork(v5.HumanoidRootPart) then
          v5.HumanoidRootPart.CFrame = v1.HumanoidRootPart.CFrame;
          v5.Humanoid.JumpPower = 0;
          v5.Humanoid.WalkSpeed = 0;
          v5.HumanoidRootPart.CanCollide = false;
          v5.Humanoid:ChangeState(14);
          v5.Humanoid:ChangeState(11);
          v5.HumanoidRootPart.Size = Vector3.new(55,55,55);
          end
          end);
        end
        end
        end);
      if (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150)) then
      game:service("VirtualInputManager"):SendKeyEvent(true,"V",false,game);
      game:service("VirtualInputManager"):SendKeyEvent(false,"V",false,game);
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1.HumanoidRootPart.CFrame * CFrame.new(0,30,1);
      end
      until not CustomFindFirstChild(MaterialMob) or not AutoFarmMaterial or (v1.Humanoid.Health <= 0) or not v1.Parent FastAttack = false;
      end
      end
      else
        FastAttack = false;
      Modstween = toTarget(CFrameMon);
      if (World1 and (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and ((CFrameMon.Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000)) then
      if Modstween then Modstween:Stop(); end wait(0.5);game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625,11.6796875,1819.7841796875));
      elseif (World1 and not (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and ((CFrameMon.Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000)) then
      if Modstween then Modstween:Stop();end wait(0.5);game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625,6.6796875, -1926.7841796875));
      elseif (World1 and (table.find(MaterialMob,"God's Guard [Lv. 450]")) and ((CFrameMon.Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000)) then
      if Modstween then Modstween:Stop();end wait(0.5);game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.8227539063,872.54248046875, -1667.5568847656));
      elseif ((CFrameMon.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
      if Modstween then Modstween:Stop();end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon;
      end
      end
      end
      end,function(x)
      print("Auto Farm Material Error : "..x)
      end)
    else
      --break;
    end
    end
    end)
  end)
Farms1:Toggle(
  "Auto Material Soul Guitar",
  _G.Settings.Main["Auto Material Soul Guitar"],
  function(value)
  _G.Settings.Main["Auto Material Soul Guitar"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  end
)
elseif World3 then
Farms1:Seperator("Farm Materail")

Farms1:Dropdown("Select Material", AllMaterial, {
  ""
},function(value)
  SelectModeMaterial = value
  end)

Farms1:Toggle("Auto Farm Material", AutoFarmMaterial,function(x)
  AutoFarmMaterial = x
--CancelTween(AutoFarmMaterial)
  if x == false then
  toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  spawn(function()
    while wait() do
    if AutoFarmMaterial then
    xpcall(function()
      if (SelectModeMaterial ~= "") then
      CheckMaterial(SelectModeMaterial);
      if CustomFindFirstChild(MaterialMob) then
      for v0,v1 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if (AutoFarmMaterial and table.find(MaterialMob,v1.Name) and v1:FindFirstChild("HumanoidRootPart") and v1:FindFirstChild("Humanoid") and (v1.Humanoid.Health > 0)) then
      repeat wait();
      FarmtoTarget = toTarget(v1.HumanoidRootPart.CFrame * CFrame.new(0,30,1));
      if (v1:FindFirstChild("HumanoidRootPart") and v1:FindFirstChild("Humanoid") and ((v1.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150)) then
      if FarmtoTarget then FarmtoTarget:Stop(); end
      FastAttack = true;
      EquipWeapon(_G.Settings.Configs["Select Weapon"]);
      spawn(function()for v4,v5 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if (v5.Name == v1.Name) then
        spawn(function()
          if InMyNetWork(v5.HumanoidRootPart) then
          v5.HumanoidRootPart.CFrame = v1.HumanoidRootPart.CFrame;
          v5.Humanoid.JumpPower = 0;
          v5.Humanoid.WalkSpeed = 0;
          v5.HumanoidRootPart.CanCollide = false;
          v5.Humanoid:ChangeState(14);
          v5.Humanoid:ChangeState(11);
          v5.HumanoidRootPart.Size = Vector3.new(55,55,55);
          end
          end);
        end
        end
        end);
      if (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150)) then
      game:service("VirtualInputManager"):SendKeyEvent(true,"V",false,game);
      game:service("VirtualInputManager"):SendKeyEvent(false,"V",false,game);
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1.HumanoidRootPart.CFrame * CFrame.new(0,30,1);
      end
      until not CustomFindFirstChild(MaterialMob) or not AutoFarmMaterial or (v1.Humanoid.Health <= 0) or not v1.Parent FastAttack = false;
      end
      end
      else
        FastAttack = false;
      Modstween = toTarget(CFrameMon);
      if (World1 and (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and ((CFrameMon.Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000)) then
      if Modstween then Modstween:Stop(); end wait(0.5);game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625,11.6796875,1819.7841796875));
      elseif (World1 and not (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and ((CFrameMon.Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000)) then
      if Modstween then Modstween:Stop();end wait(0.5);game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625,6.6796875, -1926.7841796875));
      elseif (World1 and (table.find(MaterialMob,"God's Guard [Lv. 450]")) and ((CFrameMon.Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000)) then
      if Modstween then Modstween:Stop();end wait(0.5);game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.8227539063,872.54248046875, -1667.5568847656));
      elseif ((CFrameMon.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
      if Modstween then Modstween:Stop();end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon;
      end
      end
      end
      end,function(x)
      print("Auto Farm Material Error : "..x)
      end)
    else
      --break;
    end
    end
    end)
  end)
end

if World1 then
--World3:Line()
local World1 = Farms:CraftPage(1)
World1:Seperator("First Sea")
World1:Toggle("Auto New World",_G.Settings.Main["Auto New World"],function(value)
  _G.Settings.Main["Auto New World"] = value
--CancelTween(_G.Settings.Main["Auto New World"])
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()

  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto New World"] then
      if game.Players.LocalPlayer.Data.Level.Value >= 700 then
      if Auto_Farm_Level then
      _G.Settings.Main["Auto Farm Level"] = false
      end
      if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
      wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
      EquipWeapon("Key")
      repeat wait() toTarget(CFrame.new(1347.7124, 37.3751602, -1325.6488)) until (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.Main["Auto New World"]
      wait(3)
      elseif game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
      if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Ice Admiral [Lv. 700] [Boss]" and v.Humanoid.Health > 0 then
      repeat wait()
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      FastAttack = true
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
      until v.Humanoid.Health <= 0 or not v.Parent
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
      end
      end
      else
        toTarget(CFrame.new(1347.7124, 37.3751602, -1325.6488))
      end
      else
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
      end
      end
      end
      end)
    end
    end)
  end)

World1:Seperator("Saber")
local required = World1:Label("")
local StatusSaber = World1:Label("")

spawn(function()
  while wait() do
  pcall(function()
    if game.Players.LocalPlayer.Data.Level.Value >= 200 then
    required:Set("Level Required : 200".."✅")
    else
      required:Set("Level Required : 200".."❌")
    end
    end)
  end
  end)

spawn(function()
  while wait() do
  pcall(function()
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Saber") then
    StatusSaber:Set("Saber :".."✅")
    else
      StatusSaber:Set("Saber :".."❌")
    end
    end)
  end
  end)


World1:Toggle("Auto Saber",_G.Settings.Main["Auto Saber"],function(value)
  _G.Settings.Main["Auto Saber"] = value
--CancelTween(_G.Settings.Main["Auto Saber"])
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Saber"] and game.Players.LocalPlayer.Data.Level.Value >= 200 and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Saber") and not game.Players.LocalPlayer.Character:FindFirstChild("Saber") then
      if Auto_Farm_Level then
      _G.Settings.Main["Auto Farm Level"] = false
      end
      if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
      if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
      if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
      toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
      wait(1)
      else
        toTarget(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
      end
      else
        if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
      if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
      EquipWeapon("Torch")
      toTarget(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
      else
        toTarget(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
      end
      else
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
      wait(0.5)
      EquipWeapon("Cup")
      wait(0.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
      wait(0)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
      else
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
      elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
      if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
      toTarget(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Mob Leader [Lv. 120] [Boss]" then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      until v.Humanoid.Health <= 0 or _G.Settings.Main["Auto Saber"] == false
      end
      end
      end
      elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
      wait(0.5)
      EquipWeapon("Relic")
      wait(0.5)
      toTarget(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
      end
      end
      end
      end
      else
        if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
      toTarget(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-08, 0.513301849, -8.55007443e-08, 1, -2.77243419e-08, -0.513301849, -2.00944328e-08, 0.85820812))
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Saber Expert [Lv. 200] [Boss]" then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
      until v.Humanoid.Health <= 0 or _G.Settings.Main["Auto Saber"] == false
      if v.Humanoid.Health <= 0 then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
      end
      _G.Settings.Main["Auto Farm Level"] = true
      end
      end
      end
      end
      end
      end)
    end
    end)
  end)

World1:Toggle("Auto Saber Hop",false,function(value)
  Hop()
  end)

World1:Seperator("Pole V1")
local PoleStatus = World1:Label("")
spawn(function()
  while wait() do
  pcall(function()
    if game.ReplicatedStorage:FindFirstChild("Thunder God [Lv. 575] [Boss]") or game.Workspace.Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
    PoleStatus:Set("Pole Boss Spawned")
    else
      PoleStatus:Set("Pole Boss Not Found")
    end
    end)
  end
  end)

World1:Toggle("Auto Pole",_G.Settings.Main["Auto Pole"],function(value)
  _G.Settings.Main["Auto Pole"] = value
--CancelTween(_G.Settings.Main["Auto Pole"])
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Pole"] then
      if game.ReplicatedStorage:FindFirstChild("Thunder God [Lv. 575] [Boss]") or game.Workspace.Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if v.Name == "Thunder God [Lv. 575] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
      repeat wait()
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
      Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
      elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Farmtween then Farmtween:Stop() end
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
      end
      until not _G.Settings.Main["Auto Pole"] or v.Humanoid.Health <= 0 or not v.Parent
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        Questtween = toTarget(CFrame.new(-7900.66406, 5606.90918, -2267.46436).Position,CFrame.new(-7900.66406, 5606.90918, -2267.46436))
      if (CFrame.new(-7900.66406, 5606.90918, -2267.46436).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Questtween then
      Questtween:Stop()
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7900.66406, 5606.90918, -2267.46436)
      end
      end
      end
      end)
    end
    end)
  end)
-- [World 2 Main Page]
World1:Toggle("Auto Pole V1 Hop",false,function(value)
  Hop()
  end)

elseif World2 then
local World2 = Farms:CraftPage(1)
World2:Seperator("Second Sea")


World2:Toggle(
  "Auto Third World",
  _G.Settings.Main["Auto Third Sea"],
  function(value)
  _G.Settings.Main["Auto Third Sea"] = value
--CancelTween(_G.Settings.Main["Auto Third Sea"])
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Third Sea"] then
      if game.Players.LocalPlayer.Data.Level.Value >= 1500 then
      if Auto_Farm_Level then
      _G.Settings.Main["Auto Farm Level"] = false
      end
      if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
      if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
      Com("F_","TravelZou")
      if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 0 then
      if game.Workspace.Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if v.Name == "rip_indra [Lv. 1500] [Boss]" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
      repeat wait()
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
      Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
      elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Farmtween then Farmtween:Stop() end
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      end
      until not _G.Settings.Main["Auto Third Sea"] or not v.Parent or v.Humanoid.Health <= 0
      wait(.5)
      Check = 2
      repeat wait() Com("F_","TravelZou") until Check == 1
      FastAttack = false
      end
      end
      else
        Com("F_","ZQuestProgress","Check")
      Com("F_","ZQuestProgress","Begin")
      end
      elseif game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
      Com("F_","TravelZou")
      else
        if game.Workspace.Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if v.Name == "Don Swan [Lv. 1000] [Boss]" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
      repeat wait()
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
      Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
      elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Farmtween then Farmtween:Stop() end
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      end
      until not _G.Settings.Main["Auto Third Sea"] or not v.Parent or v.Humanoid.Health <= 0
      FastAttack = false
      end
      end
      else
        TweenDonSwanthireworld = toTarget(CFrame.new(2288.802, 15.1870775, 863.034607).Position,CFrame.new(2288.802, 15.1870775, 863.034607))
      if (CFrame.new(2288.802, 15.1870775, 863.034607).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if TweenDonSwanthireworld then
      TweenDonSwanthireworld:Stop()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2288.802, 15.1870775, 863.034607)
      end
      end
      end
      end
      else
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
      TabelDevilFruitStore = {}
      TabelDevilFruitOpen = {}

      for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
      for i1,v1 in pairs(v) do
      if i1 == "Name" then
      table.insert(TabelDevilFruitStore,v1)
      end
      end
      end

      for i,v in next,game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
      if v.Price >= 1000000 then
      table.insert(TabelDevilFruitOpen,v.Name)
      end
      end

      for i,DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
      for i1,DevilFruitStore in pairs(TabelDevilFruitStore) do
      if DevilFruitOpenDoor == DevilFruitStore and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild(DevilFruitStore) then
      Com("F_","LoadFruit",DevilFruitStore)
      else
        Com("F_","TalkTrevor","1")
      Com("F_","TalkTrevor","2")
      Com("F_","TalkTrevor","3")
      end
      end
      end
      end

      Com("F_","TalkTrevor","1")
      Com("F_","TalkTrevor","2")
      Com("F_","TalkTrevor","3")
      end
      end
      else
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
      if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
      if game.Workspace.Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if v.Name == "Swan Pirate [Lv. 775]" then
      pcall(function()
        repeat wait()
        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
        Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
        elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
        if Farmtween then Farmtween:Stop() end
        FastAttack = true
        StartMagnet = true
        if _G.Settings.Configs["Auto Haki"] then
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
        end
        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
        wait()
        EquipWeapon(_G.Settings.Configs["Select Weapon"])
        end
        PosMon = v.HumanoidRootPart.CFrame
        if not _G.Settings.Configs["Fast Attack"] then
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
        if _G.Settings.Configs["Show Hitbox"] then
        v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
        else
          v.HumanoidRootPart.Transparency = 1
        end
        v.Humanoid.JumpPower = 0
        v.Humanoid.WalkSpeed = 0
        v.HumanoidRootPart.CanCollide = false
        v.Humanoid:ChangeState(11)
        toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
        end
        until not v.Parent or v.Humanoid.Health <= 0 or _G.Settings.Main["Auto Third Sea"] == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
        FastAttack = false
        StartMagnet = false
        end)
      end
      end
      else
        Questtween = toTarget(CFrame.new(1057.92761, 137.614319, 1242.08069).Position,CFrame.new(1057.92761, 137.614319, 1242.08069))
      if (CFrame.new(1057.92761, 137.614319, 1242.08069).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Bartilotween then Bartilotween:Stop() end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1057.92761, 137.614319, 1242.08069)
      end
      end
      else
        Bartilotween = toTarget(CFrame.new(-456.28952, 73.0200958, 299.895966).Position,CFrame.new(-456.28952, 73.0200958, 299.895966))
      if (CFrame.new(-456.28952, 73.0200958, 299.895966).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Bartilotween then Bartilotween:Stop() end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-456.28952, 73.0200958, 299.895966)
      Com("F_","StartQuest","BartiloQuest",1)
      end
      end
      elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
      if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if v.Name == "Jeremy [Lv. 850] [Boss]" then
      repeat wait()
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
      Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
      elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Farmtween then Farmtween:Stop() end
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      end
      until not v.Parent or v.Humanoid.Health <= 0 or _G.Settings.Main["Auto Third Sea"] == false
      FastAttack = false
      end
      end
      else
        Bartilotween = toTarget(CFrame.new(2099.88159, 448.931, 648.997375).Position,CFrame.new(2099.88159, 448.931, 648.997375))
      if (CFrame.new(2099.88159, 448.931, 648.997375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Bartilotween then Bartilotween:Stop() end
      game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2099.88159, 448.931, 648.997375)
      end
      end
      elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
      if (CFrame.new(-1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
      Bartilotween = toTarget(CFrame.new(-1836, 11, 1714).Position,CFrame.new(-1836, 11, 1714))
      elseif (CFrame.new(-1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Bartilotween then Bartilotween:Stop() end
      game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1836, 11, 1714)
      wait(.5)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
      wait(.1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
      wait(.1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
      wait(.1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
      wait(.1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)
      wait(.1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
      wait(.1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)
      wait(.1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
      end
      end
      end
      end
      end
      end)
    end
    end)
  end)

World2:Toggle(
  "Auto Bartilo Quest",
  _G.Settings.Main["Auto Bartilo Quest"],
  function(value)
  _G.Settings.Main["Auto Bartilo Quest"] = value
--CancelTween(_G.Settings.Main["Auto Bartilo Quest"])
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Bartilo Quest"] then
      if game.Players.LocalPlayer.Data.Level.Value >= 850 then
      if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
      if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
      if game.Workspace.Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if v.Name == "Swan Pirate [Lv. 775]" then
      pcall(function()
        repeat wait()
        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
        Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
        elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
        if Farmtween then Farmtween:Stop() end
        FastAttack = true
        StartMagnet = true
        if _G.Settings.Configs["Auto Haki"] then
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
        end
        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
        wait()
        EquipWeapon(_G.Settings.Configs["Select Weapon"])
        end
        PosMon = v.HumanoidRootPart.CFrame
        if not _G.Settings.Configs["Fast Attack"] then
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
        if _G.Settings.Configs["Show Hitbox"] then
        v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
        else
          v.HumanoidRootPart.Transparency = 1
        end
        v.Humanoid.JumpPower = 0
        v.Humanoid.WalkSpeed = 0
        v.HumanoidRootPart.CanCollide = false
        v.Humanoid:ChangeState(11)
        toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
        end
        until not v.Parent or v.Humanoid.Health <= 0 or _G.Settings.Main["Auto Bartilo Quest"] == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
        StartMagnet = false
        FastAttack = false
        end)
      end
      end
      else
        Questtween = toTarget(CFrame.new(1057.92761, 137.614319, 1242.08069).Position,CFrame.new(1057.92761, 137.614319, 1242.08069))
      if (CFrame.new(1057.92761, 137.614319, 1242.08069).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Questtween then
      Questtween:Stop()
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1057.92761, 137.614319, 1242.08069)
      end
      end
      else
        Bartilotween = toTarget(CFrame.new(-456.28952, 73.0200958, 299.895966).Position,CFrame.new(-456.28952, 73.0200958, 299.895966))
      if (CFrame.new(-456.28952, 73.0200958, 299.895966).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Bartilotween then
      Bartilotween:Stop()
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-456.28952, 73.0200958, 299.895966)
      local args = {
        [1] = "StartQuest",
        [2] = "BartiloQuest",
        [3] = 1
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end
      end
      elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
      if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if v.Name == "Jeremy [Lv. 850] [Boss]" then
      repeat wait()
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
      Farmtween = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
      elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Farmtween then Farmtween:Stop() end
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      end
      until not v.Parent or v.Humanoid.Health <= 0 or _G.Settings.Main["Auto Bartilo Quest"] == false
      FastAttack = false
      end
      end
      else
        Bartilotween = toTarget(CFrame.new(2099.88159, 448.931, 648.997375).Position,CFrame.new(2099.88159, 448.931, 648.997375))
      if (CFrame.new(2099.88159, 448.931, 648.997375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Bartilotween then
      Bartilotween:Stop()
      end
      game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2099.88159, 448.931, 648.997375)
      end
      end
      elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
      if (CFrame.new(-1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
      Bartilotween = toTarget(CFrame.new(-1836, 11, 1714).Position,CFrame.new(-1836, 11, 1714))
      elseif (CFrame.new(-1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
      if Bartilotween then
      Bartilotween:Stop()
      end
      game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1836, 11, 1714)
      wait(.5)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)
      wait(1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
      end
      end
      end
      end)
    end
    end)
  end)

World2:Seperator("Dark Coat")

local CoatStatus = World2:Label("")

spawn(function()
  while wait() do
  pcall(function()
    if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
    CoatStatus:Set("Dark Coat Boss Spawned ✅")
    else
      CoatStatus:Set("Dark Coat Boss Not Found ❌")
    end
    end)
  end
  end)

World2:Toggle(
  "Auto Dark Coat",
  _G.Settings.Main["Auto Dark Coat"],
  function(value)
  _G.Settings.Main["Auto Dark Coat"] = value
--CancelTween(_G.Settings.Main["Auto Dark Coat"])
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Dark Coat"] then
      if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == ("Darkbeard [Lv. 1000] [Raid Boss]" or v.Name == "Darkbeard [Lv. 1000] [Raid Boss]") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until _G.Settings.Main["Auto Dark Coat"] == false or v.Humanoid.Health <= 0
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        toTarget(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
      end
      end
      end)
    end
    end)
  end)

World2:Toggle("Auto Dark Coat Hop",false,function(value)
  Hop()
  end)

World2:Seperator("Factory")
--World2:Line()
World2:Toggle(
  "Auto Factory",
  _G.Settings.Main["Auto Factory"],
  function(value)
  _G.Settings.Main["Auto Factory"] = value
--CancelTween(_G.Settings.Main["Auto Factory"])
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Factory"] then
      if game.Workspace.Enemies:FindFirstChild("Core") then
      _G.FactoryCore = true
      if _G.Settings.Main["Auto Farm Level"] then
      Auto_Farm_Level = false
      end
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if _G.FactoryCore and v.Name == "Core" and v.Humanoid.Health > 0 then
      repeat wait()
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,10,10))
      until not _G.FactoryCore or v.Humanoid.Health <= 0 or _G.Settings.Main["Auto Factory"] == false
      end
      end
      elseif game.ReplicatedStorage:FindFirstChild("Core") and game.ReplicatedStorage:FindFirstChild("Core"):FindFirstChild("Humanoid") then
      _G.FactoryCore = true
      if _G.Settings.Main["Auto Farm Level"] then
      Auto_Farm_Level = false
      end
      toTarget(CFrame.new(502.7349853515625, 143.0749053955078, -379.078125))
      elseif not game.ReplicatedStorage:FindFirstChild("Core") then
      if _G.Settings.Main["Auto Factory Hop"] then
      ServerHop:Teleport()
      else
        if _G.Settings.Main["Auto Farm Level"] then
      _G.FactoryCore = false
      Auto_Farm_Level = true
      end
      end
      end
      end
      end)
    end
    end)
  end)

World2:Toggle(
  "Auto Factory Hop",
  _G.Settings.Main["Auto Factory Hop"],
  function(value)
  _G.Settings.Main["Auto Factory Hop"] = value
  SaveSettings()
  end
)

World2:Seperator("True Triple Katana")

local Shisui = World2:Label("❌: Shisui")
local Saddi = World2:Label("❌: Saddi")
local Wando = World2:Label("❌: Wando")
spawn(function()
  while task.wait() do
  pcall(function()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
    if v.Name == "Shisui" then
    Shisui:Set("✅: Shisui")
    end
    if v.Name == "Saddi" then
    Saddi:Set("✅: Saddi")
    end
    if v.Name == "Wando" then
    Wando:Set("✅: Wando")
    end
    end
    end)
  end
  end)

World2:Toggle(
  "Auto True Triple Katana",
  _G.Settings.Main["Auto True Triple Katana"],
  function(value)
  _G.Settings.Main["Auto True Triple Katana"] = value
--CancelTween(_G.Settings.Main["Auto True Triple Katana"])
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto True Triple Katana"] then
      local string_1 = "MysteriousMan";
      local string_2 = "2";
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, string_2);
      end
      end)
    end
    end)
  end)

World2:Seperator("Rengoko Sword")

local Rengoku = World2:Label("❌ : Rengoku")

for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
if v.Name == "Rengoku" then
Rengoku:Set("✅ : Rengoku")
end
end

World2:Toggle(
  "Auto Rengoku Swords",
  _G.Settings.Main["Auto Rengoku"],
  function(value)
  _G.Settings.Main["Auto Rengoku"] = value
--CancelTween(_G.Settings.Main["Auto Rengoku"])
  if value == false then
  toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Rengoku"] then
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
      EquipWeapon("Hidden Key")
      toTarget(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
      elseif game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]") then
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if (v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Arctic Warrior [Lv. 1350]") and v.Humanoid.Health > 0 then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or not _G.Settings.Main["Auto Rengoku"] or not v.Parent or v.Humanoid.Health <= 0
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        StartMagnet = false
      FastAttack = false
      toTarget(CFrame.new(5525.7045898438, 262.90060424805, -6755.1186523438))
      end
      end
      end)
    end
    end)
  end)

World2:Toggle("Auto Rengoku Hop",false,function(value)
  Hop()
  end)

World2:Seperator("Swan Glasses")

local Swan = World2:Label("")

spawn(function()
  while wait() do
  pcall(function()
    if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
    Swan:Set("Swan Glasses Boss Spawned ✅")
    else
      Swan:Set("Swan Glasses Not Found ❌")
    end
    end)
  end
  end)

World2:Toggle(
  "Auto Swan Glasses",
  _G.Settings.Main["Auto Swan Glasses"],
  function(value)
  _G.Settings.Main["Auto Swan Glasses"] = value
--CancelTween(_G.Settings.Main["Auto Swan Glasses"])
  if value == false then
  toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Swan Glasses"] then
      if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Don Swan [Lv. 1000] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Swan Glasses"] or v.Humanoid.Health <= 0
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        repeat wait()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
      until (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 or not _G.Settings.Main["Auto Swan Glasses"]
      end
      end
      end)
    end
    end)
  end)

World2:Toggle("Auto Swan Glasses Hop",false,function(value)
  Hop()
  end)

--World3:Toggle(
--	"Auto Ghoul Race",
--	 _G.Settings.Main["Auto Ghoul Race"],
--	function(value)
--		_G.Settings.Main["Auto Ghoul Race"] = value
--	end,
--})

World2:Seperator(
  "Auto Buy")

World2:Toggle("Auto Buy Legendary Sword",_G.Settings.Main["Auto Buy Legendary Sword"],function(value)
  _G.Settings.Main["Auto Buy Legendary Sword"] = value
  SaveSettings()

  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Buy Legendary Sword"] then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","3")
      end
      end)
    end
    end)
  end)

World2:Toggle(
  "Auto Buy Enchanment Haki",
  _G.Settings.Main["Auto Buy Enchanment Haki"],
  function(value)
  _G.Settings.Main["Auto Buy Enchanment Haki"] = value
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Buy Enchanment Haki"] then
      local args = {
        [1] = "ColorsDealer",
        [2] = "2"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end)
    end
    end)
  end)
-- [World 3 Main Page]

elseif World3 then
local World3 = Farms:CraftPage(1)
World3:Seperator("Third Sea")
--World3:Line()
World3:Toggle(
  "Auto Holy Torch",
  _G.Settings.Main["Auto Holy Torch"],
  function(value)
  _G.Settings.Main["Auto Holy Torch"] = value
--CancelTween(_G.Settings.Main["Auto Holy Torch"])
  if value == false then
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    if _G.Settings.Main["Auto Holy Torch"] then
    repeat toTarget(CFrame.new(-10752, 417, -9366)) wait() until not _G.Settings.Main["Auto Holy Torch"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10752, 417, -9366)).Magnitude <= 10
    wait(1)
    repeat toTarget(CFrame.new(-11672, 334, -9474)) wait() until not _G.Settings.Main["Auto Holy Torch"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-11672, 334, -9474)).Magnitude <= 10
    wait(1)
    repeat toTarget(CFrame.new(-12132, 521, -10655)) wait() until not _G.Settings.Main["Auto Holy Torch"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12132, 521, -10655)).Magnitude <= 10
    wait(1)
    repeat toTarget(CFrame.new(-13336, 486, -6985)) wait() until not _G.Settings.Main["Auto Holy Torch"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13336, 486, -6985)).Magnitude <= 10
    wait(1)
    repeat toTarget(CFrame.new(-13489, 332, -7925)) wait() until not _G.Settings.Main["Auto Holy Torch"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13489, 332, -7925)).Magnitude <= 10
    else
      toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    --break;
    end
    end
    end)
  end)

DoughMob = {
  "Cookie Crafter [Lv. 2200]","Cake Guard [Lv. 2225]","Baking Staff [Lv. 2250]"
}
World3:Toggle(
  "Auto Dough V2",
  _G.Settings.Main["Auto Dough V2"],
  function(value)
  _G.Settings.Main["Auto Dough V2"] = value
  if value == false then
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    if _G.Settings.Main["Auto Dough V2"] then
    if not game:GetService("Workspace").Map.CakeLoaf:FindFirstChild("RedDoor") then
    if game.Players.LocalPlayer.Character:FindFirstChild("Red Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key") then
    local args = {
      [1] = "CakeScientist",
      [2] = "Check"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
      [1] = "RaidsNpc",
      [2] = "Check"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
    elseif game:GetService("Workspace").Map.CakeLoaf:FindFirstChild("RedDoor") then
    if game.Players.LocalPlayer.Character:FindFirstChild("Red Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key") then
    RedDorTween = toTargetP(CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782))
    if (CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 5 then
    if RedDorTween then RedDorTween:Stop() end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)
    wait(0.5)
    EquipWeapon("Red Key")
    wait(0.5)
    end
    elseif game.Workspace:FindFirstChild("Enemies"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") then
    if game:GetService("Workspace").Enemies:FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") then
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    if _G.Settings.Main["Auto Dough V2"] and v.Name == "Dough King [Lv. 2300] [Raid Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
    repeat wait()
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
    Farmtween = toTarget(v.HumanoidRootPart.CFrame)
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    if Farmtween then
    Farmtween:Stop()
    end
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    v.HumanoidRootPart.Size = Vector3.new(55,55,55)
    FastAttack = true
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
    end
    until not _G.Settings.Main["Auto Dough V2"] or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]")
    FastAttack = false
    end
    end
    else
      if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
    FastAttack = false
    Questtween = toTargetP(CFrame.new(-2151.82153, 149.315704, -12404.9053))
    if (CFrame.new(-2151.82153, 149.315704, -12404.9053).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    if Questtween then Questtween:Stop() end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2151.82153, 149.315704, -12404.9053)
    wait(1)
    end
    end
    end
    elseif game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") then
--if string.find(tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)),"already") then

--else
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
    if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]") then
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    if _G.Settings.Main["Auto Dough V2"] and (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
    repeat wait()
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
    Farmtween = toTarget(v.HumanoidRootPart.CFrame)
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    if Farmtween then Farmtween:Stop() end
    FastAttack = true
    PosFarmCakePrince = v.HumanoidRootPart.CFrame
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
    MagnetFarmCakePrince = true
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
    end
    until not _G.Settings.Main["Auto Dough V2"] or not v.Parent or v.Humanoid.Health <= 0
    FastAttack = false
    MagnetFarmCakePrince = false
    end
    end
    else
      MagnetFarmCakePrince = false
    FastAttack = false
    Questtween = toTarget(CFrame.new(-2077, 252, -12373))
    if (CFrame.new(-2077, 252, -12373).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    if Questtween then Questtween:Stop() end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2077, 252, -12373)
    end
    end

--end
    elseif (game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice")) and GetMaterial("Conjured Cocoa") >= 10 then
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
    wait(0.2)
    elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") and (game.Workspace.Enemies:FindFirstChild("Deandre [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Urban [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Diablo [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]")) then
    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") then
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if string.find(v.Name,"Diablo") then
    DoughTween = toTarget(v.HumanoidRootPart.CFrame)
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
    if DoughTween then
    DoughTween:Stop()
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
    end
    end
    if string.find(v.Name,"Urban") then
    DoughTween = toTarget(v.HumanoidRootPart.CFrame)
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
    if DoughTween then
    DoughTween:Stop()
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
    end
    end
    if string.find(v.Name,"Deandre") then
    DoughTween = toTarget(v.HumanoidRootPart.CFrame)
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
    if DoughTween then
    DoughTween:Stop()
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
    end
    end
    end
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    if _G.Settings.Main["Auto Dough V2"] and string.find(v.Name,"Diablo") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
    repeat wait()
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
    Farmtween = toTarget(v.HumanoidRootPart.CFrame)
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    if Farmtween then
    Farmtween:Stop()
    end
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    FastAttack = true
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
    end
    until not _G.Settings.Main["Auto Dough V2"] or not v.Parent or v.Humanoid.Health <= 0
    FastAttack = false
    end
    if _G.Settings.Main["Auto Dough V2"] and string.find(v.Name,"Urban") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
    repeat wait()
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
    Farmtween = toTarget(v.HumanoidRootPart.CFrame)
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    if Farmtween then
    Farmtween:Stop()
    end
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    FastAttack = true
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
    end
    until not _G.Settings.Main["Auto Dough V2"] or not v.Parent or v.Humanoid.Health <= 0
    FastAttack = false
    end
    if _G.Settings.Main["Auto Dough V2"] and string.find(v.Name,"Deandre") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
    repeat wait()
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
    Farmtween = toTarget(v.HumanoidRootPart.CFrame)
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    if Farmtween then
    Farmtween:Stop()
    end
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    FastAttack = true
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
    end
    until not _G.Settings.Main["Auto Dough V2"] or not v.Parent or v.Humanoid.Health <= 0
    FastAttack = false
    end
    end
    else
      local string_1 = "EliteHunter";
    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
    Target:InvokeServer(string_1);
    end
    else
      local string_1 = "EliteHunter";
    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
    Target:InvokeServer(string_1);
    end
    else
      if game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel [Lv. 2375]") or game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief [Lv. 2350]") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler [Lv. 2325]") or game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior [Lv. 2300]") then
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    if _G.Settings.Main["Auto Dough V2"] and (v.Name == "Candy Rebel [Lv. 2375]" or v.Name == "Sweet Thief [Lv. 2350]" or v.Name == "Chocolate Bar Battler [Lv. 2325]" or v.Name == "Cocoa Warrior [Lv. 2300]") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
    repeat wait()
-- if game.Players.LocalPlayer:DistanceFromCharacter(v.HumanoidRootPart.Position) > 3500 then
--     if Questtween then Questtween:Stop() end
--     if game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Dead then return end
--     ResetSetSpawn(v.HumanoidRootPart.CFrame)
-- else
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 150 then
    Farmtween = toTarget(v.HumanoidRootPart.CFrame)
    FastAttack = false
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
    if Farmtween then Farmtween:Stop() end
    FastAttack = true
    PosFarmCoco = v.HumanoidRootPart.CFrame
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
    MagnetFarmCoco = true
    end
    until not _G.Settings.Main["Auto Dough V2"] or not v.Parent or v.Humanoid.Health <= 0
    FastAttack = false
    MagnetFarmCoco = false
    end
    end
    else
      MagnetFarmCoco = false
    FastAttack = false
    Questtween = toTarget(CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625))
    if (CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
    if Questtween then
    Questtween:Stop()
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
    end
    end
    end
    else
      print("Error Whyyy")
    end
    else
      --break;
    end
    end
    end)
  end)

spawn(function()
  while wait() do
  if _G.Settings.Main["Auto Dough V2"] then
  if MagnetFarmCakePrince then
  for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
  if MagnetFarmCakePrince and _G.Settings.Main["Auto Dough V2"] and (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
  if InMyNetWork(v.HumanoidRootPart) then
  v.HumanoidRootPart.CFrame = PosFarmCakePrince
  v.HumanoidRootPart.CanCollide = false
  v.HumanoidRootPart.Size = Vector3.new(60,60,60)
  end
  end
  end
  end
  else
    --break;
  end
  end
  end)

World3:Toggle(
  "Auto Rainbow Haki",
  _G.Settings.Main["Auto Rainbow Haki"],
  function(value)
  _G.Settings.Main["Auto Rainbow Haki"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Rainbow Haki"] then
      if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
      toTarget(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
      if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
      wait(1.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
      end
      elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
      if game:GetService("Workspace").Enemies:FindFirstChild("Stone [Lv. 1550] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Stone [Lv. 1550] [Boss]" then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Rainbow Haki"] or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        toTarget(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
      end
      elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
      if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Island Empress [Lv. 1675] [Boss]" then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Rainbow Haki"] or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        toTarget(CFrame.new(5713.98877, 601.922974, 202.751251, -0.101080291, -0, -0.994878292, -0, 1, -0, 0.994878292, 0, -0.101080291))
      end
      elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
      if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Kilo Admiral [Lv. 1750] [Boss]" then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Rainbow Haki"] or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        toTarget(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
      end
      elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
      if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Rainbow Haki"] or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        toTarget(CFrame.new(-13485.0283, 331.709259, -8012.4873, 0.714521289, 7.98849911e-08, 0.69961375, -1.02065748e-07, 1, -9.94383065e-09, -0.69961375, -6.43015241e-08, 0.714521289))
      end
      elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
      if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Rainbow Haki"] or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        toTarget(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
      end
      else
        toTarget(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
      if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
      wait(1.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
      end
      end
      end
      end)
    end
    end)
  end)

World3:Toggle(
  "Auto Musketeer Hat",
  _G.Settings.Main["Auto Musketeer Hat"],
  function(value)
  _G.Settings.Main["Auto Musketeer Hat"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Musketeer Hat"] then
      if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
      if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
      if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Forest Pirate [Lv. 1825]" then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Musketeer Hat"] or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        toTarget(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
      end
      else
        toTarget(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
      if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
      wait(1.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
      end
      end
      elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
      if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
      if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
      OldCFrameElephant = v.HumanoidRootPart.CFrame
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Musketeer Hat"] or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        toTarget(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
      end
      else
        toTarget(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
      if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
      wait(1.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
      end
      end
      elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
      toTarget(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
      end
      end
      end)
    end
    end)
  end)

World3:Toggle(
  "Auto Ken-Haki V2",
  _G.Settings.Main["Auto Ken-Haki V2"],
  function(value)
  _G.Settings.Main["Auto Ken-Haki V2"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Ken-Haki V2"] then
      if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
      repeat
      toTarget(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625))
      wait()
      until not _G.Settings.Main["Auto Ken-Haki V2"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
      wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
      wait(1)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
      else
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Banana") and game.Players.LocalPlayer.Backpack:FindFirstChild("Apple") and game.Players.LocalPlayer.Backpack:FindFirstChild("Pineapple") then
      repeat
      toTarget(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625))
      wait()
      until not _G.Settings.Main["Auto Ken-Haki V2"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
      wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
      elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game.Players.LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
      repeat
      toTarget(CFrame.new(-10920.125, 624.20275878906, -10266.995117188))
      wait()
      until not _G.Settings.Main["Auto Ken-Haki V2"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
      wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Start")
      wait(1)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Buy")
      elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat 50 Forest Pirates") then
      if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Forest Pirate [Lv. 1825]" then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Ken-Haki V2"] or v.Humanoid.Health <= 0
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        repeat
      toTarget(CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625))
      wait()
      until not _G.Settings.Main["Auto Ken-Haki V2"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13277.568359375, 370.34185791016, -7821.1572265625)).Magnitude <= 10
      end
      elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Captain Elephant (0/1)" then
      if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Ken-Haki V2"] or v.Humanoid.Health <= 0
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        repeat
      toTarget(CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875))
      wait()
      until not _G.Settings.Main["Auto Ken-Haki V2"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13493.12890625, 318.89553833008, -8373.7919921875)).Magnitude <= 10
      end
      else
        for i,v in pairs(game.Workspace:GetDescendants()) do
      if v.Name == "Apple" or v.Name == "Banana" or v.Name == "Pineapple" then
      v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10)
      wait()
      firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
      wait()
      end
      end
      end
      end
      end
      end)
    end
    end)
  end)

World3:Seperator("Dough Prince")

local CakePrinceStatus = World3:Label("")
spawn(function()
  while task.wait() do
  pcall(function()
    if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
    CakePrinceStatus:Set("Killed : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41)..' / 500')
    elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
    CakePrinceStatus:Set("Killed : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40)..' / 500')
    elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
    CakePrinceStatus:Set("Killed : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39)..' / 500')
    else
      CakePrinceStatus:Set("Prince King Spawned ✅")
    end
    end)
  end
  end)

task.spawn(function()
  while wait() do
  pcall(function()
    if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41)) - 500)
    elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),40,41)) - 500)
    elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),41,41)) - 500)
    end
    end)
  end
  end)

World3:Toggle(
  "Auto Cake Prince",
  _G.Settings.Main["Auto Cake Prince"],
  function(value)
  _G.Settings.Main["Auto Cake Prince"] = value
--CancelTween(_G.Settings.Main["Auto Cake Prince"])
  if value == false then
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings()

  task.spawn(function()
    while wait() do
    if _G.Settings.Main["Auto Cake Prince"] then
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
    if game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    if _G.Settings.Main["Auto Cake Prince"] and v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
    repeat wait()
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
    Farmtween = toTarget(v.HumanoidRootPart.CFrame)
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    if Farmtween then
    Farmtween:Stop()
    end
    FastAttack = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    PosMon = v.HumanoidRootPart.CFrame
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
    end
    until not _G.Settings.Main["Auto Cake Prince"] or not v.Parent or v.Humanoid.Health <= 0
    FastAttack = false
    end
    end
    else
      if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 and (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude >= 2000 then
    FastAttack = false
    Questtween = toTarget(CFrame.new(-2151.82153, 149.315704, -12404.9053))
    if (CFrame.new(-2151.82153, 149.315704, -12404.9053).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    if Questtween then Questtween:Stop() end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2151.82153, 149.315704, -12404.9053)
    wait(.1)
    end
    end
    end
    else
      if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]") then
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    if (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
    repeat wait()
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
    Farmtween = toTarget(v.HumanoidRootPart.CFrame)
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    if Farmtween then
    Farmtween:Stop()
    end
    FastAttack = true
    StartMagnet = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    PosMon = v.HumanoidRootPart.CFrame
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
    end
    until not _G.Settings.Main["Auto Cake Prince"] or not v.Parent or v.Humanoid.Health <= 0
    StartMagnet = false
    FastAttack = false
    end
    end
    else
      Questtween = toTarget(CFrame.new(-2077, 252, -12373))
    if (CFrame.new(-2077, 252, -12373).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    if Questtween then Questtween:Stop() end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2077, 252, -12373)
    end
    end
    end
    else
      toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    --break;
    end
    end
    end)
  end)

World3:Seperator("Elite Hunter")
local EliteProgress = World3:Label("")
local BosstElite = World3:Label("")

spawn(function()
  while task.wait(.1) do
  pcall(function()
    local progelit = tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
    EliteProgress:Set("Elite Killed : "..progelit)
    if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") then
    BosstElite:Set("Status : Elite Boss Spawned ✅\n Elite Boss Name : Diablo [Lv. 1750] ")
    elseif game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") then
    BosstElite:Set("Status : Elite Boss Spawned ✅\n Elite Boss Name : Deandre [Lv. 1750] ")
    elseif game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
    BosstElite:Set("Status : Elite Boss Spawned ✅\n Elite Boss Name : Urban [Lv. 1750] ")
    else
      BosstElite:Set("Status : Elite Boss Not Found")
    end
    end)
  end
  end)

World3:Toggle(
  "Auto Elite Hunter",
  _G.Settings.Main["Auto Elite Hunter"],
  function(value)
  _G.Settings.Main["Auto Elite Hunter"] = value
--CancelTween(_G.Settings.Main["Auto Elite Hunter"])
  if value == false then
  toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Elite Hunter"] then
      if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
      if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") then
      for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
      if string.find(v.Name,"Diablo") then
      EliteHunter = toTarget(v.HumanoidRootPart.CFrame)
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if EliteHunter then
      EliteHunter:Stop()
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
      end
      end
      if string.find(v.Name,"Urban") then
      EliteHunter = toTarget(v.HumanoidRootPart.CFrame)
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if EliteHunter then
      EliteHunter:Stop()
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
      end
      end
      if string.find(v.Name,"Deandre") then
      EliteHunter = toTarget(v.HumanoidRootPart.CFrame)
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if EliteHunter then
      EliteHunter:Stop()
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
      end
      end
      end
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if _G.Settings.Main["Auto Elite Hunter"] and string.find(v.Name,"Diablo") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
      repeat wait()
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 150 then
      Farmtween = toTarget(v.HumanoidRootPart.CFrame)
      elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if Farmtween then
      Farmtween:Stop()
      end
      if AttackRandomType == 1 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
      elseif AttackRandomType == 2 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 1, 30)
      elseif AttackRandomType == 3 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(1, 1, -30)
      elseif AttackRandomType == 4 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(30, 1, 0)
      elseif AttackRandomType == 5 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(-30, 1, 0)
      else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
      end
      FastAttack = true
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      until not _G.Settings.Main["Auto Elite Hunter"] or not v.Parent or v.Humanoid.Health <= 0
      FastAttack = false
      end
      if _G.Settings.Main["Auto Elite Hunter"] and string.find(v.Name,"Urban") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
      repeat wait()
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 150 then
      Farmtween = toTarget(v.HumanoidRootPart.CFrame)
      elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if Farmtween then
      Farmtween:Stop()
      end
      if AttackRandomType == 1 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
      elseif AttackRandomType == 2 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 1, 30)
      elseif AttackRandomType == 3 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(1, 1, -30)
      elseif AttackRandomType == 4 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(30, 1, 0)
      elseif AttackRandomType == 5 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(-30, 1, 0)
      else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
      end
      FastAttack = true
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      until not _G.Settings.Main["Auto Elite Hunter"] or not v.Parent or v.Humanoid.Health <= 0
      FastAttack = false
      end
      if _G.Settings.Main["Auto Elite Hunter"] and string.find(v.Name,"Deandre") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
      repeat wait()
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 150 then
      Farmtween = toTarget(v.HumanoidRootPart.CFrame)
      elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if Farmtween then
      Farmtween:Stop()
      end
      if AttackRandomType == 1 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
      elseif AttackRandomType == 2 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 1, 30)
      elseif AttackRandomType == 3 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(1, 1, -30)
      elseif AttackRandomType == 4 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(30, 1, 0)
      elseif AttackRandomType == 5 then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(-30, 1, 0)
      else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
      end
      FastAttack = true
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      until not _G.Settings.Main["Auto Elite Hunter"] or not v.Parent or v.Humanoid.Health <= 0
      FastAttack = false
      end
      end
      else
        local string_1 = "EliteHunter";
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1);
      end
      else
        local string_1 = "EliteHunter";
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1);
      end
      end
      end)
    end
    end)
  end)

World3:Seperator("Buddy Sword")

local queen = World3:Label("")

spawn(function()
  while wait() do
  pcall(function()
    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
    queen:Set("Status : Boss Found ✅")
    else
      queen:Set("Status : Not Found ❌")
    end
    end)
  end
  end)


World3:Toggle(
  "Auto Buddy Swords",
  _G.Settings.Main["Auto Buddy Swords"],
  function(value)
  _G.Settings.Main["Auto Buddy Swords"] = value
--CancelTween(_G.Settings.Main["Auto Buddy Swords"])
  if value == false then
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Buddy Swords"] then
      if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == ("Cake Queen [Lv. 2175] [Boss]" or v.Name == "Cake Queen [Lv. 2175] [Boss]") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Buddy Swords"] or v.Humanoid.Health <= 0
      StartMagnet = false
      FastAttack = false
      end
      end
      end
      end
      end)
    end
    end)
  end)

World3:Seperator("Hallow Sycthe")
local hallow = World3:Label("")

spawn(function()
  while wait() do
  pcall(function()
    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
    hallow:Set("Status : Boss Found ✅")
    else
      hallow:Set("Status : Not Found ❌")

    end
    end)
  end
  end)

World3:Toggle(
  "Auto Hallow Sycthe Boss",
  _G.Settings.Main["Auto Farm Boss Hallow"],
  function(value)
  _G.Settings.Main["Auto Farm Boss Hallow"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Farm Boss Hallow"] then
      if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if string.find(v.Name , "Soul Reaper") then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until v.Humanoid.Health <= 0 or not _G.Settings.Main["Auto Farm Boss Hallow"]
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        toTarget(CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813))
      end
      end
      end)
    end
    end)
  end)

World3:Seperator("Canvander Sword")

local cavander = World3:Label("")

spawn(function()
  while wait() do
  pcall(function()
    if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
    cavander:Set("Status : Boss Found ✅")
    else
      cavander:Set("Status : Not Found ❌")
    end
    end)
  end
  end)


World3:Toggle(
  "Auto Cavander",
  _G.Settings.Main["Auto Cavander"],
  function(value)
  _G.Settings.Main["Auto Cavander"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Cavander"] then
      if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == ("Beautiful Pirate [Lv. 1950] [Boss]") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Cavander"] or v.Humanoid.Health <= 0
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        toTarget(CFrame.new(5283.609375, 22.56223487854, -110.78285217285))
      end
      end
      end)
    end
    end)
  end)

World3:Seperator("Yama Sword")
World3:Label("Kill 30 Elite Boss First!")
local killedelite = World3:Label("")
local progelit = tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
killedelite:Set("Elite Killed : "..progelit)

World3:Toggle(
  "Auto Yama Sword",
  _G.Settings.Main["Auto Yama Sword"],
  function(value)
  _G.Settings.Main["Auto Yama Sword"] = value
  SaveSettings()
  spawn(function()
    while wait() do
    if _G.Settings.Main["Auto Yama Sword"] then
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
    repeat wait()
    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
    until game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") or not AutoYama
    end
    end
    end
    end)
  end)

World3:Seperator("Tushita Sword")

World3:Toggle(
  "Auto Kill Tushita Boss",
  _G.Settings.Main["Auto Tushita Sword"],
  function(value)
  _G.Settings.Main["Auto Tushita Sword"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    if _G.Settings.Main["Auto Tushita Sword"] then
    if game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == ("Longma [Lv. 2000] [Boss]" or v.Name == "Longma [Lv. 2000] [Boss]") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
    repeat wait()
    StartMagnet = true
    FastAttack = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    PosMon = v.HumanoidRootPart.CFrame
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
    until not _G.Settings.Main["Auto Tushita Sword"] or not v.Parent or v.Humanoid.Health <= 0
    StartMagnet = false
    FastAttack = false
    end
    end
    else
      toTarget(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
    end
    end
    end
    end)
  end)

World3:Toggle('Auto Fully Tushita', AutoTushita, function(autotushitafunc)
  AutoTushita = autotushitafunc
  end)
spawn(function()
  while task.wait(.1) do
  if AutoTushita then
  pcall(function()
    autoTushita()
    end)
  end
  end
  end)
function enemyrip()
toTarget(CFrame.new(-5332.30371, 423.985413, -2673.48218))
wait()
if game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
local mobs = game.Workspace.Enemies:GetChildren()
for i,v in pairs(mobs) do
if v.Name == "rip_indra True Form [Lv. 5000] [Raid Boss]" and v:IsA("Model") and v:FindFirstChild("Humanoid") and
v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
return v
end
end
end
return game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]")
end
function enemyEliteBoss()
if game.Workspace.Enemies:FindFirstChild("Deandre [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Urban [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Diablo [Lv. 1750]") then
local mobs = game.Workspace.Enemies:GetChildren()
for i,v in pairs(mobs) do
if v.Name == "Deandre [Lv. 1750]" or v.Name == "Diablo [Lv. 1750]" or v.Name == "Urban [Lv. 1750]" and v:IsA("Model") and v:FindFirstChild("Humanoid") and
v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
return v
end
end
end
return game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]")
end
function enemylongma()
toTarget(CFrame.new(-10171.7051, 406.981995, -9552.31738))
if game.Workspace.Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") then
local mobs = game.Workspace.Enemies:GetChildren()
for i,v in pairs(mobs) do
if v.Name == "Longma [Lv. 2000] [Boss]" and v:IsA("Model") and v:FindFirstChild("Humanoid") and
v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
return v
end
end
end
return game.ReplicatedStorage:FindFirstChild("Longma [Lv. 2000] [Boss]")
end
function autoTushita()
if not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
if game.Workspace.Enemies:FindFirstChild("Deandre [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Urban [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Diablo [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]") then
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
repeat toTarget(CFrame.new(5420.49219, 314.446045, -2823.07373)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(1)
repeat toTarget(CFrame.new(5420.49219, 314.446045, -2823.07373)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(1.1)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
wait(1)
elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
CheckQuest()
pcall(function()
  EquipWeapon(_G.Settings.Configs["Select Weapon"])
  pcall(function()
    local v = enemyEliteBoss()
    v.HumanoidRootPart.CanCollide = false
    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
    toTarget(v.HumanoidRootPart.CFrame * Farm_Mode)
    Click()
    end)
  end)
end
else
  toTarget(CFrame.new(-12554.9443, 337.194092, -7501.44727))
end
elseif game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
wait(0.5)
repeat toTarget(CFrame.new(-5420.16602, 1084.9657, -2666.8208)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude <= 10
wait(0.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
wait(0.5)
repeat toTarget(CFrame.new(-5414.41357, 309.865753, -2212.45776)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5414.41357, 309.865753, -2212.45776)).Magnitude <= 10
wait(0.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
wait(0.5)
repeat toTarget(CFrame.new(-4971.47559, 331.565765, -3720.02954)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude <= 10
wait(0.5)
EquipTool("God's Chalice")
wait(0.5)
repeat toTarget(CFrame.new(-5560.27295, 313.915466, -2663.89795)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5560.27295, 313.915466, -2663.89795)).Magnitude <= 10
wait(0.5)
repeat toTarget(CFrame.new(-5561.37451, 313.342529, -2663.4948)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(1)
repeat toTarget(CFrame.new(5154.17676, 141.786423, 911.046326)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(0.2)
repeat toTarget(CFrame.new(5148.03613, 162.352493, 910.548218)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(1)
EquipTool("Holy Torch")
wait(1)
wait(0.4)
repeat toTarget(CFrame.new(-10752.7695, 412.229523, -9366.36328)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(0.4)
repeat toTarget(CFrame.new(-11673.4111, 331.749023, -9474.34668)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(0.4)
repeat toTarget(CFrame.new(-12133.3389, 519.47522, -10653.1904)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(0.4)
repeat toTarget(CFrame.new(-13336.5, 485.280396, -6983.35254)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(0.4)
repeat toTarget(CFrame.new(-13487.4131, 334.84845, -7926.34863)) wait() until not AutoTushita or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
wait(1)
elseif game.Workspace.Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") or game.ReplicatedStorage:FindFirstChild("Longma [Lv. 2000] [Boss]") then
pcall(function()
  EquipWeapon(_G.Settings.Configs["Select Weapon"])
  pcall(function()
    local v = enemylongma()
    v.HumanoidRootPart.CanCollide = false
    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
    toTarget(v.HumanoidRootPart.CFrame * Farm_Mode)
    Click()
    end)
  end)
elseif game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") or game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
pcall(function()
  EquipWeapon(_G.Settings.Configs["Select Weapon"])
  pcall(function()
    local v = enemyrip()
    v.HumanoidRootPart.CanCollide = false
    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
    toTarget(v.HumanoidRootPart.CFrame * Farm_Mode)
    Click()
    end)
  end)
else
  toTarget(CFrame.new(-12554.9443, 337.194092, -7501.44727))
end
end

World3:Seperator("Serpent Bow")
local serpent = World3:Label("")

spawn(function()
  while wait() do
  pcall(function()
    if game.Workspace.Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
    serpent:Set("Status : Boss Found ✅")
    else
      serpent:Set("Status : Not Found ❌")

    end
    end)
  end
  end)

World3:Toggle(
  "Auto Serpent Bow",
  _G.Settings.Main["Auto Serpent Bow"],
  function(value)
  _G.Settings.Main["Auto Serpent Bow"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    if _G.Settings.Main["Auto Serpent Bow"] then
    if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == ("Island Empress [Lv. 1675] [Boss]" or v.Name == "Island Empress [Lv. 1675] [Boss]") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
    repeat wait()
    StartMagnet = true
    FastAttack = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    PosMon = v.HumanoidRootPart.CFrame
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
    until not _G.Settings.Main["Auto Serpent Bow"] or not v.Parent or v.Humanoid.Health <= 0
    StartMagnet = false
    FastAttack = false
    end
    end
    else
      toTarget(CFrame.new(5543.86328125, 668.97399902344, 199.0341796875))
    end
    end
    end
    end)
  end)

local Daggers = World3:Label("")

spawn(function()
  while wait() do
  pcall(function()
    if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
    Daggers:Set("Status : Boss Found ✅")
    else
      Daggers:Set("Status : Not Found ❌")

    end
    end)
  end
  end)


World3:Toggle(
  "Auto Dark Dagger",
  _G.Settings.Main["Auto Dark Dagger"],
  function(value)
  _G.Settings.Main["Auto Dark Dagger"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.Main["Auto Dark Dagger"] then
      if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == ("rip_indra True Form [Lv. 5000] [Raid Boss]" or v.Name == "rip_indra True Form [Lv. 5000] [Raid Boss]") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not _G.Settings.Main["Auto Dark Dagger"] or not v.Parent or v.Humanoid.Health <= 0
      StartMagnet = false
      FastAttack = false
      end
      end
      else
        toTarget(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
      end
      end
      end)
    end
    end)
  end)


World3:Seperator(
  "Soul Guitar"
)

World3:Label(
  "Soul Guitar Quest 3 Not Work Now"
)

World3:Toggle(
  "Auto Quest Soul Guitar",
  _G.Settings.Main["Auto Quest Soul Guitar"],
  function(value)
  _G.Settings.Main["Auto Quest Soul Guitar"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  end
)

task.spawn(function()
  while wait() do
  pcall(function()
    if _G.Settings.Main["Auto Quest Soul Guitar"] then
    if GetWeaponInventory("Soul Guitar") == false then
    if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
    if game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy",true)
    else
      if game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0 then
    if game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0 then
    Quest2 = true
    repeat wait() toTarget(CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875)) until (CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.Main["Auto Quest Soul Guitar"]
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
    wait(1)
    elseif game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
    if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
    Quest4 = true
    repeat wait() toTarget(CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625)) until (CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.Main["Auto Quest Soul Guitar"]
    wait(1)
    toTarget(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
    wait(1)
    toTarget(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
    wait(1)
    toTarget(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
    wait(1)
    toTarget(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
    wait(1)
    toTarget(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
    wait(1)
    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
    else
      Quest3 = true
--Not Work Yet
    end
    else
      if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
    local args = {
      [1] = "GuitarPuzzleProgress",
      [2] = "Ghost"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
    if game.Workspace.Enemies:FindFirstChild("Living Zombie [Lv. 2000]") then
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
    if v.Name == "Living Zombie [Lv. 2000]" then
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    v.HumanoidRootPart.Transparency = 1
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
    toTarget(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    end
    end
    else
      toTarget(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
    end
    end
    else
      if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Error") then
    print("Go to Grave")
    toTarget(CFrame.new(-8653.2060546875, 140.98487854003906, 6160.033203125))
    elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Nothing") then
    print("Wait Next Night")
    else
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2,true)
    end
    end
    end
    else
      toTarget(CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125))
    end
    end
    end
    end)
  end
  end)

--World3:Line()

World3:Seperator(
  "Cursed Dual Katana"
)

local Yama = World3:Label("❌ : Yama")

local Tushita = World3:Label("❌ : Tushita")


spawn(function()
  while task.wait() do
  pcall(function()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
    if v.Name == "Yama" then
    Yama:Set("✅ : Yama")
    end
    if v.Name == "Tushita" then
    Tushita:Set("✅ : Tushita")
    end
    end
    end)
  end
  end)

World3:Toggle(
  "Auto Cursed Dual Katana",
  Auto_Cursed_Dual_Katana,
  function(value)
  Auto_Cursed_Dual_Katana = value
  end
)

spawn(function()
  while wait() do
  pcall(function()
    if Auto_Cursed_Dual_Katana then
    if GetWeaponInventory("Cursed Dual Katana") == true then
    if game.Players.LocalPlayer.Character:FindFirstChild("Cursed Dual Katana") or game.Players.LocalPlayer.Backpack:FindFirstChild("Cursed Dual Katana") then

    else
      print("Get Weapon")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Cursed Dual Katana")
    end
    else
      if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
    if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
    EquipWeapon("Tushita")
    else
      for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v.Name == "Tushita" and v:IsA("Tool") then
    if v.Level.Value >= 350 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Yama")
    _G.Settings.Main["Auto Farm Bone"] = false
    else
      _G.Select_Weapon = "Tushita"
    _G.Settings.Main["Auto Farm Bone"] = true
    end
    end
    end
    end
    elseif game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
    EquipWeapon("Yama")
    else
      for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v.Name == "Yama" and v:IsA("Tool") then
    if v.Level.Value >= 350 then
    Auto_CDK_Quest = true
    _G.Settings.Main["Auto Farm Bone"] = false
    else
      _G.Select_Weapon = "Yama"
    _G.Settings.Main["Auto Farm Bone"] = true
    end
    end
    end
    end
    end
    else
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
    end
    end
    end
    end)
  end
  end)

spawn(function()
  while wait() do
  pcall(function()
    if Auto_CDK_Quest then
    if GetMaterial("Alucard Fragment") == 0 then
    Auto_Quest_Yama_1 = true
    Auto_Quest_Yama_2 = false
    Auto_Quest_Yama_3 = false
    Auto_Quest_Tushita_1 = false
    Auto_Quest_Tushita_2 = false
    Auto_Quest_Tushita_3 = false
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
    elseif GetMaterial("Alucard Fragment") == 1 then
    Auto_Quest_Yama_1 = false
    Auto_Quest_Yama_2 = true
    Auto_Quest_Yama_3 = false
    Auto_Quest_Tushita_1 = false
    Auto_Quest_Tushita_2 = false
    Auto_Quest_Tushita_3 = false
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
    elseif GetMaterial("Alucard Fragment") == 2 then
    Auto_Quest_Yama_1 = false
    Auto_Quest_Yama_2 = false
    Auto_Quest_Yama_3 = true
    Auto_Quest_Tushita_1 = false
    Auto_Quest_Tushita_2 = false
    Auto_Quest_Tushita_3 = false
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
    elseif GetMaterial("Alucard Fragment") == 3 then
    Auto_Quest_Yama_1 = false
    Auto_Quest_Yama_2 = false
    Auto_Quest_Yama_3 = false
    Auto_Quest_Tushita_1 = true
    Auto_Quest_Tushita_2 = false
    Auto_Quest_Tushita_3 = false
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
    elseif GetMaterial("Alucard Fragment") == 4 then
    Auto_Quest_Yama_1 = false
    Auto_Quest_Yama_2 = false
    Auto_Quest_Yama_3 = false
    Auto_Quest_Tushita_1 = false
    Auto_Quest_Tushita_2 = true
    Auto_Quest_Tushita_3 = false
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
    elseif GetMaterial("Alucard Fragment") == 5 then
    Auto_Quest_Yama_1 = false
    Auto_Quest_Yama_2 = false
    Auto_Quest_Yama_3 = false
    Auto_Quest_Tushita_1 = false
    Auto_Quest_Tushita_2 = false
    Auto_Quest_Tushita_3 = true
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
    elseif GetMaterial("Alucard Fragment") == 6 then
    if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").ReplicatedStorage:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") then
    Auto_Quest_Yama_1 = false
    Auto_Quest_Yama_2 = false
    Auto_Quest_Yama_3 = false
    Auto_Quest_Tushita_1 = false
    Auto_Quest_Tushita_2 = false
    Auto_Quest_Tushita_3 = false
    if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == "Cursed Skeleton Boss [Lv. 2025] [Boss]" or v.Name == "Cursed Skeleton [Lv. 2200]" then
    if v.Humanoid.Health > 0 then
    v.HumanoidRootPart.CanCollide = false
    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    end
    end
    end
    else
      if (CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
    wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
    wait(1)
    toTarget(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
    wait(1.5)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
    wait(1.5)
    toTarget(CFrame.new(-12253.5419921875, 598.8999633789062, -6546.8388671875))
    else
      toTarget(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
    end
    end
    end
    end
    end)
  end
  end)

spawn(function()
  while wait() do
  if Auto_Quest_Yama_1 then
  pcall(function()
    if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate [Lv. 1850]") then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == "Mythological Pirate [Lv. 1850]" then
    repeat wait()
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,0,-2))
    until Auto_CDK_Quest == false or Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_1 == false
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
    end
    end
    else
      toTarget(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
    end
    end)
  end
  end
  end)

spawn(function()
  while wait() do
  pcall(function()
    if Auto_Quest_Yama_2 then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v:FindFirstChild("HazeESP") then
    v.HazeESP.Size = UDim2.new(50,50,50,50)
    v.HazeESP.MaxDistance = "inf"
    end
    end
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if v:FindFirstChild("HazeESP") then
    v.HazeESP.Size = UDim2.new(50,50,50,50)
    v.HazeESP.MaxDistance = "inf"
    end
    end
    end
    end)
  end
  end)

spawn(function()
  while wait() do
  pcall(function()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if Auto_Quest_Yama_2 and v:FindFirstChild("HazeESP") and (v.HumanoidRootPart.Position - PosMonsEsp.Position).magnitude <= 300 then
    v.HumanoidRootPart.CFrame = PosMonsEsp
    v.HumanoidRootPart.CanCollide = false
    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    if not v.HumanoidRootPart:FindFirstChild("BodyVelocity") then
    local vc = Instance.new("BodyVelocity", v.HumanoidRootPart)
    vc.MaxForce = Vector3.new(1, 1, 1) * math.huge
    vc.Velocity = Vector3.new(0, 0, 0)
    end
    end
    end
    end)
  end
  end)

spawn(function()
  while wait() do
  if Auto_Quest_Yama_2 then
  pcall(function()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v:FindFirstChild("HazeESP") then
    repeat wait()
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
    BTP(y.HumanoidRootPart.CFrameMon * CFrame.new(0,20,0))
    else
      StartMagnet = true
    FastAttack = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    PosMonsEsp = v.HumanoidRootPart.CFrame
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
    end
    until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_2 == false or not v.Parent or v.Humanoid.Health <= 0 or not v:FindFirstChild("HazeESP")
    else
      for x,y in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if y:FindFirstChild("HazeESP") then
    if (y.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
    BTP(y.HumanoidRootPart.CFrameMon* CFrame.new(0,20,0))
    else
      toTarget(y.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
    end
    end
    end
    end
    end
    end)
  end
  end
  end)

spawn(function()
  while wait() do
  if Auto_Quest_Yama_3 then
  pcall(function()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
    _G.Settings.Main["Auto Farm Bone"] = false
    toTarget(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
    elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
    repeat wait()
    if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Hell's Messenger [Lv. 2200] [Boss]") then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == "Cursed Skeleton [Lv. 2200]" or v.Name == "Cursed Skeleton [Lv. 2200] [Boss]" or v.Name == "Hell's Messenger [Lv. 2200] [Boss]" then
    if v.Humanoid.Health > 0 then
    repeat wait()
    StartMagnet = true
    FastAttack = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    PosMonsEsp = v.HumanoidRootPart.CFrame
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
    until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Yama_3 == false
    end
    end
    end
    else
      wait(5)
    toTarget(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame)
    wait(1.5)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
    wait(1.5)
    toTarget(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame)
    wait(1.5)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
    wait(1.5)
    toTarget(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame)
    wait(1.5)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
    wait(1.5)
    toTarget(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
    end
    until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_3 == false or GetMaterial("Alucard Fragment") == 3
    else
      if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == "Soul Reaper [Lv. 2100] [Raid Boss]" then
    if v.Humanoid.Health > 0 then
    repeat wait()
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,0,-2))
    until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_3 == false or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
    end
    end
    end
    else
      toTarget(CFrame.new(-9570.033203125, 315.9346923828125, 6726.89306640625))
    end
    else
      _G.Settings.Main["Auto Farm Bone"] = true
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
    end
    end
    end)
  end
  end
  end)

spawn(function()
  while wait() do
  if Auto_Quest_Tushita_1 then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
  end
  end
  end)

spawn(function()
  while wait() do
  if Auto_Quest_Tushita_1 then
  BTP(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
  wait(5)
  BTP(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
  wait(5)
  BTP(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875))
  end
  end
  end)

spawn(function()
  while wait() do
  if Auto_Quest_Tushita_2 then
  pcall(function()
    if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if Auto_Quest_Tushita_2 and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
    repeat wait()
    v.HumanoidRootPart.CanCollide = false
    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Tushita_2 == false
    end
    end
    end
    else
      toTarget(CFrame.new(-5545.1240234375, 313.800537109375, -2976.616455078125))
    end
    end)
  end
  end
  end)

spawn(function()
  while wait() do
  if Auto_Quest_Tushita_3 then
  pcall(function()
    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") or game.ReplicatedStorage:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == "Cake Queen [Lv. 2175] [Boss]" then
    if v.Humanoid.Health > 0 then
    repeat wait()
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
    until Auto_Cursed_Dual_Katana == false or Auto_Quest_Tushita_3 == false or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension")
    end
    end
    end
    else
      toTarget(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
    end
    elseif game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
    repeat wait()
    if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven's Guardian [Lv. 2200] [Boss]") then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == "Cursed Skeleton [Lv. 2200]" or v.Name == "Cursed Skeleton [Lv. 2200] [Boss]" or v.Name == "Heaven's Guardian [Lv. 2200] [Boss]" then
    if v.Humanoid.Health > 0 then
    repeat wait()
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Tushita_3 == false
    end
    end
    end
    else
      wait(5)
    toTarget(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame)
    wait(1.5)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
    wait(1.5)
    toTarget(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame)
    wait(1.5)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
    wait(1.5)
    toTarget(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame)
    wait(1.5)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
    wait(1.5)
    toTarget(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
    end
    until Auto_Cursed_Dual_Katana == false or Auto_Quest_Tushita_3 == false or GetMaterial("Alucard Fragment") == 6
    else
      ServerHop:Teleport()
    end
    end)
  end
  end
  end)

Tushita_Quest1 = nil
World3:Button("Tushita Quest : 1",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
  wait(1)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
  Tushita_Quest1 = true
  toTarget(CFrame.new(-6127.5712890625, 16.446542739868164, -2247.595703125))
  wait(60)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
  wait(1)
  toTarget(CFrame.new(-127.23313903808594, 6.755744934082031, 5259.51025390625))
  wait(60)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
  wait(1)
  toTarget(CFrame.new(-2067.349365234375, 4.701088905334473, -9890.4501953125))
  wait(60)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
  Tushita_Quest1 = false
  end)

if Tushita_Quest1 == false then
World3:Toggle(
  "Tushita Quest : 2",
  Tushita_Quest2,
  function(value)
  Tushita_Quest2 = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if Tushita_Quest2 then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
      wait(1)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
      wait(.5)
      if game:GetService("Workspace").Enemies:GetChildren() then
      toTarget(CFrame.new(-5523.9453125, 313.7913818359375, -2958.09765625))
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if Tushita_Quest2 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until v.Humanoid.Health <= 0 or not Tushita_Quest2
      StartMagnet = false
      FastAttack = false
      end
      end
      end
      end
      end)
    end
    end)
  end)

World3:Label(
  "Use Auto Buddy Sword / Self-ignite torch / Near Farm"
)

--World3:Line()

World3:Label("Yama Quest")

World3:Toggle(
  "Yama Quest : 1",
  YamaQuest1,
  function(value)
  YamaQuest1 = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if YamaQuest1 then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Yama")
      wait(.1)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
      wait(.1)
      toTarget(CFrame.new(-13284.16796875, 332.4040222167969, -7899.060546875))
      end
      end)
    end
    end)
  end)

World3:Toggle(
  "Yama Quest : 2",
  YamaQuest2,
  function(value)
  YamaQuest2 = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if YamaQuest2 then
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
      if YamaQuest2 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HazeESP") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
      repeat wait()
      StartMagnet = true
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      PosMon = v.HumanoidRootPart.CFrame
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      until not YamaQuest2 or not v.Parent or v.Humanoid.Health <= 0
      StartMagnet = false
      FastAttack = false
      end
      end
      end
      end)
    end
    end)
  end)

World3:Label("Walk up to the Halloween boss and kill afterward, light your torch and turn on the Auto Near Farm.")
end
end

task.spawn(function()
  while wait() do
  pcall(function()
    if GetWeaponInventory("Soul Guitar") == false then
    if _G.Settings.Main["Auto Material Soul Guitar"] then
    if GetMaterial("Bones") >= 500 and GetMaterial("Ectoplasm") >= 250 and GetMaterial("Dark Fragment") >= 1 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy",true)
    else
      if GetMaterial("Ectoplasm") <= 250 then
    if World2 then
    if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]") then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == "Ship Deckhand [Lv. 1250]" or v.Name == "Ship Engineer [Lv. 1275]" or v.Name == "Ship Steward [Lv. 1300]" or v.Name == "Ship Officer [Lv. 1325]" or v.Name == "Arctic Warrior [Lv. 1350]" then
    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
    repeat wait()
    StartMagnet = true
    FastAttack = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    PosMon = v.HumanoidRootPart.CFrame
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
    until not _G.Settings.Main["Auto Material Soul Guitar"] or not v.Parent or v.Humanoid.Health <= 0
    StartMagnet = false
    FastAttack = false
    end
    end
    end
    else
      StartMagnet = false
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
    end
    else
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
    elseif GetMaterial("Dark Fragment") < 1 then
    if World2 then
    if game.ReplicatedStorage:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    if v.Name == "Darkbeard [Lv. 1000] [Raid Boss]" and v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
    repeat task.wait()
    FastAttack = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
    until _G.Settings.Main["Auto Material Soul Guitar"] or v.Humanoid.Health <= 0
    end
    end
    else
      toTarget(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
    end
    else
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
    elseif GetMaterial("Bones") <= 500 then
    if World3 then
    if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
    repeat wait()
    StartMagnet = true
    FastAttack = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    PosMon = v.HumanoidRootPart.CFrame
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
    until not _G.Settings.Main["Auto Material Soul Guitar"] or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
    StartMagnet = false
    FastAttack = false
    end
    end
    end
    else
      toTarget(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
    end
    else
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
    end
    end
    end
    end
    end)
  end
  end)

Farms2:Toggle(
  "Auto God Human",
  _G.Settings.FightingStyle["Auto God Human"],
  function(value)
  _G.Settings.FightingStyle["Auto God Human"] = value
  BuyGodhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true))
  if BuyGodhuman then
  if BuyGodhuman ~= 1 then
  GetAllMeleeFarm()
  end
  end
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.FightingStyle["Auto God Human"] then
      BuyGodhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true))
      if BuyGodhuman then
      if BuyGodhuman == 1 then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
      _G.Settings.FightingStyle["Auto God Human"] = false
      end
      end
      if not HasTalon then
      BuyDragonTalon = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true))

      if BuyDragonTalon then
      if BuyDragonTalon == 1 then
      HasTalon = true
      end
      end
      end
      if not HasSuperhuman then
      BuySuperhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true))

      if BuySuperhuman then
      if BuySuperhuman == 1 then
      HasSuperhuman = true
      end
      end
      end
      if not HasKarate then
      BuySharkmanKarate = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true))

      if BuySharkmanKarate then
      if BuySharkmanKarate == 1 then
      HasKarate = true
      end
      end
      end
      if not HasDeathStep then
      BuyDeathStep = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true))

      if BuyDeathStep then
      if BuyDeathStep == 1 then
      HasDeathStep = true
      end
      end
      end
      if not HasElectricClaw then
      BuyElectricClaw = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true))
      if BuyElectricClaw then
      if BuyElectricClaw == 1 then
      HasElectricClaw = true
      end
      end
      end

      if not HasSuperhuman then
      if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") and not game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and not game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and not game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and not game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and not game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and not game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") then
      local args = {
        [1] = "BuyElectro"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end
      end
      end
      end
      end
      _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")

      if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
      local args = {
        [1] = "BuyElectro"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
      local args = {
        [1] = "BuyBlackLeg"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
      local args = {
        [1] = "BuyBlackLeg"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
      local args = {
        [1] = "BuyFishmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
      local args = {
        [1] = "BuyFishmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
      local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "2"
      }
      HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      if _G.Settings.FightingStyle["Auto God Human"] and game.Players.LocalPlayer.Data.Fragments.Value <= 1500 and HaveDragonClaw == 0 then
      if game.Players.LocalPlayer.Data.Level.Value > 1100 then
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = false end
      end
      else
        if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "2"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
      local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "2"
      }
      HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      if _G.Settings.FightingStyle["Auto God Human"] and game.Players.LocalPlayer.Data.Fragments.Value <= 1500 and HaveDragonClaw == 0 then
      if game.Players.LocalPlayer.Data.Level.Value > 1100 then
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = false end
      end
      else
        if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "2"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      end
      end

      if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      local args = {
        [1] = "BuySuperhuman"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      local args = {
        [1] = "BuySuperhuman"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end
      elseif not HasKarate then
      if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and not game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and not game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") then
      local args = {
        [1] = "BuyFishmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end

      if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 then
      if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == "I lost my house keys, could you help me find them? Thanks." and not game.Players.LocalPlayer.Character:FindFirstChild("Water Key") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key") then
      if World2 then
      KillSharkMan = true
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = false end
      else
        KillSharkMan = false
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      end
      elseif tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)) == 1 then
      KillSharkMan = false
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      local args = {
        [1] = "BuySharkmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      elseif game.Players.LocalPlayer.Character:FindFirstChild("Water Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key") then
      KillSharkMan = false
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      local args = {
        [1] = "BuySharkmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end

      if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
      if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == "I lost my house keys, could you help me find them? Thanks." and not game.Players.LocalPlayer.Character:FindFirstChild("Water Key") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key") then
      if World2 then
      KillSharkMan = true
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = false end
      else
        if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      KillSharkMan = false
      end
      elseif tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)) == 1 then
      KillSharkMan = false
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      local args = {
        [1] = "BuySharkmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      elseif game.Players.LocalPlayer.Character:FindFirstChild("Water Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key") then
      KillSharkMan = false
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      local args = {
        [1] = "BuySharkmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end
      _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")
      end
      elseif not HasDeathStep then
      if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 then
      local args = {
        [1] = "BuyDeathStep"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 400 then
      local args = {
        [1] = "BuyDeathStep"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

      end
      _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")
      end
      elseif not HasTalon then
      if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
      _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")

      if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
      if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 3 then
      local string_1 = "Bones";
      local string_2 = "Buy";
      local number_1 = 1;
      local number_2 = 1;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, string_2, number_1, number_2);

      local string_1 = "BuyDragonTalon";
      local bool_1 = true;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, bool_1);
      elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1 then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
      else
        local string_1 = "Bones";
      local string_2 = "Buy";
      local number_1 = 1;
      local number_2 = 1;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, string_2, number_1, number_2);
      end
      end

      if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
      if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 3 then
      local string_1 = "Bones";
      local string_2 = "Buy";
      local number_1 = 1;
      local number_2 = 1;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, string_2, number_1, number_2);

      local string_1 = "BuyDragonTalon";
      local bool_1 = true;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, bool_1);
      elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1 then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
      else
        local string_1 = "Bones";
      local string_2 = "Buy";
      local number_1 = 1;
      local number_2 = 1;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, string_2, number_1, number_2);
      end
      end
      end
      elseif not HasElectricClaw then
      if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
      _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
      local v175 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true);
      if v175 == 4 then
      local v176 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
      if v176 == nil then
      game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12548, 337, -7481)
      end
      else
        local string_1 = "BuyElectricClaw";
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1);
      end
      end

      if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
      local v175 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true);
      if v175 == 4 then
      local v176 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
      if v176 == nil then
      game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12548, 337, -7481)
      end
      else
        local string_1 = "BuyElectricClaw";
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1);
      end
      end
      end
      end
      if BuyGodhuman ~= 1 and HasSuperhuman and HasTalon and HasKarate and HasDeathStep and HasElectricClaw then
      if HasSuperhuman and not SupComplete then
      local args = {
        [1] = "BuySuperhuman"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      wait(0.2)
      if CheckMasteryWeapon("Superhuman",400) == "true UpTo" or CheckMasteryWeapon("Superhuman",400) == "true" and SupComplete == false then
      SupComplete = true
      end
      elseif HasTalon and not TalComplete then
      local args = {
        [1] = "BuyDragonTalon"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      wait(0.2)
      if CheckMasteryWeapon("Dragon Talon",400) == "true UpTo" or CheckMasteryWeapon("Superhuman",400) == "true" and TalComplete == false then
      TalComplete = true
      end
      elseif HasKarate and not SharkComplete then
      local args = {
        [1] = "BuySharkmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      wait(0.2)
      if CheckMasteryWeapon("Sharkman Karate",400) == "true UpTo" or CheckMasteryWeapon("Superhuman",400) == "true" and SharkComplete == false then
      SharkComplete = true
      end
      elseif HasDeathStep and not DeathComplete then
      local args = {
        [1] = "BuyDeathStep"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      wait(0.2)
      if CheckMasteryWeapon("Death Step",400) == "true UpTo" or CheckMasteryWeapon("Superhuman",400) == "true" and DeathComplete == false then
      DeathComplete = true
      end
      elseif HasElectricClaw and not EClawComplete then
      local args = {
        [1] = "BuyElectricClaw"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      wait(0.2)
      if CheckMasteryWeapon("Electric Claw",400) == "true UpTo" or CheckMasteryWeapon("Superhuman",400) == "true" and EClawComplete == false then
      EClawComplete = true
      end
      end
      end

      if BuyGodhuman ~= 1 and SupComplete and EClawComplete and TalComplete and SharkComplete and DeathComplete and (not game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") or not game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman")) then
      if GetMaterial("Fish Tail") >= 20 then
      if GetMaterial("Magma Ore") >= 20 then
      if GetMaterial("Dragon Scale") >= 10 then
      if GetMaterial("Mystic Droplet") >= 10 then
      Com("F_","BuyGodhuman")
      BuyGodhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true))

      if BuyGodhuman then
      if BuyGodhuman == 1 then
      _G.Settings.FightingStyle["Auto God Human"] = false
      end
      end
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      elseif not World2 then
      Com("F_","TravelDressrosa")
      elseif World2 then
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = false end
      CheckMaterial("Mystic Droplet")
      if CustomFindFirstChild(MaterialMob) then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if _G.Settings.FightingStyle["Auto God Human"] and table.find(MaterialMob,v.Name) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
      repeat wait()
      FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,1))
      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if FarmtoTarget then FarmtoTarget:Stop() end
      FastAttack = true
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      spawn(function()
        for i,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v2.Name == v.Name then
        spawn(function()
          if InMyNetWork(v2.HumanoidRootPart) then
          v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
          v2.Humanoid.JumpPower = 0
          v2.Humanoid.WalkSpeed = 0
          v2.HumanoidRootPart.CanCollide = false
          v2.Humanoid:ChangeState(11)
          v2.HumanoidRootPart.Size = Vector3.new(80,80,80)
          end
          end)
        end
        end
        end)
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
      game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
      game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
      end
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      end
      until not CustomFindFirstChild(MaterialMob) or not _G.Settings.FightingStyle["Auto God Human"] or v.Humanoid.Health <= 0 or not v.Parent
      FastAttack = false
      end
      end
      else
        FastAttack = false
      Modstween = toTarget(CFrameMon.Position,CFrameMon)
      if World1 and (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
      elseif World1 and not (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
      elseif World1 and (table.find(MaterialMob,"God's Guard [Lv. 450]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
      elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if Modstween then Modstween:Stop() end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
      end
      end
      end
      elseif not World3 then
      Com("F_","TravelZou")
      elseif World3 then
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = false end
      CheckMaterial("Dragon Scale")
      if CustomFindFirstChild(MaterialMob) then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if _G.Settings.FightingStyle["Auto God Human"] and table.find(MaterialMob,v.Name) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
      repeat wait()
      FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if FarmtoTarget then FarmtoTarget:Stop() end
      FastAttack = true
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      spawn(function()
        for i,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v2.Name == v.Name then
        spawn(function()
          if InMyNetWork(v2.HumanoidRootPart) then
          v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
          v2.Humanoid.JumpPower = 0
          v2.Humanoid.WalkSpeed = 0
          v2.HumanoidRootPart.CanCollide = false
          v2.Humanoid:ChangeState(11)
          v2.HumanoidRootPart.Size = Vector3.new(80,80,80)
          end
          end)
        end
        end
        end)
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
      game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
      game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
      end
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      end
      until not CustomFindFirstChild(MaterialMob) or not _G.Settings.FightingStyle["Auto God Human"] or v.Humanoid.Health <= 0 or not v.Parent
      FastAttack = false
      end
      end
      else
        FastAttack = false
      Modstween = toTarget(CFrameMon.Position,CFrameMon)
      if World1 and (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
      elseif World1 and not (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
      elseif World1 and (table.find(MaterialMob,"God's Guard [Lv. 450]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
      elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if Modstween then Modstween:Stop() end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
      end
      end
      end
      elseif not World1 then
      Com("F_","TravelMain")
      elseif World1 then
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = false end
      CheckMaterial("Magma Ore")
      if CustomFindFirstChild(MaterialMob) then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if _G.Settings.FightingStyle["Auto God Human"] and table.find(MaterialMob,v.Name) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
      repeat wait()
      FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if FarmtoTarget then FarmtoTarget:Stop() end
      FastAttack = true
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      spawn(function()
        for i,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v2.Name == v.Name then
        spawn(function()
          if InMyNetWork(v2.HumanoidRootPart) then
          v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
          v2.Humanoid.JumpPower = 0
          v2.Humanoid.WalkSpeed = 0
          v2.HumanoidRootPart.CanCollide = false
          v2.Humanoid:ChangeState(11)
          v2.HumanoidRootPart.Size = Vector3.new(80,80,80)
          end
          end)
        end
        end
        end)
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
      game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
      game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
      end
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      end
      until not CustomFindFirstChild(MaterialMob) or not _G.Settings.FightingStyle["Auto God Human"] or v.Humanoid.Health <= 0 or not v.Parent
      FastAttack = false
      end
      end
      else
        FastAttack = false
      Modstween = toTarget(CFrameMon.Position,CFrameMon)
      if World1 and (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
      elseif World1 and not (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
      elseif World1 and (table.find(MaterialMob,"God's Guard [Lv. 450]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
      elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if Modstween then Modstween:Stop() end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
      end
      end
      end
      elseif not World1 then
      Com("F_","TravelMain")
      elseif World1 then
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = false end
      CheckMaterial("Fish Tail")
      if CustomFindFirstChild(MaterialMob) then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if _G.Settings.FightingStyle["Auto God Human"] and table.find(MaterialMob,v.Name) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
      repeat wait()
      FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if FarmtoTarget then FarmtoTarget:Stop() end
      FastAttack = true
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      spawn(function()
        for i,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v2.Name == v.Name then
        spawn(function()
          if InMyNetWork(v2.HumanoidRootPart) then
          v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
          v2.Humanoid.JumpPower = 0
          v2.Humanoid.WalkSpeed = 0
          v2.HumanoidRootPart.CanCollide = false
          v2.Humanoid:ChangeState(11)
          v2.HumanoidRootPart.Size = Vector3.new(80,80,80)
          end
          end)
        end
        end
        end)
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
      game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
      game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
      end
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      end
      until not CustomFindFirstChild(MaterialMob) or not _G.Settings.FightingStyle["Auto God Human"] or v.Humanoid.Health <= 0 or not v.Parent
      FastAttack = false
      end
      end
      else
        FastAttack = false
      Modstween = toTarget(CFrameMon.Position,CFrameMon)
      if World1 and (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
      elseif World1 and not (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
      elseif World1 and (table.find(MaterialMob,"God's Guard [Lv. 450]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
      if Modstween then Modstween:Stop() end wait(.5)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
      elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
      if Modstween then Modstween:Stop() end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
      end
      end
      end
      end
      end
      end)
    end
    end)
  end)

task.spawn(function()
  while wait() do
  pcall(function()
    if _G.Settings.FightingStyle["Auto God Human"] and World2 then
    if game.Workspace.Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") or game.ReplicatedStorage:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") then
    if (KillSharkMan == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == "I lost my house keys, could you help me find them? Thanks.") then
    if KillFish then KillFish:Stop() end
    Com("F_","SetSpawnPoint")
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    if v.Name == "Tide Keeper [Lv. 1475] [Boss]" then
    repeat wait()
    if game.Workspace.Enemies:FindFirstChild(v.Name) then
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 200 then
    Farmtween = toTarget(v.HumanoidRootPart.CFrame)
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
    if Farmtween then Farmtween:Stop() end
    FastAttack = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    if not _G.Settings.Configs["Fast Attack"] then
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    if _G.Settings.Configs["Show Hitbox"] then
    v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
    else
      v.HumanoidRootPart.Transparency = 1
    end
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
    if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
    end
    end
    end
    until not v.Parent or not _G.Settings.FightingStyle["Auto God Human"] or KillSharkMan == false or v.Humanoid.Health == 0 or game.Players.LocalPlayer.Character:FindFirstChild("Water Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key")
    FastAttack = false
    end
    end
    end
    else
      if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") then
    KillFish = toTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]").HumanoidRootPart.CFrame)
    else
      if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == "I lost my house keys, could you help me find them? Thanks." then
    ServerHop:Teleport()
    end
    end
    end
    end
    end)
  end
  end)

Farms2:Toggle(
  "Auto Superhuman",
  _G.Settings.FightingStyle["Auto Superhuman"],
  function(value)
  _G.Settings.FightingStyle["Auto Superhuman"] = value
  SaveSettings()
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.FightingStyle["Auto Superhuman"] then
      if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") and not game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and not game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and not game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and not game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and not game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
      if not game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and not game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") then
      local args = {
        [1] = "BuyElectro"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end
      end
      end
      end
      end

      _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")

      if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
      local args = {
        [1] = "BuyElectro"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
      local args = {
        [1] = "BuyBlackLeg"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
      local args = {
        [1] = "BuyBlackLeg"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
      local args = {
        [1] = "BuyFishmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
      local args = {
        [1] = "BuyFishmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
      local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "2"
      }
      HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      if _G.Settings.FightingStyle["Auto Superhuman"] and game.Players.LocalPlayer.Data.Fragments.Value <= 1500 and HaveDragonClaw == 0 then
      if game.Players.LocalPlayer.Data.Level.Value > 1100 then
      _G.Settings.Raids["Select Raids"] = "Flame"
      _G.Settings.Raids["Auto Raids"] = true
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = false end
      end
      else
        _G.Settings.Raids["Auto Raids"] = false
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "2"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      _G.Settings.Raids["Auto Raids"] = false
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      end
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
      local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "2"
      }
      HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      if _G.Settings.FightingStyle["Auto Superhuman"] and game.Players.LocalPlayer.Data.Fragments.Value <= 1500 and HaveDragonClaw == 0 then
      if game.Players.LocalPlayer.Data.Level.Value > 1100 then
      _G.Settings.Raids["Select Raids"] = "Flame"
      _G.Settings.Raids["Auto Raids"] = true
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = false end
      end
      else
        _G.Settings.Raids["Auto Raids"] = false
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "2"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      _G.Settings.Raids["Auto Raids"] = false
      if Auto_Farm_Level then _G.Settings.Main["Auto Farm Level"] = true end
      end
      end

      if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
      Auto_Farm_Level = _G.Settings.Main["Auto Farm Level"]
      local args = {
        [1] = "BuySuperhuman"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
      Auto_Farm_Level = _G.Settings.Main["Auto Farm Level"]
      local args = {
        [1] = "BuySuperhuman"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end
      end
      end)
    end
    end)
  end)

Farms2:Toggle(
  "Auto Electric Claw",
  _G.Settings.FightingStyle["Auto Electric Claw"],
  function(value)
  _G.Settings.FightingStyle["Auto Electric Claw"] = value
  SaveSettings()
  if _G.Settings.FightingStyle["Auto Electric Claw"] then
  Com("F_","BuyElectro")
  end
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.FightingStyle["Auto Electric Claw"] then
      if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value < 400 then
      _G.Settings.Configs["Select Weapon"] = "Electro"
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value < 400 then
      _G.Settings.Configs["Select Weapon"] = "Electro"
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
      local v175 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true);
      if v175 == 4 then
      local v176 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
      if v176 == nil then
      game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12548, 337, -7481)
      end
      else
        local string_1 = "BuyElectricClaw";
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1);
      end
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
      local v175 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true);
      if v175 == 4 then
      local v176 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
      if v176 == nil then
      game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12548, 337, -7481)
      end
      else
        local string_1 = "BuyElectricClaw";
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1);
      end
      end
      end
      end
      end)
    end
    end)
  end)

Farms2:Toggle(
  "Auto Death Step",
  _G.Settings.FightingStyle["Auto Death Step"],
  function(value)
  _G.Settings.FightingStyle["Auto Death Step"] = value
  SaveSettings()
  if _G.Settings.FightingStyle["Auto Death Step"] then
  Com("F_","BuyBlackLeg")
  end
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.FightingStyle["Auto Death Step"] then
      if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 then
      local args = {
        [1] = "BuyDeathStep"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      _G.Settings.Configs["Select Weapon"] = "Death Step"
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 400 then
      local args = {
        [1] = "BuyDeathStep"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

      _G.Settings.Configs["Select Weapon"] = "Death Step"
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value < 400 then
      _G.Settings.Configs["Select Weapon"] = "Black Leg"
      end
      end
      elseif _G.Settings.FightingStyle["Auto Fully Death Step"] then
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 400 or game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 then
      if game:GetService("Workspace").Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then
      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key") then
      EquipWeapon("Library Key")
      repeat wait() toTarget(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) until (CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.FightingStyle["Auto Death Step"]
      if (CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
      wait(1.2)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
      wait(0.5)
      end
      elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
      if game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") then
      if game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
      repeat wait()
      if game.Workspace.Enemies:FindFirstChild(v.Name) then
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 200 then
      Farmtween = toTarget(v.HumanoidRootPart.CFrame)
      elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
      if Farmtween then Farmtween:Stop() end
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
      game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
      game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
      end
      end
      end
      until not v.Parent or v.Humanoid.Health <= 0 or _G.Settings.FightingStyle["Auto Death Step"] == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key")
      FastAttack = false
      end
      end
      else
        toTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]").HumanoidRootPart.CFrame)
      end
      end
      end
      end
      else
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
      end
      end
      end)
    end
    end)
  end)


Farms2:Toggle(
  "Auto SharkMan Karate",
  _G.Settings.FightingStyle["Auto SharkMan Karate"],
  function(value)
  _G.Settings.FightingStyle["Auto SharkMan Karate"] = value
  SaveSettings()
  if _G.Settings.FightingStyle["Auto SharkMan Karate"] then
  Com("F_","BuySharkmanKarate")
  end
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.FightingStyle["Auto SharkMan Karate"] then
      if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
      if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sharkman Karate") then
      if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
      _G.Settings.Configs["Select Weapon"] = "Sharkman Karate"
      end
      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
      _G.Settings.Configs["Select Weapon"] = "Sharkman Karate"
      end
      if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 400 then
      _G.Settings.Configs["Select Weapon"] = "Fishman Karate"
      end
      else
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
      end
      end
      elseif _G.Settings.FightingStyle["Auto Fully SharkMan Karate"] then
      if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 then
      if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then
      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then
      repeat wait() toTarget(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365) until (CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_Fully_SharkMan_Karate
      if (CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
      wait(1.2)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
      wait(0.5)
      end
      elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 then
      if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") then
      if game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      if v.Name == "Tide Keeper [Lv. 1475] [Boss]" then
      repeat wait()
      if game.Workspace.Enemies:FindFirstChild(v.Name) then
      if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 200 then
      Farmtween = toTarget(v.HumanoidRootPart.CFrame)
      elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
      if Farmtween then Farmtween:Stop() end
      FastAttack = true
      if _G.Settings.Configs["Auto Haki"] then
      if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
      end
      end
      if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
      wait()
      EquipWeapon(_G.Settings.Configs["Select Weapon"])
      end
      if not _G.Settings.Configs["Fast Attack"] then
      game:GetService'VirtualUser':CaptureController()
      game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
      end
      v.HumanoidRootPart.Size = Vector3.new(60,60,60)
      if _G.Settings.Configs["Show Hitbox"] then
      v.HumanoidRootPart.Transparency = _G.Hitbox_LocalTransparency
      else
        v.HumanoidRootPart.Transparency = 1
      end
      v.Humanoid.JumpPower = 0
      v.Humanoid.WalkSpeed = 0
      v.HumanoidRootPart.CanCollide = false
      v.Humanoid:ChangeState(11)
      toTarget(v.HumanoidRootPart.CFrame * CFrame.new(25,_G.Settings.Configs["Distance Auto Farm"],0))
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
      game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
      game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
      end
      end
      end
      until not v.Parent or v.Humanoid.Health <= 0 or _G.Settings.FightingStyle["Auto Death Step"] == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key")
      FastAttack = false end
      end
      else
        toTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]").HumanoidRootPart.CFrame)
      end
      end
      end
      else
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
      end
      else
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
      end
      end
      end)
    end
    end)
  end)

Farms2:Toggle(
  "Auto Dragon Talon",
  _G.Settings.FightingStyle["Auto Dragon Talon"],
  function(value)
  _G.Settings.FightingStyle["Auto Dragon Talon"] = value
  SaveSettings()
  if _G.Settings.FightingStyle["Auto Dragon Talon"] then
  Com("F_","BlackbeardReward","DragonClaw","2")
  end
  task.spawn(function()
    while wait() do
    pcall(function()
      if _G.Settings.FightingStyle["Auto Dragon Talon"] then
      if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
      _G.Settings.Configs["Select Weapon"] = "Dragon Claw"
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value <= 399 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
      _G.Settings.Configs["Select Weapon"] = "Dragon Claw"
      end

      if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
      _G.Settings.Configs["Select Weapon"] = "Dragon Claw"
      if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 3 then
      local string_1 = "Bones";
      local string_2 = "Buy";
      local number_1 = 1;
      local number_2 = 1;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, string_2, number_1, number_2);

      local string_1 = "BuyDragonTalon";
      local bool_1 = true;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, bool_1);
      elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1 then
      game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
      else
        local string_1 = "BuyDragonTalon";
      local bool_1 = true;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, bool_1);
      local string_1 = "BuyDragonTalon";
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1);
      end
      end

      if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
      _G.Settings.Configs["Select Weapon"] = "Dragon Claw"
      if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 3 then
      local string_1 = "Bones";
      local string_2 = "Buy";
      local number_1 = 1;
      local number_2 = 1;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, string_2, number_1, number_2);

      local string_1 = "BuyDragonTalon";
      local bool_1 = true;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, bool_1);
      elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1 then
      game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
      else
        local string_1 = "BuyDragonTalon";
      local bool_1 = true;
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1, bool_1);
      local string_1 = "BuyDragonTalon";
      local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
      Target:InvokeServer(string_1);
      end
      end
      end
      end
      end)
    end
    end)
  end)

Farms2:Seperator(
  "Auto Fully")

Farms2:Toggle(
  "Auto Fully Death Step",
  _G.Settings.FightingStyle["Auto Fully Death Step"],
  function(value)
  _G.Settings.FightingStyle["Auto Fully Death Step"] = value
  SaveSettings()
  end)

Farms2:Toggle(
  "Auto Fully SharkMan Karate",
  _G.Settings.FightingStyle["Auto Fully SharkMan Karate"],
  function(value)
  _G.Settings.FightingStyle["Auto Fully SharkMan Karate"] = value
  SaveSettings()
  end)

local BossStatus = Page5:Label("[Boss] : ...".." | [Distance] : ...")
local BossQuest = Page5:Label("[Quest] : ...".." | [Level] : ...")
spawn(function()
  while task.wait() do
  pcall(function()
    CheckBossQuest()
    if _G.Settings.Boss["Select Boss"] == MsBoss then
    BossStatus:Set("[Boss] : "..MsBoss)
    BossQuest:Set("[Quest] : "..NameBoss.." | [Level] : "..LevelQuestBoss)
    end
    end)
  end
  end)

local BossTable = {}
for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
if string.find(v.Name, "Boss") then
if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
else
  table.insert(BossTable, v.Name)
end
end
end

local Boss_Dropdown = Page5:Dropdown("Select Boss",
  BossTable,"",
  function(value)
  _G.Settings.Boss["Select Boss"] = value
  SaveSettings()
  end)

Page5:Button("Refresh Boss",function()
  Boss_Dropdown:Clear()
  for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
  if string.find(v.Name, "Boss") then
  Boss_Dropdown:Add(v.Name)
  end
  end
  end)

Page5:Toggle(
  "Auto Farm All Boss",
  _G.Settings.Boss["Auto All Boss"],
  function(value)
  _G.Settings.Boss["Auto All Boss"] = value
  SaveSettings()
  _G.GetBoss = false
  MsBoss = ""
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  end)

task.spawn(function()
  while wait() do
  if _G.Settings.Boss["Auto All Boss"] then
  GetBossName()
  end
  end
  end)

task.spawn(function()
  while wait() do
  if _G.Settings.Boss["Auto All Boss"] then
  pcall(function()
    CheckBossQuest()
    if MsBoss == "Soul Reaper [Lv. 2100] [Raid Boss]" or MsBoss == "Longma [Lv. 2000] [Boss]" or MsBoss == "Don Swan [Lv. 1000] [Boss]" or MsBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or MsBoss == "Order [Lv. 1250] [Raid Boss]" or MsBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
    if game:GetService("ReplicatedStorage"):FindFirstChild(MsBoss) or game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
    if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == MsBoss then
    repeat wait()
    _G.GetBoss = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    StartMagnet = true
    FastAttack = true
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(1,30,0))
    PosMon = v.HumanoidRootPart.CFrame
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    until _G.Settings.Boss["Auto All Boss"] == false or not v.Parent or v.Humanoid.Health <= 0
    _G.GetBoss = false
    end
    end
    else
      _G.GetBoss = true
    toTarget(CFrameBoss)
    end
    else
      _G.GetBoss = false
    end
    else
      if _G.Settings.Boss["Auto Quest"] then
    CheckBossQuest()
    if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
    _G.GetBoss = true
    repeat wait() toTarget(CFrameQuestBoss) until (CFrameQuestBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.Boss["Auto All Boss"]
    if (CFrameQuestBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
    wait(1.1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, LevelQuestBoss)
    end
    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
    if game:GetService("ReplicatedStorage"):FindFirstChild(MsBoss) or game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
    if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == MsBoss then
    repeat wait()
    _G.GetBoss = true
    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    StartMagnet = true
    FastAttack = true
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(1,30,0))
    PosMon = v.HumanoidRootPart.CFrame
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    else
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end
    until _G.Settings.Boss["Auto All Boss"] == false or not v.Parent or v.Humanoid.Health <= 0
    _G.GetBoss = false
    end
    end
    else
      _G.GetBoss = true
    toTarget(CFrameBoss)
    end
    else
      _G.GetBoss = false
    end
    end
    else
      if game:GetService("ReplicatedStorage"):FindFirstChild(MsBoss) or game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
    if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == MsBoss then
    repeat wait()
    _G.GetBoss = true
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    StartMagnet = true
    FastAttack = true
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(1,30,0))
    PosMon = v.HumanoidRootPart.CFrame
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    until _G.Settings.Boss["Auto All Boss"] == false or not v.Parent or v.Humanoid.Health <= 0
    _G.GetBoss = false
    end
    end
    else
      _G.GetBoss = true
    toTarget(CFrameBoss)
    end
    else
      _G.GetBoss = false
    end
    end
    end
    end)
  end
  end
  end)

--Page5:Line()

Page5:Toggle(
  "Auto Farm Boss Select",
  _G.Settings.Boss["Auto Boss Select"],
  function(value)
  _G.Settings.Boss["Auto Boss Select"] = value
  SaveSettings()
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  end)

task.spawn(function()
  while wait() do
  if _G.Settings.Boss["Auto Boss Select"] then
  pcall(function()
    CheckBossQuest()
    if MsBoss == "Soul Reaper [Lv. 2100] [Raid Boss]" or MsBoss == "Longma [Lv. 2000] [Boss]" or MsBoss == "Don Swan [Lv. 1000] [Boss]" or MsBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or MsBoss == "Order [Lv. 1250] [Raid Boss]" or MsBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
    if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == MsBoss then
    repeat wait()
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    StartMagnet = true
    FastAttack = true
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(1,30,0))
    PosMon = v.HumanoidRootPart.CFrame
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    until _G.Settings.Boss["Auto Boss Select"] == false or not v.Parent or v.Humanoid.Health <= 0
    end
    end
    else
      toTarget(CFrameBoss)
    end
    else
      if _G.Settings.Boss["Auto Quest"] then
    CheckBossQuest()
    if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
    repeat wait() toTarget(CFrameQuestBoss) until (CFrameQuestBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.Boss["Auto Boss Select"]
    if (CFrameQuestBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
    wait(1.1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, LevelQuestBoss)
    end
    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
    if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == MsBoss then
    repeat wait()
    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    StartMagnet = true
    FastAttack = true
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(1,30,0))
    PosMon = v.HumanoidRootPart.CFrame
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    else
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end
    until _G.Settings.Boss["Auto Boss Select"] == false or not v.Parent or v.Humanoid.Health <= 0
    end
    end
    else
      toTarget(CFrameBoss)
    end
    end
    else
      if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if v.Name == MsBoss then
    repeat wait()
    if _G.Settings.Configs["Auto Haki"] then
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
    wait()
    EquipWeapon(_G.Settings.Configs["Select Weapon"])
    end
    StartMagnet = true
    FastAttack = true
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(1,30,0))
    PosMon = v.HumanoidRootPart.CFrame
    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
    v.Humanoid.JumpPower = 0
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid:ChangeState(11)
    until _G.Settings.Boss["Auto Boss Select"] == false or not v.Parent or v.Humanoid.Health <= 0
    end
    end
    else
      toTarget(CFrameBoss)
    end
    end
    end
    end)
  end
  end
  end)

Page5:Toggle(
  "Auto Quest Boss",
  _G.Settings.Boss["Auto Quest"],
  function(value)
  _G.Settings.Boss["Auto Quest"] = value
  SaveSettings()
  end)

spawn(function()
  local gg = getrawmetatable(game)
  local old = gg.__namecall
  setreadonly(gg,false)
  gg.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args = {
      ...
    }
    if tostring(method) == "FireServer" then
    if tostring(args[1]) == "RemoteEvent" then
    if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
    if UseSkillMasteryDevilFruit and _G.Settings.Mastery["Auto Farm Fruit Mastery"] then
    if type(args[2]) == "vector" then
    args[2] = PositionSkillMasteryDevilFruit
    else
      args[2] = CFrame.new(PositionSkillMasteryDevilFruit)
    end
    return old(unpack(args))
    end
    end
    end
    end
    return old(...)
    end)
  end)

spawn(function()
  local gt = getrawmetatable(game)
  local old = gt.__namecall
  setreadonly(gt,false)
  gt.__namecall = newcclosure(function(...)
    local args = {
      ...
    }
    if getnamecallmethod() == "InvokeServer" then
    if SelectWeaponGun then
    if SelectWeaponGun == "Soul Guitar" then
    if tostring(args[2]) == "TAP" then
    if _G.Settings.Mastery["Auto Farm Gun Mastery"] and UseSkillMasteryGun then
    args[3] = PositionSkillMasteryGun
    end
    end
    end
    end
    end
    return old(unpack(args))
    end)
  setreadonly(gt,true)
  end)

task.spawn(function()
  while wait() do
  for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
  if v:IsA("Tool") then
  if v:FindFirstChild("RemoteFunctionShoot") then
  SelectWeaponGun = v.Name
  end
  end
  end
  end
  end)

function AutoFarmMasteryGun()
if game:GetService("Workspace").Enemies:FindFirstChild(Name) then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if _G.Settings.Mastery["Auto Farm Gun Mastery"] and v.Name == Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat wait()
FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
if FarmtoTarget then FarmtoTarget:Stop() end
StartMagnet = true
PosMon = v.HumanoidRootPart.CFrame
if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
end
HealthMin = v.Humanoid.MaxHealth*_G.Settings.Mastery["Mob Health (%)"]/100
PositionSkillMasteryGun = v.HumanoidRootPart.Position
if v.Humanoid.Health <= HealthMin and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
EquipWeapon(SelectWeaponGun)
UseSkillMasteryGun = true
-- v.HumanoidRootPart.CanCollide = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
if game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponGun) and game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponGun):FindFirstChild("RemoteFunctionShoot") then
Click()
local args = {
  [1] = v.HumanoidRootPart.Position,
  [2] = v.HumanoidRootPart
}
game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
end
else
  UseSkillMasteryGun = false
Click()
EquipWeapon(_G.Settings.Configs["Select Weapon"])
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
end
end
until not game:GetService("Workspace").Enemies:FindFirstChild(Name) or not _G.Settings.Mastery["Auto Farm Gun Mastery"] or v.Humanoid.Health <= 0 or not v.Parent
UseSkillMasteryGun = false
StartMagnet = false
end
end
else
  StartMagnet = false
Modstween = toTarget(CFrameMon)
if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
elseif World1 and not (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
elseif World1 and (Name == "God's Guard [Lv. 450]" or Name == "Sky Bandit [Lv. 150]" or Name == "Dark Master [Lv. 175]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
elseif World1 and (Name == "Shanda [Lv. 475]" or Name == "Royal Squad [Lv. 525]" or Name == "Royal Soldier [Lv. 550]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 5000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Modstween then Modstween:Stop() end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Modstween then Modstween:Stop() end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
if Modstween then Modstween:Stop() end wait(.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
end
end
end

function AutoFarmMasteryDevilFruit()
if game:GetService("Workspace").Enemies:FindFirstChild(Name) then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if _G.Settings.Mastery["Auto Farm Fruit Mastery"] and v.Name == Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat wait()
FarmtoTarget = toTarget(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
if FarmtoTarget then FarmtoTarget:Stop() end
StartMagnet = true
PosMon = v.HumanoidRootPart.CFrame
HealthMin = v.Humanoid.MaxHealth*_G.Settings.Mastery["Mob Health (%)"]/100
if v.Humanoid.Health <= HealthMin and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 40, 10)
if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
PositionSkillMasteryDevilFruit = v.HumanoidRootPart.Position
UseSkillMasteryDevilFruit = true
if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
MasteryDevilFruit = require(game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].Data)
DevilFruitMastery = game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value
elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
MasteryDevilFruit = require(game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Data)
DevilFruitMastery = game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value
end
if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
if _G.Settings.Configs["Skill Z"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.Z then
game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
wait(_G.HoldZ)
game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
end
if _G.Settings.Configs["Skill X"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X then
game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
wait(_G.HoldX)
game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
end
elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
if _G.Settings.Configs["Skill Z"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and game.Players.LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(7.6, 7.676, 3.686) and DevilFruitMastery >= MasteryDevilFruit.Lvl.Z then
else
  game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
wait(_G.HoldZ)
game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
end
if _G.Settings.Configs["Skill X"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X then
game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
wait(_G.HoldX)
game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
end
if _G.Settings.Configs["Skill C"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.C then
game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
wait(_G.HoldC)
game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
end
elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then
if _G.Settings.Configs["Skill Z"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.Z then
game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
wait(4)
game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
end
if _G.Settings.Configs["Skill X"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X then
game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
wait(_G.HoldX)
game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
end
if _G.Settings.Configs["Skill C"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.C then
game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
wait(_G.HoldC)
game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
end
elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = v.HumanoidRootPart.Position
if _G.Settings.Configs["Skill Z"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.Z then
game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
wait(_G.HoldZ)
game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
end
if _G.Settings.Configs["Skill X"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X then
game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
wait(_G.HoldX)
game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
end
if _G.Settings.Configs["Skill C"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.C then
game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
wait(_G.HoldC)
game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
end
if _G.Settings.Configs["Skill V"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.V then
game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
wait(_G.HoldV)
game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
end
end
end
else
  game:GetService('VirtualUser'):CaptureController()
game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
UseSkillMasteryDevilFruit = false
EquipWeapon(_G.Settings.Configs["Select Weapon"])
v.HumanoidRootPart.Size = Vector3.new(60,60,60)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
end
end
until not game:GetService("Workspace").Enemies:FindFirstChild(Name) or not _G.Settings.Mastery["Auto Farm Fruit Mastery"] or v.Humanoid.Health <= 0 or not v.Parent
StartMagnet = false
end
end
else
  StartMagnet = false
Modstween = toTarget(CFrameMon.Position,CFrameMon)
if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
elseif World1 and not (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
elseif World1 and (Name == "God's Guard [Lv. 450]" or Name == "Sky Bandit [Lv. 150]" or Name == "Dark Master [Lv. 175]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
elseif World1 and (Name == "Shanda [Lv. 475]" or Name == "Royal Squad [Lv. 525]" or Name == "Royal Soldier [Lv. 550]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 5000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Modstween then Modstween:Stop() end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Modstween then Modstween:Stop() end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
if Modstween then Modstween:Stop() end wait(.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
end
end
end

function CheckMasteryWeapon(NameWe,MasNum)
if game.Players.LocalPlayer.Backpack:FindFirstChild(NameWe) then
if tonumber(game.Players.LocalPlayer.Backpack:FindFirstChild(NameWe).Level.Value) < tonumber(MasNum) then
return "true DownTo"
elseif tonumber(game.Players.LocalPlayer.Backpack:FindFirstChild(NameWe).Level.Value) >= tonumber(MasNum) then
return "true UpTo"
end
end
if game.Players.LocalPlayer.Character:FindFirstChild(NameWe) then
if tonumber(game.Players.LocalPlayer.Character:FindFirstChild(NameWe).Level.Value) < tonumber(MasNum) then
return "true DownTo"
elseif tonumber(game.Players.LocalPlayer.Character:FindFirstChild(NameWe).Level.Value) >= tonumber(MasNum) then
return "true UpTo"
end
end
return "else"
end

local AllSwordInInventroy = {};
pcall(function()
  for i, v in pairs(game:GetService("ReplicatedStorage").Remotes['CommF_']:InvokeServer("getInventoryWeapons")) do
  if (type(v) ~= "table") then
  elseif (v.Type == "Sword") then
  table.insert(AllSwordInInventroy, v.Name);
  end
  end
  end)

table.insert(AllSwordInInventroy, GetFightingStyle("Sword"));
local SwordMulti = Page6:MultiDropdown("Select Sword",
  AllSwordInInventroy,
  {
    ""
  },
  function(value)
  _G.Settings.Mastery["Select Multi Sword"] = value
  if value == false then
  toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings()
  end)

local function CheckQuestMasteryFarm()
if World1 then
Name = "Galley Captain [Lv. 650]";
CFrameMon = CFrame.new(5649, 39, 4936);
end
if World2 then
Name = "Water Fighter [Lv. 1450]";
CFrameMon = CFrame.new(-3385, 239, -10542);
end
if ThreeWorld then
Name = "Reborn Skeleton [Lv. 1975]";
CFrameMon = CFrame.new(-9506.14648, 172.130661, 6101.79053);
end
end

function AutoFarmMasterySwordList()
if game:GetService("Workspace").Enemies:FindFirstChild(Name) or (ThreeWorld and (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]"))) then
for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
if _G.Settings.Mastery["Farm Mastery SwordList"] and ((ThreeWorld and (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]")) or v.Name == Name) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
repeat wait()
FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,1))
if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
if FarmtoTarget then FarmtoTarget:Stop() end
FastAttack = true
EquipWeaponSword()
StartMagnet = true
PosMon = v.HumanoidRootPart.CFrame
if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
end
until not game:GetService("Workspace").Enemies:FindFirstChild(Name) and ((ThreeWorld and not (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]")) or v.Name == Name) or not _G.Settings.Mastery["Farm Mastery SwordList"] or v.Humanoid.Health <= 0 or not v.Parent
StartMagnet = false
FastAttack = false
end
end
else
  StartMagnet = false
Modstween = toTarget(CFrameMon)
if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
elseif World1 and not (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
elseif World1 and (Name == "God's Guard [Lv. 450]" or Name == "Sky Bandit [Lv. 150]" or Name == "Dark Master [Lv. 175]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
elseif World1 and (Name == "Shanda [Lv. 475]" or Name == "Royal Squad [Lv. 525]" or Name == "Royal Soldier [Lv. 550]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 5000 then
if Modstween then Modstween:Stop() end wait(.5)
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
elseif World2 and string.find(Name, "Ship") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Modstween then Modstween:Stop() end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
elseif World2 and not string.find(Name, "Ship") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
if Modstween then Modstween:Stop() end
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
-- elseif game.Players.LocalPlayer:DistanceFromCharacter(CFrameMon.Position) > 3500 then
--     if Modstween then Modstween:Stop() end
--     if game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Dead then return end
--     ResetSetSpawn(CFrameMon)
elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
if Modstween then Modstween:Stop() end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
end
end
end

local function inmyself(name)
return game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(name) or game:GetService("Players").LocalPlayer.Character:FindFirstChild(name);
end

SwordListFarmComplete = {};
Page6:Toggle("Auto Farm Sword Mastery", _G.Settings.Mastery["Farm Mastery SwordList"],function(x)
  _G.Settings.Mastery["Farm Mastery SwordList"] = x
  if x == false then
  toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings();
  spawn(function()
    while wait() do
    if _G.Settings.Mastery["Farm Mastery SwordList"] and #_G.Settings.Mastery["Select Multi Sword"] ~= 0 then
    for i,v in pairs(_G.Settings.Mastery["Select Multi Sword"]) do
    if _G.Settings.Mastery["Farm Mastery SwordList"] == false and table.find(SwordListFarmComplete,v) then
    --break;
    end
    if not game.Players.LocalPlayer.Backpack:FindFirstChild(v) and not game.Players.LocalPlayer.Character:FindFirstChild(v) and game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):GetState() ~= Enum.HumanoidStateType.Dead and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0 then
    while _G.Settings.Mastery["Farm Mastery SwordList"] do wait()
    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0; wait(0.2) end
    if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) or _G.Settings.Mastery["Farm Mastery SwordList"] == false or table.find(SwordListFarmComplete,v) then
    --break;
    end
    wait(1)
    Com("F_","StoreItem",tostring(GetFightingStyle("Sword")),inmyself(GetFightingStyle("Sword")))
    wait(1)
    Com("F_","LoadItem",tostring(v))
    wait(0.5)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) then
    SelectWeaponInSwordList = v
    --break;
    end
    if CheckMasteryWeapon(v,600) == "true" or CheckMasteryWeapon(v,600) == "true UpTo" then
    print("DONE "..v)
    table.insert(SwordListFarmComplete,v)
    --break;
    end
    end
    end
    wait(0.2)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) then
    while _G.Settings.Mastery["Farm Mastery SwordList"] do wait()
    if table.find(SwordListFarmComplete,v) and #_G.Settings.Mastery["Select Multi Sword"] ~= 0 and #SwordListFarmComplete ~= 0 then
    --break;
    end
    if _G.Settings.Mastery["Farm Mastery SwordList"] == false then
    --break;
    end
    if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) then
    SelectWeaponInSwordList = v
    end
    CheckQuestMasteryFarm()
    AutoFarmMasterySwordList()
    if CheckMasteryWeapon(v,600) == "true" or CheckMasteryWeapon(v,600) == "true UpTo" then
    print("DONE "..v)
    table.insert(SwordListFarmComplete,v)
    --break;
    end
    end
    end
    end
    else
      --break;
    end
    end
    end)
  end)

Page6:Toggle(
  "Auto Fruit Mastery",
  _G.Settings.Mastery["Auto Farm Fruit Mastery"],
  function(value)
  _G.Settings.Mastery["Auto Farm Fruit Mastery"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  end)

Page6:Toggle(
  "Auto Gun Mastery",
  _G.Settings.Mastery["Auto Farm Gun Mastery"],
  function(value)
  _G.Settings.Mastery["Auto Farm Gun Mastery"] = value
  if value == false then
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  end
  SaveSettings()
  end)

Page6:Slider(
  "Mob Health (%)",true,
  0,
  100,
  _G.Settings.Mastery["Mob Health (%)"],
  function(value)
  _G.Settings.Mastery["Mob Health (%)"] = value
  SaveSettings()
  end)


spawn(function()
  while wait() do
  if _G.Settings.Mastery["Auto Farm Fruit Mastery"] then
  CheckQuest()
  AutoFarmMasteryDevilFruit()
  end
  end
  end)

spawn(function()
  while wait() do
  if _G.Settings.Mastery["Auto Farm Gun Mastery"] then
  CheckQuest()
  AutoFarmMasteryGun()
  end
  end
  end)

local Chestp = Tab1:CraftPage(1)
Chestp:Seperator("Esp Sections")

Chestp:Toggle('Chest ESP', false, function(ce)
  ChestESP = ce
  end)
spawn(function()
  while wait() do
  pcall(function()
    if ChestESP then
    for i,v in pairs(game.Workspace:GetChildren()) do
    if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
    if not v:FindFirstChild("ChestESP") then
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")

    BillboardGui.Parent = v
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.Name = "ChestESP"
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.Text.Size = 35
    TextLabel.TextStrokeTransparency = 0.000
    TextLabel.TextWrapped = true
    end
    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude)
    v.ChestESP.TextLabel.Text = v.Name.."\n"..Dis.." M."
    if v.Name == "Chest1" then
    v:FindFirstChild("ChestESP").TextLabel.TextColor3 = Color3.new(192, 192, 192)
    elseif v.Name == "Chest2" then
    v:FindFirstChild("ChestESP").TextLabel.TextColor3 = Color3.new(255,215,0)
    elseif v.Name == "Chest3" then
    v:FindFirstChild("ChestESP").TextLabel.TextColor3 = Color3.new(0, 255, 255)
    end
    end
    end
    else
      for i,v in pairs(game.Workspace:GetChildren()) do
    if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
    if v:FindFirstChild("ChestESP") then
    v.ChestESP:Destroy()
    end
    end
    end
    end
    end)
  end
  end)

Chestp:Toggle('Player ESP', false, function(pe)
  PlayerESP = pe
  end)
spawn(function()
  while wait() do
  pcall(function()
    if PlayerESP then
    for i,v in pairs(game.Players:GetChildren()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
    if not v.Character.HumanoidRootPart:FindFirstChild("PlayerESP") then
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")

    BillboardGui.Parent = v.Character.HumanoidRootPart
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.Name = "PlayerESP"
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.Text.Size = 35
    TextLabel.TextStrokeTransparency = 0.000
    TextLabel.TextWrapped = true
    end
    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude)
    v.Character.HumanoidRootPart:FindFirstChild("PlayerESP").TextLabel.Text = v.Name.."\n\n"..Dis.." M."
    if v.Team == game.Players.LocalPlayer.Team then
    v.Character.HumanoidRootPart:FindFirstChild("PlayerESP").TextLabel.TextColor3 = Color3.new(255,0,0)
    else
      v.Character.HumanoidRootPart:FindFirstChild("PlayerESP").TextLabel.TextColor3 = Color3.new(0,255,0)
    end
    end
    end
    else
      for i,v in pairs(game.Players:GetChildren()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
    if v.Character.HumanoidRootPart:FindFirstChild("PlayerESP") then
    v.Character.HumanoidRootPart.PlayerESP:Destroy()
    end
    end
    end
    end
    end)
  end
  end)

Chestp:Toggle('Devil Fruit ESP', _G.ESPDF, function(dfespf)
  _G.ESPDF = dfespf
  end)
spawn(function()
  while wait(.1) do
  if _G.ESPDF then
  pcall(function()
    for i,v in pairs(game.Workspace:GetChildren()) do
    if v:IsA("Tool") and v:FindFirstChild("Handle") then
    if not v.Handle:FindFirstChild("DFESP") then
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")

    BillboardGui.Parent = v.Handle
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.Name = "DFESP"
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    TextLabel.Text.Size = 35
    TextLabel.TextStrokeTransparency = 0.000
    TextLabel.TextWrapped = true
    end
    Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude)
    v.Handle.DFESP.TextLabel.Text = v.Name.."\n"..Dis.." M."
    end
    end
    end)
  else
    for i,v in pairs(game.Workspace:GetChildren()) do
  if v:IsA("Tool") and v:FindFirstChild("Handle") then
  if v.Handle:FindFirstChild("DFESP") then
  v:Destroy()
  end
  end
  end
  end
  end
  end)

Chestp:Toggle('Fruit ESP', false, function(fec)
  FruitESPe = fec
  end)
spawn(function()
  while task.wait() do
  pcall(function()
    if FruitESPe then
    for a,b in pairs(game.Workspace:GetChildren()) do
    if b.Name == 'PineappleSpawner' or b.Name == 'BananaSpawner' or b.Name == 'AppleSpawner' then
    for i,v in pairs(b:GetChildren()) do
    if v:IsA('Tool') then
    if v:FindFirstChild("Handle") then
    repeat task.wait()
    if not v.Handle:FindFirstChild("FruitESP") then
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")

    BillboardGui.Parent = v.Handle
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.Name = "FruitESP"
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    TextLabel.Text.Size = 35
    TextLabel.TextStrokeTransparency = 0.000
    TextLabel.TextWrapped = true
    end
    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude)
    v.Handle.FruitESP.TextLabel.Text = v.Name.."\n"..Dis.." M."
    until not FruitESPe
    end
    end
    end
    end
    end
    else
      for a,b in pairs(game.Workspace:GetChildren()) do
    if b.Name == 'PineappleSpawner' or b.Name == 'BananaSpawner' or b.Name == 'AppleSpawner' then
    for i,v in pairs(b:GetChildren()) do
    if v:IsA('Tool') then
    if v:FindFirstChild("Handle") then
    if v.Handle:FindFirstChild("FruitESP") then
    v.Handle.FruitESP:Destroy()
    end
    end
    end
    end
    end
    end
    end
    end)
  end
  end)

Chestp:Toggle('Island ESP', false, function(ies)
  IslandESP = ies
  end)
spawn(function()
  while wait() do
  pcall(function()
    if IslandESP then
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
    if not v:FindFirstChild("IslandEsp") then
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")

    BillboardGui.Parent = v
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.Name = "IslandEsp"
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextColor3 = Color3.fromRGB(255, 0, 255)
    TextLabel.Text.Size = 75
    TextLabel.TextStrokeTransparency = 0.000
    TextLabel.TextWrapped = true
    end
    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude / 10)
    v.IslandEsp.TextLabel.Text = v.Name.."\n".."["..Dis.."]"
    end
    else
      for i,v in pairs (game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
    if v:FindFirstChild("IslandEsp") then
    v.IslandEsp:Destroy()
    end
    end
    end
    end)
  end
  end)

Chestp:Toggle('Npc ESP', false, function(nec)
  NpcESP = nec
  end)
spawn(function()
  while wait() do
  pcall(function()
    if NpcESP then
    for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    if v:FindFirstChild('HumanoidRootPart') then
    if not v:FindFirstChild("NpcEspes") then
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")

    BillboardGui.Parent = v
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.Name = "NpcEspes"
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
    TextLabel.Text.Size = 35
    end
    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
    v.NpcEspes.TextLabel.Text = v.Name.." - ["..Dis.." M]"
    end
    end
    else
      for i,v in pairs (game:GetService("Workspace").NPCs:GetChildren()) do
    if v:FindFirstChild("NpcEspes") then
    v.NpcEspes:Destroy()
    end
    end
    end
    end)
  end
  end)

Page9:Seperator("Auto Stats")

Page9:Dropdown("Select Stats",
  {
    "Max Stats","Melee","Defense","Sword","Gun","Devil Fruits"
  }, {
    ""
  },
  function(value)
  _G.Settings.Stat["Select Stats"] = value
  SaveSettings()
  task.spawn(function()
    pcall(function()
      while wait() do
      if _G.Settings.Stat["Enabled Auto Stats"] then
      if _G.Settings.Stat["Select Stats"] == "Melee" then
      local args = {
        [1] = "AddPoint",
        [2] = "Melee",
        [3] = _G.Settings.Stat["Point Select"]
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      elseif _G.Settings.Stat["Select Stats"] == "Defense" then
      local args = {
        [1] = "AddPoint",
        [2] = "Defense",
        [3] = _G.Settings.Stat["Point Select"]
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      elseif _G.Settings.Stat["Select Stats"] == "Sword" then
      local args = {
        [1] = "AddPoint",
        [2] = "Sword",
        [3] = _G.Settings.Stat["Point Select"]
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      elseif _G.Settings.Stat["Select Stats"] == "Gun" then
      local args = {
        [1] = "AddPoint",
        [2] = "Gun",
        [3] = _G.Settings.Stat["Point Select"]
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      elseif _G.Settings.Stat["Select Stats"] == "Devil Fruits" then
      local args = {
        [1] = "AddPoint",
        [2] = "Demon Fruit",
        [3] = _G.Settings.Stat["Point Select"]
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      elseif _G.Settings.Stat["Select Stats"] == "Max Stats" then
      if game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value < 2400 then
      local args = {
        [1] = "AddPoint",
        [2] = "Melee",
        [3] = _G.Settings.Stat["Point Select"]
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      else
        local args = {
        [1] = "AddPoint",
        [2] = "Defense",
        [3] = _G.Settings.Stat["Point Select"]
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end
      end
      end
      end)
    end)
  end)

Page9:Slider(
  "Point Select", true,
  0,
  9,
  _G.Settings.Stat["Point Select"],
  function(value)
  _G.Settings.Stat["Point Select"] = value
  end)


Page9:Toggle(
  "Auto Stats",
  _G.Settings.Stat["Enabled Auto Stats"],
  function(value)
  _G.Settings.Stat["Enabled Auto Stats"] = value
  SaveSettings()
  end)

Page9:Toggle(
  "Auto Stat Kaitun",
  _G.Settings.Stat["Auto Stats Kaitun"],
  "Will Up Melee to 2400 First then Up def",
  function(value)
  _G.Settings.Stat["Auto Stats Kaitun"] = value
  SaveSettings()
  end)

spawn(function()
  while wait() do
  if _G.Settings.Stat["Auto Stats Kaitun"] then
  if game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value < 2400 then
  local args = {
    [1] = "AddPoint",
    [2] = "Melee",
    [3] = tonumber(UpStatus)
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  else
    local args = {
    [1] = "AddPoint",
    [2] = "Defense",
    [3] = tonumber(UpStatus)
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end
  end
  end
  end)

Page9:Seperator("Fake Stats")

Page9:Toggle("Enabled Fake",true,function(value)
  _G.EnabledStat = value
  end)

Page9:Textbox("Level","",function(value)
  if _G.EnabledStat then
  game:GetService("Players")["LocalPlayer"].Data.Level.Value = tonumber(value)
  end
  end)

Page9:Textbox("Exp ","",function(value)
  if _G.EnabledStat then
  game:GetService("Players")["LocalPlayer"].Data.Exp.Value = tonumber(value)
  end
  end)

Page9:Textbox("Beli","",function(value)
  if _G.EnabledStat then
  game:GetService("Players")["LocalPlayer"].Data.Beli.Value = tonumber(value)
  end
  end)

Page9:Textbox("Fragments","",function(value)
  if _G.EnabledStat then
  game:GetService("Players")["Localplayer"].Data.Fragments.Value = tonumber(value)
  end
  end)

Page9:Textbox("Melee","",function(value)
  if _G.EnabledStat then
  game:GetService("Players")["LocalPlayer"].Data.Stats.Melee.Level.Value = tonumber(value)
  end
  end)

Page9:Textbox("Defense","",function(value)
  if _G.EnabledStat then
  game:GetService("Players")["LocalPlayer"].Data.Stats.Defense.Level.Value = tonumber(value)
  end
  end)

Page9:Textbox("Sword","",function(value)
  if _G.EnabledStat then
  game:GetService("Players")["LocalPlayer"].Data.Stats.Sword.Level.Value = tonumber(value)
  end
  end)

Page9:Textbox("Gun","",function(value)
  if _G.EnabledStat then
  game:GetService("Players")["LocalPlayer"].Data.Stats.Gun.Level.Value = tonumber(value)
  end
  end)
Page9:Textbox("Fruit","",function(value)
  if _G.EnabledStat then
  game:GetService("Players")["LocalPlayer"].Data.Stats["Demon Fruit"].Level.Value = tonumber(value)
  end
  end)

Page9:Textbox("Bounty","",function(value)
  if _G.EnabledStat then
  game:GetService("Players")["LocalPlayer"].leaderstats["Bounty/Honor"].Value = tonumber(value)
  end
  end)

if World3 then
--RaceV4:Line()
local RaceV4 = RaceMirage:CraftPage(1)
RaceV4:Seperator("Auto Trials")

RaceV4:Dropdown("Select Trial Race", {
  "Angel","Mink","Cyborg"
},"",function(value)
  _G.SelectRace = value
  end)

RaceV4:Toggle("Auto Select Trial Race",false,function(value)
  _G.TeleportRace = value
  if _G.TeleportRace == true then
  repeat wait()
  if _G.SelectRace == "Angel" then
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.SkyTrial.Model.FinishPart.CFrame
  elseif _G.SelectRace == "Mink" then
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.MinkTrial.Ceiling.CFrame * CFrame.new(0,-5,0)
  elseif _G.SelectRace == "Cyborg" then
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,300,0)
  end
  until not _G.TeleportRace
  end
end)

RaceV4:Toggle("Auto Complete All Trial",false,function(value)
  _G.AutoQuestRace = value
  end)

spawn(function()
    pcall(function()
        while wait() do
        if _G.AutoQuestRace then
        if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
        for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
        pcall(function()
            repeat wait(.1)
            v.Humanoid.Health = 0
            v.HumanoidRootPart.CanCollide = false
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
            end)
        end
        end
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
        for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
        if v.Name == "snowisland_Cylinder.081" then
        toTarget(v.CFrame* CFrame.new(0,0,0))
        end
        end
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
        for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
        if v.Name == "HumanoidRootPart" then
        toTarget(v.CFrame* CFrame.new(20,450,0))
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
        if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
        end
        end
        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        wait(.2)
        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        wait(.2)
        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
        if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
        end
        end
        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        wait(.2)
        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        wait(.2)
        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)

        wait(0.5)
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
        if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
        end
        end
        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        wait(.2)
        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        wait(.2)
        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        wait(0.5)
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
        if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
        end
        end
        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        wait(.2)
        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        wait(.2)
        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        end
        end
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
        toTargets(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
        for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
        pcall(function()
            repeat wait(.1)
            v.Humanoid.Health = 0
            v.HumanoidRootPart.CanCollide = false
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
            end)
        end
        end
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
        for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "StartPoint" then
        toTarget(v.CFrame* CFrame.new(0,10,0))
        end
        end
        end
        end
        end
        end)
    end)

RaceV4:Seperator("Teleports")

Islandplace = {
  "Top Of GreatTree",
  "Timple Of Time",
  "Level Pull",
  "Acient One",
  "Cyborg Door",
  "Fish Door",
  "Ghoul Door",
  "Human Door",
  "Mink Door",
  "Sky Door"
}

RaceV4:Dropdown("Select Place",Islandplace,"",function(value)
  _G.SelectIslandRace = value
  end)


RaceV4:Toggle("Teleport To Top Of GreatTree",_G.TeleportDoor,function(value)
  _G.TeleportDoor = value
  if _G.TeleportDoor == true then
  repeat wait()
  if _G.SelectIslandRace == "Top Of GreatTree" then
  toTarget(CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625))
  elseif _G.SelectIslandRace == "Timple Of Time" then
  Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
  elseif _G.SelectIslandRace == "Lever Pull" then
  toTarget(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
  elseif _G.SelectIslandRace == "Acient One" then
  toTarget(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
  elseif _G.SelectIslandRace == "Cyborg Door" then
  toTarget(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
  elseif _G.SelectIslandRace == "Fish Door" then
  toTarget(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
  elseif _G.SelectIslandRace == "Ghoul Door" then
  toTarget(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
  elseif _G.SelectIslandRace == "Human Door" then
  toTarget(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
  elseif _G.SelectIslandRace == "Mink Door" then
  toTarget(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
  elseif _G.SelectIslandRace == "Sky Door" then
  toTarget(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
  end
  until not _G.TeleportDoor
  end
  end)

RaceV4:Seperator("Others")
RaceV4:Button("Auto Upgrade Tier",function(t)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer('UpgradeRace','Buy')
  end)
RaceV4:Button("Unlock Lever", function()
  venyx:Notify("Unlocked")
  if game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt:FindFirstChild("ProximityPrompt") then
  game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt:FindFirstChild("ProximityPrompt"):Remove()
  else
--[[]]
    end
  wait(0.1)
  local ProximityPrompt = Instance.new("ProximityPrompt")
  ProximityPrompt.Parent = game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt
  ProximityPrompt.MaxActivationDistance = 10
  ProximityPrompt.ActionText = "Secrets Beholds Inside"
  ProximityPrompt.ObjectText = "An unknown lever of time"

  function onProximity()
  local part = game:GetService("Workspace").Map["Temple of Time"].MainDoor1
  local toTargetService = game:GetService("toTargetService")

  local startPosition = part.Position
  local endPosition = startPosition + Vector3.new(0, -50, 0)

  local tweenInfo = toTargetInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
  local tween = toTargetService:Create(part, tweenInfo, {
    Position = endPosition
  })
  tween:Play()
  local partnew = game:GetService("Workspace").Map["Temple of Time"].MainDoor2
  local toTargetService = game:GetService("toTargetService")

  local startPosition = partnew.Position
  local endPosition = startPosition + Vector3.new(0, -50, 0)

  local tweenInfo = toTargetInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
  local tween = toTargetService:Create(partnew, tweenInfo, {
    Position = endPosition
  })

  tween:Play()

  local SoundSFX = Instance.new("Sound")
  SoundSFX.Parent = workspace
  SoundSFX.SoundId = "rbxassetid://1904813041"
  SoundSFX:Play()
  SoundSFX.Name = "POwfpxzxzfFfFF"
  game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt:FindFirstChild("ProximityPrompt"):Remove()
  wait(5)
  workspace:FindFirstChild("POwfpxzxzfFfFF"):Remove()
  game:GetService("Workspace").Map["Temple of Time"].NoGlitching:Remove()
  game:GetService("Workspace").Map["Temple of Time"].NoGlitching:Remove()
  game:GetService("Workspace").Map["Temple of Time"].NoGlitching:Remove()
  end

  ProximityPrompt.Triggered:Connect(onProximity)
  end)

RaceV4:Button("Clock Acces", function()
  game:GetService("Workspace").Map["Temple of Time"].DoNotEnter:Remove()
  game:GetService("Workspace").Map["Temple of Time"].ClockRoomExit:Remove()
  end)

RaceV4:Button("Disabled Inf Stairs",function()
  game.Players.LocalPlayer.Character.InfiniteStairs.Disabled = value
end)
--[[RaceV4:Toggle("Auto Use V4",false,function(value)
  _G.UseAwakenZ = value
end)

spawn(function()
    pcall(function()
        while wait() do
        if game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 and game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
        repeat task.wait()
        EquipItem('Awakening')
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        until not _G.UseAwakenZ or game.Players.LocalPlayer.Character.RaceTransformed.Value == true
        end
        end
        end)
    end)]]
end

if World3 then
local Mirrages = RaceMirage:CraftPage(2)
Mirrages:Seperator("Mirrage Island")
local FM = Mirrages:Label('')
local Mirragecheck = Mirrages:Label('')
task.spawn(function()
  while task.wait() do
  pcall(function()
    if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
    FM:Set("🌕: Full Moon 100%")
    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
    FM:Set("🌖’ : Full Moon 75%")
    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
    FM:Set("🌗 : Full Moon 50%")
    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
    FM:Set("🌘 : Full Moon 25%")
    elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
    FM:Set("🌘: Full Moon 15%")
    else
      FM:Set("🌑: Full Moon 0%")
    end
    end)
  end
  end)

spawn(function()
  pcall(function()
    while wait() do
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
    Mirragecheck:Set("Mirrage Island Found!!")
    else
      Mirragecheck:Set('❌: Mirage Island Not Found')end
    end
    end)
  end)

Mirrages:Toggle("Tween Mirage Island",false,function(value)
  _G.Mirage = value
--CancelTween(_G.Mirage)
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenMGear then
				if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
					for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
						if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then 
                            if v.Material ==  Enum.Material.Neon then  
                                toTarget(v.CFrame)
                            end
                        end
					end
				end
			end
        end
    end)
end)

Mirrages:Toggle("Auto Mirage Island [HOP]",false,function(value)
  _G.MirageHop = value
  end)
Mirrages:Toggle("Teleport To Gear",false,function(value)
  _G.TweenMGear = value
  end)

spawn(function()
  pcall(function()
    while wait() do
    if _G.Mirage then
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
    function toTargetWait(a)local b = (a.p-game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude;tweenrach = game:GetService('toTargetService'):Create(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),toTargetInfo.new(b/250,Enum.EasingStyle.Linear), {
      CFrame = a
    })tweenrach:Play()end;toTargetWait(workspace.Map.MysticIsland.PrimaryPart.CFrame*CFrame.new(0,250,0))
    if _G.MirageHop then
    wait(6)
    Hop()
    end
    end
    end
    end
    end)
end)
Mirrages:Toggle("Teleport To Highest Point",false,function(value)
 TwenetoHighestPoint()
end)

function getHighestPoint()
if not game.workspace.Map:FindFirstChild("MysticIsland") then
return nil
end
end

function TwenetoHighestPoint()
HighestPoint = getHighestPoint()
if HighestPoint then
toTarget(HighestPoint.CFrame * CFrame.new(0, 211.88, 0))
end
end

function MoveCamtoMoon()
workspace.CurrentCamera.CFrame =
CFrame.new(
  workspace.CurrentCamera.CFrame.Position,
  game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
end

spawn(
  function()
  while task.wait() do
  if _G.MoonLook then
  MoveCamtoMoon()
  end
  end
  end
)

function TweentoBlueGear()
BlueGear = getBlueGear()
if BlueGear then
toTarget(BlueGear.CFrame)
end
end

Mirrages:Toggle("Auto Look To Moon",false,function(value)
  _G.MoonLook = value
end)

function NoFog()
local c = game.Lighting
c.FogEnd = 100000
for r, v in pairs(c:GetDescendants()) do
if v:IsA("Atmosphere") then
v:Destroy()
end
end
end

Mirrages:Toggle("Collect Chest [Mirrage Island]",false,function(value)
  _G.GrabChestMirrage = value
  end)

spawn(function()
  while wait() do
  if _G.GrabChestMirrage then
  pcall(function()
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
    if game:GetService("Workspace"):FindFirstChild("Chest1") or game:GetService("Workspace"):FindFirstChild("Chest2") or game:GetService("Workspace"):FindFirstChild("Chest3") then
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
    repeat wait()
    toTarget(v.CFrame)
    until not v.Parent or _G.GrabChestMirrage == false
    end
    end
    end
    end
    end)
  end
  end
  end)

Mirrages:Toggle("TP Advance BloxFruit Dealer",false,function(value)
  _G.BloxFruitsDealer = value
  end)

spawn(function()
  while wait() do
  if _G.BloxFruitsDealer then
  pcall(function()
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
  AllNPCS = getnilinstances()
  for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
  table.insert(AllNPCS, v)
  end
  for r, v in pairs(AllNPCS) do
  if v.Name == "Advanced Fruit Dealer" then
  toTarget(v.HumanoidRootPart.CFrame)
  end
end
end
end)
    end
  end
  end)

Mirrages:Button("Remove Fog",function(value)
 NoFog()
end)

end

local DevilFruit = Fruit:CraftPage(1)
local DevilFruit2 = Fruit:CraftPage(2)

DevilFruit:Seperator("Sniper")

FruitList = {
  "Bomb-Bomb",
  "Spike-Spike",
  "Chop-Chop",
  "Spring-Spring",
  "Kilo-Kilo",
  "Spin-Spin",
  "Bird: Falcon",
  "Smoke-Smoke",
  "Flame-Flame",
  "Ice-Ice",
  "Sand-Sand",
  "Dark-Dark",
  "Revive-Revive",
  "Diamond-Diamond",
  "Light-Light",
  "Love-Love",
  "Rubber-Rubber",
  "Barrier-Barrier",
  "Magma-Magma",
  "Portal-Portal",
  "Quake-Quake",
  "Human-Human: Buddha",
  "String-String",
  "Bird-Bird: Phoenix",
  "Rumble-Rumble",
  "Paw-Paw",
  "Gravity-Gravity",
  "Dough-Dough",
  "Venom-Venom",
  "Shadow-Shadow",
  "Control-Control",
  "Blizzard-Blizzard",
  "Spirit-Spirit",
  "Dragon-Dragon",
  "Leopard-Leopard"
}

DevilFruit:Dropdown("Select Fruits Sniper",FruitList,"",function(value)
  _G.SelectFruit = value
  end)

DevilFruit:Toggle("Auto Buy Fruit Sniper",_G.AutoBuyFruitSniper,function(value)
  _G.AutoBuyFruitSniper = value
  end)


DevilFruit:Seperator("Others")

DevilFruit:Dropdown("Select Fruits Eat",FruitList,function(value)
  _G.SelectFruitEat = value
  end)

DevilFruit:Toggle("Auto Eat Fruit",_G.AutoEatFruit,function(value)
  _G.AutoEatFruit = value
  end)

spawn(function()
  pcall(function()
    while wait(.1) do
    if _G.AutoEatFruit then
    game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat).EatRemote:InvokeServer()
    end
    end
    end)
  end)

DevilFruit:Toggle("Auto Eat Fruit Hop",_G.AutoEatFruitHop,function(value)
  _G.AutoEatFruitHop = value
  end)

spawn(function()
  pcall(function()
    while wait(.1) do wait(10)
    if _G.AutoEatFruitHop and _G.SelectFruitEat ~= nil then
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat) or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(_G.SelectFruitEat) then
    Hop()
    else
      game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat).EatRemote:InvokeServer()
    end
    end
    end
    end)
  end)

spawn(function()
  pcall(function()
    while wait(.1) do
    if _G.AutoBuyFruitSniper then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",_G.SelectFruit)
    end
    end
    end)
  end)

DevilFruit2:Seperator("More")
DevilFruit2:Toggle("Get Fruit Inventory Under 1M",_G.Get_Fruit,function(vu)
  _G.Get_Fruit = vu
  end)
spawn(function()
  while wait(.5) do
  pcall(function()
    if _G.Get_Fruit then
    if Inventory_Fruit then
    Inventory_Fruit = nil
    end
    fruit = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
    for i,v in pairs(fruit) do
    if v["Price"] < 10000000 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",v["Name"])
    end
    end
    else
      wait(2)
    end
    end)
  end
  end)

DevilFruit2:Button("Random Fruit",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
  end)

DevilFruit2:Toggle("Auto Random Fruit",_G.Random_Auto,function(value)
  _G.Random_Auto = value
  end)

spawn(function()
  pcall(function()
    while wait(.1) do
    if _G.Random_Auto then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
    end
    end
    end)
  end)

DevilFruit2:Toggle("Auto Drop Fruit",_G.DropFruit,function(value)
  _G.DropFruit = value
  end)

spawn(function()
  while wait() do
  if _G.DropFruit then
  pcall(function()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    if string.find(v.Name, "Fruit") then
    EquipWeapon(v.Name)
    wait(.1)
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
    game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
    end
    EquipWeapon(v.Name)
    game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer("Drop")
    end
    end
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
    if string.find(v.Name, "Fruit") then
    EquipWeapon(v.Name)
    wait(.1)
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
    game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
    end
    EquipWeapon(v.Name)
    game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer("Drop")
    end
    end
    end)
  end
  end
  end)

DevilFruit2:Toggle("Auto Store Fruit",_G.AutoStoreFruit,function(value)
  _G.AutoStoreFruit = value
  end)

spawn(function()--store fruit
    while task.wait() do
        if _G.AutoStoreFruit then
            pcall(function()
                if _G.AutoStoreFruit then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bomb-Bomb",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spike-Spike",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Chop-Chop",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spring-Spring",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kilo Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Kilo-Kilo",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Smoke-Smoke",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spin-Spin",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Flame-Flame",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Falcon",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ice-Ice",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sand-Sand",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dark-Dark",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Revive Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Revive-Revive",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Diamond-Diamond",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Light-Light",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Love-Love",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rubber-Rubber",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Barrier-Barrier",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Magma-Magma",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Door Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Door-Door",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit"))
                    end
                end
                if not trygettrevo then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Quake-Quake",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Human-Human: Buddha",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("String Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","String-String",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Phoenix",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rumble-Rumble",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Paw Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Paw-Paw",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Gravity-Gravity",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dough-Dough",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Shadow-Shadow",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Venom-Venom",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Control-Control",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Soul Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Soul Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Soul-Soul",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Soul Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dragon-Dragon",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
                    end
                end
            end)
        end
        wait(1)
    end
end)

DevilFruit2:Toggle("Auto Bring Fruit",_G.AutoBringFruit,function(value)
  _G.AutoBringFruit = value
  end)

spawn(function()
  pcall(function()
    while wait(.1) do
    if _G.AutoBringFruit then
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
    if string.find(v.Name, "Fruit") then
    if v:IsA("Tool") then
    v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
    wait(.2)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
    end
    end
    end
    end
    end
    end)
  end)

DevilFruit2:Toggle("Teleport To Spawn Fruit",false,function(value)
  _G.Grabfruit = value
  end)

spawn(function()
  while wait(.1) do
  if _G.Grabfruit then
  for i,v in pairs(game.Workspace:GetChildren()) do
  if string.find(v.Name, "Fruit") then
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
  end
  end
  end
  end
  end)

Page15:Seperator("Aimbots")
local lp = game:GetService('Players').LocalPlayer
local mouse = lp:GetMouse()
spawn(function()
  while wait() do
  if _G.Settings.Combat["Aimbot Skill"] then
  pcall(function()
    local MaxDist, Closest = math.huge
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
    local Head = v.Character:FindFirstChild("HumanoidRootPart")
    local Pos, Vis = game.Workspace.CurrentCamera.WorldToScreenPoint(game.Workspace.CurrentCamera, Head.Position)
    local MousePos, TheirPos = Vector2.new(mouse.X, mouse.Y), Vector2.new(Pos.X, Pos.Y)
    local Dist = (TheirPos - MousePos).Magnitude
    if Dist < MaxDist and Dist <= _G.Settings.Combat["Fov Size"] and v.Name ~= game.Players.LocalPlayer.Name then
    MaxDist = Dist
    _G.Aim_Players = v
    end
    end
    end)
  end
  end
  end)

spawn(function()
  local gg = getrawmetatable(game)
  local old = gg.__namecall
  setreadonly(gg,false)
  gg.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args = {
      ...
    }
    if tostring(method) == "FireServer" then
    if tostring(args[1]) == "RemoteEvent" then
    if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
    if _G.Settings.Combat["Aimbot Skill"] then
    args[2] = _G.Aim_Players.Character.HumanoidRootPart.Position
    return old(unpack(args))
    end
    end
    end
    end
    return old(...)
    end)
  end)

local Circle = Drawing.new("Circle")
Circle.Color = Color3.fromRGB(255, 255, 255)
Circle.Thickness = 1
Circle.Radius = 250
Circle.NumSides = 460
Circle.Filled = false
Circle.Transparency = 1

game:GetService("RunService").Stepped:Connect(function()
  Circle.Radius = tonumber(_G.Settings.Combat["Fov Size"])
  Circle.Thickness = 1
  Circle.NumSides = 460
  Circle.Position = game:GetService('UserInputService'):GetMouseLocation()
  if _G.Settings.Combat["Show Fov"] then
  Circle.Visible = true
  else
    Circle.Visible = false
  end
  end)
Page15:Slider(
  "Fov Size", true,
  0,
  1000,
  500,
  function(value)
  _G.Settings.Combat["Fov Size"] = value
  SaveSettings()
  end)
Page15:Toggle(
  "Show Fov",
  _G.Settings.Combat["Show Fov"],
  function(value)
  _G.Settings.Combat["Show Fov"] = value
  end)

Page15:Toggle(
  "Aimbot Skill",
  _G.Settings.Combat["Aimbot Skill"],
  function(value)
  _G.Settings.Combat["Aimbot Skill"] = value
  end)

local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
  local method = getnamecallmethod()
  local args = {
    ...
  }
  if tostring(method) == "FireServer" then
  if tostring(args[1]) == "RemoteEvent" then
  if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
  if Skillaimbot then
  args[2] = AimBotSkillPosition
  return old(unpack(args))
  end
  end
  end
  end
  return old(...)
  end)

spawn(function()
  while wait() do
  for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
  if v:IsA("Tool") then
  if v:FindFirstChild("RemoteFunctionShoot") then
  SelectToolWeaponGun = v.Name
  end
  end
  end
  for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
  if v:IsA("Tool") then
  if v:FindFirstChild("RemoteFunctionShoot") then
  SelectToolWeaponGun = v.Name
  end
  end
  end
  end
  end)

--[aimbot skill]

task.spawn(function()
  while wait() do
  if Skillaimbot then
  if game.Players:FindFirstChild(SelectPlayer) and game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild("HumanoidRootPart") and game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild("Humanoid") and game.Players:FindFirstChild(SelectPlayer).Character.Humanoid.Health > 0 then
  AimBotSkillPosition = game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild("HumanoidRootPart").Position
  end
  end
  end
  end)

spawn(function()
  pcall(function()
    while task.wait() do
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then
    if v:FindFirstChild("RemoteFunctionShoot") then
    CurrentEquipGun = v.Name
    end
    end
    end
    end
    end)
  end)
--[aimbot gun]

local lp = game:GetService('Players').LocalPlayer
local mouse = lp:GetMouse()
mouse.Button1Down:Connect(function()
  if Aimbot and game.Players.LocalPlayer.Character:FindFirstChild(SelectToolWeaponGun) and game:GetService("Players"):FindFirstChild(SelectPlayer) then
  tool = game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun]
  v17 = workspace:FindPartOnRayWithIgnoreList(Ray.new(tool.Handle.CFrame.p, (game:GetService("Players"):FindFirstChild(SelectPlayer).Character.HumanoidRootPart.Position - tool.Handle.CFrame.p).unit * 100), {
    game.Players.LocalPlayer.Character, workspace._WorldOrigin
  });
  game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(game:GetService("Players"):FindFirstChild(SelectPlayer).Character.HumanoidRootPart.Position, (require(game.ReplicatedStorage.Util).Other.hrpFromPart(v17)));
  end
  end)

Page15:Toggle('Aimbot Gun', false, function(aimbotgunfunc)
  AimbotGun = aimbotgunfunc
  end)

spawn(function()
  while task.wait() do
  if AimbotSkill then
  if game.Players:FindFirstChild(SelectPly) and game.Players:FindFirstChild(SelectPly).Character:FindFirstChild("HumanoidRootPart") and game.Players:FindFirstChild(SelectPly).Character:FindFirstChild("Humanoid") and game.Players:FindFirstChild(SelectPly).Character.Humanoid.Health > 0 then
  _G.AimBotSkillPosition = game.Players:FindFirstChild(SelectPly).Character:FindFirstChild("HumanoidRootPart").Position
  end
  end
  end
  end)

local lp = game:GetService('Players').LocalPlayer
local mouse = lp:GetMouse()
mouse.Button1Down:Connect(function()
  if AimbotGun and game.Players.LocalPlayer.Character:FindFirstChild(CurrentEquipGun) and game:GetService("Players"):FindFirstChild(SelectPly) then
  tool = game:GetService("Players").LocalPlayer.Character[CurrentEquipGun]
  v17 = workspace:FindPartOnRayWithIgnoreList(Ray.new(tool.Handle.CFrame.p, (game:GetService("Players"):FindFirstChild(SelectPly).Character.HumanoidRootPart.Position - tool.Handle.CFrame.p).unit * 100), {
    game.Players.LocalPlayer.Character, workspace._WorldOrigin
  });
  game:GetService("Players").LocalPlayer.Character[CurrentEquipGun].RemoteFunctionShoot:InvokeServer(game:GetService("Players"):FindFirstChild(SelectPly).Character.HumanoidRootPart.Position, (require(game.ReplicatedStorage.Util).Other.hrpFromPart(v17)));
  end
  end)

Page15:Seperator("Player Combat")

PlayerList = {}

for i,v in pairs(game.Players:GetChildren()) do
table.insert(PlayerList ,v.Name)
end

local SelectedPly = Page15:Dropdown('Player List', PlayerList, {
  ""
}, function(SelectPlyfunc)
  SelectPly = SelectPlyfunc
  end)

Page15:Button('Refresh Player List',function()
  NewPlayerList = {}
  for i,v in pairs(game.Players:GetChildren()) do
  table.insert(NewPlayerList ,v.Name)
  end
  SelectedPly:Refresh(NewPlayerList)
  end)


Page15:Toggle('Teleport to Player', false, function(tptoplf)
  TeleportPlayer = tptoplf
  pcall(function()
    if TeleportPlayer then
    repeat task.wait()
    toTarget(game:GetService("Players")[SelectPly].Character.HumanoidRootPart.CFrame)
    wait()
--CancelTween(TeleportPlayer)
    until TeleportPlayer == false
    end
    end)
  end)

Page15:Toggle('Spectated Player', false, function(spectafunc)
  SpectatePlayer = spectafunc
  pcall(function()
    local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
    local plr2 = game:GetService("Players"):FindFirstChild(SelectPly)
    repeat task.wait()
    game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(SelectPly).Character.Humanoid
    until SpectatePlayer == false
    game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
    end)
  end)

Page15:Toggle('Kill Player with Melee', false, function(killplayermeleefunc)
  KillPlayerMelee = killplayermeleefunc
--CancelTween(KillPlayerMelee)
  end)
spawn(function()
  while task.wait() do
  if KillPlayerMelee then
  pcall(function()
    if game.Players:FindFirstChild(SelectPly) then
    for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
    if v.Name == SelectPly then
    repeat task.wait()
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
    toTarget(v.HumanoidRootPart.CFrame * Farm_Mode)
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    EquipWeapon(KillPlayerUsingMelee)
    toTarget(v.HumanoidRootPart.CFrame)
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),workspace.CurrentCamera.CFrame)
    end
    until game.Players:FindFirstChild(SelectPly).Character.Humanoid.Health <= 0 or not KillPlayerMelee or not game.Players:FindFirstChild(SelectPly)
    end
    end
    end
    end)
  end
  end
  end)

spawn(function()
  pcall(function()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    if v.ToolTip == "Melee" then
    if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
    KillPlayerUsingMelee = tostring(v.Name)
    end
    end
    end
    end)
  end)

Page15:Toggle('Kill Player with Devil Fruit', false, function(killplayfruitfunc)
  KillPlayerFruit = killplayfruitfunc
--CancelTween(KillPlayerFruit)
  end)
spawn(function()
  while task.wait() do
  if KillPlayerFruit then
  pcall(function()
    if game.Players:FindFirstChild(SelectPly) then
    for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
    if v.Name == SelectPly then
    repeat task.wait()
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
    toTarget(v.HumanoidRootPart.CFrame)
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(posX,7,posZ))
    _G.AimBotSkillPosition = v.HumanoidRootPart.Position
    end
    until game.Players:FindFirstChild(SelectPly).Character.Humanoid.Health <= 0 or not KillPlayerFruit or not game.Players:FindFirstChild(SelectPly)
    end
    end
    end
    end)
  end
  end
  end)

Page15:Toggle('Kill Player with Gun', false, function(killplaygunfunc)
  KillPlayerGun = killplaygunfunc
--CancelTween(KillPlayerGun)
  end)

spawn(function()
  while task.wait() do
  if KillPlayerGun then
  pcall(function()
    if game.Players:FindFirstChild(SelectPly) then
    for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
    if v.Name == SelectPly then
    repeat task.wait()
    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
    toTarget(v.HumanoidRootPart.CFrame)
    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
    EquipWeapon(CurrentEquipGun)
    UseGunKillPlayer = true
    toTarget(v.HumanoidRootPart.CFrame * Farm_Mode)
    game:GetService("Players").LocalPlayer.Character[CurrentEquipGun].Cooldown.Value = 0
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),workspace.CurrentCamera.CFrame)
    end
    until game.Players:FindFirstChild(SelectPly).Character.Humanoid.Health <= 0 or not KillPlayerGun or not game.Players:FindFirstChild(SelectPly)
    end
    end
    else
      UseGunKillPlayer = false
    end
    end)
  end
  end
  end)

spawn(function()
  game:GetService("RunService").RenderStepped:Connect(function()
    if UseGunKillPlayer then
    pcall(function()
      for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
      if v.Name == SelectPly then
      game:GetService("Players").LocalPlayer.Character[CurrentEquipGun].RemoteFunctionShoot:InvokeServer(v.HumanoidRootPart.Position,v.HumanoidRootPart)
      end
      end
      end)
    end
    end)
  end)

Page10:Seperator("World - Server")

Page10:Button("Hop Server",function()
  local PlaceID = game.PlaceId
  local AllIDs = {}
  local foundAnything = ""
  local actualHour = os.date("!*t").hour
  local Deleted = false
  function TPReturner()
  local Site;
  if foundAnything == "" then
  Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
  else
    Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
  end
  local ID = ""
  if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
  foundAnything = Site.nextPageCursor
  end
  local num = 0;
  for i,v in pairs(Site.data) do
  local Possible = true
  ID = tostring(v.id)
  if tonumber(v.maxPlayers) > tonumber(v.playing) then
  for _,Existing in pairs(AllIDs) do
  if num ~= 0 then
  if ID == tostring(Existing) then
  Possible = false
  end
  else
    if tonumber(actualHour) ~= tonumber(Existing) then
  local delFile = pcall(function()
-- delfile("NotSameServers.json")
    AllIDs = {}
    table.insert(AllIDs, actualHour)
    end)
  end
  end
  num = num + 1
  end
  if Possible == true then
  table.insert(AllIDs, ID)
  wait()
  pcall(function()
-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
    wait()
    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
    end)
  wait(.1)
  end
  end
  end
  end
  function Teleport()
  while wait() do
  pcall(function()
    TPReturner()
    if foundAnything ~= "" then
    TPReturner()
    end
    end)
  end
  end
  Teleport()
  end)

--// World Teleport
Page10:Button("Travel to First Sea", function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
  end)

Page10:Button("Travel to Second Sea", function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
  end)

Page10:Button("Travel to Third Sea", function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
  end)

Page10:Button('Sea Beast', function()
  toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations["Sea of Treats"].CFrame)
  end)

Page10:Seperator("Island Teleport ")

--// Island Teleport
Page10:Button('Stop Tween', function()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  end)
if World1 then
Page10:Dropdown("Select Island", {
  "WindMill",
  "Marine",
  "Middle Town",
  "Jungle",
  "Pirate Village",
  "Desert",
  "Snow Island",
  "MarineFord",
  "Colosseum",
  "Sky Island 1",
  "Sky Island 2",
  "Sky Island 3",
  "Prison",
  "Magma Village",
  "Under Water Island",
  "Fountain City",
  "Shank Room",
  "Mob Island"
},"",function(value)
  _G.SelectIsland = value
  end)
end

if World2 then
Page10:Dropdown("Select Island", {
  "The Cafe",
  "Frist Spot",
  "Dark Area",
  "Flamingo Mansion",
  "Flamingo Room",
  "Green Zone",
  "Factory",
  "Colossuim",
  "Zombie Island",
  "Two Snow Mountain",
  "Punk Hazard",
  "Cursed Ship",
  "Ice Castle",
  "Forgotten Island",
  "Ussop Island",
  "Mini Sky Island"
},"",function(value)
  _G.SelectIsland = value
  end)
end

if World3 then
Page10:Dropdown("Select Island", {
  "Mansion",
  "Port Town",
  "Great Tree",
  "Castle On The Sea",
  "MiniSky",
  "Hydra Island",
  "Floating Turtle",
  "Haunted Castle",
  "Ice Cream Island",
  "Peanut Island",
  "Cake Island",
  "Noname Island(New)"
},"",function(value)
  _G.SelectIsland = value
  end)
end

Page10:Toggle("Teleport",false,function(value)
  _G.TeleportIsland = value
  if _G.TeleportIsland == true then
  repeat wait()
  if _G.SelectIsland == "WindMill" then
  toTarget(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
  elseif _G.SelectIsland == "Marine" then
  toTarget(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
  elseif _G.SelectIsland == "Middle Town" then
  toTarget(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
  elseif _G.SelectIsland == "Jungle" then
  toTarget(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
  elseif _G.SelectIsland == "Pirate Village" then
  toTarget(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
  elseif _G.SelectIsland == "Desert" then
  toTarget(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
  elseif _G.SelectIsland == "Snow Island" then
  toTarget(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
  elseif _G.SelectIsland == "MarineFord" then
  toTarget(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
  elseif _G.SelectIsland == "Colosseum" then
  toTarget(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
  elseif _G.SelectIsland == "Sky Island 1" then
  toTarget(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
  elseif _G.SelectIsland == "Sky Island 2" then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
  elseif _G.SelectIsland == "Sky Island 3" then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
  elseif _G.SelectIsland == "Prison" then
  toTarget(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
  elseif _G.SelectIsland == "Magma Village" then
  toTarget(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
  elseif _G.SelectIsland == "Under Water Island" then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
  elseif _G.SelectIsland == "Fountain City" then
  toTarget(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
  elseif _G.SelectIsland == "Shank Room" then
  toTarget(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
  elseif _G.SelectIsland == "Mob Island" then
  toTarget(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
  elseif _G.SelectIsland == "The Cafe" then
  toTarget(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
  elseif _G.SelectIsland == "Frist Spot" then
  toTarget(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
  elseif _G.SelectIsland == "Dark Area" then
  toTarget(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
  elseif _G.SelectIsland == "Flamingo Mansion" then
  toTarget(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
  elseif _G.SelectIsland == "Flamingo Room" then
  toTarget(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
  elseif _G.SelectIsland == "Green Zone" then
  toTarget(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
  elseif _G.SelectIsland == "Factory" then
  toTarget(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
  elseif _G.SelectIsland == "Colossuim" then
  toTarget(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
  elseif _G.SelectIsland == "Zombie Island" then
  toTarget(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
  elseif _G.SelectIsland == "Two Snow Mountain" then
  toTarget(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
  elseif _G.SelectIsland == "Punk Hazard" then
  toTarget(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
  elseif _G.SelectIsland == "Cursed Ship" then
  toTarget(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
  elseif _G.SelectIsland == "Ice Castle" then
  toTarget(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
  elseif _G.SelectIsland == "Forgotten Island" then
  toTarget(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
  elseif _G.SelectIsland == "Ussop Island" then
  toTarget(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
  elseif _G.SelectIsland == "Mini Sky Island" then
  toTarget(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
  elseif _G.SelectIsland == "Great Tree" then
  toTarget(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
  elseif _G.SelectIsland == "Castle On The Sea" then
  toTarget(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
  elseif _G.SelectIsland == "MiniSky" then
  toTarget(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
  elseif _G.SelectIsland == "Port Town" then
  toTarget(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
  elseif _G.SelectIsland == "Hydra Island" then
  toTarget(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
  elseif _G.SelectIsland == "Floating Turtle" then
  toTarget(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
  elseif _G.SelectIsland == "Mansion" then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
  elseif _G.SelectIsland == "Haunted Castle" then
  toTarget(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
  elseif _G.SelectIsland == "Ice Cream Island" then
  toTarget(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
  elseif _G.SelectIsland == "Peanut Island" then
  toTarget(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
  elseif _G.SelectIsland == "Cake Island" then
  toTarget(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
  elseif _G.SelectIsland == "Noname Island(New)" then
  toTarget(CFrame.new(231.742981, 25.3354111, -12199.0537, 0.998278677, -5.16006757e-08, 0.0586484075, 4.79685092e-08, 1, 6.33390442e-08, -0.0586484075, -6.04167383e-08, 0.998278677))
  end
  until not _G.TeleportIsland
  end
--CanceltoTarget(_G.TeleportIsland)
  end)

Page10:Seperator("NPC Teleport")

if World1 then
Page10:Dropdown("Select NPC", {
  "Random Devil Fruit",
  "Blox Fruits Dealer",
  "Remove Devil Fruit",
  "Ability Teacher",
  "Dark Step",
  "Electro",
  "Fishman Karate"
}, {
  ""
},function(value)
  _G.SelectNPC = value
  end)
end

if World2 then
Page10:Dropdown("Select NPC", {
  "Dargon Berath",
  "Mtsterious Man",
  "Mysterious Scientist",
  "Awakening Expert",
  "Nerd",
  "Bar Manager",
  "Blox Fruits Dealer",
  "Trevor",
  "Enhancement Editor",
  "Pirate Recruiter",
  "Marines Recruiter",
  "Chemist",
  "Cyborg",
  "Ghoul Mark",
  "Guashiem",
  "El Admin",
  "El Rodolfo",
  "Arowe"
}, {
  ""
},function(value)
  _G.SelectNPC = value
  end)
end

if World3 then
Page10:Dropdown("Select NPC", {
  "Blox Fruits Dealer",
  "Remove Devil Fruit",
  "Horned Man",
  "Hungey Man",
  "Previous Hero",
  "Butler",
  "Lunoven",
  "Trevor",
  "Elite Hunter",
  "Player Hunter",
  "Uzoth"
}, {
  ""
},function(value)
  _G.SelectNPC = value
  end)
end

Page10:Toggle("Teleport",_G.TeleportNPC,function(value)
  _G.TeleportNPC = value
  if _G.TeleportNPC == true then
  repeat wait()
  if _G.SelectNPC == "Dargon Berath" then
  toTarget(CFrame.new(703.372986, 186.985519, 654.522034, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Mtsterious Man" then
  toTarget(CFrame.new(-2574.43335, 1627.92371, -3739.35767, 0.378697902, -9.06400288e-09, 0.92552036, -8.95582009e-09, 1, 1.34578926e-08, -0.92552036, -1.33852689e-08, 0.378697902))
  elseif _G.SelectNPC == "Mysterious Scientist" then
  toTarget(CFrame.new(-6437.87793, 250.645355, -4498.92773, 0.502376854, -1.01223634e-08, -0.864648759, 2.34106086e-08, 1, 1.89508653e-09, 0.864648759, -2.11940012e-08, 0.502376854))
  elseif _G.SelectNPC == "Awakening Expert" then
  toTarget(CFrame.new(-408.098846, 16.0459061, 247.432846, 0.028394036, 6.17599138e-10, 0.999596894, -5.57905944e-09, 1, -4.59372484e-10, -0.999596894, -5.56376767e-09, 0.028394036))
  elseif _G.SelectNPC == "Nerd" then
  toTarget(CFrame.new(-401.783722, 73.0859299, 262.306702, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Bar Manager" then
  toTarget(CFrame.new(-385.84726, 73.0458984, 316.088806, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Blox Fruits Dealer" then
  toTarget(CFrame.new(-450.725464, 73.0458984, 355.636902, -0.780352175, -2.7266168e-08, 0.625340283, 9.78516468e-09, 1, 5.58128797e-08, -0.625340283, 4.96727601e-08, -0.780352175))
  elseif _G.SelectNPC == "Trevor" then
  toTarget(CFrame.new(-341.498322, 331.886444, 643.024963, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Plokster" then
  toTarget(CFrame.new(-1885.16016, 88.3838196, -1912.28723, -0.513468027, 0, 0.858108759, 0, 1, 0, -0.858108759, 0, -0.513468027))
  elseif _G.SelectNPC == "Enhancement Editor" then
  toTarget(CFrame.new(-346.820221, 72.9856339, 1194.36218, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Pirate Recruiter" then
  toTarget(CFrame.new(-428.072998, 72.9495239, 1445.32422, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Marines Recruiter" then
  toTarget(CFrame.new(-1349.77295, 72.9853363, -1045.12964, 0.866493046, 0, -0.499189168, 0, 1, 0, 0.499189168, 0, 0.866493046))
  elseif _G.SelectNPC == "Chemist" then
  toTarget(CFrame.new(-2777.45288, 72.9919434, -3572.25732, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Ghoul Mark" then
  toTarget(CFrame.new(635.172546, 125.976357, 33219.832, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Cyborg" then
  toTarget(CFrame.new(629.146851, 312.307373, -531.624146, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Guashiem" then
  toTarget(CFrame.new(937.953003, 181.083359, 33277.9297, 1, -8.60126406e-08, 3.81773896e-17, 8.60126406e-08, 1, -1.89969598e-16, -3.8177373e-17, 1.89969598e-16, 1))
  elseif _G.SelectNPC == "El Admin" then
  toTarget(CFrame.new(1322.80835, 126.345039, 33135.8789, 0.988783717, -8.69797603e-08, -0.149354503, 8.62223786e-08, 1, -1.15461916e-08, 0.149354503, -1.46101409e-09, 0.988783717))
  elseif _G.SelectNPC == "El Rodolfo" then
  toTarget(CFrame.new(941.228699, 40.4686775, 32778.9922, -0.818029106, -1.19524382e-08, 0.575176775, -1.28741648e-08, 1, 2.47053866e-09, -0.575176775, -5.38394795e-09, -0.818029106))
  elseif _G.SelectNPC == "Arowe" then
  toTarget(CFrame.new(-1994.51038, 125.519142, -72.2622986, -0.16715166, -6.55417338e-08, -0.985931218, -7.13315558e-08, 1, -5.43836585e-08, 0.985931218, 6.12376851e-08, -0.16715166))
  elseif _G.SelectNPC == "Random Devil Fruit" then
  toTarget(CFrame.new(-1436.19727, 61.8777695, 4.75247526, -0.557794094, 2.74216543e-08, 0.829979479, 5.83273234e-08, 1, 6.16037932e-09, -0.829979479, 5.18467118e-08, -0.557794094))
  elseif _G.SelectNPC == "Blox Fruits Dealer" then
  toTarget(CFrame.new(-923.255066, 7.67800522, 1608.61011, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Remove Devil Fruit" then
  toTarget(CFrame.new(5664.80469, 64.677681, 867.85907, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Ability Teacher" then
  toTarget(CFrame.new(-1057.67822, 9.65220833, 1799.49146, -0.865874112, -9.26330159e-08, 0.500262439, -7.33759435e-08, 1, 5.816689e-08, -0.500262439, 1.36579752e-08, -0.865874112))
  elseif _G.SelectNPC == "Dark Step" then
  toTarget(CFrame.new(-987.873047, 13.7778397, 3989.4978, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Electro" then
  toTarget(CFrame.new(-5389.49561, 13.283, -2149.80151, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Fishman Karate" then
  toTarget(CFrame.new(61581.8047, 18.8965912, 987.832703, 1, 0, 0, 0, 1, 0, 0, 0, 1))
  elseif _G.SelectNPC == "Random Devil Fruit" then
  toTarget(CFrame.new(-12491, 337, -7449))
  elseif _G.SelectNPC == "Blox Fruits Dealer" then
  toTarget(CFrame.new(-12511, 337, -7448))
  elseif _G.SelectNPC == "Remove Devil Fruit" then
  toTarget(CFrame.new(-5571, 1089, -2661))
  elseif _G.SelectNPC == "Horned Man" then
  toTarget(CFrame.new(-11890, 931, -8760))
  elseif _G.SelectNPC == "Hungey Man" then
  toTarget(CFrame.new(-10919, 624, -10268))
  elseif _G.SelectNPC == "Previous Hero" then
  toTarget(CFrame.new(-10368, 332, -10128))
  elseif _G.SelectNPC == "Butler" then
  toTarget(CFrame.new(-5125, 316, -3130))
  elseif _G.SelectNPC == "Lunoven" then
  toTarget(CFrame.new(-5117, 316, -3093))
  elseif _G.SelectNPC == "Elite Hunter" then
  toTarget(CFrame.new(-5420, 314, -2828))
  elseif _G.SelectNPC == "Player Hunter" then
  toTarget(CFrame.new(-5559, 314, -2840))
  elseif _G.SelectNPC == "Uzoth" then
  toTarget(CFrame.new(-9785, 852, 6667))
  end
  until not _G.TeleportNPC
  end
--CanceltoTarget(_G.TeleportNPC)
  end)

local Abili = Tab4:CraftPage(1)
Abili:Seperator("Abilities")

Abili:Button("Buy Geppo [ $10K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
  end)

Abili:Button("Buy Buso Haki [ $25K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
  end)

Abili:Button("Buy Soru [ $25 Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
  end)

Abili:Button("Buy Observation Haki [ $750K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
  end)

Abili:Toggle("Auto Buy Abilities", false, function(t)
  Abilities = t
  while Abilities do wait(.1)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
  end
  end)
local Bote = Tab4:CraftPage(1)
Bote:Seperator("Boats")

BoatList = {
  "Pirate Sloop",
  "Enforcer",
  "Rocket Boost",
  "Dinghy",
  "Pirate Basic",
  "Pirate Brigade"
}

spawn(function()
  while wait() do
  pcall(function()
    if SelectBoat == "Pirate Sloop" then
    _G.SelectBoat = "PirateSloop"
    else
      if SelectBoat == "Enforcer" then
    _G.SelectBoat = "Enforcer"
    else
      if SelectBoat == "RocketBoost" then
    _G.SelectBoat = "RocketBoost"
    else
      if SelectBoat == "PirateBasic" then
    _G.SelectBoat = "PirateBasic"
    else
      if SelectBoat == "PirateBrigade" then
    _G.SelectBoat = "PirateBrigade"
    end
    end
    end
    end
    end
    end)
  end
  end)

Bote:Dropdown("Select Boats",BoatList,function(value)
  SelectBoat = value
  end)

Bote:Button("Buy Boat",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat",_G.SelectBoat)
  end)


local Style = Tab4:CraftPage(1)

Style:Seperator("Fighting Style")

Style:Button("Buy Black Leg [ $150K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
  end)

Style:Button("Buy Electro [ $550K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
  end)

Style:Button("Buy Fishman Karate [ $750K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
  end)

Style:Button("Buy Dragon Claw [ $1,500 Fragments ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
  end)

Style:Button("Buy Superhuman [ $3M Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
  end)

Style:Button("Buy Death Step [ $5K Fragments $5M Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
  end)

Style:Button("Buy Sharkman Karate [ $5K ragments $2M.500K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
  end)

Style:Button("Buy Electric Claw [ $5K Fragments $3M Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
  end)

Style:Button("Buy Dragon Talon [ $5K Fragments $3M Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
  end)

Style:Button("Buy God Human [ $5K Fragments $5M Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
  end)
-----Shop----------------
local Swordss = Tab4:CraftPage(2)

Swordss:Seperator("Sword")

Swordss:Button("Cutlass [ $1K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
  end)

Swordss:Button("Katana [ $1K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
  end)

Swordss:Button("Iron Mace [ $25K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
  end)

Swordss:Button("Dual Katana [ $12K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
  end)

Swordss:Button("Triple Katana [ $60K Beli ]", function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
  end)

Swordss:Button("Pipe [ $100K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
  end)

Swordss:Button("Dual-Headed Blade [ $400K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
  end)

Swordss:Button("Bisento [ $1M.200K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
  end)

Swordss:Button("Soul Cane [ $750K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
  end)

Swordss:Button("Pole v.2 [ 5K Fragments ]",function()
  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
  end)

Swordss:Button("Yama Sword [ Elite Hunter 30 ]",function()
  _G.AutoYama = true
  end)

spawn(function()
  while wait() do
  if _G.AutoYama then
  if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
  repeat wait(.1)
  fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
  until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
  end
  end
  end
  end)

local Bonesz = Tab4:CraftPage(1)

Bonesz:Seperator("Bones")

Bonesz:Button("Buy Surprise [ $50 Bone ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
  end)

Bonesz:Button("Stat Refund [ $50 Bone ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,2)
  end)

Bonesz:Button("Race Reroll [ $50 Bone ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,3)
  end)

local Gunss = Tab4:CraftPage(2)

Gunss:Seperator("Gun")

Gunss:Button("Slingshot [ $5K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
  end)

Gunss:Button("Musket [ $8K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
  end)

Gunss:Button("Flintlock [ $10,500 Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
  end)

Gunss:Button("Refined Slingshot [ $30K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
  end)

Gunss:Button("Refined Flintlock [ $65K Beli ]",function()
  local args = {
    [1] = "BuyItem",
    [2] = "Refined Flintlock"
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)

Gunss:Button("Cannon [ $100K Beli ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
  end)

Gunss:Button("Kabucha [ 1,500 Fragments]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
  end)

Gunss:Button("Bizarre Rifle [ 250 Ectoplasm ]", function()
  local A_1 = "Ectoplasm"
  local A_2 = "Buy"
  local A_3 = 1
  local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
  Event:InvokeServer(A_1, A_2, A_3)
  local A_1 = "Ectoplasm"
  local A_2 = "Buy"
  local A_3 = 1
  local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
  Event:InvokeServer(A_1, A_2, A_3)
  end)

------------Stat------------------
local Statss = Tab4:CraftPage(2)

Statss:Seperator("Stat")

Statss:Button("Reset Stats (Use 2.5K Fragments)", function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
  end)

Statss:Button("Random Race (Use 3K Fragments)", function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
  end)

--------------Accessories-----------------
local Accces = Tab4:CraftPage(2)

Accces:Seperator("Accessories")
Accces:Button("Black Cape [ $50K Beli ]",function()
  local args = {
    [1] = "BuyItem",
    [2] = "Black Cape"
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)
Accces:Button("Swordsman Hat [ 150k Beli ]",function()
  local args = {
    [1] = "BuyItem",
    [2] = "Swordsman Hat"
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)
Accces:Button("Tomoe Ring [ $500k Beli ]",function()
  local args = {
    [1] = "BuyItem",
    [2] = "Tomoe Ring"
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)

local Racess = Tab4:CraftPage(2)
Racess:Seperator("Race & etc")
Racess:Button("Race Ghoul (Use 2.5K Fragments)",function()
  local args = {
    [1] = "Ectoplasm",
    [2] = "BuyCheck",
    [3] = 4
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  local args = {
    [1] = "Ectoplasm",
    [2] = "Change",
    [3] = 4
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)

Racess:Button("Race Cyborg (Use 2.5K Fragments)",function()
  local args = {
    [1] = "CyborgTrainer",
    [2] = "Buy"
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)

Page11:Toggle(
  "Auto Raids",
  _G.Settings.Raids["Auto Raids"],
  function(value)
  _G.Settings.Raids["Auto Raids"] = value
  if value == false then
  wait()
  toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  wait()
  end
  SaveSettings()
  end)

Page11:Dropdown("Select Raids",
  {
    "Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"
  }, {
    ""
  },
  function(value)
  _G.Settings.Raids["Select Raids"] = value
  SaveSettings()
  end)

Page11:Seperator(
  "Raids Configs")

Page11:Toggle(
  "Kill Aura",
  _G.Settings.Raids["Kill Aura"],
  function(value)
  _G.Settings.Raids["Kill Aura"] = value
  SaveSettings()
  end)

Page11:Toggle(
  "Auto Awakened",
  _G.Settings.Raids["Auto Awakened"],
  function(value)
  _G.Settings.Raids["Auto Awakened"] = value
  SaveSettings()
  end)

Page11:Toggle(
  "Auto Next Place",
  _G.Settings.Raids["Auto Next Place"],
  function(value)
  _G.Settings.Raids["Auto Next Place"] = value
  SaveSettings()
  end)

task.spawn(function()
  while wait() do
  if _G.Settings.Raids["Auto Raids"] and not _G.Settings.Main["Auto Farm Level"] then
  if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
  if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
  if World2 then
  fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
  elseif World3 then
  fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
  end
  wait(17)
  elseif game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true then
  pcall(function()
    repeat wait()
    if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then

    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
    game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame.z)
    if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
    Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame)
    elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
    if Farmtween then
    Farmtween:Stop()
    end
    toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 5"].CFrame*CFrame.new(4,65,10))
    end
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
    game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame.z)
    if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
    Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame)
    elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
    if Farmtween then
    Farmtween:Stop()
    end
    toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 4"].CFrame*CFrame.new(4,65,10))
    end
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
    game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame.z)
    if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
    Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame)
    elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
    if Farmtween then
    Farmtween:Stop()
    end
    toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 3"].CFrame*CFrame.new(4,65,10))
    end
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
    game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame.z)
    if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
    Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame)
    elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
    if Farmtween then
    Farmtween:Stop()
    end
    toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame*CFrame.new(4,65,10))
    end
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
    game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame.z)
    if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
    Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame)
    elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
    if Farmtween then
    Farmtween:Stop()
    end
    toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 1"].CFrame*CFrame.new(4,65,10))
    end
    end
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
    if _G.Settings.Raids["Auto Raids"] and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 400 then
    repeat wait()
    v.Humanoid.Health = 0
    v:BreakJoints()
    until not _G.Settings.Raids["Auto Raids"] or v.Humanoid.Health <= 0 or not v.Parent
    end
    end
    if _G.Settings.Raids["Auto Awakened"] then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
    end
    until not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") or game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false
    if _G.Settings.Raids["Auto Awakened"] then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
    end
    end)
  end
  else
    if _G.Settings.Raids["Auto Awakened"] then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
  end
  local args = {
    [1] = "RaidsNpc",
    [2] = "Select",
    [3] = tostring(_G.Settings.Raids["Select Raids"])
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end
  end
  end
  end)

spawn(function()
  while wait() do
  if _G.Settings.Raids["Kill Aura"] then
  for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
  if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
  pcall(function()
    repeat wait()
    v.Humanoid.Health = 0
    v.HumanoidRootPart.CanCollide = false
    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    v.HumanoidRootPart.Transparency = 0.8
    until not _G.Settings.Raids["Kill Aura"] or not _G.Settings.Raids["Auto Raids"] or not RaidSuperhuman or not v.Parent or v.Humanoid.Health <= 0
    end)
  end
  end
  end
  end
  end)

spawn(function()
  pcall(function()
    while wait() do
    if _G.Settings.Raids["Auto Next Place"] then
    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true and game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
    toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 5"].CFrame*CFrame.new(4,65,10))
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
    toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 4"].CFrame*CFrame.new(4,65,10))
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
    toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 3"].CFrame*CFrame.new(4,65,10))
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
    toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame*CFrame.new(4,65,10))
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
    toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 1"].CFrame*CFrame.new(4,65,10))
    end
    elseif World2 then
    toTarget(CFrame.new(-6438.73535, 250.645355, -4501.50684))
    elseif World3 then
    toTarget(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
    end
    end
    end
    end)
end)
local MainUi = Tab5:CraftPage(1)
MainUi:Seperator("Main - Ui")

MainUi:Button("Open Devil Shop",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
  game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
  end)

MainUi:Button("Open Inventory",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
  wait(1)
  game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Visible = true
  end)

MainUi:Button("Open Inventory Fruit",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
  game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
  end)

MainUi:Button("Open Title Name",function()
  local args = {
    [1] = "getTitles"
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
  end)

MainUi:Button("Open Color Haki",function()
  game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
  end)

MainUi:Button("Open Awakenings Expert",function()
  game.Players.LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
  end)

local MainTeam = Tab5:CraftPage(1)
MainTeam:Seperator("Main - Teams")

MainTeam:Button("Join Pirates Team", function()
  local args = {
    [1] = "SetTeam",
    [2] = "Pirates"
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  local args = {
    [1] = "BartiloQuestProgress"
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)

MainTeam:Button("Join Marines Team",function()
  local args = {
    [1] = "SetTeam",
    [2] = "Marines"
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  local args = {
    [1] = "BartiloQuestProgress"
  }
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)

local Abilis = Tab5:CraftPage(1)
Abilis:Seperator("Abilities")

Abilis:Toggle("Infinite Energy",false,function(value)
  InfiniteEnergy = value
  originalstam = LocalPlayer.Character.Energy.Value
  end)

local LocalPlayer = game:GetService'Players'.LocalPlayer
local originalstam = LocalPlayer.Character.Energy.Value
function infinitestam()
LocalPlayer.Character.Energy.Changed:connect(function()
  if InfinitsEnergy then
  LocalPlayer.Character.Energy.Value = originalstam
  end
  end)
end
spawn(function()
  while wait(.1) do
  if InfinitsEnergy then
  wait(0.3)
  originalstam = LocalPlayer.Character.Energy.Value
  infinitestam()
  end
  end
end)

Abilis:Toggle("Infinite Ability",false,function(infA)
if infA then
  local Agility = game:GetService("ReplicatedStorage").FX["Agility"]:Clone()
  Agility.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
  local Agility = game:GetService("ReplicatedStorage").FX["Agility"]:Clone()
  else
  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart["Agility"]:Destroy()
  end
  end)

Abilis:Toggle("Infinite Obversation Range",getgenv().InfiniteObRange,function(value)
  getgenv().InfiniteObRange = value
  local VS = game:GetService("Players").LocalPlayer.VisionRadius.Value
  while getgenv().InfiniteObRange do
  wait()
  local player = game:GetService("Players").LocalPlayer
  local char = player.Character
  local VisionRadius = player.VisionRadius
  if player then
  if char.Humanoid.Health <= 0 then
  wait(5)
  end
  VisionRadius.Value = math.huge
  elseif getgenv().InfiniteObRange == false and player then
  VisionRadius.Value = VS
  end
  end
  end)

Abilis:Toggle("Infinite Geppo",getgenv().InfGeppo,function(value)
  getgenv().InfGeppo = value
  end)

spawn(function()
  while wait() do
  pcall(function()
    if getgenv().InfGeppo then
    for i,v in next, getgc() do
    if game:GetService("Players").LocalPlayer.Character.Geppo then
    if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Geppo then
    for i2,v2 in next, getupvalues(v) do
    if tostring(i2) == "9" then
    repeat wait(.1)
    setupvalue(v,i2,0)
    until not getgenv().InfGeppo or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
    end
    end
    end
    end
    end
    end
    end)
  end
  end)

Abilis:Toggle("Infinite Soru",getgenv().InfSoru,function(value)
  getgenv().InfSoru = value
  end)

spawn(function()
  while wait() do
  pcall(function()
    if getgenv().InfSoru and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
    for i,v in next, getgc() do
    if game:GetService("Players").LocalPlayer.Character.Soru then
    if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Soru then
    for i2,v2 in next, getupvalues(v) do
    if typeof(v2) == "table" then
    repeat wait(.1)
    v2.LastUse = 0
    until not getgenv().InfSoru or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
    end
    end
    end
    end
    end
    end
    end)
  end
  end)

Abilis:Toggle("Infinite Jump", nil, function(State)
  Infinite = State
  game:GetService("UserInputService").JumpRequest:connect(function()
    if Infinite then
    game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
    end
    end)
  end)

local Higlits = Tab5:CraftPage(1)
Higlits:Seperator("Highlight")

Higlits:Toggle("Show Chat disabled", _G.chat, function(value)
  _G.chat = value
  if _G.chat == true then
  local StarterGui = game:GetService('StarterGui')
  StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
  elseif _G.chat == false then
  local StarterGui = game:GetService('StarterGui')
  StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
  end
  end)

Higlits:Toggle("Show leaderboard disabled", _G.leaderboard, function(a)
  _G.leaderboard = a
  if _G.leaderboard == true then
  local StarterGui = game:GetService('StarterGui')
  game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
  elseif _G.leaderboard == false then
  local StarterGui = game:GetService('StarterGui')
  game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
  end
  end)

Higlits:Toggle("Highlight Mode",false,function(value)
  if value == true then
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = false
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = false
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = false
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = false
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = false
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = false
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = false
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = false
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = false
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = false
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = false
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = false
  else
    game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = true
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = true
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = true
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = true
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = true
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = true
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = true
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = true
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = true
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = true
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = true
  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = true
  end
  end)

Higlits:Toggle("Graphic",false,function(v)
  if v then
  getgenv().mode = "Autumn" -- Choose from Summer and Autumn
  local a = game.Lighting
  a.Ambient = Color3.fromRGB(33, 33, 33)
  a.Brightness = 0.3
  a.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
  a.ColorShift_Top = Color3.fromRGB(255, 247, 237)
  a.EnvironmentDiffuseScale = 0.105
  a.EnvironmentSpecularScale = 0.522
  a.GlobalShadows = true
  a.OutdoorAmbient = Color3.fromRGB(51, 54, 67)
  a.ShadowSoftness = 0.04
  a.GeographicLatitude = -15.525
  a.ExposureCompensation = 0.75
  local b = Instance.new("BloomEffect", a)
  b.Name = "BloomEffect_Graphic"
  b.Enabled = true
  b.Intensity = 0.04
  b.Size = 1900
  b.Threshold = 0.915
  local c = Instance.new("ColorCorrectionEffect", a)
  c.Name = 'ColorCorrectionEffect1_Graphic'
  c.Brightness = 0.176
  c.Contrast = 0.39
  c.Enabled = true
  c.Saturation = 0.2
  c.TintColor = Color3.fromRGB(217, 145, 57)
  if getgenv().mode == "Summer" then
  c.TintColor = Color3.fromRGB(255, 220, 148)
  elseif getgenv().mode == "Autumn" then
  c.TintColor = Color3.fromRGB(242, 193, 79)
  end
  local d = Instance.new("DepthOfFieldEffect", Graphic)
  d.Name = 'DepthOfFieldEffect_Graphic'
  d.Enabled = true
  d.FarIntensity = 0.077
  d.FocusDistance = 21.54
  d.InFocusRadius = 20.77
  d.NearIntensity = 0.277
  local e = Instance.new("ColorCorrectionEffect", a)
  e.Name = 'ColorCorrectionEffect2_Graphic'
  e.Brightness = 0
  e.Contrast = -0.07
  e.Saturation = 0
  e.Enabled = true
  e.TintColor = Color3.fromRGB(255, 247, 239)
  local e2 = Instance.new("ColorCorrectionEffect", a)
  e2.Name = 'ColorCorrectionEffect3_Graphic'
  e2.Brightness = 0.2
  e2.Contrast = 0.45
  e2.Saturation = -0.1
  e2.Enabled = true
  e2.TintColor = Color3.fromRGB(255, 255, 255)
  local s = Instance.new("SunRaysEffect", a)
  s.Name = 'SunRaysEffect_Graphic'
  s.Enabled = false
  s.Intensity = 0.01
  s.Spread = 0.146
  else
    local a = game.Lighting
  a.Ambient = Color3.fromRGB(170, 170, 170)
  a.Brightness = 2
  a.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
  a.ColorShift_Top = Color3.fromRGB(0, 0, 0)
  a.EnvironmentDiffuseScale = 0.105
  a.EnvironmentSpecularScale = 0.522
  a.GlobalShadows = false
  a.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
  a.ShadowSoftness = 0
  a.GeographicLatitude = 66
  a.ExposureCompensation = 0.2
  game:GetService("Lighting")["BloomEffect_Graphic"]:Destroy()
  game:GetService("Lighting")["ColorCorrectionEffect1_Graphic"]:Destroy()
  game:GetService("Lighting")["ColorCorrectionEffect2_Graphic"]:Destroy()
  game:GetService("Lighting")["ColorCorrectionEffect3_Graphic"]:Destroy()
  game:GetService("Lighting")["SunRaysEffect_Graphic"]:Destroy()
  end
  end)

Higlits:Toggle("Xray",false,function(value)
  NoWorld = value
  if NoWorld == true then
  transparent = true
  x(transparent)
  elseif NoWorld == false then
  transparent = false
  x(transparent)
  end
  end)

local transparent = false -- xray
function x(v)
if v then
for _,i in pairs(workspace:GetDescendants()) do
if i:IsA("BasePart") and not i.Parent:FindFirstChild("Humanoid") and not i.Parent.Parent:FindFirstChild("Humanoid") then
i.LocalTransparencyModifier = 0.7
end
end
else
  for _,i in pairs(workspace:GetDescendants()) do
if i:IsA("BasePart") and not i.Parent:FindFirstChild("Humanoid") and not i.Parent.Parent:FindFirstChild("Humanoid") then
i.LocalTransparencyModifier = 0
end
end
end
end

---- [RainbowHaki]
spawn(function()
  while wait() do
  if RainbowHaki then
  pcall(function()
    if game.Players.LocalPlayer.Character.HasBuso then
    for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetChildren()) do
    if v.Name == "RightLowerArm_BusoLayer1" or v.Name == "RightLowerArm_BusoLayer2" or v.Name == "RightHand_BusoLayer1" or v.Name == "RightHand_BusoLayer2" or v.Name == "LeftLowerArm_BusoLayer1" or v.Name == "LeftLowerArm_BusoLayer2" or v.Name == "LeftHand_BusoLayer1" or v.Name == "LeftHand_BusoLayer2" or v.Name == "LeftHand_BusoLayer1" or v.Name == "RightUpperArm_BusoLayer1" or v.Name == "RightUpperArm_BusoLayer2" or v.Name == "LeftUpperArm_BusoLayer1" or v.Name == "LeftUpperArm_BusoLayer2" or v.Name == "UpperTorso_BusoLayer1" or v.Name == "UpperTorso_BusoLayer2" or v.Name == "LowerTorso_BusoLayer1" or v.Name == "LowerTorso_BusoLayer2" or v.Name == "Head_BusoLayer1" or v.Name == "Head_BusoLayer2" or v.Name == "RightUpperLeg_BusoLayer1" or v.Name == "RightUpperLeg_BusoLayer2" or v.Name == "LeftUpperLeg_BusoLayer1" or v.Name == "LeftUpperLeg_BusoLayer2" or v.Name == "RightLowerLeg_BusoLayer1" or v.Name == "RightLowerLeg_BusoLayer2" or v.Name == "LeftLowerLeg_BusoLayer1" or v.Name == "LeftLowerLeg_BusoLayer2" or v.Name == "LeftFoot_BusoLayer1" or v.Name == "LeftFoot_BusoLayer2" or v.Name == "RightFoot_BusoLayer1" or v.Name == "RightFoot_BusoLayer2" then
    v.Color = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
    end
    end
    end
    end)
  end
  end
  end)

Higlits:Toggle("Rainbow Haki",false,function(value)
  RainbowHaki = value
  end)

Higlits:Toggle("Rainbow Yoru",false,function(value)
  RainbowYoru = value
  end)

---- [RainbowYoru]

spawn(function()
  while wait() do
  if RainbowYoru then
  pcall(function()
    for i,v in pairs(game.Players.LocalPlayer.Character.DarkBlade.Right:GetChildren()) do
    if v.Name == "Runes" or v.Name == "Hold" or v.Name == "Bottom" or v.Name == "Gems" or v.Name == "Wings" or v.Name == "Blade" or v.Name == "Tape" then
    v.Color = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
    v.Material = "Neon"
    end

    end
    end)
  end
  end
  end)

spawn(function()
  while wait(1) do
  if RainbowYoru then
  pcall(function()
    for i,v in pairs(game.Players.LocalPlayer.Character.DarkBlade.Right.Handle:GetChildren()) do
    if v.Name == "Trail" then
    v.LightEmission = 1
    end

    end
    end)
  end
  end
  end)

spawn(function()
  while wait(1) do
  if RainbowYoru then
  pcall(function()
    for i,v in pairs(game.Players.LocalPlayer.Character.DarkBlade.Right.Handle.Attachment0:GetChildren()) do
    if v.Name == "Beam" then
    v.LightEmission = 1 v.Texture = 0 v.Width0 = 0 v.Width1 = 0
    end

    end
    end)
  end
  end
  end)

local Miscss = Tab5:CraftPage(1)
Miscss:Seperator("Misc")

Miscss:Toggle("Auto Haki", true,function(vu)
  _G.AutoHakiBuso = vu
  end)

spawn(function()
  while wait(.1) do
  if _G.AutoHakiBuso then
  if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
  end
  end
  end
  end)

function Click()
game:GetService("RunService").RenderStepped:Connect(function()
  game:GetService'VirtualUser':CaptureController()
  end)
game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
end

Miscss:Toggle("Anti AFK", true, function()
  local vu = game:GetService("VirtualUser")
  repeat wait() until game:IsLoaded()
  game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
  end)

Miscss:Toggle("Auto Rejoin",true,function(value)
  _G.AutoRejoin = value
  end)

spawn(function()
  while wait() do
  if _G.AutoRejoin then
  getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
    game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
    end)
  end
  end
  end)

Miscss:Toggle("No Clip",_G.NoClip,function()
  _G.NoClip = value
  end)

local MainMobs = Tab5:CraftPage(2)
MainMobs:Seperator("Main - Mob")

MainMobs:Button("Remove Lave",function()
  for i,v in pairs(game.Workspace:GetDescendants()) do
  if v.Name == "Lava" then
  v:Destroy()
  end
  end
  for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
  if v.Name == "Lava" then
  v:Destroy()
  end
  end
  end)

MainMobs:Button("Invisible (lag)",function()
  game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
  end)

MainMobs:Button("Invisible [Remove]",function()
  local removeNametags = true -- remove custom billboardgui nametags from hrp, could trigger anticheat

  local plr = game:GetService("Players").LocalPlayer
  local character = plr.Character
  local hrp = character.HumanoidRootPart
  local old = hrp.CFrame

  if not character:FindFirstChild("LowerTorso") or character.PrimaryPart ~= hrp then
  return print("unsupported")
  end

  if removeNametags then
  local tag = hrp:FindFirstChildOfClass("BillboardGui")
  if tag then tag:Destroy() end

  hrp.ChildAdded:Connect(function(item)
    if item:IsA("BillboardGui") then
    task.wait()
    item:Destroy()
    end
    end)
  end

  local newroot = character.LowerTorso.Root:Clone()
  hrp.Parent = workspace
  character.PrimaryPart = hrp
  character:MoveTo(Vector3.new(old.X,9e9,old.Z))
  hrp.Parent = character
  task.wait(0.5)
  newroot.Parent = hrp
  hrp.CFrame = old
  end)


MainMobs:Button("Max Zoom", function()
  while wait() do
  game.Players.LocalPlayer.CameraMaxZoomDistance = 9223372036854718
  end
  end)

MainMobs:Button("Buddha Big", function()
  local LocalPlayer = game:GetService("Players").LocalPlayer
  local Character = LocalPlayer.Character
  local Humanoid = Character:FindFirstChildOfClass("Humanoid")

  function rm()
  for i,v in pairs(Character:GetDescendants()) do
  if v:IsA("BasePart") then
  if v.Name == "Handle" or v.Name == "Head" then
  if Character.Head:FindFirstChild("OriginalSize") then
  Character.Head.OriginalSize:Destroy()
  end
  else
    for i,cav in pairs(v:GetDescendants()) do
  if cav:IsA("Attachment") then
  if cav:FindFirstChild("OriginalPosition") then
  cav.OriginalPosition:Destroy()
  end
  end
  end
  v:FindFirstChild("OriginalSize"):Destroy()
  if v:FindFirstChild("AvatarPartScaleType") then
  v:FindFirstChild("AvatarPartScaleType"):Destroy()
  end
  end
  end
  end
  end

  rm()
  wait(0.5)
  Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
  wait(1)
  end)

MainMobs:Button("Kaitun Cap", function(value)
  local cac = require(game:GetService("Players").LocalPlayer.PlayerGui.Main.UIController.Inventory)
  local Inventory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
  local Items = {}
  local RaityLevel = {
    "Mythical","Legendary","Rare","Uncommon","Common"
  }
  local RaityColor = {
    ["Common"] = Color3.fromRGB(179, 179, 179),
    ["Uncommon"] = Color3.fromRGB(92, 140, 211),
    ["Rare"] = Color3.fromRGB(140, 82, 255),
    ["Legendary"] = Color3.fromRGB(213, 43, 228) ,
    ["Mythical"] = Color3.fromRGB(238, 47, 50)
  }
  function GetRaity(color)
  for k,v in pairs(RaityColor) do
  if v == color then return k end
  end
  end

  for k,v in pairs(Inventory) do
  Items[v.Name] = v
  end

  local total = #getupvalue(cac.UpdateRender,4)
  local rac = {}
  local allitem = {}
  local total2 = 0
  while total2 < total do
  local i = 0
  while i < 25000 and total2 < total do
  game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition = Vector2.new(0,i)
  for k,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.Frame:GetChildren()) do
  if v:IsA("Frame") and not rac[v.ItemName.Text] and v.ItemName.Visible == true then
  local vaihuhu = GetRaity(v.Background.BackgroundColor3)
  if vaihuhu then
  print("Rac")
  if not allitem[vaihuhu] then
  allitem[vaihuhu] = {}
  end
  table.insert(allitem[vaihuhu],v:Clone())
  end
  total2 = total2+1
  rac[v.ItemName.Text] = true
  end
  end
  i = i+20
  end
  wait()
  end
  function GetXY(vec)
  return vec*100
  end

  local tvk = Instance.new("UIListLayout")
  tvk.FillDirection = Enum.FillDirection.Vertical
  tvk.SortOrder = 2
  tvk.Padding = UDim.new(0,10)

  local Left = Instance.new("Frame",game.Players.LocalPlayer.PlayerGui.BubbleChat)
  Left.BackgroundTransparency = 1
  Left.Size = UDim2.new(.5,0,1,0)
  tvk.Parent = Left

  local Right = Instance.new("Frame",game.Players.LocalPlayer.PlayerGui.BubbleChat)
  Right.BackgroundTransparency = 1
  Right.Size = UDim2.new(.5,0,1,0)
  Right.Position = UDim2.new(.6,0,0,0)
  tvk:Clone().Parent = Right
  for k,v in pairs(allitem) do
  local cac = Instance.new("Frame",Left)
  cac.BackgroundTransparency = 1
  cac.Size = UDim2.new(1,0,0,0)
  cac.LayoutOrder = table.find(RaityLevel,k)

  local cac2 = Instance.new("Frame",Right)
  cac2.BackgroundTransparency = 1
  cac2.Size = UDim2.new(1,0,0,0)
  cac2.LayoutOrder = table.find(RaityLevel,k)

  local tvk = Instance.new("UIGridLayout",cac)
  tvk.CellPadding = UDim2.new(.005,0,.005,0)
  tvk.CellSize = UDim2.new(0,70,0,70)
  tvk.FillDirectionMaxCells = 100
  tvk.FillDirection = Enum.FillDirection.Horizontal

  local ccc = tvk:Clone()
  ccc.Parent = cac2
  for k,v in pairs(v) do
  if Items[v.ItemName.Text] and Items[v.ItemName.Text].Mastery then
  if v.ItemLine2.Text ~= "Accessory" then
  local bucac = v.ItemName:Clone()
  bucac.BackgroundTransparency = 1
  bucac.TextSize = 10
  bucac.TextXAlignment = 2
  bucac.TextYAlignment = 2
  bucac.ZIndex = 5
  bucac.Text = Items[v.ItemName.Text].Mastery
  bucac.Size = UDim2.new(.5,0,.5,0)
  bucac.Position = UDim2.new(.5,0,.5,0)
  bucac.Parent = v
  end
  v.Parent = cac
  elseif v.ItemLine2.Text == "Blox Fruit" then
  v.Parent = cac2
  end
  end
  cac.AutomaticSize = 2
  cac2.AutomaticSize = 2
  end
  local ListHuhu = {
    ["Superhuman"] = Vector2.new(3,2),
    ["GodHuman"] = Vector2.new(3,2),
    ["DeathStep"] = Vector2.new(4,3),
    ["ElectricClaw"] = Vector2.new(2,0),
    ["SharkmanKarate"] = Vector2.new(0,0),
    ["DragonTalon"] = Vector2.new(1,5)
  }
  local MeleeG = Instance.new("Frame",Left)
  MeleeG.BackgroundTransparency = 1
  MeleeG.Size = UDim2.new(1,0,0,0)
  MeleeG.LayoutOrder = table.find(RaityLevel,k)
  MeleeG.AutomaticSize = 2
  MeleeG.LayoutOrder = 100
  local tvk = Instance.new("UIGridLayout",MeleeG)
  tvk.CellPadding = UDim2.new(.005,0,.005,0)
  tvk.CellSize = UDim2.new(0,70,0,70)
  tvk.FillDirectionMaxCells = 100
  tvk.FillDirection = Enum.FillDirection.Horizontal

  local cac = {
    "Superhuman","ElectricClaw","DragonTalon","SharkmanKarate","DeathStep","GodHuman"
  }
  for k,v in pairs(cac) do
  if ListHuhu[v] and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy"..v,true) == 1 then
  local huhu = Instance.new("ImageLabel",MeleeG)
  huhu.Image = "rbxassetid://9945562382"
  huhu.ImageRectSize = Vector2.new(100,100)
  huhu.ImageRectOffset = ListHuhu[v]*100
  end
  end
  function formatNumber(v)
  return tostring(v):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
  end
  game:GetService("Players").LocalPlayer.PlayerGui.Main.Beli.Position = UDim2.new(0,800,0,500)
  game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Position = UDim2.new(0,800,0,550)

  local thieunang = game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone()
  thieunang.Parent = game:GetService("Players").LocalPlayer.PlayerGui.BubbleChat
  thieunang.Position = UDim2.new(0,800,0.63,0)
  local n = formatNumber(game.Players.LocalPlayer.Data.Fragments.Value)
  thieunang.Text = "Ã†â€™"..n
  print("Done")
  pcall(function()
    game:GetService("Players").LocalPlayer.PlayerGui.Main.MenuButton:Destroy()
    end)
  pcall(function()
    game:GetService("Players").LocalPlayer.PlayerGui.Main.HP:Destroy()
    end)
  pcall(function()
    game:GetService("Players").LocalPlayer.PlayerGui.Main.Energy:Destroy()
    end)
  for k,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main:GetChildren()) do
  if v:IsA("ImageButton") then
  v:Destroy()
  end
  end
  pcall(function()
    game:GetService("Players").LocalPlayer.PlayerGui.Main.Compass:Destroy()
    end)
  end)

local States = Tab5:CraftPage(2)
States:Seperator("State")

States:Dropdown("Select Haki State", {
  "State 0","State 1","State 2","State 3","State 4","State 5"},"",function(value)
  _G.SelectStateHaki = value
  end)

States:Button("Change Buso Haki State",function()
  if _G.SelectStateHaki == "State 0" then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",0)
  elseif _G.SelectStateHaki == "State 1" then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",1)
  elseif _G.SelectStateHaki == "State 2" then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",2)
  elseif _G.SelectStateHaki == "State 3" then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",3)
  elseif _G.SelectStateHaki == "State 4" then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",4)
  elseif _G.SelectStateHaki == "State 5" then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",5)
  end
  end)

local Booster = Tab5:CraftPage(2)
Booster:Seperator("Boost FPS")

local a = game.Lighting
local c = Instance.new("ColorCorrectionEffect", a)
local e = Instance.new("ColorCorrectionEffect", a)
OldAmbient = a.Ambient
OldBrightness = a.Brightness
OldColorShift_Top = a.ColorShift_Top
OldBrightnessc = c.Brightness
OldContrastc = c.Contrast
OldTintColorc = c.TintColor
OldTintColore = e.TintColor

Booster:Toggle("RTX Mode",_G.RTXMode,function(value)
  _G.RTXMode = value
  if not _G.RTXMode then return end
  while _G.RTXMode do wait()
  a.Ambient = Color3.fromRGB(33, 33, 33)
  a.Brightness = 0.3
  c.Brightness = 0.176
  c.Contrast = 0.39
  c.TintColor = Color3.fromRGB(217, 145, 57)
  game.Lighting.FogEnd = 999
  if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PointLight") then
  local a2 = Instance.new("PointLight")
  a2.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
  a2.Range = 15
  a2.Color = Color3.fromRGB(217, 145, 57)
  end
  if not _G.RTXMode then
  a.Ambient = OldAmbient
  a.Brightness = OldBrightness
  a.ColorShift_Top = OldColorShift_Top
  c.Contrast = OldContrastc
  c.Brightness = OldBrightnessc
  c.TintColor = OldTintColorc
  e.TintColor = OldTintColore
  game.Lighting.FogEnd = 2500
  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PointLight"):Destroy()
  end
  end
  end)

Booster:Toggle("Super FPS boost",false,function(value)
  _G.SuperFPSboost = value
  end)

spawn(function()
  while wait() do
  if _G.SuperFPSboost then
  for i,v in pairs(game.Workspace.Map:GetDescendants()) do
  if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
  v:Destroy()
  end
  end
  for i,v in pairs(game.ReplicatedStorage.Unloaded:GetDescendants()) do
  if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
  v:Destroy()
  end
  end
  for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
  if v:IsA("Accessory") or v.Name == "Pants" or v.Name == "Shirt" then
  v:Destroy()
  end
  end
  local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
  local g = game
  local w = g.Workspace
  local l = g.Lighting
  local t = w.Terrain
  t.WaterWaveSize = 0
  t.WaterWaveSpeed = 0
  t.WaterReflectance = 0
  t.WaterTransparency = 0
  l.GlobalShadows = false
  l.FogEnd = 9e9
  l.Brightness = 0
  settings().Rendering.QualityLevel = "Level01"
  for i, v in pairs(g:GetDescendants()) do
  if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
  v.Material = "Plastic"
  v.Reflectance = 0
  elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
  v.Transparency = 1
  elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
  v.Lifetime = NumberRange.new(0)
  elseif v:IsA("Explosion") then
  v.BlastPressure = 1
  v.BlastRadius = 1
  elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
  v.Enabled = false
  elseif v:IsA("MeshPart") then
  v.Material = "Plastic"
  v.Reflectance = 0
  v.TextureID = 10385902758728957
  end
  end
  for i, e in pairs(l:GetChildren()) do
  if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
  e.Enabled = false
  end
  end
  end
  end
end)

Booster:Button("FPS Boost",function()
  pcall(function()
    game:GetService("Lighting").FantasySky:Destroy()
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
    v.Material = "Plastic"
    v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") then
    v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
    v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
    v.BlastPressure = 1
    v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
    v.Enabled = false
    elseif v:IsA("MeshPart") then
    v.Material = "Plastic"
    v.Reflectance = 0
    v.TextureID = 10385902758728957
    end
    end
    for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
    e.Enabled = false
    end
    end
    for i, v in pairs(game:GetService("Workspace").Camera:GetDescendants()) do
    if v.Name == ("Water;") then
    v.Transparency = 1
    v.Material = "Plastic"
    end
    end
    end)
  end)

Booster:Button("Unlock Portal",function()
  _G.UnlockPortal = true
  end)

spawn(function()
  while wait() do
  pcall(function()
    if _G.UnlockPortal == true then
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
    if v.Name == "NotificationTemplate" then
    if string.find(v.Text,"cannot") then
    v:Destroy()
    end
    end
    end
    end
    end)
  end
  end)

spawn(function()
  while wait() do
  pcall(function()
    if _G.UnlockPortal == true then
    CastlePostoMansion = CFrame.new(-5084.8447265625, 316.48101806641, -3145.3752441406)
    MansiontoCastlePos = CFrame.new(-12464.596679688, 376.30590820312, -7567.2626953125)
    Castletophydra = CFrame.new(-5095.33984375, 316.48101806641, -3168.3134765625)
    HydratoCastle = CFrame.new(5741.869140625, 611.94750976562, -282.61154174805)
    if (CastlePostoMansion.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
    end
    if (MansiontoCastlePos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
    end
    if (Castletophydra.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5748.7587890625, 610.44982910156, -267.81704711914))
    end
    if (HydratoCastle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
    end
    end
    end)
  end
  end)

Booster:Button("Unlock FPS",function()
  setfpscap(500)
  end)

Booster:Button("FPS delete color",function()
  for _,v in pairs(workspace:GetDescendants()) do
  if v.ClassName == "Part" or v.ClassName == "SpawnLocation" or v.ClassName == "WedgePart" or v.ClassName == "Terrain" or v.ClassName == "MeshPart" then
  v.BrickColor = BrickColor.new(155, 155, 155)
  v.Material = "Plastic"
  end
  end
  end)

Booster:Button("FPS Fast Mode",function()
  for _,v in pairs(workspace:GetDescendants()) do
  if v.ClassName == "Part" or v.ClassName == "SpawnLocation" or v.ClassName == "WedgePart" or v.ClassName == "Terrain" or v.ClassName == "MeshPart" then
  v.Material = "Plastic"
  end
  end
  end)


Booster:Seperator("Race Boost")

Booster:Toggle("Auto Active Race",_G.AutoAgility,function(value)
  _G.AutoAgility = value
  end)

spawn(function()
  pcall(function()
    while wait() do
    if _G.AutoAgility then
    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
    end
    end
    end)
  end)

Booster:Toggle("Dodge No Cooldown",false,function(value)
  nododgecool = value
  NoDodgeCool()
end)

local Playergss = PlayerStatus:CraftPage(1)
Playergss:Seperator("Player Status")

Playergss:Label("Name : "..game.Players.LocalPlayer.Name)

if World1 then
Playergss:Label("World : 1")
end

if World2 then
Playergss:Label("World : 2")
end

if World3 then
Playergss:Label("World : 3")
end

Playergss:Label("Race : "..game:GetService("Players").LocalPlayer.Data.Race.Value)

Playergss:Label("Fruit : "..game.Players.LocalPlayer.Data.DevilFruit.Value)

Playergss:Label("Level : "..game.Players.localPlayer.Data.Level.Value)

Playergss:Label("Bounty : "..game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)

local Swordss = PlayerStatus:CraftPage(2)
Swordss:Seperator("Sword")

local Saber = Swordss:Label("❌ : Saber")
local Rengoku = Swordss:Label("❌ : Rengoku")
local Midnight_Blade = Swordss:Label("❌ : Midnight Blade")
local Dragon_Trident = Swordss:Label("❌ : Dragon Trident")
local Yama = Swordss:Label("❌ : Yama")
local Buddy_Sword = Swordss:Label("❌ : Buddy Sword")
local Canvander = Swordss:Label("❌ : Canvander")
local Twin_Hooks = Swordss:Label("❌ : Twin Hooks")
local Spikey_Trident = Swordss:Label("❌ : Spikey Trident")
local Hallow_Scythe = Swordss:Label("❌ : Hallow Scythe")
local Dark_Dagger = Swordss:Label("❌ : Dark Dagger")
local Tushita = Swordss:Label("❌ : Tushita")

spawn(function()
  while task.wait() do
  pcall(function()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
    if v.Name == "Saber" then
    Saber:Set("✅ : Saber")
    end
    if v.Name == "Rengoku" then
    Rengoku:Set("✅ : Rengoku")
    end
    if v.Name == "Midnight Blade" then
    Midnight_Blade:Set("✅ : Midnight Blade")
    end
    if v.Name == "Dragon Trident" then
    Dragon_Trident:Set("✅ : Dragon Trident")
    end
    if v.Name == "Yama" then
    Yama:Set("✅ : Yama")
    end
    if v.Name == "Buddy Sword" then
    Buddy_Sword:Set("✅ : Buddy Sword")
    end
    if v.Name == "Canvander" then
    Canvander:Set("✅ : Canvander")
    end
    if v.Name == "Twin Hooks" then
    Twin_Hooks:Set("✅ : Twin Hooks")
    end
    if v.Name == "Spikey Trident" then
    Spikey_Trident:Set("✅ : Spikey Trident")
    end
    if v.Name == "Hallow Scythe" then
    Hallow_Scythe:Set("✅ : Hallow Scythe")
    end
    if v.Name == "Dark Dagger" then
    Dark_Dagger:Set("✅ : Dark Dagger")
    end
    if v.Name == "Tushita" then
    Tushita:Set("✅ : Tushita")
    end
    end
    end)
  end
  end)
local Questss = PlayerStatus:CraftPage(2)
Questss:Seperator("Quest")

local Bartilo_Quest = Questss:Label("❌ : Bartilo Quest")
local Don_Swan_Quest = Questss:Label("❌ : Don Swan Quest")
local Kill_Don_Swan = Questss:Label("❌ : Kill Don Swan")

spawn(function()
  while task.wait() do
  if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
  Bartilo_Quest:Set("✅ : Bartilo Quest")
  end

  if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
--Nothing
  else
    Don_Swan_Quest:Set("✅ : Don Swan Quest")
  end

  if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "General") == 1 then
  Kill_Don_Swan:Set("✅ : Kill Don Swan")
  end
  end
  end)

local Legendarys = PlayerStatus:CraftPage(2)
Legendarys:Seperator("Sword Legendary")

local Shisui = Legendarys:Label("❌ : Shisui")
local Saddi = Legendarys:Label("❌ : Saddi")
local Wando = Legendarys:Label("❌ : Wando")
local True_Triple_Katana = Legendarys:Label("❌ : True Triple Katana")

spawn(function()
  while task.wait() do
  pcall(function()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
    if v.Name == "Shisui" then
    Shisui:Set("✅ : Shisui")
    end
    if v.Name == "Saddi" then
    Saddi:Set("✅ : Saddi")
    end
    if v.Name == "Wando" then
    Wando:Set("✅ : Wando")
    end
    if v.Name == "True Triple Katana" then
    True_Triple_Katana:Set("✅ : True Triple Katana")
    end
    end
    end)
  end
  end)
local Meleesf = PlayerStatus:CraftPage(2)
Meleesf:Seperator("Melee")

local Superhuman = Meleesf:Label("❌ : Superhuman")
local Death_Step = Meleesf:Label("❌ : Death Step")
local Sharkman_Karate = Meleesf:Label("❌ : Sharkman Karate")
local Electric_Claw = Meleesf:Label("❌ : Electric Claw")
local Dragon_Talon = Meleesf:Label("❌ : Dragon Talon")
local God_Human = Meleesf:Label("❌ : God Human")

spawn(function()
  while task.wait() do
  if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true) == 1 then
  Superhuman:Set("✅ : Superhuman")
  end
  if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true) == 1 then
  Death_Step:Set("✅ : Death Step")
  end
  if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == 1 then
  Sharkman_Karate:Set("✅ : Sharkman Karate")
  end
  if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true) == 1 then
  Electric_Claw:Set("✅ : Electric Claw")
  end
  if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true) == 1 then
  Dragon_Talon:Set("✅ : Dragon Talon")
  end
  end
  end)

local Gunss = PlayerStatus:CraftPage(2)
Gunss:Seperator("Gun")

local Kabu_cha = Gunss:Label("❌ : Kabucha")
local Acidum_Rifle = Gunss:Label("❌ : Acidum Rifle")
local Bizarre_Rifle = Gunss:Label("❌ : Bizarre Rifle")

spawn(function()
  while task.wait() do
  pcall(function()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
    if v.Name == "Kabucha" then
    Kabu_cha:Set("✅ : Kabucha")
    end
    if v.Name == "Acidum Rifle" then
    Acidum_Rifle:Set("✅ : Acidum Rifle")
    end
    if v.Name == "Bizarre Rifle" then
    Bizarre_Rifle:Set("✅ : Bizarre Rifle")
    end
    end
    end)
  end
end)

local Aceesoh = PlayerStatus:CraftPage(2)
Aceesoh:Seperator("Accessory")

local Dark_Coat = Aceesoh:Label("❌ : Dark Coat")
local Ghoul_Mask = Aceesoh:Label("❌ : Ghoul Mask")
local Swan_Glass = Aceesoh:Label("❌ : Swan Glass")
local Pale_Scarf = Aceesoh:Label("❌ : Pale Scarf")
local Valkyrie_Helm = Aceesoh:Label("❌ : Valkyrie Helm")


spawn(function()
  while task.wait() do
  pcall(function()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
    if v.Name == "Saber" then
    Dark_Coat:Set("✅ : Dark Coat")
    end
    if v.Name == "Ghoul Mask" then
    Ghoul_Mask:Set("✅ : Ghoul Mask")
    end
    if v.Name == "Swan Glasses" then
    Swan_Glass:Set("✅ : Swan Glass")
    end
    if v.Name == "Pale Scarf" then
    Pale_Scarf:Set("✅ : Pale Scarf")
    end
    if v.Name == "Valkyrie Helmet" then
    Valkyrie_Helm:Set("✅ : Valkyrie Helmet")
    end
    end
    end)
  end
end)
