--[[

    Kaitun or Cuttay, a phrase of a Roblox script that fully autofarms everything in Blox Fruits (game)
    "Ơ! Thằng lồn này dùng cuttay à? Mới chơi có (1) tuần mà đã giàu như này rồi?"

    Binh Hub Kaitun (catn1qqer)
    Project started on 13/5/2023

]]

_G.Team = "Pirates" -- "Marines"
_G.FPSBoost = true -- really fucked up the client but the good side is fps go wroom.

getgenv().Config = {
    ["Discord"] = {
        ["Enabled"] = false,
        ["WebhookUrl"] = "https://discord.com/api/webhooks/1363192645488218122/-4Rbq5Bc-C_6qXNzc1uiAd6lUfS72GaddrlNTkw_mmcxR2UdCj4BcjYMBlCyweF4IrKA",
        ["Content"] = "@everyone", -- @everyone or <@roleid/userid>, it can be just text.
        ["Time"] = 60 -- Seconds
    },
    ["Autofarm"] = {
        ["BuySwords"] = false, -- xong
        ["BuyAccessories"] = false,
        ["BuyLegendarySword"] = false -- tạm thời bị gỡ cho shitter bị bại não.
    }
}

-- Variables

local DCSettings = Config["Discord"]
local FSSettings = Config["Autofarm"]

function TP(P1)
    Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 250 then
        Speed = 600
    elseif Distance < 500 then
        Speed = 500
    elseif Distance < 1000 then
        Speed = 400
    elseif Distance >= 1000 then
        Speed = 250
    end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P1}
    ):Play()
end

function TP2(P1)
	Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if Distance < 1000 then
		Speed = 500
	elseif Distance >= 1000 then
		Speed = 350
	end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P1}
    ):Play()
    Clip = true
    wait(Distance/Speed)
    Clip = false
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
		Speed = 250
	end
	game:GetService("TweenService"):Create(
		game.Players.LocalPlayer.Character.HumanoidRootPart,
		TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
		{CFrame = P}
	):Play()
end

-- gui // line 662 to continue

SelectToolWeapon = "Combat"

-- Instances:

local LocalPlayer = game:GetService("Players").LocalPlayer

local KaitunBinhHubGUI = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Status = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Account = Instance.new("TextLabel")
local Stats = Instance.new("TextLabel")
local Fragments = Instance.new("TextLabel")
local Beli = Instance.new("TextLabel")
local Level = Instance.new("TextLabel")
local Defense = Instance.new("TextLabel")
local Melee = Instance.new("TextLabel")
local Sword = Instance.new("TextLabel")
local Gun = Instance.new("TextLabel")
local Fruit = Instance.new("TextLabel")
local Below = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local BlockCorner = Instance.new("Frame")
local Credits1 = Instance.new("TextLabel")
local Credits2 = Instance.new("TextLabel")
local Brand = Instance.new("TextLabel")
local Profile = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")
local Welcome = Instance.new("TextLabel")
local Username = Instance.new("TextLabel")
local ClientUptime = Instance.new("TextLabel")
local RobloxProfile = Instance.new("ImageLabel")
local UICorner_4 = Instance.new("UICorner")
local Tabs = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local ProfileTab = Instance.new("ImageLabel")
local PlayerStats = Instance.new("TextButton")
local ItemsTab = Instance.new("ImageLabel")
local ItemsInv = Instance.new("TextButton")
local Main = Instance.new("ImageLabel")
local UICorner_6 = Instance.new("UICorner")
local Game = Instance.new("TextLabel")
local CreatorName = Instance.new("TextLabel")
local Logo = Instance.new("ImageLabel")
local LogoName = Instance.new("TextLabel")
local ToggleUIButton = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")

-- Webhook

local data = {
    ["username"] = 'Binh Hub Notifier', -- haha NO.
    ['content'] = DCSettings["Content"],
    ["embeds"] = {
        {
            ["title"] = '**Binh Hub Account Status**', -- LMAO WTF
            ["color"] = 5539744, -- color id		
            ["type"] = "rich",
            ["fields"] =  {
                {
                    ["name"] = "User Name",
                    ["value"] = "||"..tostring(game.Players.LocalPlayer.Name).."||",
                    ["inline"] = true
                },
                {
                    ["name"] = "Level",
                    ["value"] = tostring(game:GetService("Players").LocalPlayer.Data:FindFirstChild("Level").Value),
                    ["inline"] = true
                },
                {
                    ["name"] = "Fragments",
                    ["value"] = tostring(game:GetService("Players").LocalPlayer.Data:FindFirstChild("Fragments").Value),
                    ["inline"] = true
                },
                {
                    ["name"] = "Bounty/Honor",
                    ["value"] = tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value),
                    ["inline"] = true
                },
                {
                    ["name"] = "Beli",
                    ["value"] = tostring(game:GetService("Players").LocalPlayer.Data:FindFirstChild("Beli").Value),
                    ["inline"] = true
                },
                {
                    ["name"] = "Race",
                    ["value"] = tostring(game:GetService("Players").LocalPlayer.Data:FindFirstChild("Race").Value),
                    ["inline"] = true
                },
                {
                    ["name"] = "Status",
                    ["value"] = "```sml\n"..tostring("Melee : "..game:GetService("Players").LocalPlayer.Data.Stats.Melee:WaitForChild("Level").Value .. 
                        "\nDefense : "..game:GetService("Players").LocalPlayer.Data.Stats.Defense:WaitForChild("Level").Value .. 
                        "\nSword : "..game:GetService("Players").LocalPlayer.Data.Stats.Sword:WaitForChild("Level").Value.. 
                        "\nGun : "..game:GetService("Players").LocalPlayer.Data.Stats.Gun:WaitForChild("Level").Value .. 
                        "\nDevil Fruit : "..game:GetService("Players").LocalPlayer.Data.Stats["Demon Fruit"]:WaitForChild("Level").Value).."```",
                    ["inline"] = true
                },
            },
            ["footer"] = {
                ["text"] = "Script còn mới, đôi khi vài thứ thiếu. Mong bạn thông cảm.".."\nTime".." : "..os.date("%c").." ("..os.date("%X")..")",
            },
        }
    },
}

--Properties:

KaitunBinhHubGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
KaitunBinhHubGUI.Name = "KaitunBinhHubGUI"
KaitunBinhHubGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = KaitunBinhHubGUI
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.499266863, -516, 0.498697907, -291)
Frame.Size = UDim2.new(0, 1033, 0, 583)

Status.Name = "Status"
Status.Parent = Frame
Status.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Status.Position = UDim2.new(0.011616651, 0, 0.399656951, 0)
Status.Size = UDim2.new(0, 235, 0, 336)

UICorner.Parent = Status

Account.Name = "Account"
Account.Parent = Status
Account.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Account.BackgroundTransparency = 1.000
Account.BorderSizePixel = 0
Account.Position = UDim2.new(0.114349864, 0, 0.0405752994, 0)
Account.Size = UDim2.new(0, 194, 0, 21)
Account.Font = Enum.Font.GothamBold
Account.Text = "Account"
Account.TextColor3 = Color3.fromRGB(255, 255, 255)
Account.TextSize = 23.000
Account.TextTransparency = 0.790
Account.TextWrapped = true
Account.TextXAlignment = Enum.TextXAlignment.Right

Stats.Name = "Stats"
Stats.Parent = Status
Stats.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Stats.BackgroundTransparency = 1.000
Stats.BorderSizePixel = 0
Stats.Position = UDim2.new(0.118605182, 0, 0.424721628, 0)
Stats.Size = UDim2.new(0, 194, 0, 21)
Stats.Font = Enum.Font.GothamBold
Stats.Text = "Stats"
Stats.TextColor3 = Color3.fromRGB(255, 255, 255)
Stats.TextSize = 23.000
Stats.TextTransparency = 0.790
Stats.TextWrapped = true
Stats.TextXAlignment = Enum.TextXAlignment.Right

Fragments.Name = "Fragments"
Fragments.Parent = Status
Fragments.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Fragments.BackgroundTransparency = 1.000
Fragments.BorderSizePixel = 0
Fragments.Position = UDim2.new(0.0377541408, 0, 0.199111849, 0)
Fragments.Size = UDim2.new(0, 222, 0, 34)
Fragments.Font = Enum.Font.GothamBold
Fragments.Text = "Fragments : 0"
Fragments.TextColor3 = Color3.fromRGB(255, 255, 255)
Fragments.TextSize = 23.000
Fragments.TextWrapped = true
Fragments.TextXAlignment = Enum.TextXAlignment.Left

Beli.Name = "Beli"
Beli.Parent = Status
Beli.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Beli.BackgroundTransparency = 1.000
Beli.BorderSizePixel = 0
Beli.Position = UDim2.new(0.0377541408, 0, 0.104599692, 0)
Beli.Size = UDim2.new(0, 223, 0, 30)
Beli.Font = Enum.Font.GothamBold
Beli.Text = "Beli : 0"
Beli.TextColor3 = Color3.fromRGB(255, 255, 255)
Beli.TextSize = 23.000
Beli.TextWrapped = true
Beli.TextXAlignment = Enum.TextXAlignment.Left

Level.Name = "Level"
Level.Parent = Status
Level.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Level.BackgroundTransparency = 1.000
Level.BorderSizePixel = 0
Level.Position = UDim2.new(0.0377541408, 0, 0.302770376, 0)
Level.Size = UDim2.new(0, 222, 0, 34)
Level.Font = Enum.Font.GothamBold
Level.Text = "Level : 2450"
Level.TextColor3 = Color3.fromRGB(255, 255, 255)
Level.TextSize = 23.000
Level.TextWrapped = true
Level.TextXAlignment = Enum.TextXAlignment.Left

Defense.Name = "Defense"
Defense.Parent = Status
Defense.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Defense.BackgroundTransparency = 1.000
Defense.BorderSizePixel = 0
Defense.Position = UDim2.new(0.0377541408, 0, 0.604599595, 0)
Defense.Size = UDim2.new(0, 222, 0, 18)
Defense.Font = Enum.Font.GothamBold
Defense.Text = "Defense :"
Defense.TextColor3 = Color3.fromRGB(255, 255, 255)
Defense.TextSize = 23.000
Defense.TextWrapped = true
Defense.TextXAlignment = Enum.TextXAlignment.Left

Melee.Name = "Melee"
Melee.Parent = Status
Melee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Melee.BackgroundTransparency = 1.000
Melee.BorderSizePixel = 0
Melee.Position = UDim2.new(0.0377541408, 0, 0.522282481, 0)
Melee.Size = UDim2.new(0, 222, 0, 18)
Melee.Font = Enum.Font.GothamBold
Melee.Text = "Melee :"
Melee.TextColor3 = Color3.fromRGB(255, 255, 255)
Melee.TextSize = 23.000
Melee.TextWrapped = true
Melee.TextXAlignment = Enum.TextXAlignment.Left

Sword.Name = "Sword"
Sword.Parent = Status
Sword.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sword.BackgroundTransparency = 1.000
Sword.BorderSizePixel = 0
Sword.Position = UDim2.new(0.0377541408, 0, 0.683867872, 0)
Sword.Size = UDim2.new(0, 222, 0, 18)
Sword.Font = Enum.Font.GothamBold
Sword.Text = "Sword :"
Sword.TextColor3 = Color3.fromRGB(255, 255, 255)
Sword.TextSize = 23.000
Sword.TextWrapped = true
Sword.TextXAlignment = Enum.TextXAlignment.Left

Gun.Name = "Gun"
Gun.Parent = Status
Gun.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gun.BackgroundTransparency = 1.000
Gun.BorderSizePixel = 0
Gun.Position = UDim2.new(0.0377541408, 0, 0.769233644, 0)
Gun.Size = UDim2.new(0, 222, 0, 18)
Gun.Font = Enum.Font.GothamBold
Gun.Text = "Gun :"
Gun.TextColor3 = Color3.fromRGB(255, 255, 255)
Gun.TextSize = 23.000
Gun.TextWrapped = true
Gun.TextXAlignment = Enum.TextXAlignment.Left

Fruit.Name = "Fruit"
Fruit.Parent = Status
Fruit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Fruit.BackgroundTransparency = 1.000
Fruit.BorderSizePixel = 0
Fruit.Position = UDim2.new(0.0420094579, 0, 0.851550817, 0)
Fruit.Size = UDim2.new(0, 222, 0, 18)
Fruit.Font = Enum.Font.GothamBold
Fruit.Text = "Fruit :"
Fruit.TextColor3 = Color3.fromRGB(255, 255, 255)
Fruit.TextSize = 23.000
Fruit.TextWrapped = true
Fruit.TextXAlignment = Enum.TextXAlignment.Left

Below.Name = "Below"
Below.Parent = Frame
Below.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Below.BorderColor3 = Color3.fromRGB(36, 36, 36)
Below.Position = UDim2.new(0.247821882, 0, 0.672384202, 0)
Below.Size = UDim2.new(0, 766, 0, 93)

UICorner_2.Parent = Below

BlockCorner.Name = "BlockCorner"
BlockCorner.Parent = Below
BlockCorner.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
BlockCorner.BorderColor3 = Color3.fromRGB(36, 36, 36)
BlockCorner.Position = UDim2.new(-0.000219917798, 0, -0.0050350721, 0)
BlockCorner.Size = UDim2.new(0, 766, 0, 83)

Credits1.Name = "Credits1"
Credits1.Parent = Below
Credits1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits1.BackgroundTransparency = 1.000
Credits1.BorderSizePixel = 0
Credits1.Position = UDim2.new(0.566378653, 0, 0.412709624, 0)
Credits1.Size = UDim2.new(0, 315, 0, 21)
Credits1.Font = Enum.Font.GothamBold
Credits1.Text = "legiteriumz, thuy - coding"
Credits1.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits1.TextSize = 23.000
Credits1.TextTransparency = 0.790
Credits1.TextWrapped = true
Credits1.TextXAlignment = Enum.TextXAlignment.Right

Credits2.Name = "Credits2"
Credits2.Parent = Below
Credits2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits2.BackgroundTransparency = 1.000
Credits2.BorderSizePixel = 0
Credits2.Position = UDim2.new(0.72432071, 0, 0.150882617, 0)
Credits2.Size = UDim2.new(0, 194, 0, 21)
Credits2.Font = Enum.Font.GothamBold
Credits2.Text = "thuy - ui design"
Credits2.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits2.TextSize = 23.000
Credits2.TextTransparency = 0.790
Credits2.TextWrapped = true
Credits2.TextXAlignment = Enum.TextXAlignment.Right

Brand.Name = "Brand"
Brand.Parent = Frame
Brand.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Brand.BackgroundTransparency = 1.000
Brand.BorderSizePixel = 0
Brand.Position = UDim2.new(0.795740545, 0, 0.010291595, 0)
Brand.Size = UDim2.new(0, 200, 0, 27)
Brand.Font = Enum.Font.Gotham
Brand.Text = "catn1qqer x Binh Hub"
Brand.TextColor3 = Color3.fromRGB(255, 255, 255)
Brand.TextSize = 17.000
Brand.TextTransparency = 0.440
Brand.TextWrapped = true
Brand.TextXAlignment = Enum.TextXAlignment.Right

Profile.Name = "Profile"
Profile.Parent = Frame
Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profile.BackgroundTransparency = 0.650
Profile.BorderSizePixel = 0
Profile.Position = UDim2.new(0.934172273, 0, 0.0926243663, 0)
Profile.Size = UDim2.new(0, 40, 0, 40)
Profile.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=".. LocalPlayer.UserId .."&width=420&height=420&format=png"
Profile.ScaleType = Enum.ScaleType.Crop

UICorner_3.CornerRadius = UDim.new(1, 0)
UICorner_3.Parent = Profile

Welcome.Name = "Welcome"
Welcome.Parent = Frame
Welcome.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Welcome.BackgroundTransparency = 1.000
Welcome.BorderSizePixel = 0
Welcome.Position = UDim2.new(0.447241038, 0, 0.475128651, 0)
Welcome.Size = UDim2.new(0, 200, 0, 30)
Welcome.Font = Enum.Font.Gotham
Welcome.Text = "Welcome,"
Welcome.TextColor3 = Color3.fromRGB(255, 255, 255)
Welcome.TextSize = 29.000
Welcome.TextWrapped = true
Welcome.TextXAlignment = Enum.TextXAlignment.Left

Username.Name = "Username"
Username.Parent = Frame
Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Username.BackgroundTransparency = 1.000
Username.BorderSizePixel = 0
Username.Position = UDim2.new(0.447241038, 0, 0.528997242, 0)
Username.Size = UDim2.new(0, 503, 0, 51)
Username.Font = Enum.Font.GothamBold
Username.Text = game.Players.LocalPlayer.Name
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextSize = 48.000
Username.TextWrapped = true
Username.TextXAlignment = Enum.TextXAlignment.Left

ClientUptime.Name = "Client Uptime"
ClientUptime.Parent = Frame
ClientUptime.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClientUptime.BackgroundTransparency = 1.000
ClientUptime.BorderSizePixel = 0
ClientUptime.Position = UDim2.new(0.447241038, 0, 0.617495716, 0)
ClientUptime.Size = UDim2.new(0, 235, 0, 22)
ClientUptime.Font = Enum.Font.Gotham
ClientUptime.Text = "Client Uptime : 00h 00m 00s"
ClientUptime.TextColor3 = Color3.fromRGB(255, 255, 255)
ClientUptime.TextSize = 13.000
ClientUptime.TextWrapped = true
ClientUptime.TextXAlignment = Enum.TextXAlignment.Left

RobloxProfile.Name = "RobloxProfile"
RobloxProfile.Parent = Frame
RobloxProfile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RobloxProfile.BackgroundTransparency = 0.800
RobloxProfile.BorderSizePixel = 0
RobloxProfile.Position = UDim2.new(0.255566329, 0, 0.327615768, 0)
RobloxProfile.Size = UDim2.new(0, 190, 0, 190)
RobloxProfile.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=".. LocalPlayer.UserId .."&width=420&height=420&format=png"
RobloxProfile.ScaleType = Enum.ScaleType.Crop

UICorner_4.Parent = RobloxProfile

Tabs.Name = "Tabs"
Tabs.Parent = Frame
Tabs.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Tabs.Position = UDim2.new(0.011616651, 0, 0.193825036, 0)
Tabs.Size = UDim2.new(0, 235, 0, 107)

UICorner_5.Parent = Tabs

ProfileTab.Name = "ProfileTab"
ProfileTab.Parent = Tabs
ProfileTab.BackgroundColor3 = Color3.fromRGB(71, 120, 116)
ProfileTab.BackgroundTransparency = 1.000
ProfileTab.BorderSizePixel = 0
ProfileTab.Position = UDim2.new(0.0389033705, 0, 0.0712717101, 0)
ProfileTab.Size = UDim2.new(0, 40, 0, 40)
ProfileTab.Image = "rbxassetid://7992557358"
ProfileTab.ScaleType = Enum.ScaleType.Crop

PlayerStats.Name = "PlayerStats"
PlayerStats.Parent = Tabs
PlayerStats.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerStats.BackgroundTransparency = 1.000
PlayerStats.BorderSizePixel = 0
PlayerStats.Position = UDim2.new(0.255319148, 0, 0.102803737, 0)
PlayerStats.Size = UDim2.new(0, 175, 0, 36)
PlayerStats.Font = Enum.Font.GothamBold
PlayerStats.Text = "Player Stats"
PlayerStats.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerStats.TextSize = 23.000
PlayerStats.TextWrapped = true
PlayerStats.TextXAlignment = Enum.TextXAlignment.Left

ItemsTab.Name = "ItemsTab"
ItemsTab.Parent = Tabs
ItemsTab.BackgroundColor3 = Color3.fromRGB(71, 120, 116)
ItemsTab.BackgroundTransparency = 1.000
ItemsTab.BorderSizePixel = 0
ItemsTab.Position = UDim2.new(0.0516693145, 0, 0.529215634, 0)
ItemsTab.Size = UDim2.new(0, 33, 0, 31)
ItemsTab.Image = "rbxassetid://7485051715"
ItemsTab.ImageTransparency = 0.480
ItemsTab.ScaleType = Enum.ScaleType.Crop

ItemsInv.Name = "ItemsInv"
ItemsInv.Parent = Tabs
ItemsInv.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemsInv.BackgroundTransparency = 1.000
ItemsInv.BorderSizePixel = 0
ItemsInv.Position = UDim2.new(0.255319148, 0, 0.532710314, 0)
ItemsInv.Size = UDim2.new(0, 175, 0, 36)
ItemsInv.Font = Enum.Font.GothamBold
ItemsInv.Text = "Items (soon)"
ItemsInv.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemsInv.TextSize = 23.000
ItemsInv.TextTransparency = 0.480
ItemsInv.TextWrapped = true
ItemsInv.TextXAlignment = Enum.TextXAlignment.Left

Main.Name = "Main"
Main.Parent = Frame
Main.BackgroundColor3 = Color3.fromRGB(85, 165, 175)
Main.Position = UDim2.new(0.247821882, 0, 0.0668953657, 0)
Main.Size = UDim2.new(0, 766, 0, 445)
Main.ZIndex = 0
Main.Image = "rbxassetid://13412525664"

UICorner_6.Parent = Main

Game.Name = "Game"
Game.Parent = Frame
Game.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Game.BackgroundTransparency = 1.000
Game.BorderSizePixel = 0
Game.Position = UDim2.new(0.255566239, 0, 0.8730703, 0)
Game.Size = UDim2.new(0, 200, 0, 27)
Game.Font = Enum.Font.Gotham
Game.Text = "Checking.."
Game.TextColor3 = Color3.fromRGB(255, 255, 255)
Game.TextSize = 23.000
Game.TextWrapped = true
Game.TextXAlignment = Enum.TextXAlignment.Left

CreatorName.Name = "CreatorName"
CreatorName.Parent = Frame
CreatorName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CreatorName.BackgroundTransparency = 1.000
CreatorName.BorderSizePixel = 0
CreatorName.Position = UDim2.new(0.255566239, 0, 0.902229786, 0)
CreatorName.Size = UDim2.new(0, 200, 0, 27)
CreatorName.Font = Enum.Font.Gotham
CreatorName.Text = "Gamer Robot Inc"
CreatorName.TextColor3 = Color3.fromRGB(255, 255, 255)
CreatorName.TextSize = 15.000
CreatorName.TextTransparency = 0.350
CreatorName.TextWrapped = true
CreatorName.TextXAlignment = Enum.TextXAlignment.Left

Logo.Name = "Logo"
Logo.Parent = Frame
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
Logo.Position = UDim2.new(0.0199410655, 0, 0.0274442546, 0)
Logo.Size = UDim2.new(0, 78, 0, 78)
Logo.Image = "http://www.roblox.com/asset/?id=13450463175"

LogoName.Name = "LogoName"
LogoName.Parent = Logo
LogoName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LogoName.BackgroundTransparency = 1.000
LogoName.BorderSizePixel = 0
LogoName.Position = UDim2.new(1.17929673, 0, 0.0880808681, 0)
LogoName.Size = UDim2.new(0, 124, 0, 70)
LogoName.Font = Enum.Font.GothamBold
LogoName.Text = "Binh Hub Kaitun"
LogoName.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoName.TextSize = 23.000
LogoName.TextWrapped = true
LogoName.TextXAlignment = Enum.TextXAlignment.Left

ToggleUIButton.Name = "ToggleUIButton"
ToggleUIButton.Parent = KaitunBinhHubGUI
ToggleUIButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleUIButton.Position = UDim2.new(0.159199998, 0, 0.25920248, 0)
ToggleUIButton.Size = UDim2.new(0, 70, 0, 70)
ToggleUIButton.Font = Enum.Font.IndieFlower
ToggleUIButton.Text = "open"
ToggleUIButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleUIButton.TextSize = 41.000
ToggleUIButton.TextWrapped = true
ToggleUIButton.Visible = true

UICorner_10.Parent = ToggleUIButton

_G.loopMemayDi = true

local updateStatus = coroutine.create(function() -- ngu qua ma. huuh
    while _G.loopMemayDi do
        Gun.Text = "Gun : "..game.Players.LocalPlayer.Data.Stats.Gun.Level.Value
        Fruit.Text = "Fruit : "..game.Players.LocalPlayer.Data.Stats["Demon Fruit"].Level.Value
        Melee.Text = "Melee : "..game.Players.LocalPlayer.Data.Stats.Melee.Level.Value
        Sword.Text = "Sword : "..game.Players.LocalPlayer.Data.Stats.Sword.Level.Value
        Defense.Text = "Defense : "..game.Players.LocalPlayer.Data.Stats.Defense.Level.Value
        Beli.Text = "Beli : "..game.Players.LocalPlayer.Data.Beli.Value
        Fragments.Text = "Fragments : "..game.Players.LocalPlayer.Data.Fragments.Value
        Level.Text = "Level : "..game.Players.LocalPlayer.Data.Level.Value

		local scripttime=game.Workspace.DistributedGameTime
		local seconds = scripttime%60
		local minutes = math.floor(scripttime/60%60)
		local hours = math.floor(scripttime/3600)
		local tempo = string.format("%.0f:%.0f:%.0f", hours ,minutes, seconds)
		ClientUptime.Text = "Client Uptime : "..tempo
        wait(1)
    end
end)

coroutine.resume(updateStatus)

local toggleState = true

ToggleUIButton.MouseButton1Click:Connect(function()
    toggleState = not toggleState -- Toggling the state
    if toggleState then
        ToggleUIButton.Text = "close"
        game:GetService("Players").LocalPlayer.PlayerGui.KaitunBinhHubGUI.Frame.Visible = true
    else
        ToggleUIButton.Text = "open"
        game:GetService("Players").LocalPlayer.PlayerGui.KaitunBinhHubGUI.Frame.Visible = false
    end
end)

local function drag()
	local script = Instance.new('LocalScript', ToggleUIButton)
	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
	
end
coroutine.wrap(drag)()

local function drag2()
	local script = Instance.new('LocalScript', Frame)
	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
	
end
coroutine.wrap(drag2)()

print("Dang load")

-- Main code

spawn(function()
    while task.wait() do
        if game.Players.LocalPlayer.Team == nil then
            pcall(function()
                if _G.Team == "Pirates" then
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
                    wait(.5)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                elseif _G.Team == "Marines" then
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
                    wait(.5)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                else
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Size = UDim2.new(10000,1000,10000,1000)
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4,0,-5,0)
                    wait(.5)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,true,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(605,394,0,false,game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton,0)
                end
            end)
        end
    end
end)

function UseCode(Text) -- theres no button.
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
end

UseCode("Enyu_is_Pro")
UseCode("Magicbus")
UseCode("JCWK")
UseCode("Starcodeheo")
UseCode("Bluxxy")
UseCode("fudd10_v2")
UseCode("3BVISITS")
UseCode("UPD16")
UseCode("FUDD10")
UseCode("UPD15")
UseCode("Sub2OfficialNoobie")
UseCode("SUB2GAMERROBOT_EXP1")
UseCode("THEGREATACE")
UseCode("SUB2NOOBMASTER123")
UseCode("Axiore")
UseCode("TantaiGaming")
UseCode("STRAWHATMAINE") 

warn("redeemed")

    vu = true
    AutoKaitan = vu
    _G.AutoFarm = vu

	if _G.AutoFarm and SelectToolWeapon == "" then
		print("select weapon first")
	else
		Auto_Farm = vu
		SelectMonster = ""
		if vu == false then
			wait(1)
			TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end

    spawn(function()
        while wait(.5) do
            if AutoKaitan and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                    local args = {
                        [1] = "BuyBlackLeg"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end   
                if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    SelectToolWeapon = "Superhuman"
                end  
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    SelectToolWeapon = "Black Leg"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    SelectToolWeapon = "Electro"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    SelectToolWeapon = "Fishman Karate"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    SelectToolWeapon = "Dragon Claw"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    local args = {
                        [1] = "BuyElectro"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    local args = {
                        [1] = "BuyElectro"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    local args = {
                        [1] = "BuyFishmanKarate"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    local args = {
                        [1] = "BuyFishmanKarate"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    local args = {
                        [1] = "BlackbeardReward",
                        [2] = "DragonClaw",
                        [3] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    local args = {
                        [1] = "BlackbeardReward",
                        [2] = "DragonClaw",
                        [3] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    local args = {
                        [1] = "BuySuperhuman"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                    local args = {
                        [1] = "BuySuperhuman"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end 
            end
        end
    end)
 
_G.AutoStats = true

spawn(function() -- only for sea 1, co the se lam cho sea 2 va 3 vi tui thay great tree ma nang moi melee la chet.
	while wait() do
		if _G.AutoStats then
			if game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value < 2400 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee")
			else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense")			
			end
		end
	end
end)

local placeId = game.PlaceId
Magnet = true
if placeId == 2753915549 then
    Game.Text = "First Sea"
	OldWorld = true
elseif placeId == 4442272183 then
    Game.Text = "Second Sea"
	NewWorld = true
elseif placeId == 7449423635 then
    Game.Text = "Third Sea"
	ThreeWorld = true
end
function Click()
	game:GetService'VirtualUser':CaptureController()
	game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end
function CheckQuest()
	local MyLevel = game.Players.LocalPlayer.Data.Level.Value
	if OldWorld then
		if MyLevel == 1 or MyLevel <= 9 then 
			Ms = "Bandit [Lv. 5]"
			NaemQuest = "BanditQuest1"
			LevelQuest = 1
			NameMon = "Bandit"
			CFrameQuest = CFrame.new(1061.66699, 16.5166187, 1544.52905, -0.942978859, -3.33851502e-09, 0.332852632, 7.04340497e-09, 1, 2.99841325e-08, -0.332852632, 3.06188177e-08, -0.942978859)
			CFrameMon = CFrame.new(1199.31287, 52.2717781, 1536.91516, -0.929782331, 6.60215846e-08, -0.368109822, 3.9077392e-08, 1, 8.06501603e-08, 0.368109822, 6.06023249e-08, -0.929782331)
		elseif MyLevel == 10 or MyLevel <= 14 then 
			Ms = "Monkey [Lv. 14]"
			NaemQuest = "JungleQuest"
			LevelQuest = 1
			NameMon = "Monkey"
			CFrameQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
			CFrameMon = CFrame.new(-1772.4093017578, 60.860641479492, 54.872589111328)
		elseif MyLevel == 15 or MyLevel <= 29 then 
			Ms = "Gorilla [Lv. 20]"
			NaemQuest = "JungleQuest"
			LevelQuest = 2
			NameMon = "Gorilla"
			CFrameQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
			CFrameMon = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
		elseif MyLevel == 30 or MyLevel <= 39 then 
			Ms = "Pirate [Lv. 35]"
			NaemQuest = "BuggyQuest1"
			LevelQuest = 1
			NameMon = "Pirate"
			CFrameQuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
			CFrameMon = CFrame.new(-1219.32324, 4.75205183, 3915.63452, -0.966492832, -6.91238853e-08, 0.25669381, -5.21195496e-08, 1, 7.3047012e-08, -0.25669381, 5.72206496e-08, -0.966492832)
		elseif MyLevel == 40 or MyLevel <= 59 then 
			Ms = "Brute [Lv. 45]"
			NaemQuest = "BuggyQuest1"
			LevelQuest = 2
			NameMon = "Brute"
			CFrameQuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
			CFrameMon = CFrame.new(-1146.49646, 96.0936813, 4312.1333, -0.978175163, -1.53222057e-08, 0.207781896, -3.33316912e-08, 1, -8.31738873e-08, -0.207781896, -8.82843523e-08, -0.978175163)
		elseif MyLevel == 60 or MyLevel <= 74 then 
			Ms = "Desert Bandit [Lv. 60]"
			NaemQuest = "DesertQuest"
			LevelQuest = 1
			NameMon = "Desert Bandit"
			CFrameQuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
			CFrameMon = CFrame.new(932.788818, 6.4503746, 4488.24609, -0.998625934, 3.08948351e-08, 0.0524050146, 2.79967303e-08, 1, -5.60361286e-08, -0.0524050146, -5.44919629e-08, -0.998625934)
		elseif MyLevel == 75 or MyLevel <= 89 then 
			Ms = "Desert Officer [Lv. 70]"
			NaemQuest = "DesertQuest"
			LevelQuest = 2
			NameMon = "Desert Officer"
			CFrameQuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
			CFrameMon = CFrame.new(1580.03198, 4.61375761, 4366.86426, 0.135744005, -6.44280718e-08, -0.990743816, 4.35738308e-08, 1, -5.90598574e-08, 0.990743816, -3.51534837e-08, 0.135744005)
		elseif MyLevel == 90 or MyLevel <= 99 then 
			Ms = "Snow Bandit [Lv. 90]"
			NaemQuest = "SnowQuest"
			LevelQuest = 1
			NameMon = "Snow Bandits"
			CFrameQuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
			CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905, 0.980274439, -1.12995728e-08, 0.197641045, -9.57343449e-09, 1, 1.04655214e-07, -0.197641045, -1.04482936e-07, 0.980274439)
		elseif MyLevel == 100 or MyLevel <= 119 then 
			Ms = "Snowman [Lv. 100]"
			NaemQuest = "SnowQuest"
			LevelQuest = 2
			NameMon = "Snowman"
			CFrameQuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
			CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905, 0.980274439, -1.12995728e-08, 0.197641045, -9.57343449e-09, 1, 1.04655214e-07, -0.197641045, -1.04482936e-07, 0.980274439)
		elseif MyLevel == 120 or MyLevel <= 149 then 
			Ms = "Chief Petty Officer [Lv. 120]"
			NaemQuest = "MarineQuest2"
			LevelQuest = 1
			NameMon = "Chief Petty Officer"
			CFrameQuest = CFrame.new(-5035.0835, 28.6520386, 4325.29443, 0.0243340395, -7.08064647e-08, 0.999703884, -6.36926814e-08, 1, 7.23777944e-08, -0.999703884, -6.54350671e-08, 0.0243340395)
			CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
		elseif MyLevel == 150 or MyLevel <= 174 then 
			Ms = "Sky Bandit [Lv. 150]"
			NaemQuest = "SkyQuest"
			LevelQuest = 1
			NameMon = "Sky Bandit"
			CFrameQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
			CFrameMon = CFrame.new(-4970.74219, 294.544342, -2890.11353, -0.994874597, -8.61311236e-08, -0.101116329, -9.10836206e-08, 1, 4.43614923e-08, 0.101116329, 5.33441664e-08, -0.994874597)
		elseif MyLevel == 175 or MyLevel <= 249 then 
			Ms = "Dark Master [Lv. 175]"
			NaemQuest = "SkyQuest"
			LevelQuest = 2
			NameMon = "Dark Master"
			CFrameQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
			CFrameMon = CFrame.new(-5220.58594, 430.693298, -2278.17456, -0.925375521, 1.12086873e-08, 0.379051805, -1.05115507e-08, 1, -5.52320891e-08, -0.379051805, -5.50948407e-08, -0.925375521)
		elseif MyLevel == 250 or MyLevel <= 275 then 
			Ms = "Toga Warrior [Lv. 250]"
			NaemQuest = "ColosseumQuest"
			LevelQuest = 1
			NameMon = "Toga Warrior"
			CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
			CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
		elseif MyLevel == 275 or MyLevel <= 299 then 
			Ms = "Gladiator [Lv. 275]"
			NaemQuest = "ColosseumQuest"
			LevelQuest = 2
			NameMon = "Gladiato"
			CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
			CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
		elseif MyLevel == 300 or MyLevel <= 324 then 
			Ms = "Military Soldier [Lv. 300]"
			NaemQuest = "MagmaQuest"
			LevelQuest = 1
			NameMon = "Military Soldier"
			CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
			CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
        elseif MyLevel == 325 or MyLevel <= 374 then -- Military Spy
            Ms = "Military Spy [Lv. 325]"
            NaemQuest = "MagmaQuest"
            LevelQuest = 2
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5984.0532226563, 82.14656829834, 8753.326171875)
		elseif MyLevel == 375 or MyLevel <= 399 then 
			Ms = "Fishman Warrior [Lv. 375]"
			NaemQuest = "FishmanQuest"
			LevelQuest = 1
			NameMon = "Fishman Warrior"
			CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
			CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822, 2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
		elseif MyLevel == 400 or MyLevel <= 449 then 
			Ms = "Fishman Commando [Lv. 400]"
			NaemQuest = "FishmanQuest"
			LevelQuest = 2
			NameMon = "Fishman Commando"
			CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
			CFrameMon = CFrame.new(61885.5039, 18.4828243, 1504.17896, 0.577502489, 0, -0.816389024, -0, 1.00000012, -0, 0.816389024, 0, 0.577502489)
		elseif MyLevel == 450 or MyLevel <= 474 then 
			Ms = "God's Guard [Lv. 450]"
			NaemQuest = "SkyExp1Quest"
			LevelQuest = 1
			NameMon = "God's Guards"
			CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105, -0.999277651, -5.56969759e-09, 0.0380011722, -4.14751478e-09, 1, 3.75035256e-08, -0.0380011722, 3.73188307e-08, -0.999277651)
			CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.92542, -0.93441087, -6.77488776e-09, -0.356197298, 1.12145182e-08, 1, -4.84390199e-08, 0.356197298, -4.92565206e-08, -0.93441087)
		elseif MyLevel == 475 or MyLevel <= 524 then 
			Ms = "Shanda [Lv. 475]"
			NaemQuest = "SkyExp1Quest"
			LevelQuest = 2
			NameMon = "Shandas"
			CFrameQuest = CFrame.new(-7863.63672, 5545.49316, -379.826324, 0.362120807, -1.98046344e-08, -0.93213129, 4.05822291e-08, 1, -5.48095125e-09, 0.93213129, -3.58431969e-08, 0.362120807)
			CFrameMon = CFrame.new(-7685.12354, 5601.05127, -443.171509, 0.150056243, 1.79768236e-08, -0.988677442, 6.67798661e-09, 1, 1.91962481e-08, 0.988677442, -9.48289181e-09, 0.150056243)
		elseif MyLevel == 525 or MyLevel <= 549 then 
			Ms = "Royal Squad [Lv. 525]"
			NaemQuest = "SkyExp2Quest"
			LevelQuest = 1
			NameMon = "Royal Squad"
			CFrameQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
			CFrameMon = CFrame.new(-7685.02051, 5606.87842, -1442.729, 0.561947823, 7.69527464e-09, -0.827172697, -4.24974544e-09, 1, 6.41599973e-09, 0.827172697, -9.01838604e-11, 0.561947823)
		elseif MyLevel == 550 or MyLevel <= 624 then 
			Ms = "Royal Soldier [Lv. 550]"
			NaemQuest = "SkyExp2Quest"
			LevelQuest = 2
			NameMon = "Royal Soldier"
			CFrameQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
			CFrameMon = CFrame.new(-7864.44775, 5661.94092, -1708.22351, 0.998389959, 2.28686137e-09, -0.0567218624, 1.99431383e-09, 1, 7.54200258e-08, 0.0567218624, -7.54117195e-08, 0.998389959)
		elseif MyLevel == 625 or MyLevel <= 649 then 
			Ms = "Galley Pirate [Lv. 625]"
			NaemQuest = "FountainQuest"
			LevelQuest = 1
			NameMon = "Galley Pirate"
			CFrameQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
			CFrameMon = CFrame.new(5595.06982, 41.5013695, 3961.47095, -0.992138803, -2.11610267e-08, -0.125142589, -1.34249509e-08, 1, -6.26613996e-08, 0.125142589, -6.04887518e-08, -0.992138803)
		elseif MyLevel >= 650 then 
			Ms = "Galley Captain [Lv. 650]"
			NaemQuest = "FountainQuest"
			LevelQuest = 2
			NameMon = "Galley Captain"
			CFrameQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
			CFrameMon = CFrame.new(5658.5752, 38.5361786, 4928.93506, -0.996873081, 2.12391046e-06, -0.0790185928, 2.16989656e-06, 1, -4.96097414e-07, 0.0790185928, -6.66008248e-07, -0.996873081)
		end
	end
	if NewWorld then
		if MyLevel == 700 or MyLevel <= 724 then 
			Ms = "Raider [Lv. 700]"
			NaemQuest = "Area1Quest"
			LevelQuest = 1
			NameMon = "Raider"
			CFrameQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
			CFrameMon = CFrame.new(-737.026123, 39.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0, 0.962260842, 0, 0.272128761)
		elseif MyLevel == 725 or MyLevel <= 774 then 
			Ms = "Mercenary [Lv. 725]"
			NaemQuest = "Area1Quest"
			LevelQuest = 2
			NameMon = "Mercenary"
			CFrameQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
			CFrameMon = CFrame.new(-973.731995, 95.8733215, 1836.46936, 0.999135971, 2.02326991e-08, -0.0415605344, -1.90767793e-08, 1, 2.82094952e-08, 0.0415605344, -2.73922804e-08, 0.999135971)
		elseif MyLevel == 775 or MyLevel <= 874 then 
			Ms = "Swan Pirate [Lv. 775]"
			NaemQuest = "Area2Quest"
			LevelQuest = 1
			NameMon = "Swan Pirate"
			CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
			CFrameMon = CFrame.new(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723, 1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468)
		elseif MyLevel == 875 or MyLevel <= 899 then 
			Ms = "Marine Lieutenant [Lv. 875]"
			NaemQuest = "MarineQuest3"
			LevelQuest = 1
			NameMon = "Marine Lieutenant"
			CFrameQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
			CFrameMon = CFrame.new(-2913.26367, 73.0011826, -2971.64282, 0.910507619, 0, 0.413492233, 0, 1.00000012, 0, -0.413492233, 0, 0.910507619)
		elseif MyLevel == 900 or MyLevel <= 949 then 
			Ms = "Marine Captain [Lv. 900]"
			NaemQuest = "MarineQuest3"
			LevelQuest = 2
			NameMon = "Marine Captain"
			CFrameQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
			CFrameMon = CFrame.new(-1868.67688, 73.0011826, -3321.66333, -0.971402287, 1.06502087e-08, 0.237439692, 3.68856199e-08, 1, 1.06050372e-07, -0.237439692, 1.11775684e-07, -0.971402287)
		elseif MyLevel == 950 or MyLevel <= 974 then 
			Ms = "Zombie [Lv. 950]"
			NaemQuest = "ZombieQuest"
			LevelQuest = 1
			NameMon = "Zombie"
			CFrameQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
			CFrameMon = CFrame.new(-5634.83838, 126.067039, -697.665039, -0.992770672, 6.77618939e-09, 0.120025545, 1.65461245e-08, 1, 8.04023372e-08, -0.120025545, 8.18070234e-08, -0.992770672)
		elseif MyLevel == 975 or MyLevel <= 999 then 
			Ms = "Vampire [Lv. 975]"
			NaemQuest = "ZombieQuest"
			LevelQuest = 2
			NameMon = "Vampire"
			CFrameQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
			CFrameMon = CFrame.new(-6030.32031, 6.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945, -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
		elseif MyLevel == 1000 or MyLevel <= 1049 then 
			Ms = "Snow Trooper [Lv. 1000]"
			NaemQuest = "SnowMountainQuest"
			LevelQuest = 1
			NameMon = "Snow Trooper"
			CFrameQuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
			CFrameMon = CFrame.new(535.893433, 401.457062, -5329.6958, -0.999524176, 0, 0.0308452044, 0, 1, -0, -0.0308452044, 0, -0.999524176)
		elseif MyLevel == 1050 or MyLevel <= 1099 then 
			Ms = "Winter Warrior [Lv. 1050]"
			NaemQuest = "SnowMountainQuest"
			LevelQuest = 2
			NameMon = "Winter Warrior"
			CFrameQuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
			CFrameMon = CFrame.new(1223.7417, 454.575226, -5170.02148, 0.473996818, 2.56845354e-08, 0.880526543, -5.62456428e-08, 1, 1.10811016e-09, -0.880526543, -5.00510211e-08, 0.473996818)
		elseif MyLevel == 1100 or MyLevel <= 1124 then 
			Ms = "Lab Subordinate [Lv. 1100]"
			NaemQuest = "IceSideQuest"
			LevelQuest = 1
			NameMon = "Lab Subordinate"
			CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
			CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936, -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
		elseif MyLevel == 1125 or MyLevel <= 1174 then 
			Ms = "Horned Warrior [Lv. 1125]"
			NaemQuest = "IceSideQuest"
			LevelQuest = 2
			NameMon = "Horned Warrior"
			CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
			CFrameMon = CFrame.new(-6400.85889, 24.7645149, -5818.63574, -0.964845479, 8.65926566e-08, -0.262817472, 3.98261392e-07, 1, -1.13260398e-06, 0.262817472, -1.19745812e-06, -0.964845479)
		elseif MyLevel == 1175 or MyLevel <= 1199 then 
			Ms = "Magma Ninja [Lv. 1175]"
			NaemQuest = "FireSideQuest"
			LevelQuest = 1
			NameMon = "Magma Ninja"
			CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
			CFrameMon = CFrame.new(-5496.65576, 58.6890411, -5929.76855, -0.885073781, 0, -0.465450764, 0, 1.00000012, -0, 0.465450764, 0, -0.885073781)
		elseif MyLevel == 1200 or MyLevel <= 1249 then 
			Ms = "Lava Pirate [Lv. 1200]"
			NaemQuest = "FireSideQuest"
			LevelQuest = 2
			NameMon = "Lava Pirate"
			CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
			CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012, -0, -0.98044765, 0, -0.196780294)
		elseif MyLevel == 1250 or MyLevel <= 1274 then 
			Ms = "Ship Deckhand [Lv. 1250]"
			NaemQuest = "ShipQuest1"
			LevelQuest = 1
			NameMon = "Ship Deckhand"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
			CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968, 5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
		elseif MyLevel == 1275 or MyLevel <= 1299 then 
			Ms = "Ship Engineer [Lv. 1275]"
			NaemQuest = "ShipQuest1"
			LevelQuest = 2
			NameMon = "Ship Engineer"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
			CFrameMon = CFrame.new(921.30249023438, 125.400390625, 32937.34375)
		elseif MyLevel == 1300 or MyLevel <= 1324 then 
			Ms = "Ship Steward [Lv. 1300]"
			NaemQuest = "ShipQuest2"
			LevelQuest = 1
			NameMon = "Ship Steward"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame.new(917.96057128906, 136.89932250977, 33343.4140625)
		elseif MyLevel == 1325 or MyLevel <= 1349 then 
			Ms = "Ship Officer [Lv. 1325]"
			NaemQuest = "ShipQuest2"
			LevelQuest = 2
			NameMon = "Ship Officer"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame.new(944.44964599609, 181.40081787109, 33278.9453125)
		elseif MyLevel == 1350 or MyLevel <= 1374 then 
			Ms = "Arctic Warrior [Lv. 1350]"
			NaemQuest = "FrostQuest"
			LevelQuest = 1
			NameMon = "Arctic Warrior"
			CFrameQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
			CFrameMon = CFrame.new(5995.07471, 57.3188477, -6183.47314, 0.702747107, -1.53454167e-07, -0.711440146, -1.08168464e-07, 1, -3.22542007e-07, 0.711440146, 3.03620908e-07, 0.702747107)
		elseif MyLevel == 1375 or MyLevel <= 1424 then 
			Ms = "Snow Lurker [Lv. 1375]"
			NaemQuest = "FrostQuest"
			LevelQuest = 2
			NameMon = "Snow Lurker"
			CFrameQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
			CFrameMon = CFrame.new(5518.00684, 60.5559731, -6828.80518, -0.650781393, -3.64292951e-08, 0.759265184, -4.07668654e-09, 1, 4.44854642e-08, -0.759265184, 2.58550248e-08, -0.650781393)
		elseif MyLevel == 1425 or MyLevel <= 1449 then 
			Ms = "Sea Soldier [Lv. 1425]"
			NaemQuest = "ForgottenQuest"
			LevelQuest = 1
			NameMon = "Sea Soldier"
			CFrameQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
			CFrameMon = CFrame.new(-3030.3696289063, 191.13464355469, -9859.7958984375)
		elseif MyLevel >= 1450 then 
			Ms = "Water Fighter [Lv. 1450]"
			NaemQuest = "ForgottenQuest"
			LevelQuest = 2
			NameMon = "Water Fighter"
			CFrameQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
			CFrameMon = CFrame.new(-3436.7727050781, 290.52191162109, -10503.438476563)
		end
	end
	if ThreeWorld then
        if MyLevel >= 1500 and MyLevel <= 1524 then
            Ms = "Pirate Millionaire [Lv. 1500]"
            NaemQuest = "PiratePortQuest"
            LevelQuest = 1
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984)
            PosQuest = Vector3.new(-290.074677, 42.9034653, 5581.58984)
            CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
            PosMon = Vector3.new(81.164993286133, 43.755737304688, 5724.7021484375)
        elseif MyLevel >= 1525 and MyLevel <= 1574 then
            Ms = "Pistol Billionaire [Lv. 1525]"
            NaemQuest = "PiratePortQuest"
            LevelQuest = 2
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984)
            PosQuest = Vector3.new(-290.074677, 42.9034653, 5581.58984)
            CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
            PosMon = Vector3.new(81.164993286133, 43.755737304688, 5724.7021484375)
        elseif MyLevel >= 1575 and MyLevel <= 1599 then
            Ms = "Dragon Crew Warrior [Lv. 1575]"
            NaemQuest = "AmazonQuest"
            LevelQuest = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563)
            PosQuest = Vector3.new(5832.83594, 51.6806107, -1101.51563)
            CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
            PosMon = Vector3.new(6241.9951171875, 51.522083282471, -1243.9771728516)
        elseif MyLevel >= 1600 and MyLevel <= 1624 then
            Ms = "Dragon Crew Archer [Lv. 1600]"
            NaemQuest = "AmazonQuest"
            LevelQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563)
            PosQuest = Vector3.new(5832.83594, 51.6806107, -1101.51563)
            CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
            PosMon = Vector3.new(6488.9155273438, 383.38375854492, -110.66246032715)
        elseif MyLevel >= 1625 and MyLevel <= 1649 then
            Ms = "Female Islander [Lv. 1625]"
            NaemQuest = "AmazonQuest2"
            LevelQuest = 1
            NameMon = "Female Islander"
            CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676)
            PosQuest = Vector3.new(5448.86133, 601.516174, 751.130676)
            CFrameMon = CFrame.new(5825.2241210938, 682.89245605469, 704.57958984375)
            PosMon = Vector3.new(5825.2241210938, 682.89245605469, 704.57958984375)
        elseif MyLevel >= 1650 and MyLevel <= 1699 then
            Ms = "Giant Islander [Lv. 1650]"
            NaemQuest = "AmazonQuest2"
            LevelQuest = 2
            NameMon = "Giant Islander"
            CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676)
            PosQuest = Vector3.new(5448.86133, 601.516174, 751.130676)
            CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
            PosMon = Vector3.new(4530.3540039063, 656.75695800781, -131.60952758789)
        elseif MyLevel >= 1700 and MyLevel <= 1724 then
            Ms = "Marine Commodore [Lv. 1700]"
            NaemQuest = "MarineTreeIsland"
            LevelQuest = 1
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498)
            PosQuest = Vector3.new(2180.54126, 27.8156815, -6741.5498)
            CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
            PosMon = Vector3.new(2490.0844726563, 190.4232635498, -7160.0502929688)
        elseif MyLevel >= 1725 and MyLevel <= 1774 then
            Ms = "Marine Rear Admiral [Lv. 1725]"
            NaemQuest = "MarineTreeIsland"
            LevelQuest = 2
            NameMon = "Marine Rear Admiral"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498)
            PosQuest = Vector3.new(2180.54126, 27.8156815, -6741.5498)
            CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
            PosMon = Vector3.new(3951.3903808594, 229.11549377441, -6912.81640625)
        elseif MyLevel >= 1775 and MyLevel <= 1799 then
            Ms = "Fishman Raider [Lv. 1775]"
            NaemQuest = "DeepForestIsland3"
            LevelQuest = 1
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            PosQuest = Vector3.new(-10581.6563, 330.872955, -8761.18652)
            CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
            PosMon = Vector3.new(-10322.400390625, 390.94473266602, -8580.0908203125)
        elseif MyLevel >= 1800 and MyLevel <= 1824 then
            Ms = "Fishman Captain [Lv. 1800]"
            NaemQuest = "DeepForestIsland3"
            LevelQuest = 2
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            PosQuest = Vector3.new(-10581.6563, 330.872955, -8761.18652)
            CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
            PosMon = Vector3.new(-11194.541992188, 442.02795410156, -8608.806640625)
        elseif MyLevel >= 1825 and MyLevel <= 1849 then
            Ms = "Forest Pirate [Lv. 1825]"
            NaemQuest = "DeepForestIsland"
            LevelQuest = 1
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137)
            PosQuest = Vector3.new(-13234.04, 331.488495, -7625.40137)
            CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
            PosMon = Vector3.new(-13225.809570313, 428.19387817383, -7753.1245117188)
        elseif MyLevel >= 1850 and MyLevel <= 1899 then
            Ms = "Mythological Pirate [Lv. 1850]"
            NaemQuest = "DeepForestIsland"
            LevelQuest = 2
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137)
            PosQuest = Vector3.new(-13234.04, 331.488495, -7625.40137)
            CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
            PosMon = Vector3.new(-13869.172851563, 564.95251464844, -7084.4135742188)
        elseif MyLevel >= 1900 and MyLevel <= 1924 then
            Ms = "Jungle Pirate [Lv. 1900]"
            NaemQuest = "DeepForestIsland2"
            LevelQuest = 1
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953)
            PosQuest = Vector3.new(-12680.3818, 389.971039, -9902.01953)
            CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
            PosMon = Vector3.new(-11982.221679688, 376.32522583008, -10451.415039063)
        elseif MyLevel >= 1925 and MyLevel <= 1974 then
            Ms = "Musketeer Pirate [Lv. 1925]"
            NaemQuest = "DeepForestIsland2"
            LevelQuest = 2
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953)
            PosQuest = Vector3.new(-12680.3818, 389.971039, -9902.01953)
            CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
            PosMon = Vector3.new(-13282.3046875, 496.23684692383, -9565.150390625)
        elseif MyLevel >= 1975 and MyLevel <= 1999 then
            Ms = "Reborn Skeleton [Lv. 1975]"
            NaemQuest = "HauntedQuest1"
            LevelQuest = 1
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
            PosQuest = Vector3.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
            CFrameMon = CFrame.new(-8817.880859375, 191.16761779785, 6298.6557617188)
            PosMon = Vector3.new(-8817.880859375, 191.16761779785, 6298.6557617188)
        elseif MyLevel >= 2000 and MyLevel <= 2024 then
            Ms = "Living Zombie [Lv. 2000]"
            NaemQuest = "HauntedQuest1"
            LevelQuest = 2
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
            PosQuest = Vector3.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
            CFrameMon = CFrame.new(-10125.234375, 183.94705200195, 6242.013671875)
            PosMon = Vector3.new(-10125.234375, 183.94705200195, 6242.013671875)
        elseif MyLevel >= 2025 and MyLevel <= 2049  then
            Ms = "Demonic Soul [Lv. 2025]"
            NaemQuest = "HauntedQuest2"
            LevelQuest = 1
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            PosQuest = Vector3.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
            PosMon = Vector3.new(-9712.03125, 204.69589233398, 6193.322265625)
        elseif MyLevel > 2050 and MyLevel <= 2074 then
            Ms = "Posessed Mummy [Lv. 2050]"
            NaemQuest = "HauntedQuest2"
            LevelQuest = 2
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            PosQuest = Vector3.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)    
            PosMon = Vector3.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
		elseif MyLevel >= 2075 and MyLevel <= 2099  then
            Ms = "Peanut Scout [Lv. 2075]"
            NaemQuest = "NutsIslandQuest"
            LevelQuest = 1
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.5874, 38.1299706, -10194.3496, 0.774643302, -5.8516525e-09, 0.632398427, -4.8110703e-08, 1, 6.81853152e-08, -0.632398427, -8.324443e-08, 0.774643302)
            PosQuest = Vector3.new(-2104.5874, 38.1299706, -10194.3496, 0.774643302, -5.8516525e-09, 0.632398427, -4.8110703e-08, 1, 6.81853152e-08, -0.632398427, -8.324443e-08, 0.774643302)
            CFrameMon = CFrame.new(-2099.04126, 107.883263, -10065.6582, -0.847717106, -1.89047302e-08, -0.530448556, -2.99691649e-08, 1, 1.22549917e-08, 0.530448556, 2.62858659e-08, -0.847717106)    
            PosHee = Vector3.new(-2099.04126, 107.883263, -10065.6582, -0.847717106, -1.89047302e-08, -0.530448556, -2.99691649e-08, 1, 1.22549917e-08, 0.530448556, 2.62858659e-08, -0.847717106)
        elseif MyLevel >= 2100 and MyLevel <= 2124  then
            Ms = "Peanut President [Lv. 2100]"
            NaemQuest = "NutsIslandQuest"
            LevelQuest = 2
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.2546386719, 38.129970550537, -10194.146484375)
            PosQuest = Vector3.new(-2104.2546386719, 38.129970550537, -10194.146484375)
            CFrameMon = CFrame.new(-2137.076171875, 70.30451965332, -10515.509765625)
            PosHee = Vector3.new(-2137.076171875, 70.30451965332, -10515.509765625)
        elseif MyLevel >= 2125 and MyLevel <= 2149  then
            Ms = "Ice Cream Chef [Lv. 2125]"
            NaemQuest = "IceCreamIslandQuest"
            LevelQuest = 1
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.336182, 65.8453293, -10965.7627, 0.763408899, 2.66162115e-08, -0.645915508, 5.54280488e-09, 1, 4.77580073e-08, 0.645915508, -4.00390725e-08, 0.763408899)
            PosQuest = Vector3.new(-820.336182, 65.8453293, -10965.7627, 0.763408899, 2.66162115e-08, -0.645915508, 5.54280488e-09, 1, 4.77580073e-08, 0.645915508, -4.00390725e-08, 0.763408899)
            CFrameMon = CFrame.new(-797.381287, 111.218796, -10848.5146, 0.755367041, 4.70847183e-08, 0.655301929, -6.89669344e-09, 1, -6.39021209e-08, -0.655301929, 4.37501413e-08, 0.755367041)    
            PosHee = Vector3.new(-797.381287, 111.218796, -10848.5146, 0.755367041, 4.70847183e-08, 0.655301929, -6.89669344e-09, 1, -6.39021209e-08, -0.655301929, 4.37501413e-08, 0.755367041)
        elseif MyLevel >= 2150  and MyLevel <= 2199 then
            Ms = "Ice Cream Commander [Lv. 2150]"
            NaemQuest = "IceCreamIslandQuest"
            LevelQuest = 2
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.336182, 65.8453293, -10965.7627, 0.763408899, 2.66162115e-08, -0.645915508, 5.54280488e-09, 1, 4.77580073e-08, 0.645915508, -4.00390725e-08, 0.763408899)
            PosQuest = Vector3.new(-820.336182, 65.8453293, -10965.7627, 0.763408899, 2.66162115e-08, -0.645915508, 5.54280488e-09, 1, 4.77580073e-08, 0.645915508, -4.00390725e-08, 0.763408899)
            CFrameMon = CFrame.new(-541.803711, 186.394516, -11210.9062, -0.181756258, -5.9845668e-08, 0.983343601, -1.98635615e-08, 1, 5.71878864e-08, -0.983343601, -9.13845e-09, -0.181756258)    
            PosHee = Vector3.new(-541.803711, 186.394516, -11210.9062, -0.181756258, -5.9845668e-08, 0.983343601, -1.98635615e-08, 1, 5.71878864e-08, -0.983343601, -9.13845e-09, -0.181756258)
        elseif MyLevel >= 2200 and MyLevel <= 2224 then
                Ms = "Cookie Crafter [Lv. 2200]"
                NaemQuest = "CakeQuest1"
                LevelQuest = 1
                NameMon = "Cookie Crafter"
                CFrameQuest = CFrame.new(-2021.96851, 37.7982178, -12026.5137, 0.971608818, 1.80562854e-08, 0.236593053, -1.95491463e-08, 1, 3.96393229e-09, -0.236593053, -8.47658388e-09, 0.971608818)
                PosQuest = Vector3.new(-2021.96851, 37.7982178, -12026.5137, 0.971608818, 1.80562854e-08, 0.236593053, -1.95491463e-08, 1, 3.96393229e-09, -0.236593053, -8.47658388e-09, 0.971608818)
                CFrameMon = CFrame.new(-2276.00415, 146.539841, -12203.0146, -0.638633609, -1.0404194e-08, 0.769510984, 1.24565211e-08, 1, 2.38584601e-08, -0.769510984, 2.48222438e-08, -0.638633609)
                PosMon = Vector3.new(-2276.00415, 146.539841, -12203.0146, -0.638633609, -1.0404194e-08, 0.769510984, 1.24565211e-08, 1, 2.38584601e-08, -0.769510984, 2.48222438e-08, -0.638633609)
            elseif MyLevel >= 2225 and MyLevel <= 2249 then
                Ms = "Cake Guard [Lv. 2225]"
                NaemQuest = "CakeQuest1"
                LevelQuest = 2
                NameMon = "Cake Guard"
                CFrameQuest = CFrame.new(-2021.4884, 37.7982292, -12026.9375, 0.934181511, -2.17844871e-08, 0.356799245, 4.77947726e-09, 0.99999994, 4.85416081e-08, -0.356799245, -4.36413572e-08, 0.934181511)
                PosQuest = Vector3.new(-2021.4884, 37.7982292, -12026.9375, 0.934181511, -2.17844871e-08, 0.356799245, 4.77947726e-09, 0.99999994, 4.85416081e-08, -0.356799245, -4.36413572e-08, 0.934181511)
                CFrameMon = CFrame.new(-1520.92725, 195.658432, -12300.3184, -0.830619276, 8.0356088e-08, -0.556840897, -1.90049647e-08, 1, 1.72656073e-07, 0.556840897, 1.53994222e-07, -0.830619276)
                PosMon = Vector3.new(-1520.92725, 195.658432, -12300.3184, -0.830619276, 8.0356088e-08, -0.556840897, -1.90049647e-08, 1, 1.72656073e-07, 0.556840897, 1.53994222e-07, -0.830619276)
            elseif MyLevel >= 2250  and MyLevel <= 2274 then
                Ms = "Baking Staff [Lv. 2250]"
                NaemQuest = "CakeQuest2" --à¸Šà¸·à¹ˆà¸­à¹€à¸à¸£à¸²à¸°à¸–à¹‰à¸²à¸¡à¸µ Giver 1 à¹ƒà¸«à¹‰à¹€à¸£à¸²à¹ƒà¸ªà¹ˆà¸Šà¸·à¹ˆà¸­ 1-2 à¸‚à¹‰à¸²à¸‡à¸«à¸¥à¸±à¸‡à¹€à¸„à¸§à¸ª--
                LevelQuest = 1
                NameMon = "Baking Staff"
                CFrameQuest = CFrame.new(-1927.58313, 37.7981453, -12843.8145, -0.961271644, -8.12611574e-07, 0.275603265, -7.71673683e-07, 1, 2.56976563e-07, -0.275603265, 3.43484281e-08, -0.961271644)
                PosQuest = Vector3.new(-1927.58313, 37.7981453, -12843.8145, -0.961271644, -8.12611574e-07, 0.275603265, -7.71673683e-07, 1, 2.56976563e-07, -0.275603265, 3.43484281e-08, -0.961271644)
                CFrameMon = CFrame.new(-1917.79016, 157.941437, -12869.1377, 0.697629273, -8.53369329e-06, -0.716459036, 1.89624473e-06, 1, -1.00645202e-05, 0.716459036, 5.66272183e-06, 0.697629273)
                PosMon = Vector3.new(-1917.79016, 157.941437, -12869.1377, 0.697629273, -8.53369329e-06, -0.716459036, 1.89624473e-06, 1, -1.00645202e-05, 0.716459036, 5.66272183e-06, 0.697629273)
            elseif MyLevel >= 2275 then
                Ms = "Head Baker [Lv. 2275]"
                NaemQuest = "CakeQuest2" --à¸Šà¸·à¹ˆà¸­à¹€à¸à¸£à¸²à¸°à¸–à¹‰à¸²à¸¡à¸µ Giver 1 à¹ƒà¸«à¹‰à¹€à¸£à¸²à¹ƒà¸ªà¹ˆà¸Šà¸·à¹ˆà¸­ 1-2 à¸‚à¹‰à¸²à¸‡à¸«à¸¥à¸±à¸‡à¹€à¸„à¸§à¸ª--
                LevelQuest = 2
                NameMon = "Head Baker"
                CFrameQuest = CFrame.new(-1927.58313, 37.7981453, -12843.8145, -0.961271644, -8.12611574e-07, 0.275603265, -7.71673683e-07, 1, 2.56976563e-07, -0.275603265, 3.43484281e-08, -0.961271644)
                PosQuest = Vector3.new(-1927.58313, 37.7981453, -12843.8145, -0.961271644, -8.12611574e-07, 0.275603265, -7.71673683e-07, 1, 2.56976563e-07, -0.275603265, 3.43484281e-08, -0.961271644)
                CFrameMon = CFrame.new(-2259.45142, 152.333252, -12800.2656, -0.261799961, -4.23144547e-06, 0.965122163, -1.22252038e-06, 1, 4.05274068e-06, -0.965122163, -1.18874169e-07, -0.261799961)
                PosMon = Vector3.new(-2259.45142, 152.333252, -12800.2656, -0.261799961, -4.23144547e-06, 0.965122163, -1.22252038e-06, 1, 4.05274068e-06, -0.965122163, -1.18874169e-07, -0.261799961)
            end
        end
    end

if OldWorld then
CheckQuest()
function EquipWeapon(ToolSe)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
		wait(.4)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end
end

if NewWorld then
	CheckQuest()
	function EquipWeapon(ToolSe)
		if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
			local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
			wait(.4)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
		end
	end
end

if ThreeWorld then
	CheckQuest()
	function EquipWeapon(ToolSe)
		if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
			local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
			wait(.4)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
		end
	end
end

spawn(function()
	pcall(function()
		while wait(.1) do
			if AutoKaitan and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			end
		end
	end)
end)

spawn(function()
	while wait() do
	if AutoKaitan then
		pcall(function()
			for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
			   if v.ToolTip == "Melee" then
			  if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
				  local ToolSe = tostring(v.Name)
				 local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
				 wait(.4)
				 game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
			  end
			   end
			end
		end)
	end
	end
	end)

    
--Magnet
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
		pcall(function()
            local MyLevel = game.Players.LocalPlayer.Data.Level.Value
            if _G.AutoFarm or StatrMagnet then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position-PosMon.Position).magnitude <= 500 then
                        v.HumanoidRootPart.CFrame = PosMon
                        v.Humanoid.JumpPower = 0
                        v.Humanoid.WalkSpeed = 0
                        v.HumanoidRootPart.CanCollide = false
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						v.Humanoid:ChangeState(11)
                        v.Humanoid:ChangeState(14)
                    end
                end
            end
        end)
    end)
end)

    local VirtualUser = game:GetService('VirtualUser')
    local kkii = require(game.ReplicatedStorage.Util.CameraShaker)
    spawn(function()
        while game:GetService("RunService").RenderStepped:wait() do
            if _G.AutoFarm then
                pcall(function()
                 game.Players.LocalPlayer.Character.Stun.Value = 0
                 game.Players.LocalPlayer.Character.Humanoid.Sit = false
                 kkii:Stop()
                end)
            end
        end
    end)
    
    spawn(function()
        game:GetService("RunService").Heartbeat:connect(function()
            if _G.AutoFarm then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        v.Humanoid:ChangeState(11)
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        game:GetService("RunService").Heartbeat:connect(function()
            if _G.AutoFarm and StatrMagnet and Magnet then
                CheckQuest()
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if v.Name == "Factory Staff [Lv. 800]" or v.Name == "Dragon Crew Warrior [Lv. 1575]" or v.Name == "Dragon Crew Archer [Lv. 1600]" and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
                            if HideHitBlox then
                                v.HumanoidRootPart.Transparency = 1
                            else
                                v.HumanoidRootPart.Transparency = 70
                            end
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = PosMon
                        elseif v.Name == Ms and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 400 then
                            if HideHitBlox then
                                v.HumanoidRootPart.Transparency = 1
                            else
                                v.HumanoidRootPart.Transparency = 70
                            end
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = PosMon
                        end
                    end
                end
            end 
        end)
    end)

    _G.level700CheckSea2ThieuNang = true

    spawn(function() -- vẫn còn dùng được.
        while wait(.1) do
            if _G.level700CheckSea2ThieuNang then
                local Lv = game.Players.LocalPlayer.Data.Level.Value
                if Lv >= 700 and OldWorld then
                    AutoKaitan = false
                    _G.Auto_Farm = false
                    _G.AutoFarm = false
                    Auto_Farm = false
                    if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
                        TP2(CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563))
                        wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                        EquipWeapon("Key")
                        TP2(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        wait(3)
                    elseif game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Ice Admiral [Lv. 700] [Boss]" and v.Humanoid.Health > 0 then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        pcall(function()
                                            EquipWeapon(SelectToolWeapon)
                                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 10))
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = .8
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 870),workspace.CurrentCamera.CFrame)
                                        end)
                                    until v.Humanoid.Health <= 0 or not v.Parent
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                                end
                            end
                        else
                            TP2(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                    end
                end
            end
        end
    end)

	spawn(function()
		pcall(function()
			while wait() do
				if AutoKaitan then
					if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and NewWorld then
						Auto_Farm = false
						if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Check") == 0 then
							TP2(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
							if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
								wait(1.1)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
							end
							wait(2)
							if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "rip_indra [Lv. 1500] [Boss]" then
										repeat game:GetService("RunService").Heartbeat:wait()
											pcall(function()
												EquipWeapon(SelectToolWeapon)
												TP(v.HumanoidRootPart.CFrame * CFrame.new(0,25,25))
												require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
												game:GetService'VirtualUser':CaptureController()
												game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
												FoundIndra = true
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end)
										until AutoThird == false or v.Humanoid.Health <= 0 or not v.Parent
									end
								end
							elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
								TP(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
							end
						end
					end
				end
			end
		end)
	end)

function CheckLevel()
    local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    if OldWorld then
        if Lv == 1 or Lv <= 9 or SelectMonster == "Bandit [Lv. 5]" then -- Bandit
            Ms = "Bandit [Lv. 5]"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif Lv == 10 or Lv <= 14 or SelectMonster == "Monkey [Lv. 14]" then -- Monkey
            Ms = "Monkey [Lv. 14]"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
        elseif Lv == 15 or Lv <= 29 or SelectMonster == "Gorilla [Lv. 20]" then -- Gorilla
            Ms = "Gorilla [Lv. 20]"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
        elseif Lv == 30 or Lv <= 39 or SelectMonster == "Pirate [Lv. 35]" then -- Pirate
            Ms = "Pirate [Lv. 35]"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif Lv == 40 or Lv <= 59 or SelectMonster == "Brute [Lv. 45]" then -- Brute
            Ms = "Brute [Lv. 45]"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif Lv == 60 or Lv <= 74 or SelectMonster == "Desert Bandit [Lv. 60]" then -- Desert Bandit
            Ms = "Desert Bandit [Lv. 60]"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif Lv == 75 or Lv <= 89 or SelectMonster == "Desert Officer [Lv. 70]" then -- Desert Officer
            Ms = "Desert Officer [Lv. 70]"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif Lv == 90 or Lv <= 99 or SelectMonster == "Snow Bandit [Lv. 90]" then -- Snow Bandit
            Ms = "Snow Bandit [Lv. 90]"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
        elseif Lv == 100 or Lv <= 119 or SelectMonster == "Snowman [Lv. 100]" then -- Snowman
            Ms = "Snowman [Lv. 100]"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif Lv == 120 or Lv <= 149 or SelectMonster == "Chief Petty Officer [Lv. 120]" then -- Chief Petty Officer
            Ms = "Chief Petty Officer [Lv. 120]"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif Lv == 150 or Lv <= 174 or SelectMonster == "Sky Bandit [Lv. 150]" then -- Sky Bandit
            Ms = "Sky Bandit [Lv. 150]"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
        elseif Lv == 175 or Lv <= 249 or SelectMonster == "Dark Master [Lv. 175]" then -- Dark Master
            Ms = "Dark Master [Lv. 175]"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
        elseif Lv == 250 or Lv <= 274 or SelectMonster == "Toga Warrior [Lv. 225]" then -- Toga Warrior
            Ms = "Toga Warrior [Lv. 250]"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
        elseif Lv == 275 or Lv <= 299 or SelectMonster == "Gladiator [Lv. 275]" then -- Gladiator
            Ms = "Gladiator [Lv. 275]"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1465.688, 7.786, -3136.755)
        elseif Lv == 300 or Lv <= 324 or SelectMonster == "Military Soldier [Lv. 300]" then -- Military Soldier
            Ms = "Military Soldier [Lv. 300]"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
        elseif Lv == 325 or Lv <= 374 or SelectMonster == "Military Spy [Lv. 325]" then -- Military Spy
            Ms = "Military Spy [Lv. 325]"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5984.0532226563, 82.14656829834, 8753.326171875)
        elseif Lv == 375 or Lv <= 399 or SelectMonster == "Fishman Warrior [Lv. 375]" then -- Fishman Warrior 
            Ms = "Fishman Warrior [Lv. 375]"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
        elseif Lv == 400 or Lv <= 449 or SelectMonster == "Fishman Commando [Lv. 400]" then -- Fishman Commando
            Ms = "Fishman Commando [Lv. 400]"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
        elseif Lv == 450 or Lv <= 474 or SelectMonster == "God's Guard [Lv. 450]" then -- God's Guard
            Ms = "God's Guard [Lv. 450]"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
			end
        elseif Lv == 475 or Lv <= 524 or SelectMonster == "Shanda [Lv. 475]" then -- Shanda
            Ms = "Shanda [Lv. 475]"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
			end
        elseif Lv == 525 or Lv <= 549 or SelectMonster == "Royal Squad [Lv. 525]" then -- Royal Squad
            Ms = "Royal Squad [Lv. 525]"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
        elseif Lv == 550 or Lv <= 624 or SelectMonster == "Royal Soldier [Lv. 550]" then -- Royal Soldier
            Ms = "Royal Soldier [Lv. 550]"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
        elseif Lv == 625 or Lv <= 649 or SelectMonster == "Galley Pirate [Lv. 625]" then -- Galley Pirate
            Ms = "Galley Pirate [Lv. 625]"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif Lv >= 650 or SelectMonster == "Galley Captain [Lv. 650]" then -- Galley Captain
            Ms = "Galley Captain [Lv. 650]"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    end
    if NewWorld then
        if Lv == 700 or Lv <= 724 or SelectMonster == "Raider [Lv. 700]" then -- Raider
            Ms = "Raider [Lv. 700]"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
        elseif Lv == 725 or Lv <= 774 or SelectMonster == "Mercenary [Lv. 725]" then -- Mercenary
            Ms = "Mercenary [Lv. 725]"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
        elseif Lv == 775 or Lv <= 874 or SelectMonster == "Swan Pirate [Lv. 775]" then -- Swan Pirate
            Ms = "Swan Pirate [Lv. 775]"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
        elseif Lv == 875 or Lv <= 899 or SelectMonster == "Marine Lieutenant [Lv. 875]" then -- Marine Lieutenant
            Ms = "Marine Lieutenant [Lv. 875]"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
        elseif Lv == 900 or Lv <= 949 or SelectMonster == "Marine Captain [Lv. 900]" then -- Marine Captain
            Ms = "Marine Captain [Lv. 900]"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
        elseif Lv == 950 or Lv <= 974 or SelectMonster == "Zombie [Lv. 950]" then -- Zombie
            Ms = "Zombie [Lv. 950]"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
        elseif Lv == 975 or Lv <= 999 or SelectMonster == "Vampire [Lv. 975]" then -- Vampire
            Ms = "Vampire [Lv. 975]"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
        elseif Lv == 1000 or Lv <= 1049 or SelectMonster == "Snow Trooper [Lv. 1000]" then -- Snow Trooper
            Ms = "Snow Trooper [Lv. 1000]"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
        elseif Lv == 1050 or Lv <= 1099 or SelectMonster == "Winter Warrior [Lv. 1050]" then -- Winter Warrior
            Ms = "Winter Warrior [Lv. 1050]"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
        elseif Lv == 1100 or Lv <= 1124 or SelectMonster == "Lab Subordinate [Lv. 1100]" then -- Lab Subordinate
            Ms = "Lab Subordinate [Lv. 1100]"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
        elseif Lv == 1125 or Lv <= 1174 or SelectMonster == "Horned Warrior [Lv. 1125]" then -- Horned Warrior
            Ms = "Horned Warrior [Lv. 1125]"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
        elseif Lv == 1175 or Lv <= 1199 or SelectMonster == "Magma Ninja [Lv. 1175]" then -- Magma Ninja
            Ms = "Magma Ninja [Lv. 1175]"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
        elseif Lv == 1200 or Lv <= 1249 or SelectMonster == "Lava Pirate [Lv. 1200]" then -- Lava Pirate
            Ms = "Lava Pirate [Lv. 1200]"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
        elseif Lv == 1250 or Lv <= 1274 or SelectMonster == "Ship Deckhand [Lv. 1250]" then -- Ship Deckhand
            Ms = "Ship Deckhand [Lv. 1250]"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1275 or Lv <= 1299 or SelectMonster == "Ship Engineer [Lv. 1275]" then -- Ship Engineer
            Ms = "Ship Engineer [Lv. 1275]"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1300 or Lv <= 1324 or SelectMonster == "Ship Steward [Lv. 1300]" then -- Ship Steward
            Ms = "Ship Steward [Lv. 1300]"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1325 or Lv <= 1349 or SelectMonster == "Ship Officer [Lv. 1325]" then -- Ship Officer
            Ms = "Ship Officer [Lv. 1325]"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1350 or Lv <= 1374 or SelectMonster == "Arctic Warrior [Lv. 1350]" then -- Arctic Warrior
            Ms = "Arctic Warrior [Lv. 1350]"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
			end
        elseif Lv == 1375 or Lv <= 1424 or SelectMonster == "Snow Lurker [Lv. 1375]" then -- Snow Lurker
            Ms = "Snow Lurker [Lv. 1375]"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
        elseif Lv == 1425 or Lv <= 1449 or SelectMonster == "Sea Soldier [Lv. 1425]" then -- Sea Soldier
            Ms = "Sea Soldier [Lv. 1425]"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
        elseif Lv >= 1450 or SelectMonster == "Water Fighter [Lv. 1450]" then -- Water Fighter
            Ms = "Water Fighter [Lv. 1450]"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
		end
	end
	if ThreeWorld then
		if Lv == 1500 or Lv <= 1524 or SelectMonster == "Pirate Millionaire [Lv. 1500]" then -- Pirate Millionaire
			Ms = "Pirate Millionaire [Lv. 1500]"
			NameQuest = "PiratePortQuest"
			QuestLv = 1
			NameMon = "Pirate Millionaire"
			CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
			CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
		elseif Lv == 1525 or Lv <= 1574 or SelectMonster == "Pistol Billionaire [Lv. 1525]" then -- Pistol Billoonaire
			Ms = "Pistol Billionaire [Lv. 1525]"
			NameQuest = "PiratePortQuest"
			QuestLv = 2
			NameMon = "Pistol Billionaire"
			CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
			CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
		elseif Lv == 1575 or Lv <= 1599 or SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then -- Dragon Crew Warrior
			Ms = "Dragon Crew Warrior [Lv. 1575]"
			NameQuest = "AmazonQuest"
			QuestLv = 1
			NameMon = "Dragon Crew Warrior"
			CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
			CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
		elseif Lv == 1600 or Lv <= 1624 or SelectMonster == "Dragon Crew Archer [Lv. 1600]" then -- Dragon Crew Archer
			Ms = "Dragon Crew Archer [Lv. 1600]"
			NameQuest = "AmazonQuest"
			QuestLv = 2
			NameMon = "Dragon Crew Archer"
			CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
			CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
		elseif Lv == 1625 or Lv <= 1649 or SelectMonster == "Female Islander [Lv. 1625]" then -- Female Islander
			Ms = "Female Islander [Lv. 1625]"
			NameQuest = "AmazonQuest2"
			QuestLv = 1
			NameMon = "Female Islander"
			CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
			CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
		elseif Lv == 1650 or Lv <= 1699 or SelectMonster == "Giant Islander [Lv. 1650]" then -- Giant Islander
			Ms = "Giant Islander [Lv. 1650]"
			NameQuest = "AmazonQuest2"
			QuestLv = 2
			NameMon = "Giant Islander"
			CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
			CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
		elseif Lv == 1700 or Lv <= 1724 or SelectMonster == "Marine Commodore [Lv. 1700]" then -- Marine Commodore
			Ms = "Marine Commodore [Lv. 1700]"
			NameQuest = "MarineTreeIsland"
			QuestLv = 1
			NameMon = "Marine Commodore"
			CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
			CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
		elseif Lv == 1725 or Lv <= 1774 or SelectMonster == "Marine Rear Admiral [Lv. 1725]" then -- Marine Rear Admiral
			Ms = "Marine Rear Admiral [Lv. 1725]"
			NameQuest = "MarineTreeIsland"
			QuestLv = 2
			NameMon = "Marine Rear Admiral"
			CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
			CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
		elseif Lv == 1775 or Lv <= 1799 or SelectMonster == "Fishman Raider [Lv. 1775]" then -- Fishman Raide
			Ms = "Fishman Raider [Lv. 1775]"
			NameQuest = "DeepForestIsland3"
			QuestLv = 1
			NameMon = "Fishman Raider"
			CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
			CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
		elseif Lv == 1800 or Lv <= 1824 or SelectMonster == "Fishman Captain [Lv. 1800]" then -- Fishman Captain
			Ms = "Fishman Captain [Lv. 1800]"
			NameQuest = "DeepForestIsland3"
			QuestLv = 2
			NameMon = "Fishman Captain"
			CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
			CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
		elseif Lv == 1825 or Lv <= 1849 or SelectMonster == "Forest Pirate [Lv. 1825]" then -- Forest Pirate
			Ms = "Forest Pirate [Lv. 1825]"
			NameQuest = "DeepForestIsland"
			QuestLv = 1
			NameMon = "Forest Pirate"
			CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
			CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
		elseif Lv == 1850 or Lv <= 1899 or SelectMonster == "Mythological Pirate [Lv. 1850]" then -- Mythological Pirate
			Ms = "Mythological Pirate [Lv. 1850]"
			NameQuest = "DeepForestIsland"
			QuestLv = 2
			NameMon = "Mythological Pirate"
			CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
			CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
		elseif Lv == 1900 or Lv <= 1924 or SelectMonster == "Jungle Pirate [Lv. 1900]" then -- Jungle Pirate
			Ms = "Jungle Pirate [Lv. 1900]"
			NameQuest = "DeepForestIsland2"
			QuestLv = 1
			NameMon = "Jungle Pirate"
			CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
			CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
		elseif Lv == 1925 or Lv <= 1974 or SelectMonster == "Musketeer Pirate [Lv. 1925]" then -- Musketeer Pirate
			Ms = "Musketeer Pirate [Lv. 1925]"
			NameQuest = "DeepForestIsland2"
			QuestLv = 2
			NameMon = "Musketeer Pirate"
			CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
			CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
		elseif Lv == 1975 or Lv <= 1999 or SelectMonster == "Reborn Skeleton [Lv. 1975]" then
			Ms = "Reborn Skeleton [Lv. 1975]"
			NameQuest = "HauntedQuest1"
			QuestLv = 1
			NameMon = "Reborn Skeleton"
			CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
			CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
		elseif Lv == 2000 or Lv <= 2024 or SelectMonster == "Living Zombie [Lv. 2000]" then
			Ms = "Living Zombie [Lv. 2000]"
			NameQuest = "HauntedQuest1"
			QuestLv = 2
			NameMon = "Living Zombie"
			CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
			CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
		elseif Lv == 2025 or Lv <= 2049 or SelectMonster == "Demonic Soul [Lv. 2025]" then
			Ms = "Demonic Soul [Lv. 2025]"
			NameQuest = "HauntedQuest2"
			QuestLv = 1
			NameMon = "Demonic Soul"
			CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
			CFrameMon = CFrame.new(-9709.30762, 204.695892, 6044.04688, -0.845798075, -3.4587876e-07, -0.533503294, -4.46235369e-08, 1, -5.77571257e-07, 0.533503294, -4.64701827e-07, -0.845798075)
		elseif Lv == 2050 or Lv <= 2074 or SelectMonster == "Posessed Mummy [Lv. 2050]" then
			Ms = "Posessed Mummy [Lv. 2050]"
			NameQuest = "HauntedQuest2"
			QuestLv = 2
			NameMon = "Posessed Mummy"
			CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
			CFrameMon = CFrame.new(-9554.11035, 65.6141663, 6041.73584, -0.877069294, 5.33355795e-08, -0.480364174, 2.06420765e-08, 1, 7.33423562e-08, 0.480364174, 5.44105987e-08, -0.877069294)
        elseif Lv == 2075 or Lv <= 2099 or SelectMonster == "Peanut Scout [Lv. 2075]" then
			Ms = "Peanut Scout [Lv. 2075]"
			NameQuest = "NutsIslandQuest"
			QuestLv = 1
			NameMon = "Peanut Scout"
			CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
			CFrameMon = CFrame.new(-2262.80298, 84.4387054, -10255.4922, -0.999993503, 4.39228813e-08, 0.00361041375, 4.39404282e-08, 1, 4.78073403e-09, -0.00361041375, 4.93934582e-09, -0.999993503)
        elseif Lv == 2100 or Lv <= 2124 or SelectMonster == "Peanut President [Lv. 2100]" then
			Ms = "Peanut President [Lv. 2100]"
			NameQuest = "NutsIslandQuest"
			QuestLv = 2
			NameMon = "Peanut President"
            CFrameQ = CFrame.new(-2104.61475, 38.1299706, -10194.1787, 0.767064989, -6.67286102e-08, 0.641569376, 3.32893402e-09, 1, 1.00028309e-07, -0.641569376, -7.4592478e-08, 0.767064989)
            CFrameMon = CFrame.new(-2182.97241, 88.2648697, -10552.2607, 0.881975889, -1.15795429e-09, 0.471294552, 1.33532996e-09, 1, -4.19579094e-11, -0.471294552, 6.66339595e-10, 0.881975889)
        elseif Lv == 2125 or Lv <= 2149 or SelectMonster == "Ice Cream Chef [Lv. 2125]" then
            Ms = "Ice Cream Chef [Lv. 2125]"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 1
            NameMon = "Ice Cream Chef"
            CFrameQ = CFrame.new(-820.450378, 65.8453293, -10966.0752, 0.766577005, 3.68559938e-08, -0.642152369, 1.27155431e-09, 1, 5.89124021e-08, 0.642152369, -4.59774228e-08, 0.766577005)
            CFrameMon = CFrame.new(-794.760315, 133.070297, -10952.6885, -0.788999617, -7.32182599e-08, 0.614393711, -9.73502026e-08, 1, -5.84480642e-09, -0.614393711, -6.4422899e-08, -0.788999617)
        elseif Lv == 2150 or Lv <= 2199 or SelectMonster == "Ice Cream Commander [Lv. 2150]" then
            Ms = "Ice Cream Commander [Lv. 2150]"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 2
            NameMon = "Ice Cream Commander"
            CFrameQ = CFrame.new(-820.450378, 65.8453293, -10966.0752, 0.766577005, 3.68559938e-08, -0.642152369, 1.27155431e-09, 1, 5.89124021e-08, 0.642152369, -4.59774228e-08, 0.766577005)
            CFrameMon = CFrame.new(-655.430725, 126.896965, -11221.2744, 0.978674889, -1.0593471e-08, -0.205415353, 1.49809232e-08, 1, 1.98036911e-08, 0.205415353, -2.24586856e-08, 0.978674889)
        elseif Lv == 2200 or Lv <= 2224 or SelectMonster == "Cookie Crafter [Lv. 2200]" then
                Ms = "Cookie Crafter [Lv. 2200]"
                NameQuest = "CakeQuest1" 
                QuestLv = 1
                NameMon = "Cookie Crafter"
                CFrameQ = CFrame.new(-2021.96851, 37.7982178, -12026.5137, 0.971608818, 1.80562854e-08, 0.236593053, -1.95491463e-08, 1, 3.96393229e-09, -0.236593053, -8.47658388e-09, 0.971608818)
                CFrameMon = CFrame.new(-2276.00415, 146.539841, -12203.0146, -0.638633609, -1.0404194e-08, 0.769510984, 1.24565211e-08, 1, 2.38584601e-08, -0.769510984, 2.48222438e-08, -0.638633609)
            elseif Lv >= 2225 and Lv <= 2249 or SelectMonster == "Cake Guard [Lv. 2225]" then
                Ms = "Cake Guard [Lv. 2225]"
                NameQuest = "CakeQuest1" 
                QuestLv = 2
                NameMon = "Cake Guard"
                CFrameQ = CFrame.new(-2021.4884, 37.7982292, -12026.9375, 0.934181511, -2.17844871e-08, 0.356799245, 4.77947726e-09, 0.99999994, 4.85416081e-08, -0.356799245, -4.36413572e-08, 0.934181511)
                CFrameMon = CFrame.new(-1520.92725, 195.658432, -12300.3184, -0.830619276, 8.0356088e-08, -0.556840897, -1.90049647e-08, 1, 1.72656073e-07, 0.556840897, 1.53994222e-07, -0.830619276)
            elseif Lv >= 2250  and Lv <= 2274 or SelectMonster == "Baking Staff [Lv. 2250]" then
                Ms = "Baking Staff [Lv. 2250]"
                NameQuest = "CakeQuest2"
                QuestLv = 1
                NameMon = "Baking Staff"
                CFrameQ = CFrame.new(-1927.58313, 37.7981453, -12843.8145, -0.961271644, -8.12611574e-07, 0.275603265, -7.71673683e-07, 1, 2.56976563e-07, -0.275603265, 3.43484281e-08, -0.961271644)
                CFrameMon = CFrame.new(-1917.79016, 157.941437, -12869.1377, 0.697629273, -8.53369329e-06, -0.716459036, 1.89624473e-06, 1, -1.00645202e-05, 0.716459036, 5.66272183e-06, 0.697629273)
            elseif Lv >= 2275 or SelectMonster == "Head Baker [Lv. 2275]" then
                Ms = "Head Baker [Lv. 2275]"
                NameQuest = "CakeQuest2"
                QuestLv = 2
                NameMon = "Head Baker"
                CFrameQ = CFrame.new(-1927.58313, 37.7981453, -12843.8145, -0.961271644, -8.12611574e-07, 0.275603265, -7.71673683e-07, 1, 2.56976563e-07, -0.275603265, 3.43484281e-08, -0.961271644)
                CFrameMon = CFrame.new(-2259.45142, 152.333252, -12800.2656, -0.261799961, -4.23144547e-06, 0.965122163, -1.22252038e-06, 1, 4.05274068e-06, -0.965122163, -1.18874169e-07, -0.261799961)
            end
        end
    end

    
spawn(function()
    pcall(function()
        while task.wait() do
            if Clip or _G.AutoFarm or AutoKaitan then
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(150000,150000,150000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            elseif _G.AutoFarm == false or _G.AutoSecondSea == false or _G.AutoSaber == false or _G.AutoSaberHop == false or _G.AutoPole == false or _G.AutoFarmBoss == false or _G.Clip == false then
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.BodyClip:Destroy()
                end
            end 
        end
    end)
end)
 
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if Clip or _G.AutoFarm or AutoKaitan then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Heartbeat:Connect(function()
            if Noclip then
				if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(150000,150000,150000)
                    Noclip.Velocity = Vector3.new(0,0,0)
             while true do 
                 wait(0.1) 
                 game:GetService('TweenService'):Create(
                     Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                 {Color = Color3.fromRGB(255, 0, 0)}):Play() 
                 wait(.5)
 
                 game:GetService('TweenService'):Create(
                     Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                 {Color = Color3.fromRGB(255, 155, 0)}):Play() 
                 wait(.5)
 
                 game:GetService('TweenService'):Create(
                     Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                 {Color = Color3.fromRGB(255, 255, 0)}):Play() 
                 wait(.5)
 
                 game:GetService('TweenService'):Create(
                     Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                 {Color = Color3.fromRGB(0, 255, 0)}):Play() 
                 wait(.5)
 
                 game:GetService('TweenService'):Create(
                     Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                 {Color = Color3.fromRGB(0, 255, 255)}):Play() 
                 wait(.5)
 
                 game:GetService('TweenService'):Create(
                     Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                 {Color = Color3.fromRGB(0, 155, 255)}):Play() 
                 wait(.5)
 
                 game:GetService('TweenService'):Create(
                     Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                 {Color = Color3.fromRGB(255, 0, 255)}):Play() 
                 wait(.5)
 
                 game:GetService('TweenService'):Create(
                     Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                 {Color = Color3.fromRGB(255, 0, 155)}):Play() 
                 wait(.5)
             end 
     elseif game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.BodyClip:Destroy()
         end
        end
    end)
 end)
end)

spawn(function()
    while true do game:GetService("RunService").RenderStepped:Wait()
        if Clip or _G.AutoFarm or AutoKaitan then
            if syn and  game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                setfflag("HumanoidParallelRemoveNoPhysics", "False")
                setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(7)
            end
        end
    end
end)

spawn(function()
    pcall(function()
        while game:GetService("RunService").Heartbeat:wait() do
            if Noclip or _G.AutoFarm or AutoKaitan then
                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
					if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity")
						Noclip.Name = "BodyClip"
						Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
						Noclip.MaxForce = Vector3.new(150000,150000,150000)
						Noclip.Velocity = Vector3.new(0,0,0)
             while true do 
                wait(0.1) 
                game:GetService('TweenService'):Create(
                    Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                {Color = Color3.fromRGB(255, 0, 0)}):Play() 
                wait(.5)

                game:GetService('TweenService'):Create(
                    Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                {Color = Color3.fromRGB(255, 155, 0)}):Play() 
                wait(.5)

                game:GetService('TweenService'):Create(
                    Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                {Color = Color3.fromRGB(255, 255, 0)}):Play() 
                wait(.5)

                game:GetService('TweenService'):Create(
                    Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                {Color = Color3.fromRGB(0, 255, 0)}):Play() 
                wait(.5)

                game:GetService('TweenService'):Create(
                    Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                {Color = Color3.fromRGB(0, 255, 255)}):Play() 
                wait(.5)

                game:GetService('TweenService'):Create(
                    Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                {Color = Color3.fromRGB(0, 155, 255)}):Play() 
                wait(.5)

                game:GetService('TweenService'):Create(
                    Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                {Color = Color3.fromRGB(255, 0, 255)}):Play() 
                wait(.5)

                game:GetService('TweenService'):Create(
                    Paertaiteen,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                {Color = Color3.fromRGB(255, 0, 155)}):Play() 
                wait(.5)
            end 
            elseif game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.BodyClip:Destroy()
			end
            end
		end
    end
end)
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoFarm or AutoKaitan then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

--distande Auto Farm

Type = 1
spawn(function()
    while wait(.1) do
        if Type == 1 then
            Farm_Mode = CFrame.new(0, 10,10)
        elseif Type == 2 then
            Farm_Mode = CFrame.new(0, 10,10)
        end
    end
end)

spawn(function()
    while wait(.1) do
        Type = 1
        wait(5)
        Type = 2
        wait(5)
    end
end)

pcall(function()
    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = false    
        end
    end
end)

spawn(function()
    while wait() do
        if Auto_Farm then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                MagnetActive = false
                CheckLevel()
                TP(CFrameQ)
                if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                    wait(1.1)
                    CheckLevel()
                    if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 20 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    else
                        TP(CFrameQ)
                    end
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                pcall(function()
                    CheckLevel()
                    if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Ms and v:FindFirstChild("Humanoid") then
                                if v.Humanoid.Health > 0 then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                                EquipWeapon(SelectToolWeapon)
                                                TP(v.HumanoidRootPart.CFrame * Farm_Mode)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
                                                PosMon = v.HumanoidRootPart.CFrame
                                                MagnetActive = true
                                            else
                                                MagnetActive = false    
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                            end
                                        else
                                            MagnetActive = false
                                            CheckLevel()
                                            TP(CFrameMon)
                                        end
                                    until not v.Parent or v.Humanoid.Health <= 0 or Auto_Farm == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end
                    else
                        MagnetActive = false
                        CheckLevel()
                        TP(CFrameMon)
                    end
                end)
            end
        end
    end
end)

spawn(function()
    while wait(.1) do
        if AutoBartilo then
            if game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                    if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Swan Pirate [Lv. 775]" then
                                pcall(function()
                                    repeat wait(.1)
                                        EquipWeapon(MiscFarmWeapon)
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,0))
                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                        PosMonBartilo = v.HumanoidRootPart.CFrame
                                        MagnetBatilo = true
                                    until not v.Parent or v.Humanoid.Health <= 0 or AutoBartilo == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    MagnetBatilo = false
                                end)
                            end
                        end
                    else
                        MagnetBatilo = false
                        TP(CFrame.new(1057.92761, 137.614319, 1242.08069))
                    end
                else
                    TP2(CFrame.new(-456.28952, 73.0200958, 299.895966))
                    if (Vector3.new(-456.28952, 73.0200958, 299.895966) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                    end
                end
            elseif game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                if QuestBartilo == nil then
                    TP2(CFrame.new(-456.28952, 73.0200958, 299.895966))
                end
                if (Vector3.new(-456.28952, 73.0200958, 299.895966) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                    wait(1.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                    QuestBartilo = 1
                end
                if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Jeremy [Lv. 850] [Boss]" then
                            repeat wait(.1)
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                EquipWeapon(MiscFarmWeapon)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,6))
                                game:GetService'VirtualUser':CaptureController()
                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                            until not v.Parent or v.Humanoid.Health <= 0 or AutoBartilo == false
                        end
                    end
                else
                    if QuestBartilo == 1 then
                        TP(CFrame.new(1931.5931396484, 402.67391967773, 956.52215576172))
                    end
                end
            elseif game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                TP2(game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1.CFrame)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8.CFrame
                wait(1)
            end
        end 
    end
end)

warn("AFK")
local value = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

function Click()
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

function AutoHaki()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        local args = {
            [1] = "Buso"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end

spawn(function()
    while wait() do
        pcall(function()
            CheckLevel()
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _G.AutoFarm and MagnetActive and Magnet then
                    if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if v.Name == "Factory Staff [Lv. 800]" then
                            if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 250 then
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.HumanoidRootPart.CFrame = PosMon
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
                        elseif v.Name == Ms then
                            if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 400 then
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.HumanoidRootPart.CFrame = PosMon
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                    end
                elseif FarmMasteryFruit and MasteryBFMagnetActive and MasteryMagnet then
                    if v.Name == "Monkey [Lv. 14]" then
                        if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 then
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    elseif v.Name == "Factory Staff [Lv. 800]" then
                        if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 then
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    elseif v.Name == Ms then
                        if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 400 then
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                elseif FarmMasteryGun and MasteryGunMagnetActive and MasteryMagnet then
                    if v.Name == "Monkey [Lv. 14]" then
                        if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 then
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = PosMonMasteryGun
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    elseif v.Name == "Factory Staff [Lv. 800]" then
                        if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 then
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = PosMonMasteryGun
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    elseif v.Name == Ms then
                        if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 400 then
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = PosMonMasteryGun
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                elseif AutoBartilo and MagnetBatilo and Magnet then
                    if v.Name == "Swan Pirate [Lv. 775]" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = PosMonBartilo
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                elseif AutoRengoku and RengokuMagnet and Magnet then
                    if (v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Arctic Warrior [Lv. 1350]") and (v.HumanoidRootPart.Position - PosMonRengoku.Position).Magnitude <= 350 then
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = PosMonRengoku
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                elseif Auto_Bone and BoneMagnet and Magnet then
                    if (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and (v.HumanoidRootPart.Position - MainMonBone.Position).Magnitude <= 300 then
                        v.HumanoidRootPart.CFrame = MainMonBone
                        v.Humanoid.JumpPower = 0
                        v.Humanoid.WalkSpeed = 0
                        v.HumanoidRootPart.CanCollide = false
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						v.Humanoid:ChangeState(11)
                    end
                elseif Auto_Candy and CandyMagnet and Magnet then
                    if (v.Name == "Peanut Scout [Lv. 2075]" or v.Name == "Peanut President [Lv. 2100]" or v.Name == "Ice Cream Chef [Lv. 2125]" or v.Name == "Posessed Mummy [Lv. 2050]") and (v.HumanoidRootPart.Position - MainCandy.Position).Magnitude <= 300 then
                        v.HumanoidRootPart.CFrame = MainCandy
                        v.Humanoid.JumpPower = 0
                        v.Humanoid.WalkSpeed = 0
                        v.HumanoidRootPart.CanCollide = false
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						v.Humanoid:ChangeState(11)
                    end
                elseif Auto_Beli and BeliMagnet and Magnet then
                    if (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and (v.HumanoidRootPart.Position - MainBeli.Position).Magnitude <= 300 then
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = MainBeli
                        v.Humanoid.JumpPower = 0
                        v.Humanoid.WalkSpeed = 0
                        v.HumanoidRootPart.CanCollide = false
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						v.Humanoid:ChangeState(11)
                    end
                elseif AutoEcto and EctoplasMagnet and Magnet then
                    if string.find(v.Name, "Ship") and (v.HumanoidRootPart.Position - PosMonEctoplas.Position).Magnitude <= 300 then
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = PosMonEctoplas
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                elseif AutoEvoRace and EvoMagnet and Magnet then
                    if v.Name == "Zombie [Lv. 950]" and (v.HumanoidRootPart.Position - PosMonZombie.Position).Magnitude <= 300 then
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = PosMonZombie
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                elseif AutoCitizen and CitizenMagnet and Magnet then
                    if v.Name == "Forest Pirate [Lv. 1825]" and (v.HumanoidRootPart.Position - PosMonCitizen.Position).Magnitude <= 300 then
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = PosMonZombie
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                 elseif AutoCitizen and CitizenMagnet and Magnet then
                    if v.Name == "Forest Pirate [Lv. 1825]" and (v.HumanoidRootPart.Position - PosMonCitizen.Position).Magnitude <= 300 then
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = PosMonZombie
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                elseif AutoFarmSelectMonster and AutoFarmSelectMonsterMagnet and Magnet then
                    if v.Name == Ms and (v.HumanoidRootPart.Position - PosMonSelectMonster.Position).Magnitude <= 400 then
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = PosMonSelectMonster
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end
        end)
    end
end)

if AutoKaitan then
    CheckBarto = vu
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Warrior Helmet") then
        Success = true
    elseif game.Players.LocalPlayer.Character:FindFirstChild("Warrior Helmet") then
        Success = true
    end
    if Success and CheckBarto == true then
        print("success ok")
    elseif CheckBarto == true and MiscFarmWeapon == "" then
        print("fuck you")
    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 and CheckBarto == true then
        print("success ok")
    else
        AutoBartilo = vu
        if vu == false then
            wait(1)
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end
end

PlayerName = {}
for i,v in pairs(game.Players:GetChildren()) do  
	table.insert(PlayerName ,v.Name)
end
function isnil(thing)
	return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

_G.loopMemayDi = true

local updateStatus = coroutine.create(function() -- ngu qua ma. huuh
    while _G.loopMemayDi do
        AutoHaki()
        wait(0.1)
    end
end)

coroutine.resume(updateStatus)

local url = DCSettings["WebhookUrl"]

spawn(function()
	while DCSettings["Enabled"] do
        local newdata = game:GetService("HttpService"):JSONEncode(data)
        local headers = {["content-type"] = "application/json"}
        request = http_request or request or HttpPost or syn.request
        local webhook = {Url = url, Body = newdata, Method = "POST", Headers = headers}
        request(webhook)
        wait(DCSettings["Time"])
	end
end)

spawn(function()
	while wait() do
		if FSSettings["BuySwords"] then
            local itemNames = {"Cutlass", "Katana", "Iron Mace", "Duel Katana", "Triple Katana", "Pipe", "Dual-Headed Blade", "Bisento", "Soul Cane", "Slingshot", "Musket", "Flintlock", "Refined Flintlock", "Cannon"}
            local replicatedStorage = game:GetService("ReplicatedStorage")
            local remoteCommF = replicatedStorage.Remotes.CommF_

            for _, itemName in ipairs(itemNames) do
                remoteCommF:InvokeServer("BuyItem", itemName)
            end
        end 
	end
end)

spawn(function()
	while wait() do
		if FSSettings["BuyAccessories"] then
            local itemNames = {"Black Cape", "Tomoe", "Swordsman Hat"}
            local replicatedStorage = game:GetService("ReplicatedStorage")
            local remoteCommF = replicatedStorage.Remotes.CommF_

            for _, itemName in ipairs(itemNames) do
                remoteCommF:InvokeServer("BuyItem", itemName)
            end
        end 
	end
end)

print("dit me legitterium. skid ngu vai cut - thuy")

_G.thuybuy = true

task.spawn(function()
    local player = game:GetService("Players").LocalPlayer
    local beli = player.Data.Beli
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local commF = replicatedStorage.Remotes.CommF_

    while wait() do
        if _G.thuybuy then
            local function buyHaki(hakiType)
                local args = {
                    [1] = "BuyHaki",
                    [2] = hakiType
                }
                commF:InvokeServer(unpack(args))
            end
            
            local function buyKenTalk(action)
                local args = {
                    [1] = "KenTalk",
                    [2] = action
                }
                commF:InvokeServer(unpack(args))
            end

            if beli.Value >= 300000 and beli.Value < 750000 then
                buyHaki("Buso")
                buyHaki("Geppo")
                buyHaki("Soru")
            elseif beli.Value >= 750000 then
                buyKenTalk("Start")
                buyKenTalk("Buy")
            end
        end
    end
end)

if _G.FPSBoost then
    local lighting = game.Lighting
    lighting.GlobalShadows = false
    lighting.FogStart = 0
    lighting.FogEnd = 0
    lighting.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"

    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
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
        end
    end

    for _,e in pairs(lighting:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end

local Client = game.Players.LocalPlayer
local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
if not shared.orl then shared.orl = STOPRL.wrapAttackAnimationAsync end
if not shared.cpc then shared.cpc = STOP.play end
while task.wait() do
				STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
					local Hits = STOPRL.getBladeHits(b,c,d)
					if Hits then
						STOP.play = function() end
						a:Play(0.01,0.01,0.01)
						func(Hits)
						STOP.play = shared.cpc
						wait(a.length * 0.5)
						a:Stop()
					end
				end
end
