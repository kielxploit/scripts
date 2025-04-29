local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/kielxploit/scripts/refs/heads/main/redzlibmodified"))()

local Window = redzlib:MakeWindow({
    Title = "Palku Hub : Blox Fruits",
    SubTitle = "by kielxploit",
    SaveFolder = "palku hub"
  })

  Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://71014873973869", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 1) },
})

local infotab = Window:MakeTab({"Info",""})
local maintab = Window:MakeTab({"Main", ""})
local subfarmtab = Window:MakeTa({"SubFarm", ""})
local settingstab = Window:MakeTab({"Settings", ""})
local itemtab = Window:MakeTa({"Item", ""})
local statstab = Window:MakeTab({"Stats", ""})
local combat = Window:MakeTa({"Combat", ""})
local espraidtab = Window:MakeTa({"Esp/Raid", ""})
local racetab = Window:MakeTab({"Race", ""})
local teleporttab = Window:MakeTab({"Teleport", ""})
local shoptab = Window:MakeTa({"Shop", ""})
local fruittab = Window:MakeTab({"Fruit", ""})
local misctab = Window:MakeTa({"Misc", ""})

Window:SelectTab(infotab)

_G.Settings = {
	Main = {
		["Select Weapon"] = "Melee",
		["Farm Level Method"] = "Quest",
		["Auto Farm"] = false,
		["Auto Fast Farm"] = false,
		["Mastery Method"] = "Quest",
		["Auto Farm Fruit Mastery"] = false,
		["Auto Farm Gun Mastery"] = false,
		["Selected Mastery Sword"] = nil,
		["Auto Farm Sword Mastery"] = false,
		["Auto Summon Tyrant Of The Skies"] = false,
		["Auto Kill Tyrant Of The Skies"] = false,
		["Selected Mon"] = nil,
		["Auto Farm Mon"] = false,
		["Selected Boss"] = nil,
		["Auto Farm Boss"] = false,
		["Auto Farm All Boss"] = false
	},
	Event = {},
	Farm = {
		["Auto Elite Hunter"] = false,
		["Auto Elite Hunter Hop"] = false,
		["Selected Bone Farm Method"] = "Quest",
		["Auto Farm Bone"] = false,
		["Auto Random Surprise"] = false,
		["Auto Pirate Raid"] = false,
		["Auto Farm Chest Tween"] = false,
		["Auto Farm Chest Instant"] = false,
		["Auto Chest Hop"] = false,
		["Auto Farm Chest Mirage"] = false,
		["Auto Stop Items"] = false,
		["Auto Farm Katakuri"] = false,
		["Auto Spawn Cake Prince"] = false,
		["Auto Kill Cake Prince"] = false,
		["Auto Kill Dough King"] = false,
		["Selected Material"] = nil,
		["Auto Farm Material"] = false
	},
	Setting = {
		["Spin Position"] = false,
		["Farm Distance"] = 35,
		["Player Tween Speed"] = 350,
		["Bring Mob"] = true,
		["Bring Mob Mode"] = "Normal",
		["Fast Attack"] = true,
		["Fast Attack Mode"] = "Normal",
		["Attack Aura"] = true,
		["Hide Notification"] = false,
		["Hide Damage Text"] = true,
		["Black Screen"] = false,
		["White Screen"] = false,
		["Hide Monster"] = false,
		["Mastery Health"] = 25,
		["Fruit Mastery Skill Z"] = true,
		["Fruit Mastery Skill X"] = true,
		["Fruit Mastery Skill C"] = true,
		["Fruit Mastery Skill V"] = false,
		["Fruit Mastery Skill F"] = false,
		["Gun Mastery Skill Z"] = true,
		["Gun Mastery Skill X"] = true,
		["Auto Set Spawn Point"] = true,
		["Auto Observation"] = false,
		["Auto Haki"] = true,
		["Auto Rejoin"] = true
	},
	Stats = {
		["Auto Add Melee Stats"] = false,
		["Auto Add Defense Stats"] = false,
		["Auto Add Devil Fruit Stats"] = false,
		["Auto Add Sword Stats"] = false,
		["Auto Add Gun Stats"] = false,
		["Point Stats"] = 1
	},
	Items = {
		["Auto Second Sea"] = false,
		["Auto Third Sea"] = false,
		["Auto Farm Factory"] = false,
		["Auto Super Human"] = false,
		["Auto Death Step"] = false,
		["Auto Fishman Karate"] = false,
		["Auto Electric Claw"] = false,
		["Auto Dragon Talon"] = false,
		["Auto God Human"] = false,
		["Auto Saber"] = false,
		["Auto Buddy Sword"] = false,
		["Auto Soul Guitar"] = false,
		["Auto Rengoku"] = false,
		["Auto Hallow Scythe"] = false,
		["Auto Warden Sword"] = false,
		["Auto Cursed Dual Katana"] = false,
		["Auto Yama"] = false,
		["Auto Tushita"] = false,
		["Auto Canvander"] = false,
		["Auto Dragon Trident"] = false,
		["Auto Pole"] = false,
		["Auto Shawk Saw"] = false,
		["Auto Greybeard"] = false,
		["Auto Swan Glasses"] = false,
		["Auto Arena Trainer"] = false,
		["Auto Dark Dagger"] = false,
		["Auto Press Haki Button"] = false,
		["Auto Rainbow Haki"] = false,
		["Auto Holy Torch"] = false,
		["Auto Bartilo Quest"] = false
	},
	Esp = {
		["ESP Player"] = false,
		["ESP Chest"] = false,
		["ESP DevilFruit"] = false,
		["ESP RealFruit"] = false,
		["ESP Flower"] = false,
		["ESP Island"] = false,
		["ESP Npc"] = false,
		["ESP Sea Beast"] = false,
		["ESP Monster"] = false,
		["ESP Mirage"] = false,
		["ESP Kitsune"] = false,
		["ESP Frozen"] = false,
		["ESP Advanced Fruit Dealer"] = false,
		["ESP Aura"] = false,
		["ESP Gear"] = false
	},
	DragonDojo = {
		["Auto Farm Blaze Ember"] = false,
		["Auto Collect Blaze Ember"] = false
	},
	SeaEvent = {
		["Selected Boat"] = "Guardian",
		["Selected Zone"] = "Zone 5",
		["Boat Tween Speed"] = 300,
		["Sail Boat"] = false,
		["Auto Farm Shark"] = true,
		["Auto Farm Piranha"] = true,
		["Auto Farm Fish Crew Member"] = true,
		["Auto Farm Ghost Ship"] = true,
		["Auto Farm Pirate Brigade"] = true,
		["Auto Farm Pirate Grand Brigade"] = true,
		["Auto Farm Terrorshark"] = true,
		["Auto Farm Seabeasts"] = true,
		["Dodge Seabeasts Attack"] = true,
		["Dodge Terrorshark Attack"] = true
	},
	SettingSea = {
		Lightning = false,
		["Increase Boat Speed"] = false,
		["No Clip Rock"] = false,
		["Use Devil Fruit Skill"] = true,
		["Use Melee Skill"] = true,
		["Use Sword Skill"] = true,
		["Use Gun Skill"] = true,
		["Devil Fruit Z Skill"] = true,
		["Devil Fruit X Skill"] = true,
		["Devil Fruit C Skill"] = true,
		["Devil Fruit V Skill"] = false,
		["Devil Fruit F Skill"] = false,
		["Melee Z Skill"] = true,
		["Melee X Skill"] = true,
		["Melee C Skill"] = true,
		["Melee V Skill"] = true
	},
	SeaStack = {
		["Tween To Frozen Dimension"] = false,
		["Summon Frozen Dimension"] = false,
		["Tween To Kitsune Island"] = false,
		["Summon Kitsune Island"] = false,
		["Auto Collect Azure Ember"] = false,
		["Set Azure Ember"] = 20,
		["Auto Trade Azure Ember"] = false,
		["Tween To Mirage Island"] = false,
		["Teleport To Advanced Fruit Dealer"] = false,
		["Auto Attack Seabeasts"] = false,
		["Summon Prehistoric Island"] = false,
		["Tween To Prehistoric Island"] = false,
		["Auto Kill Lava Golem"] = false
	},
	Race = {
		["Auto Race V2"] = false,
		["Auto Race V3"] = false,
		["Selected Place"] = nil,
		["Teleport To Place"] = false,
		["Auto Buy Gear"] = false,
		["Tween To Highest Mirage"] = false,
		["Find Blue Gear"] = false,
		["Look Moon Ability"] = false,
		["Auto Train"] = false,
		["Auto Kill Player After Trial"] = false,
		["Auto Trial"] = false
	},
	Combat = {
		["Auto Kill Player Quest"] = false,
		["Aimbot Gun"] = false,
		["Aimbot Skill Neares"] = false,
		["Aimbot Skill"] = false,
		["Enable PvP"] = false
	},
	Raid = {
		["Selected Chip"] = nil,
		["Auto Raid"] = false,
		["Auto Awaken"] = false,
		["Price Devil Fruit"] = 1000000,
		["Unstore Devil Fruit"] = false,
		["Law Raid"] = false
	},
	Shop = {
		["Auto Buy Legendary Sword"] = false,
		["Auto Buy Haki Color"] = false
	},
	LocalPlayer = {
		["Infinite Energy"] = false,
		["Infinite Ability"] = true,
		["Infinite Geppo"] = false,
		["Infinite Soru"] = false,
		["Dodge No Cooldown"] = false,
		["Active Race V3"] = false,
		["Active Race V4"] = true,
		["Walk On Water"] = true,
		["No Clip"] = false
	},
	Fruit = {
		["Auto Buy Random Fruit"] = false,
		["Store Rarity Fruit"] = "Common - Mythical",
		["Auto Store Fruit"] = false,
		["Fruit Notification"] = false,
		["Teleport To Fruit"] = false,
		["Tween To Fruit"] = false
	},
	Misc = {
		["Hide Chat"] = false,
		["Hide Leaderboard"] = false,
		["Highlight Mode"] = false
	}
};
(getgenv()).Load = function()
	if readfile and writefile and isfile and isfolder then
		if not isfolder("Palku Hub New") then
			makefolder("Palku Hub New");
		end;
		if not isfolder("Palku Hub New/Blox Fruits/") then
			makefolder("Palku Hub New/Blox Fruits/");
		end;
		if not isfile(("Palku Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json")) then
			writefile("Palku Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", (game:GetService("HttpService")):JSONEncode(_G.Settings));
		else
			local Decode = (game:GetService("HttpService")):JSONDecode(readfile("Palku Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"));
			for i, v in pairs(Decode) do
				_G.Settings[i] = v;
			end;
		end;
		print("Loaded!");
	else
		return warn("Status : Undetected Executor");
	end;
end;
(getgenv()).SaveSetting = function()
	if readfile and writefile and isfile and isfolder then
		if not isfile(("Palku Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json")) then
			(getgenv()).Load();
		else
			local Decode = (game:GetService("HttpService")):JSONDecode(readfile("Palku Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"));
			local Array = {};
			for i, v in pairs(_G.Settings) do
				Array[i] = v;
			end;
			writefile("Palku Hub New/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", (game:GetService("HttpService")):JSONEncode(Array));
		end;
	else
		return warn("Status : Undetected Executor");
	end;
end;
(getgenv()).Load();
if game.PlaceId == 2753915549 then
	World1 = true;
elseif game.PlaceId == 4442272183 then
	World2 = true;
elseif game.PlaceId == 7449423635 then
	World3 = true;
end;
function CheckQuest()
	MyLevel = (game:GetService("Players")).LocalPlayer.Data.Level.Value;
	if World1 then
		if MyLevel == 1 or MyLevel <= 9 then
			Mon = "Bandit";
			LevelQuest = 1;
			NameQuest = "BanditQuest1";
			NameMon = "Bandit";
			CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544);
			CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125);
		elseif MyLevel == 10 or MyLevel <= 14 then
			Mon = "Monkey";
			LevelQuest = 1;
			NameQuest = "JungleQuest";
			NameMon = "Monkey";
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0);
			CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209);
		elseif MyLevel == 15 or MyLevel <= 29 then
			Mon = "Gorilla";
			LevelQuest = 2;
			NameQuest = "JungleQuest";
			NameMon = "Gorilla";
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0);
			CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875);
		elseif MyLevel == 30 or MyLevel <= 39 then
			Mon = "Pirate";
			LevelQuest = 1;
			NameQuest = "BuggyQuest1";
			NameMon = "Pirate";
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627);
			CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125);
		elseif MyLevel == 40 or MyLevel <= 59 then
			Mon = "Brute";
			LevelQuest = 2;
			NameQuest = "BuggyQuest1";
			NameMon = "Brute";
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627);
			CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875);
		elseif MyLevel == 60 or MyLevel <= 74 then
			Mon = "Desert Bandit";
			LevelQuest = 1;
			NameQuest = "DesertQuest";
			NameMon = "Desert Bandit";
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693);
			CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375);
		elseif MyLevel == 75 or MyLevel <= 89 then
			Mon = "Desert Officer";
			LevelQuest = 2;
			NameQuest = "DesertQuest";
			NameMon = "Desert Officer";
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693);
			CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875);
		elseif MyLevel == 90 or MyLevel <= 99 then
			Mon = "Snow Bandit";
			LevelQuest = 1;
			NameQuest = "SnowQuest";
			NameMon = "Snow Bandit";
			CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685);
			CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125);
		elseif MyLevel == 100 or MyLevel <= 119 then
			Mon = "Snowman";
			LevelQuest = 2;
			NameQuest = "SnowQuest";
			NameMon = "Snowman";
			CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685);
			CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625);
		elseif MyLevel == 120 or MyLevel <= 149 then
			Mon = "Chief Petty Officer";
			LevelQuest = 1;
			NameQuest = "MarineQuest2";
			NameMon = "Chief Petty Officer";
			CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625);
		elseif MyLevel == 150 or MyLevel <= 174 then
			Mon = "Sky Bandit";
			LevelQuest = 1;
			NameQuest = "SkyQuest";
			NameMon = "Sky Bandit";
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268);
			CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625);
		elseif MyLevel == 175 or MyLevel <= 189 then
			Mon = "Dark Master";
			LevelQuest = 2;
			NameQuest = "SkyQuest";
			NameMon = "Dark Master";
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268);
			CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625);
		elseif MyLevel == 190 or MyLevel <= 209 then
			Mon = "Prisoner";
			LevelQuest = 1;
			NameQuest = "PrisonerQuest";
			NameMon = "Prisoner";
			CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -0.00000000500292918, -0.995993316, 0.00000000160817859, 1, -0.00000000516744869, 0.995993316, -0.00000000206384709, -0.0894274712);
			CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781);
		elseif MyLevel == 210 or MyLevel <= 249 then
			Mon = "Dangerous Prisoner";
			LevelQuest = 2;
			NameQuest = "PrisonerQuest";
			NameMon = "Dangerous Prisoner";
			CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -0.00000000500292918, -0.995993316, 0.00000000160817859, 1, -0.00000000516744869, 0.995993316, -0.00000000206384709, -0.0894274712);
			CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375);
		elseif MyLevel == 250 or MyLevel <= 274 then
			Mon = "Toga Warrior";
			LevelQuest = 1;
			NameQuest = "ColosseumQuest";
			NameMon = "Toga Warrior";
			CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298);
			CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625);
		elseif MyLevel == 275 or MyLevel <= 299 then
			Mon = "Gladiator";
			LevelQuest = 2;
			NameQuest = "ColosseumQuest";
			NameMon = "Gladiator";
			CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298);
			CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625);
		elseif MyLevel == 300 or MyLevel <= 324 then
			Mon = "Military Soldier";
			LevelQuest = 1;
			NameQuest = "MagmaQuest";
			NameMon = "Military Soldier";
			CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469);
			CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875);
		elseif MyLevel == 325 or MyLevel <= 374 then
			Mon = "Military Spy";
			LevelQuest = 2;
			NameQuest = "MagmaQuest";
			NameMon = "Military Spy";
			CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469);
			CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375);
		elseif MyLevel == 375 or MyLevel <= 399 then
			Mon = "Fishman Warrior";
			LevelQuest = 1;
			NameQuest = "FishmanQuest";
			NameMon = "Fishman Warrior";
			CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
			CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
			end;
		elseif MyLevel == 400 or MyLevel <= 449 then
			Mon = "Fishman Commando";
			LevelQuest = 2;
			NameQuest = "FishmanQuest";
			NameMon = "Fishman Commando";
			CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
			CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
			end;
		elseif MyLevel == 450 or MyLevel <= 474 then
			Mon = "God's Guard";
			LevelQuest = 1;
			NameQuest = "SkyExp1Quest";
			NameMon = "God's Guard";
			CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859);
			CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688));
			end;
		elseif MyLevel == 475 or MyLevel <= 524 then
			Mon = "Shanda";
			LevelQuest = 2;
			NameQuest = "SkyExp1Quest";
			NameMon = "Shanda";
			CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998);
			CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047));
			end;
		elseif MyLevel == 525 or MyLevel <= 549 then
			Mon = "Royal Squad";
			LevelQuest = 1;
			NameQuest = "SkyExp2Quest";
			NameMon = "Royal Squad";
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875);
		elseif MyLevel == 550 or MyLevel <= 624 then
			Mon = "Royal Soldier";
			LevelQuest = 2;
			NameQuest = "SkyExp2Quest";
			NameMon = "Royal Soldier";
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625);
		elseif MyLevel == 625 or MyLevel <= 649 then
			Mon = "Galley Pirate";
			LevelQuest = 1;
			NameQuest = "FountainQuest";
			NameMon = "Galley Pirate";
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381);
			CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875);
		elseif MyLevel >= 650 then
			Mon = "Galley Captain";
			LevelQuest = 2;
			NameQuest = "FountainQuest";
			NameMon = "Galley Captain";
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381);
			CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375);
		end;
	elseif World2 then
		if MyLevel == 700 or MyLevel <= 724 then
			Mon = "Raider";
			LevelQuest = 1;
			NameQuest = "Area1Quest";
			NameMon = "Raider";
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985);
			CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125);
		elseif MyLevel == 725 or MyLevel <= 774 then
			Mon = "Mercenary";
			LevelQuest = 2;
			NameQuest = "Area1Quest";
			NameMon = "Mercenary";
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985);
			CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625);
		elseif MyLevel == 775 or MyLevel <= 799 then
			Mon = "Swan Pirate";
			LevelQuest = 1;
			NameQuest = "Area2Quest";
			NameMon = "Swan Pirate";
			CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906);
			CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625);
		elseif MyLevel == 800 or MyLevel <= 874 then
			Mon = "Factory Staff";
			NameQuest = "Area2Quest";
			LevelQuest = 2;
			NameMon = "Factory Staff";
			CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 0.000000000896074881, -0.999488771, 0.000000000136326533, 1, 0.000000000892172336, 0.999488771, -0.000000000107732087, -0.0319722369);
			CFrameMon = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875);
		elseif MyLevel == 875 or MyLevel <= 899 then
			Mon = "Marine Lieutenant";
			LevelQuest = 1;
			NameQuest = "MarineQuest3";
			NameMon = "Marine Lieutenant";
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268);
			CFrameMon = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125);
		elseif MyLevel == 900 or MyLevel <= 949 then
			Mon = "Marine Captain";
			LevelQuest = 2;
			NameQuest = "MarineQuest3";
			NameMon = "Marine Captain";
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268);
			CFrameMon = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625);
		elseif MyLevel == 950 or MyLevel <= 974 then
			Mon = "Zombie";
			LevelQuest = 1;
			NameQuest = "ZombieQuest";
			NameMon = "Zombie";
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146);
			CFrameMon = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875);
		elseif MyLevel == 975 or MyLevel <= 999 then
			Mon = "Vampire";
			LevelQuest = 2;
			NameQuest = "ZombieQuest";
			NameMon = "Vampire";
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146);
			CFrameMon = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625);
		elseif MyLevel == 1000 or MyLevel <= 1049 then
			Mon = "Snow Trooper";
			LevelQuest = 1;
			NameQuest = "SnowMountainQuest";
			NameMon = "Snow Trooper";
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106);
			CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875);
		elseif MyLevel == 1050 or MyLevel <= 1099 then
			Mon = "Winter Warrior";
			LevelQuest = 2;
			NameQuest = "SnowMountainQuest";
			NameMon = "Winter Warrior";
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106);
			CFrameMon = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625);
		elseif MyLevel == 1100 or MyLevel <= 1124 then
			Mon = "Lab Subordinate";
			LevelQuest = 1;
			NameQuest = "IceSideQuest";
			NameMon = "Lab Subordinate";
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578);
			CFrameMon = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375);
		elseif MyLevel == 1125 or MyLevel <= 1174 then
			Mon = "Horned Warrior";
			LevelQuest = 2;
			NameQuest = "IceSideQuest";
			NameMon = "Horned Warrior";
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578);
			CFrameMon = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375);
		elseif MyLevel == 1175 or MyLevel <= 1199 then
			Mon = "Magma Ninja";
			LevelQuest = 1;
			NameQuest = "FireSideQuest";
			NameMon = "Magma Ninja";
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
			CFrameMon = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375);
		elseif MyLevel == 1200 or MyLevel <= 1249 then
			Mon = "Lava Pirate";
			LevelQuest = 2;
			NameQuest = "FireSideQuest";
			NameMon = "Lava Pirate";
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
			CFrameMon = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875);
		elseif MyLevel == 1250 or MyLevel <= 1274 then
			Mon = "Ship Deckhand";
			LevelQuest = 1;
			NameQuest = "ShipQuest1";
			NameMon = "Ship Deckhand";
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016);
			CFrameMon = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif MyLevel == 1275 or MyLevel <= 1299 then
			Mon = "Ship Engineer";
			LevelQuest = 2;
			NameQuest = "ShipQuest1";
			NameMon = "Ship Engineer";
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016);
			CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif MyLevel == 1300 or MyLevel <= 1324 then
			Mon = "Ship Steward";
			LevelQuest = 1;
			NameQuest = "ShipQuest2";
			NameMon = "Ship Steward";
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125);
			CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif MyLevel == 1325 or MyLevel <= 1349 then
			Mon = "Ship Officer";
			LevelQuest = 2;
			NameQuest = "ShipQuest2";
			NameMon = "Ship Officer";
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125);
			CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif MyLevel == 1350 or MyLevel <= 1374 then
			Mon = "Arctic Warrior";
			LevelQuest = 1;
			NameQuest = "FrostQuest";
			NameMon = "Arctic Warrior";
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909);
			CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125);
			if _G.Settings.Main["Auto Farm"] and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422));
			end;
		elseif MyLevel == 1375 or MyLevel <= 1424 then
			Mon = "Snow Lurker";
			LevelQuest = 2;
			NameQuest = "FrostQuest";
			NameMon = "Snow Lurker";
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909);
			CFrameMon = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375);
		elseif MyLevel == 1425 or MyLevel <= 1449 then
			Mon = "Sea Soldier";
			LevelQuest = 1;
			NameQuest = "ForgottenQuest";
			NameMon = "Sea Soldier";
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376);
			CFrameMon = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125);
		elseif MyLevel >= 1450 then
			Mon = "Water Fighter";
			LevelQuest = 2;
			NameQuest = "ForgottenQuest";
			NameMon = "Water Fighter";
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376);
			CFrameMon = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875);
		end;
	elseif World3 then
		if MyLevel == 1500 or MyLevel <= 1524 then
			Mon = "Pirate Millionaire";
			LevelQuest = 1;
			NameQuest = "PiratePortQuest";
			NameMon = "Pirate Millionaire";
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627);
			CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375);
		elseif MyLevel == 1525 or MyLevel <= 1574 then
			Mon = "Pistol Billionaire";
			LevelQuest = 2;
			NameQuest = "PiratePortQuest";
			NameMon = "Pistol Billionaire";
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627);
			CFrameMon = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875);
		elseif MyLevel == 1575 or MyLevel <= 1599 then
			Mon = "Dragon Crew Warrior";
			LevelQuest = 1;
			NameQuest = "AmazonQuest";
			NameMon = "Dragon Crew Warrior";
			CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359);
			CFrameMon = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625);
		elseif MyLevel == 1600 or MyLevel <= 1624 then
			Mon = "Dragon Crew Archer [Lv. 1600]";
			NameQuest = "AmazonQuest";
			LevelQuest = 2;
			NameMon = "Dragon Crew Archer";
			CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375);
			CFrameMon = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125);
		elseif MyLevel == 1625 or MyLevel <= 1649 then
			Mon = "Female Islander";
			NameQuest = "AmazonQuest2";
			LevelQuest = 1;
			NameMon = "Female Islander";
			CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422);
			CFrameMon = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312);
		elseif MyLevel == 1650 or MyLevel <= 1699 then
			Mon = "Giant Islander [Lv. 1650]";
			NameQuest = "AmazonQuest2";
			LevelQuest = 2;
			NameMon = "Giant Islander";
			CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422);
			CFrameMon = CFrame.new(4729.09423828125, 590.436767578125, -36.97627639770508);
		elseif MyLevel == 1700 or MyLevel <= 1724 then
			Mon = "Marine Commodore";
			LevelQuest = 1;
			NameQuest = "MarineTreeIsland";
			NameMon = "Marine Commodore";
			CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747);
			CFrameMon = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125);
		elseif MyLevel == 1725 or MyLevel <= 1774 then
			Mon = "Marine Rear Admiral [Lv. 1725]";
			NameMon = "Marine Rear Admiral";
			NameQuest = "MarineTreeIsland";
			LevelQuest = 2;
			CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813);
			CFrameMon = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125);
		elseif MyLevel == 1775 or MyLevel <= 1799 then
			Mon = "Fishman Raider";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland3";
			NameMon = "Fishman Raider";
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
			CFrameMon = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625);
		elseif MyLevel == 1800 or MyLevel <= 1824 then
			Mon = "Fishman Captain";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland3";
			NameMon = "Fishman Captain";
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
			CFrameMon = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625);
		elseif MyLevel == 1825 or MyLevel <= 1849 then
			Mon = "Forest Pirate";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland";
			NameMon = "Forest Pirate";
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247);
			CFrameMon = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625);
		elseif MyLevel == 1850 or MyLevel <= 1899 then
			Mon = "Mythological Pirate";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland";
			NameMon = "Mythological Pirate";
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247);
			CFrameMon = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125);
		elseif MyLevel == 1900 or MyLevel <= 1924 then
			Mon = "Jungle Pirate";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland2";
			NameMon = "Jungle Pirate";
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002);
			CFrameMon = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625);
		elseif MyLevel == 1925 or MyLevel <= 1974 then
			Mon = "Musketeer Pirate";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland2";
			NameMon = "Musketeer Pirate";
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002);
			CFrameMon = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375);
		elseif MyLevel == 1975 or MyLevel <= 1999 then
			Mon = "Reborn Skeleton";
			LevelQuest = 1;
			NameQuest = "HauntedQuest1";
			NameMon = "Reborn Skeleton";
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0);
			CFrameMon = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625);
		elseif MyLevel == 2000 or MyLevel <= 2024 then
			Mon = "Living Zombie";
			LevelQuest = 2;
			NameQuest = "HauntedQuest1";
			NameMon = "Living Zombie";
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0);
			CFrameMon = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875);
		elseif MyLevel == 2025 or MyLevel <= 2049 then
			Mon = "Demonic Soul";
			LevelQuest = 1;
			NameQuest = "HauntedQuest2";
			NameMon = "Demonic Soul";
			CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625);
		elseif MyLevel == 2050 or MyLevel <= 2074 then
			Mon = "Posessed Mummy";
			LevelQuest = 2;
			NameQuest = "HauntedQuest2";
			NameMon = "Posessed Mummy";
			CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625);
		elseif MyLevel == 2075 or MyLevel <= 2099 then
			Mon = "Peanut Scout";
			LevelQuest = 1;
			NameQuest = "NutsIslandQuest";
			NameMon = "Peanut Scout";
			CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875);
		elseif MyLevel == 2100 or MyLevel <= 2124 then
			Mon = "Peanut President";
			LevelQuest = 2;
			NameQuest = "NutsIslandQuest";
			NameMon = "Peanut President";
			CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875);
		elseif MyLevel == 2125 or MyLevel <= 2149 then
			Mon = "Ice Cream Chef";
			LevelQuest = 1;
			NameQuest = "IceCreamIslandQuest";
			NameMon = "Ice Cream Chef";
			CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125);
		elseif MyLevel == 2150 or MyLevel <= 2199 then
			Mon = "Ice Cream Commander";
			LevelQuest = 2;
			NameQuest = "IceCreamIslandQuest";
			NameMon = "Ice Cream Commander";
			CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625);
		elseif MyLevel == 2200 or MyLevel <= 2224 then
			Mon = "Cookie Crafter";
			LevelQuest = 1;
			NameQuest = "CakeQuest1";
			NameMon = "Cookie Crafter";
			CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -0.0000000880302053, 0.288177818, 0.000000069301187, 1, 0.0000000751931211, -0.288177818, -0.000000052032135, 0.957576931);
			CFrameMon = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375);
		elseif MyLevel == 2225 or MyLevel <= 2249 then
			Mon = "Cake Guard";
			LevelQuest = 2;
			NameQuest = "CakeQuest1";
			NameMon = "Cake Guard";
			CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -0.0000000880302053, 0.288177818, 0.000000069301187, 1, 0.0000000751931211, -0.288177818, -0.000000052032135, 0.957576931);
			CFrameMon = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875);
		elseif MyLevel == 2250 or MyLevel <= 2274 then
			Mon = "Baking Staff";
			LevelQuest = 1;
			NameQuest = "CakeQuest2";
			NameMon = "Baking Staff";
			CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 0.0000000422142143, 0.250778586, 0.0000000474911062, 1, 0.0000000149904711, -0.250778586, 0.0000000264211941, -0.96804446);
			CFrameMon = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375);
		elseif MyLevel == 2275 or MyLevel <= 2299 then
			Mon = "Head Baker";
			LevelQuest = 2;
			NameQuest = "CakeQuest2";
			NameMon = "Head Baker";
			CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 0.0000000422142143, 0.250778586, 0.0000000474911062, 1, 0.0000000149904711, -0.250778586, 0.0000000264211941, -0.96804446);
			CFrameMon = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125);
		elseif MyLevel == 2300 or MyLevel <= 2324 then
			Mon = "Cocoa Warrior";
			LevelQuest = 1;
			NameQuest = "ChocQuest1";
			NameMon = "Cocoa Warrior";
			CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375);
			CFrameMon = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125);
		elseif MyLevel == 2325 or MyLevel <= 2349 then
			Mon = "Chocolate Bar Battler";
			LevelQuest = 2;
			NameQuest = "ChocQuest1";
			NameMon = "Chocolate Bar Battler";
			CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375);
			CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375);
		elseif MyLevel == 2350 or MyLevel <= 2374 then
			Mon = "Sweet Thief";
			LevelQuest = 1;
			NameQuest = "ChocQuest2";
			NameMon = "Sweet Thief";
			CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875);
			CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625);
		elseif MyLevel == 2375 or MyLevel <= 2399 then
			Mon = "Candy Rebel";
			LevelQuest = 2;
			NameQuest = "ChocQuest2";
			NameMon = "Candy Rebel";
			CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875);
			CFrameMon = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625);
		elseif MyLevel == 2400 or MyLevel <= 2424 then
			Mon = "Candy Pirate";
			LevelQuest = 1;
			NameQuest = "CandyQuest1";
			NameMon = "Candy Pirate";
			CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375);
			CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875);
		elseif MyLevel == 2425 or MyLevel <= 2449 then
			Mon = "Snow Demon";
			LevelQuest = 2;
			NameQuest = "CandyQuest1";
			NameMon = "Snow Demon";
			CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375);
			CFrameMon = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375);
		elseif MyLevel == 2450 or MyLevel <= 2474 then
			Mon = "Isle Outlaw";
			LevelQuest = 1;
			NameQuest = "TikiQuest1";
			NameMon = "Isle Outlaw";
			CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812);
			CFrameMon = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656);
		elseif MyLevel == 2475 or MyLevel <= 2524 then
			Mon = "Island Boy";
			LevelQuest = 2;
			NameQuest = "TikiQuest1";
			NameMon = "Island Boy";
			CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812);
			CFrameMon = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562);
		elseif MyLevel == 2525 or MyLevel <= 2549 then
			Mon = "Isle Champion";
			LevelQuest = 2;
			NameQuest = "TikiQuest2";
			NameMon = "Isle Champion";
			CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625);
			CFrameMon = CFrame.new(-16641.6796875, 235.7825469970703, 1031.282958984375);
		elseif MyLevel == 2550 or MyLevel <= 2574 then
			Mon = "Serpent Hunter";
			LevelQuest = 1;
			NameQuest = "TikiQuest3";
			NameMon = "Serpent Hunter";
			CFrameQuest = CFrame.new(-16661.890625, 105.2862319946289, 1576.69775390625);
			CFrameMon = CFrame.new(-16587.896484375, 154.21299743652344, 1533.40966796875);
		elseif MyLevel == 2575 or MyLevel >= 2575 then
			Mon = "Skull Slayer";
			LevelQuest = 2;
			NameQuest = "TikiQuest3";
			NameMon = "Skull Slayer";
			CFrameQuest = CFrame.new(-16661.890625, 105.2862319946289, 1576.69775390625);
			CFrameMon = CFrame.new(-16885.203125, 114.12911224365234, 1627.949951171875);
		end;
	end;
end;
function Hop()
	local module = (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))();
	module:Teleport(game.PlaceId);
end;
function isnil(thing)
	return thing == nil;
end;
local function round(n)
	return math.floor(tonumber(n) + 0.5);
end;
Number = math.random(1, 1000000);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace"))._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Island"] then
					if v.Name ~= "Sea" then
						if not v:FindFirstChild("EspIsland") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspIsland";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(0, 200, 0, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamMedium;
							name.TextSize = 14;
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = Enum.TextYAlignment.Top;
							name.BackgroundTransparency = 1;
							name.TextColor3 = Color3.fromRGB(255, 255, 255);
						else
							v.EspIsland.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
						end;
					end;
				elseif v:FindFirstChild("EspIsland") then
					(v:FindFirstChild("EspIsland")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Players")):GetChildren()) do
			pcall(function()
				if not isnil(v.Character) then
					if _G.Settings.Esp["ESP Player"] then
						if not v.Character.Head:FindFirstChild(("EspPlayer" .. Number)) then
							local bill = Instance.new("BillboardGui", v.Character.Head);
							bill.Name = "EspPlayer" .. Number;
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v.Character.Head;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamSemibold;
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Character.Head.Position)).Magnitude / 3) .. " Distance";
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							if v.Team == game.Players.LocalPlayer.Team then
								name.TextColor3 = Color3.fromRGB(50, 200, 50);
							else
								name.TextColor3 = Color3.fromRGB(200, 50, 50);
							end;
						else
							v.Character.Head["EspPlayer" .. Number].TextLabel.Text = v.Name .. " | " .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Character.Head.Position)).Magnitude / 3) .. " Distance\nHealth : " .. round(v.Character.Humanoid.Health * 100 / v.Character.Humanoid.MaxHealth) .. "%";
						end;
					elseif v.Character.Head:FindFirstChild("EspPlayer" .. Number) then
						(v.Character.Head:FindFirstChild("EspPlayer" .. Number)):Destroy();
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs(game.Workspace.ChestModels:GetChildren()) do
			pcall(function()
				if string.find(v.Name, "Chest") then
					if _G.Settings.Esp["ESP Chest"] then
						if string.find(v.Name, "Chest") then
							if not v:FindFirstChild(("EspChest" .. Number)) then
								local bill = Instance.new("BillboardGui", v);
								bill.Name = "EspChest" .. Number;
								bill.ExtentsOffset = Vector3.new(0, 1, 0);
								bill.Size = UDim2.new(1, 200, 1, 30);
								bill.Adornee = v;
								bill.AlwaysOnTop = true;
								local name = Instance.new("TextLabel", bill);
								name.Font = Enum.Font.Nunito;
								name.FontSize = "Size14";
								name.TextWrapped = true;
								name.Size = UDim2.new(1, 0, 1, 0);
								name.TextYAlignment = "Top";
								name.BackgroundTransparency = 1;
								name.TextStrokeTransparency = 0.5;
								if v.Name == "SilverChest" then
									name.TextColor3 = Color3.fromRGB(109, 109, 109);
									name.Text = "Silver Chest" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
								end;
								if v.Name == "GoldChest" then
									name.TextColor3 = Color3.fromRGB(173, 158, 21);
									name.Text = "Gold Chest" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
								end;
								if v.Name == "DiamondChest" then
									name.TextColor3 = Color3.fromRGB(20, 200, 200);
									name.Text = "Diamond Chest" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
								end;
							else
								v["EspChest" .. Number].TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
							end;
						end;
					elseif v:FindFirstChild("EspChest" .. Number) then
						(v:FindFirstChild("EspChest" .. Number)):Destroy();
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs(game.Workspace:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP DevilFruit"] then
					if v.Name and string.find(v.Name, "Fruit") then
						if not v.Handle:FindFirstChild(("EspDevilFruit" .. Number)) then
							local bill = Instance.new("BillboardGui", v.Handle);
							bill.Name = "EspDevilFruit" .. Number;
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v.Handle;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamSemibold;
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(255, 255, 255);
							name.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
							local TweenService = game:GetService("TweenService");
							local rainbowColors = {
								Color3.fromRGB(255, 0, 0),
								Color3.fromRGB(255, 127, 0),
								Color3.fromRGB(255, 255, 0),
								Color3.fromRGB(0, 255, 0),
								Color3.fromRGB(0, 0, 255),
								Color3.fromRGB(75, 0, 130),
								Color3.fromRGB(148, 0, 211)
							};
							local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut);
							(coroutine.wrap(function()
								while true do
									for _, color in ipairs(rainbowColors) do
										local tween = TweenService:Create(name, tweenInfo, {
											TextColor3 = color
										});
										tween:Play();
										tween.Completed:Wait();
									end;
								end;
							end))();
						else
							v.Handle["EspDevilFruit" .. Number].TextLabel.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
						end;
					end;
				elseif v.Handle:FindFirstChild("EspDevilFruit" .. Number) then
					(v.Handle:FindFirstChild("EspDevilFruit" .. Number)):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0) do
		for i, v in pairs(game.Workspace._WorldOrigin:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP DevilFruit"] then
					if string.find(v.Name, "Fruit") then
						if not v.Handle:FindFirstChild(("EspDevilFruit" .. Number)) then
							local bill = Instance.new("BillboardGui", v.Handle);
							bill.Name = "EspDevilFruit" .. Number;
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v.Handle;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamSemibold;
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(255, 255, 255);
							name.Text = v.Name .. "(SPAWNED)" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
							local TweenService = game:GetService("TweenService");
							local rainbowColors = {
								Color3.fromRGB(255, 0, 0),
								Color3.fromRGB(255, 127, 0),
								Color3.fromRGB(255, 255, 0),
								Color3.fromRGB(0, 255, 0),
								Color3.fromRGB(0, 0, 255),
								Color3.fromRGB(75, 0, 130),
								Color3.fromRGB(148, 0, 211)
							};
							local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut);
							(coroutine.wrap(function()
								while true do
									for _, color in ipairs(rainbowColors) do
										local tween = TweenService:Create(name, tweenInfo, {
											TextColor3 = color
										});
										tween:Play();
										tween.Completed:Wait();
									end;
								end;
							end))();
						else
							v.Handle["EspDevilFruit" .. Number].TextLabel.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
						end;
					end;
				elseif v.Handle:FindFirstChild("EspDevilFruit" .. Number) then
					(v.Handle:FindFirstChild("EspDevilFruit" .. Number)):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs(game.Workspace:GetChildren()) do
			pcall(function()
				if v.Name == "Flower2" or v.Name == "Flower1" then
					if _G.Settings.Esp["ESP Flower"] then
						if not v:FindFirstChild(("EspFlower" .. Number)) then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspFlower" .. Number;
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamSemibold;
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(255, 100, 100);
							if v.Name == "Flower1" then
								name.Text = "Blue Flower" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
								name.TextColor3 = Color3.fromRGB(40, 40, 255);
							end;
							if v.Name == "Flower2" then
								name.Text = "Red Flower" .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
								name.TextColor3 = Color3.fromRGB(255, 100, 100);
							end;
						else
							v["EspFlower" .. Number].TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
						end;
					elseif v:FindFirstChild("EspFlower" .. Number) then
						(v:FindFirstChild("EspFlower" .. Number)):Destroy();
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if _G.Settings.Esp["ESP RealFruit"] then
					if not v.Handle:FindFirstChild(("EspRealFruit" .. Number)) then
						local bill = Instance.new("BillboardGui", v.Handle);
						bill.Name = "EspRealFruit" .. Number;
						bill.ExtentsOffset = Vector3.new(0, 1, 0);
						bill.Size = UDim2.new(1, 200, 1, 30);
						bill.Adornee = v.Handle;
						bill.AlwaysOnTop = true;
						local name = Instance.new("TextLabel", bill);
						name.Font = Enum.Font.GothamSemibold;
						name.FontSize = "Size14";
						name.TextWrapped = true;
						name.Size = UDim2.new(1, 0, 1, 0);
						name.TextYAlignment = "Top";
						name.BackgroundTransparency = 1;
						name.TextStrokeTransparency = 0.5;
						name.TextColor3 = Color3.fromRGB(200, 70, 70);
						name.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					else
						v.Handle["EspRealFruit" .. Number].TextLabel.Text = v.Name .. " " .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					end;
				elseif v.Handle:FindFirstChild("EspRealFruit" .. Number) then
					(v.Handle:FindFirstChild("EspRealFruit" .. Number)):Destroy();
				end;
			end;
		end;
		for i, v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if _G.Settings.Esp["ESP RealFruit"] then
					if not v.Handle:FindFirstChild(("EspRealFruit" .. Number)) then
						local bill = Instance.new("BillboardGui", v.Handle);
						bill.Name = "EspRealFruit" .. Number;
						bill.ExtentsOffset = Vector3.new(0, 1, 0);
						bill.Size = UDim2.new(1, 200, 1, 30);
						bill.Adornee = v.Handle;
						bill.AlwaysOnTop = true;
						local name = Instance.new("TextLabel", bill);
						name.Font = Enum.Font.GothamSemibold;
						name.FontSize = "Size14";
						name.TextWrapped = true;
						name.Size = UDim2.new(1, 0, 1, 0);
						name.TextYAlignment = "Top";
						name.BackgroundTransparency = 1;
						name.TextStrokeTransparency = 0.5;
						name.TextColor3 = Color3.fromRGB(255, 170, 0);
						name.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					else
						v.Handle["EspRealFruit" .. Number].TextLabel.Text = v.Name .. " " .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					end;
				elseif v.Handle:FindFirstChild("EspRealFruit" .. Number) then
					(v.Handle:FindFirstChild("EspRealFruit" .. Number)):Destroy();
				end;
			end;
		end;
		for i, v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if _G.Settings.Esp["ESP RealFruit"] then
					if not v.Handle:FindFirstChild(("EspRealFruit" .. Number)) then
						local bill = Instance.new("BillboardGui", v.Handle);
						bill.Name = "EspRealFruit" .. Number;
						bill.ExtentsOffset = Vector3.new(0, 1, 0);
						bill.Size = UDim2.new(1, 200, 1, 30);
						bill.Adornee = v.Handle;
						bill.AlwaysOnTop = true;
						local name = Instance.new("TextLabel", bill);
						name.Font = Enum.Font.GothamSemibold;
						name.FontSize = "Size14";
						name.TextWrapped = true;
						name.Size = UDim2.new(1, 0, 1, 0);
						name.TextYAlignment = "Top";
						name.BackgroundTransparency = 1;
						name.TextStrokeTransparency = 0.5;
						name.TextColor3 = Color3.fromRGB(240, 255, 10);
						name.Text = v.Name .. " \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					else
						v.Handle["EspRealFruit" .. Number].TextLabel.Text = v.Name .. " " .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					end;
				elseif v.Handle:FindFirstChild("EspRealFruit" .. Number) then
					(v.Handle:FindFirstChild("EspRealFruit" .. Number)):Destroy();
				end;
			end;
		end;
	end;
end);
spawn(function()
	while wait(1) do
		pcall(function()
			if _G.Settings.Esp["ESP Monster"] then
				for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") then
						if not v:FindFirstChild("EspMonster") then
							local BillboardGui = Instance.new("BillboardGui");
							local TextLabel = Instance.new("TextLabel");
							BillboardGui.Parent = v;
							BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
							BillboardGui.Active = true;
							BillboardGui.Name = "EspMonster";
							BillboardGui.AlwaysOnTop = true;
							BillboardGui.LightInfluence = 1;
							BillboardGui.Size = UDim2.new(0, 200, 0, 50);
							BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0);
							TextLabel.Parent = BillboardGui;
							TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							TextLabel.BackgroundTransparency = 1;
							TextLabel.Size = UDim2.new(0, 200, 0, 50);
							TextLabel.Font = Enum.Font.GothamBold;
							TextLabel.TextColor3 = Color3.fromRGB(120, 130, 230);
							TextLabel.Text.Size = 35;
						end;
						local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude);
						v.EspMonster.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance";
					end;
				end;
			else
				for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
					if v:FindFirstChild("EspMonster") then
						v.EspMonster:Destroy();
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait(1) do
		pcall(function()
			if _G.Settings.Esp["ESP Sea Beast"] then
				for i, v in pairs((game:GetService("Workspace")).SeaBeasts:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") then
						if not v:FindFirstChild("EspSeabeasts") then
							local BillboardGui = Instance.new("BillboardGui");
							local TextLabel = Instance.new("TextLabel");
							BillboardGui.Parent = v;
							BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
							BillboardGui.Active = true;
							BillboardGui.Name = "EspSeabeasts";
							BillboardGui.AlwaysOnTop = true;
							BillboardGui.LightInfluence = 1;
							BillboardGui.Size = UDim2.new(0, 200, 0, 50);
							BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0);
							TextLabel.Parent = BillboardGui;
							TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							TextLabel.BackgroundTransparency = 1;
							TextLabel.Size = UDim2.new(0, 200, 0, 50);
							TextLabel.Font = Enum.Font.Gotham;
							TextLabel.TextColor3 = Color3.fromRGB(60, 240, 120);
							TextLabel.Text.Size = 35;
						end;
						local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude);
						v.EspSeabeasts.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance";
					end;
				end;
			else
				for i, v in pairs((game:GetService("Workspace")).SeaBeasts:GetChildren()) do
					if v:FindFirstChild("EspSeabeasts") then
						v.EspSeabeasts:Destroy();
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait(1) do
		pcall(function()
			if _G.Settings.Esp["ESP Npc"] then
				for i, v in pairs((game:GetService("Workspace")).NPCs:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") then
						if not v:FindFirstChild("EspNpc") then
							local BillboardGui = Instance.new("BillboardGui");
							local TextLabel = Instance.new("TextLabel");
							BillboardGui.Parent = v;
							BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
							BillboardGui.Active = true;
							BillboardGui.Name = "EspNpc";
							BillboardGui.AlwaysOnTop = true;
							BillboardGui.LightInfluence = 1;
							BillboardGui.Size = UDim2.new(0, 200, 0, 50);
							BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0);
							TextLabel.Parent = BillboardGui;
							TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							TextLabel.BackgroundTransparency = 1;
							TextLabel.Size = UDim2.new(0, 200, 0, 50);
							TextLabel.Font = Enum.Font.Cartoon;
							TextLabel.TextColor3 = Color3.fromRGB(200, 60, 120);
							TextLabel.Text.Size = 45;
						end;
						local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude);
						v.EspNpc.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance";
					end;
				end;
			else
				for i, v in pairs((game:GetService("Workspace")).NPCs:GetChildren()) do
					if v:FindFirstChild("EspNpc") then
						v.EspNpc:Destroy();
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace"))._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Mirage"] then
					if v.Name == "Mirage Island" then
						if not v:FindFirstChild("EspMirageIsland") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspMirageIsland";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(50, 180, 50);
						else
							v.EspMirageIsland.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspMirageIsland") then
					(v:FindFirstChild("EspMirageIsland")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace"))._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Kitsune"] then
					if v.Name == "Kitsune Island" then
						if not v:FindFirstChild("EspKitsuneIsland") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspKitsuneIsland";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(40, 40, 180);
						else
							v.EspKitsuneIsland.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspKitsuneIsland") then
					(v:FindFirstChild("EspKitsuneIsland")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace"))._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Frozen"] then
					if v.Name == "Frozen Dimension" then
						if not v:FindFirstChild("EspFrozen") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspFrozen";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(50, 180, 255);
						else
							v.EspFrozen.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspFrozen") then
					(v:FindFirstChild("EspFrozen")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace"))._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Prehistoric"] then
					if v.Name == "Prehistoric Island" then
						if not v:FindFirstChild("EspPrehistoric") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspPrehistoric";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(200, 50, 40);
						else
							v.EspPrehistoric.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspPrehistoric") then
					(v:FindFirstChild("EspPrehistoric")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace")).NPCs:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Advanced Fruit Dealer"] then
					if v.Name == "Advanced Fruit Dealer" then
						if not v:FindFirstChild("EspAdvanceFruitDealer") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspAdvanceFruitDealer";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(250, 50, 50);
						else
							v.EspAdvanceFruitDealer.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspAdvanceFruitDealer") then
					(v:FindFirstChild("EspAdvanceFruitDealer")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		for i, v in pairs((game:GetService("Workspace")).NPCs:GetChildren()) do
			pcall(function()
				if _G.Settings.Esp["ESP Aura"] then
					if v.Name == "Master of Enhancement" then
						if not v:FindFirstChild("EspAura") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspAura";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(200, 55, 255);
						else
							v.EspAura.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspAura") then
					(v:FindFirstChild("EspAura")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(1) do
		if (game:GetService("Workspace")).Map:FindFirstChild("MysticIsland") then
			for i, v in pairs((game:GetService("Workspace")).Map.MysticIsland:GetChildren()) do
				pcall(function()
					if _G.Settings.Esp["ESP Gear"] then
						if v.Name == "MeshPart" then
							if not v:FindFirstChild("AutoFarmBlazeEmber") then
								local bill = Instance.new("BillboardGui", v);
								bill.Name = "EspGear";
								bill.ExtentsOffset = Vector3.new(0, 1, 0);
								bill.Size = UDim2.new(1, 200, 1, 30);
								bill.Adornee = v;
								bill.AlwaysOnTop = true;
								local name = Instance.new("TextLabel", bill);
								name.Font = "Code";
								name.FontSize = "Size14";
								name.TextWrapped = true;
								name.Size = UDim2.new(1, 0, 1, 0);
								name.TextYAlignment = "Top";
								name.BackgroundTransparency = 1;
								name.TextStrokeTransparency = 0.5;
								name.TextColor3 = Color3.fromRGB(80, 245, 245);
							else
								v.EspGear.TextLabel.Text = v.Name .. "   \n" .. round((((game:GetService("Players")).LocalPlayer.Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
							end;
						end;
					elseif v:FindFirstChild("EspGear") then
						(v:FindFirstChild("EspGear")):Destroy();
					end;
				end);
			end;
		end;
	end;
end);
function Click()
	(game:GetService("VirtualUser")):CaptureController();
	(game:GetService("VirtualUser")):Button1Down(Vector2.new(1280, 672));
end;
function AutoHaki()
	if not (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("HasBuso") then
		(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("Buso");
	end;
end;
function UnEquipWeapon(Weapon)
	if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
		(game.Players.LocalPlayer.Character:FindFirstChild(Weapon)).Parent = game.Players.LocalPlayer.Backpack;
	end;
end;
function EquipWeapon(ToolSe)
	if not game.Players.LocalPlayer.Character:FindFirstChild(ToolSe) then
		if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
			Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe);
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool);
		end;
	end;
end;
spawn(function()
	for i, v in pairs((game:GetService("Workspace"))._WorldOrigin:GetChildren()) do
		pcall(function()
			if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" or v.Name == "SlashTail" or v.Name == "Sounds" then
				v:Destroy();
			end;
		end);
	end;
end);
function GetDistance(target)
	return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude);
end;
function BTP(value)
	pcall(function()
		if (value.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
			repeat
				wait();
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = value;
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("SetSpawnPoint");
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = value;
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("SetSpawnPoint");
				wait();
				game.Players.LocalPlayer.Character.Head:Destroy();
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = value;
			until (value.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 and game.Players.LocalPlayer.Character.Humanoid.Health > 0;
		end;
	end);
end;
function InstantTp(value)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = value;
end;
function TweenBoat(pos)
	local TweenService = game:GetService("TweenService");
	local Boat = workspace.Boats[_G.Settings.SeaEvent["Selected Boat"]];
	if not Boat or (not Boat:FindFirstChild("VehicleSeat")) then
		warn("Boat atau VehicleSeat tidak ditemukan!");
		return {
			Stop = function()
			end
		};
	end;
	local targetCFrame = pos;
	if typeof(pos) == "Instance" and pos:IsA("BasePart") then
		targetCFrame = pos.CFrame;
	elseif typeof(pos) ~= "CFrame" then
		warn("Argumen 'pos' harus berupa CFrame atau BasePart!");
		return {
			Stop = function()
			end
		};
	end;
	local startPosition = Boat.VehicleSeat.Position;
	local endPosition = targetCFrame.Position;
	local distance = (startPosition - endPosition).Magnitude;
	local tween = nil;
	local duration = distance / (_G.Settings.SeaEvent["Boat Tween Speed"] or 100);
	local info = TweenInfo.new(duration, Enum.EasingStyle.Linear);
	tween = TweenService:Create(Boat.VehicleSeat, info, {
		CFrame = targetCFrame
	});
	if distance > 25 then
		tween:Play();
	else
		warn("Jarak terlalu dekat, tween dibatalkan.");
	end;
	local StopTweenBoat = {};
	function StopTweenBoat:Stop()
		if tween and tween.PlaybackState == Enum.PlaybackState.Playing then
			tween:Cancel();
		end;
	end;
	return StopTweenBoat;
end;
function TweenPlayer(pos)
	task.spawn(function()
		pcall(function()
			if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
				game.Players.LocalPlayer.Character.Humanoid.Sit = true;
			end;
			local player = (game:GetService("Players")).LocalPlayer;
			local character = player.Character;
			local humanoidRootPart = character.HumanoidRootPart;
			if player:DistanceFromCharacter(pos.Position) <= 50 then
				humanoidRootPart.CFrame = pos;
				if character:FindFirstChild("Root") then
					character.Root:Destroy();
					wait();
					TweenPlayer(humanoidRootPart.CFrame);
					wait();
				end;
				if character:FindFirstChild("Root") then
					character.Root:Remove();
				end;
			elseif not character:FindFirstChild("Root") then
				local rootPart = Instance.new("Part", character);
				rootPart.Size = Vector3.new(1, 0.5, 1);
				rootPart.Name = "Root";
				rootPart.Anchored = true;
				rootPart.Transparency = 1;
				rootPart.CanCollide = false;
				rootPart.CFrame = humanoidRootPart.CFrame;
			end;
			local distance = (humanoidRootPart.Position - pos.Position).Magnitude;
			local tweenService = game:GetService("TweenService");
			local tweenInfo = TweenInfo.new(distance / _G.Settings.Setting["Player Tween Speed"], Enum.EasingStyle.Linear);
			local success, tweenError = pcall(function()
				local tween = tweenService:Create(character.Root, tweenInfo, {
					CFrame = pos
				});
				tween:Play();
			end);
			if _G.StopTween == true then
				tween:Cancel();
				_G.Clip = false;
			end;
			if not success then
				return tweenError;
			end;
			character.Root.CFrame = humanoidRootPart.CFrame;
			if success and character:FindFirstChild("Root") then
				pcall(function()
					local distanceFromTarget = (humanoidRootPart.Position - pos.Position).Magnitude;
					if distanceFromTarget >= 50 then
						task.spawn(function()
							pcall(function()
								if (character.Root.Position - humanoidRootPart.Position).Magnitude > 200 then
									character.Root.CFrame = humanoidRootPart.CFrame;
								else
									humanoidRootPart.CFrame = character.Root.CFrame;
								end;
							end);
						end);
					elseif distanceFromTarget >= 25 and distanceFromTarget < 40 then
						humanoidRootPart.CFrame = pos;
					elseif distanceFromTarget < 25 then
						humanoidRootPart.CFrame = pos;
					end;
				end);
			end;
			local stoppos = {};
			function stoppos:Stop()
				tween:Cancel();
			end;
			return stoppos;
		end);
	end);
end;
task.spawn(function()
	while task.wait() do
		pcall(function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.Root.CFrame;
			if (game.Players.LocalPlayer.Character.Root.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1 then
				game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
			end;
		end);
	end;
end);
spawn(function()
	(game:GetService("RunService")).RenderStepped:Connect(function()
		pcall(function()
			if setscriptable then
				setscriptable(game.Players.LocalPlayer, "SimulationRadius", true);
			end;
			if sethiddenproperty then
				sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
			end;
		end);
	end);
end);
local env = (getgenv or getrenv or getfenv)();
local rs = game:GetService("ReplicatedStorage");
local players = game:GetService("Players");
local client = players.LocalPlayer;
local modules = rs:WaitForChild("Modules");
local net = modules:WaitForChild("Net");
local charFolder = workspace:WaitForChild("Characters");
local enemyFolder = workspace:WaitForChild("Enemies");
local playerFolder = game:GetService("Players");
local AttackModule = {};
local RegisterAttack = net:WaitForChild("RE/RegisterAttack");
local RegisterHit = net:WaitForChild("RE/RegisterHit");
function AttackModule:AttackEnemy(EnemyHead, Table)
	if EnemyHead then
		RegisterAttack:FireServer(0);
		RegisterAttack:FireServer(1);
		RegisterAttack:FireServer(2);
		RegisterAttack:FireServer(3);
		RegisterHit:FireServer(EnemyHead, Table or {});
	end;
end;
function AttackModule:AttackNearest()
	local mon = {
		nil,
		{}
	};
	for _, Enemy in enemyFolder:GetChildren() do
		if not mon[1] and Enemy:FindFirstChild("HumanoidRootPart", true) and client:DistanceFromCharacter(Enemy.HumanoidRootPart.Position) < 60 then
			mon[1] = Enemy:FindFirstChild("HumanoidRootPart");
		elseif Enemy:FindFirstChild("HumanoidRootPart", true) and client:DistanceFromCharacter(Enemy.HumanoidRootPart.Position) < 60 then
			table.insert(mon[2], {
				[1] = Enemy,
				[2] = Enemy:FindFirstChild("HumanoidRootPart")
			});
		end;
	end;
	self:AttackEnemy(unpack(mon));
	local player = {
		nil,
		{}
	};
	for _, Player in playerFolder:GetChildren() do
		if not player[1] and Player:FindFirstChild("HumanoidRootPart", true) and client:DistanceFromCharacter(Player.Character.HumanoidRootPart.Position) < 60 then
			player[1] = Player.Character:FindFirstChild("HumanoidRootPart");
		elseif Player.Character:FindFirstChild("HumanoidRootPart", true) and client:DistanceFromCharacter(Player.Character.HumanoidRootPart.Position) < 60 then
			table.insert(player[2], {
				[1] = Player,
				[2] = Player.Character:FindFirstChild("HumanoidRootPart")
			});
		end;
	end;
	self:AttackEnemy(unpack(player));
end;
function AttackModule:BladeHits()
	self:AttackNearest();
end;
function Attack()
	if not _G.Settings.Main["Auto Farm Fruit Mastery"] or (not _G.Settings.Main["Auto Farm Gun Mastery"]) then
		if _G.Settings.Setting["Fast Attack"] then
			wait(_G.Settings.Setting["Fast Attack Delay"]);
			AttackModule:BladeHits();
		else
			wait(0.5);
			AttackModule:BladeHits();
		end;
	end;
end;
function NormalAttack()
	AttackModule:BladeHits();
end;
spawn(function()
	(game:GetService("RunService")).RenderStepped:Connect(function()
		pcall(function()
			if UseSkill or UseGunSkill or _G.SeaSkill then
				for i, v in pairs((game:GetService("Players")).LocalPlayer.PlayerGui.Notifications:GetChildren()) do
					for _, Notif in pairs(v:GetChildren()) do
						if string.find(Notif.Text, "Skill locked!") then
							v:Destroy();
						end;
					end;
				end;
			end;
		end);
	end);
end);
function EquipWeaponSword()
	pcall(function()
		for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Sword" and v:IsA("Tool") then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name);
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid);
			end;
		end;
	end);
end;
spawn(function()
	local angle = 0;
	while wait() do
		if _G.Settings.Setting["Spin Position"] then
			local radius = 20;
			local farmDistance = _G.Settings.Setting["Farm Distance"];
			local radian = math.rad(angle);
			local x = math.cos(radian) * radius;
			local z = math.sin(radian) * radius;
			Pos = CFrame.new(x, farmDistance, z);
			angle = (angle + 30) % 360;
		else
			Pos = CFrame.new(0, _G.Settings.Setting["Farm Distance"], 0);
		end;
		wait(0);
	end;
end);
spawn(function()
	pcall(function()
		while wait() do
			if World1 then
				if _G.Settings.Farm["Auto Farm Leather"] or _G.Settings.Farm["Auto Farm Magma Ore"] or _G.Settings.Farm["Auto Farm Scrap Metal"] or _G.Settings.Items["Auto Saber"] or _G.Settings.Items["Auto Second Sea"] or _G.Settings.Items["Auto Warden Sword"] or _G.Settings.Items["Auto Greybeard"] or _G.Settings.Items["Auto Pole"] or _G.Settings.Items["Auto Shark Saw"] or _G.Settings.Farm["Auto Farm Angel Wings"] then
					if not (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity");
						Noclip.Name = "BodyClip";
						Noclip.Parent = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart;
						Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
						Noclip.Velocity = Vector3.new(0, 0, 0);
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World1 then
				if _G.Settings.Items["Auto Saber"] or _G.Settings.Items["Auto Second Sea"] or _G.Settings.Items["Auto Warden Sword"] or _G.Settings.Items["Auto Greybeard"] or _G.Settings.Items["Auto Pole"] or _G.Settings.Items["Auto Shark Saw"] then
					for _, v in pairs((game:GetService("Players")).LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World2 then
				if _G.Settings.Items["Auto Farm Factory"] or _G.Settings.Items["Auto Swan Glasses"] or _G.Settings.Raid["Law Raid"] or _G.Settings.Race["Auto Race V2"] or _G.Settings.Items["Auto Rengoku"] or _G.Settings.Items["Auto Bartilo Quest"] or _G.Settings.Items["Auto Third Sea"] or _G.Settings.Items["Auto Dragon Trident"] or _G.Settings.SeaStack["Auto Attack Seabeasts"] or _G.Settings.Raid["Auto Raid"] then
					if not (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity");
						Noclip.Name = "BodyClip";
						Noclip.Parent = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart;
						Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
						Noclip.Velocity = Vector3.new(0, 0, 0);
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World2 then
				if _G.Settings.Items["Auto Farm Factory"] or _G.Settings.Items["Auto Swan Glasses"] or _G.Settings.Raid["Law Raid"] or _G.Settings.Race["Auto Race V2"] or _G.Settings.Items["Auto Rengoku"] or _G.Settings.Items["Auto Bartilo Quest"] or _G.Settings.Items["Auto Third Sea"] or _G.Settings.Items["Auto Dragon Trident"] or _G.Settings.SeaStack["Auto Attack Seabeasts"] or _G.Settings.Raid["Auto Raid"] then
					for _, v in pairs((game:GetService("Players")).LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World3 then
				if _G.Settings.Farm["Auto Pirate Raid"] or _G.Settings.Race["Auto Race V3"] or _G.Settings.Farm["Auto Kill Cake Prince"] or _G.Settings.SeaStack["Tween To Kitsune Island"] or _G.Settings.SeaStack["Teleport To Frozen Dimension"] or _G.Settings.SeaStack["Sail To Frozen Dimension"] or _G.Settings.SeaStack["Summon Frozen Dimension"] or _G.Settings.SeaStack["Summon Kitsune Island"] or _G.Settings.SeaStack["Tween To Mirage Island"] or _G.Settings.Race["Auto Train"] or _G.Settings.Items["Auto Press Haki Button"] or _G.Settings.SeaEvent["Sail Boat"] or _G.Settings.Items["Auto Arena Trainer"] or _G.Settings.Race["Auto Kill Player After Trial"] or _G.Settings.Race["Tween To Highest Mirage"] or _G.Settings.Race["Auto Trial"] or _G.Settings.Race["Find Blue Gear"] or _G.Settings.Combat["Auto Kill Player Quest"] or _G.Settings.Items["Auto Cursed Dual Katana"] or _G.Settings.Farm["Auto Farm Bone"] or _G.Settings.Farm["Auto Kill Dough King"] or _G.Settings.Items["Auto Soul Guitar"] or _G.Settings.Items["Auto Tushita"] or _G.Settings.Farm["Auto Elite Hunter"] or _G.AutoKillSelectedPlayer or _G.Settings.Items["Auto Rainbow Haki"] or _G.Settings.Items["Auto Dark Dagger"] or _G.Settings.Farm["Auto Farm Ectoplasm"] or _G.Settings.Farm["Auto Observation V2"] or _G.Settings.Farm["Auto Musketeer Hat"] or _G.Settings.Items["Auto Holy Torch"] or _G.Settings.Items["Auto Hallow Scythe"] or _G.Settings.Farm["Auto Farm Katakuri"] or _G.Settings.Items["Auto Buddy Sword"] or _G.Settings.Items["Auto Canvander"] or _G.Settings.Raid["Auto Raid"] or _G.Settings.Main["Auto Summon Tyrant Of The Skies"] or _G.Settings.Main["Auto Kill Tyrant Of The Skies"] then
					if not (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity");
						Noclip.Name = "BodyClip";
						Noclip.Parent = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart;
						Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
						Noclip.Velocity = Vector3.new(0, 0, 0);
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World3 then
				if _G.Settings.Farm["Auto Pirate Raid"] or _G.Settings.Race["Auto Race V3"] or _G.Settings.Farm["Auto Kill Cake Prince"] or _G.Settings.SeaStack["Tween To Kitsune Island"] or _G.Settings.SeaStack["Teleport To Frozen Dimension"] or _G.Settings.SeaStack["Sail To Frozen Dimension"] or _G.Settings.SeaStack["Summon Frozen Dimension"] or _G.Settings.SeaStack["Summon Kitsune Island"] or _G.Settings.SeaStack["Tween To Mirage Island"] or _G.Settings.Race["Auto Train"] or _G.Settings.Items["Auto Press Haki Button"] or _G.Settings.SeaEvent["Sail Boat"] or _G.Settings.Items["Auto Arena Trainer"] or _G.Settings.Race["Auto Kill Player After Trial"] or _G.Settings.Race["Tween To Highest Mirage"] or _G.Settings.Race["Auto Trial"] or _G.Settings.Race["Find Blue Gear"] or _G.Settings.Combat["Auto Kill Player Quest"] or _G.Settings.Items["Auto Cursed Dual Katana"] or _G.Settings.Farm["Auto Farm Bone"] or _G.Settings.Farm["Auto Kill Dough King"] or _G.Settings.Items["Auto Soul Guitar"] or _G.Settings.Items["Auto Tushita"] or _G.Settings.Farm["Auto Elite Hunter"] or _G.AutoKillSelectedPlayer or _G.Settings.Items["Auto Rainbow Haki"] or _G.Settings.Items["Auto Dark Dagger"] or _G.Settings.Farm["Auto Farm Ectoplasm"] or _G.Settings.Farm["Auto Observation V2"] or _G.Settings.Farm["Auto Musketeer Hat"] or _G.Settings.Items["Auto Holy Torch"] or _G.Settings.Items["Auto Hallow Scythe"] or _G.Settings.Farm["Auto Farm Katakuri"] or _G.Settings.Items["Auto Buddy Sword"] or _G.Settings.Items["Auto Canvander"] or _G.Settings.Farm["Auto Farm Leather"] or _G.Settings.Raid["Auto Raid"] or _G.Settings.Main["Auto Summon Tyrant Of The Skies"] or _G.Settings.Main["Auto Kill Tyrant Of The Skies"] then
					for _, v in pairs((game:GetService("Players")).LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.Settings.Main["Auto Farm"] or _G.Settings.Farm["Auto Farm Chest Tween"] or _G.Settings.Items["Auto Electric Claw"] or _G.Settings.Main["Auto Farm Fruit Mastery"] or _G.Settings.Main["Auto Farm Gun Mastery"] or _G.TeleportIsland or _G.AutoKillSelectedPlayer or _G.TeleportToPlayer or _G.Settings.Farm["Auto Farm Observation"] or _G.Settings.Fruit["Tween To Fruit"] or _G.TeleportNPC or _G.Settings.Main["Auto Farm Mon"] or _G.Settings.Main["Auto Farm Fast"] or _G.Settings.Main["Auto Farm All Boss"] or _G.Settings.Main["Auto Farm Boss"] or _G.Settings.Main["Auto Farm Sword Mastery"] or _G.Settings.Farm["Auto Farm Material"] then
				if not (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					local Noclip = Instance.new("BodyVelocity");
					Noclip.Name = "BodyClip";
					Noclip.Parent = (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart;
					Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
					Noclip.Velocity = Vector3.new(0, 0, 0);
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		(game:GetService("RunService")).Stepped:Connect(function()
			if _G.Settings.Main["Auto Farm"] or _G.Settings.Farm["Auto Farm Chest Tween"] or _G.Settings.Items["Auto Electric Claw"] or _G.Settings.Main["Auto Farm Fruit Mastery"] or _G.Settings.Main["Auto Farm Gun Mastery"] or _G.TeleportIsland or _G.AutoKillSelectedPlayer or _G.TeleportToPlayer or _G.Settings.Farm["Auto Farm Observation"] or _G.Settings.Fruit["Tween To Fruit"] or _G.TeleportNPC or _G.Settings.Main["Auto Farm Mon"] or _G.Settings.Main["Auto Farm Fast"] or _G.Settings.Main["Auto Farm All Boss"] or _G.Settings.Main["Auto Farm Boss"] or _G.Settings.Main["Auto Farm Sword Mastery"] or _G.Settings.Farm["Auto Farm Material"] then
				for _, v in pairs((game:GetService("Players")).LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false;
					end;
				end;
			end;
		end);
	end);
end);
function StopTween(State)
	if not State then
		_G.StopTween = true;
		TweenPlayer((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart.CFrame);
		if (game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
			((game:GetService("Players")).LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip")):Destroy();
		end;
		_G.StopTween = false;
	end;
end;
function RemoveAnimation(Mon)
	Mon.Humanoid:ChangeState(11);
	if Mon.Humanoid:FindFirstChild("Animator") then
		Mon.Humanoid.Animator:Destroy();
	end;
end;
spawn(function()
	pcall(function()
		while wait() do
			for i, v in pairs((game:GetService("Players")).LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					if v:FindFirstChild("RemoteFunctionShoot") then
						SelectWeaponGun = v.Name;
					end;
				end;
			end;
		end;
	end);
end);

--[[
=================================================================================================

MAIN TAb

=================================================================================================
]]

maintab:AddSection({"Farm"})

local WeaponList = {
	"Melee",
	"Sword",
	"Fruit"
};
maintab:AddDropdown({
  Name = "Weapont",
  Description = "select a weapon",
  Options = WeaponList,
  Default = "Melle",
  Flag = "weapon",
  Callback = functfunction(option)
  _G.Settings.Main["Select Weapon"] = option;
  (getgenv()).SaveSetting();
end
});
task.spawn(function()
while wait(0.2) do
  pcall(function()
    if _G.Settings.Main["Select Weapon"] == "Melee" then
      for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.ToolTip == "Melee" then
          if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
            _G.Settings.Main["Selected Weapon"] = v.Name;
          end;
        end;
      end;
    elseif _G.Settings.Main["Select Weapon"] == "Sword" then
      for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.ToolTip == "Sword" then
          if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
            _G.Settings.Main["Selected Weapon"] = v.Name;
          end;
        end;
      end;
    elseif _G.Settings.Main["Select Weapon"] == "Gun" then
      for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.ToolTip == "Gun" then
          if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
            _G.Settings.Main["Selected Weapon"] = v.Name;
          end;
        end;
      end;
    elseif _G.Settings.Main["Select Weapon"] == "Fruit" then
      for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.ToolTip == "Blox Fruit" then
          if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
            _G.Settings.Main["Selected Weapon"] = v.Name;
          end;
        end;
      end;
    end;
  end);
end;
end);
local LevelFarmMethodList = {
"Quest",
"No Quest",
"Nearest"
};

maintab:AddDropdown({
  Name = "Method",
  Description = "Select a farming method",
  Options = LevelFarmMethodList,
  Default = "Quest",
  Flag = "farm method",
  Callback = fufunction(option)
    _G.Settings.Main["Farm Level Method"] = option;
    (getgenv()).SaveSetting();
end
});

maintab:AddToggle({
  Name = "Start Farm",
  Description = "Start farming",
  Default = false,
  Callback = function(state)
		_G.Settings.Main["Auto Farm"] = state;
		StopTween(_G.Settings.Main["Auto Farm"]);
		(getgenv()).SaveSetting();
	end
});
spawn(function()
	while wait(0.2) do
		if _G.Settings.Main["Farm Level Method"] == "No Quest" and _G.Settings.Main["Auto Farm"] then
			pcall(function()
				CheckQuest();
				if (game:GetService("Workspace")).Enemies:FindFirstChild(Mon) then
					for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
						if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
							if v.Name == Mon then
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									AutoHaki();
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									Attack();
								until not _G.Settings.Main["Auto Farm"] or v.Humanoid.Health <= 0 or (not v.Parent) or (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false;
							end;
						end;
					end;
				else
					TweenPlayer(CFrameMon);
					UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Main["Farm Level Method"] == "Nearest" and _G.Settings.Main["Auto Farm"] then
			pcall(function()
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
						if v.Name then
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - (v:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= 5000 then
								repeat
									(game:GetService("RunService")).Heartbeat:wait();
									Attack();
									AutoHaki();
									EquipWeapon(_G.Settings.Main["Selected Weapon"]);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
								until not _G.Settings.Main["Auto Farm"] or (not v.Parent) or v.Humanoid.Health <= 0 or (not game.Workspace.Enemies:FindFirstChild(v.Name));
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait(0.2) do
		if _G.Settings.Main["Farm Level Method"] == "Quest" and _G.Settings.Main["Auto Farm"] then
			pcall(function()
				CheckQuest();
				local QuestTitle = (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
				if not string.find(QuestTitle, NameMon) then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("AbandonQuest");
				end;
				if (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest);
				elseif (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					if (game:GetService("Workspace")).Enemies:FindFirstChild(Mon) then
						for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								if v.Name == Mon then
									if string.find((game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
										repeat
											(game:GetService("RunService")).Heartbeat:wait();
											EquipWeapon(_G.Settings.Main["Selected Weapon"]);
											AutoHaki();
											PosMon = v.HumanoidRootPart.CFrame;
											TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
											v.Humanoid.WalkSpeed = 0;
											v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
											MonFarm = v.Name;
											Attack();
										until not _G.Settings.Main["Auto Farm"] or v.Humanoid.Health <= 0 or (not v.Parent) or (game:GetService("Players")).LocalPlayer.PlayerGui.Main.Quest.Visible == false;
									end;
								end;
							end;
						end;
					else
						TweenPlayer(CFrameMon);
						UnEquipWeapon(_G.Settings.Main["Selected Weapon"]);
					end;
				end;
			end);
		end;
	end;
end);