_G.Settings = {
    Main = {
        ["Auto Farm Level"] = false,

		["Distance Mob Aura"] = 1000,
        ["Mob Aura"] = false,
		
		--World1
		["Auto New World"] = false,
		["Auto Saber"] = false,
		["Auto Pole"] = false,

		--World2
		["Auto Third World"] = false,
    },

	Boss = {
		["Select Boss"] = {},
		["Auto Farm Boss"] = false,
		["Auto Quest Boss"] = true,
	},

    Setting = {
        ["Select Weapon"] = {"Melee"},
        ["Auto Ken Haki"] = false,
        ["Auto Buso Haki"] = true,
        ["Auto Buy Ablility"] = false,
        ["Auto Active Race V4"] = false,
        ["Auto Active Race V3"] = false,
		["Auto Redeem Code"] = false,
		["Level Redeem Code"] = 1,
        ["Bring Mob"] = true,
        ["Bypass TP"] = true,
        ["Fast Attack"] = true,
		["Fast Attack Type"] = {""},
        ["Double Quest"] = true,
        ["Skip Level"] = true,
        ["Skill Z"] = true,
		["Skill X"] = false,
		["Skill C"] = false,
		["Skill V"] = false,
        ["Skill F"] = false,
        ["Select Health %"] = 25,
    },
}

_G.Kai = {
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
		if not isfolder("Vỹ-Gaming Hub") then
			makefolder("Vỹ-Gaming Hub")
		end
		if not isfolder("Vỹ-Gaming Hub/Blox Fruits/") then
			makefolder("Vỹ-Gaming Hub/Blox Fruits/")
		end
		if not isfile("Vỹ-Gaming Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json") then
			writefile("Vỹ-Gaming Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(_G.Settings))
		else
			local Decode = game:GetService("HttpService"):JSONDecode(readfile("Vỹ-Gaming Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"))
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
		if not isfile("Vỹ-Gaming Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json") then
			LoadSettings()
		else
			local Decode = game:GetService("HttpService"):JSONDecode(readfile("Vỹ-Gaming Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"))
			local Array = {}
			for i,v in pairs(_G.Settings) do
				Array[i] = v
			end
			writefile("Vỹ-Gaming Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(Array))
		end
	else
		return warn("Status : Undetected Executor")
	end
end

LoadSettings()

if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
end

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

-- Anti Cheat
function CheckAntiCheatBypass()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
                v:Destroy()
            end
        end
    end
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "RobloxMotor6DBugFix" or v.Name == "Clans"  or v.Name == "Codes" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
                v:Destroy()
            end
        end
    end
end

task.spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			if _G.Settings.Main["Auto Farm Level"] or _G.Settings.Main["Auto New World"] or
			_G.Settings.Main["Auto Third World"] or
			--[Boss]
			_G.Settings.Boss["Auto Farm All Boss"] or _G.Settings.Boss["Auto Farm Boss"] or
			_G.Settings.Main["Mob Aura"] then
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
					if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
						game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
					end
					local BodyVelocity = Instance.new("BodyVelocity")
					BodyVelocity.Name = "BodyVelocity1"
					BodyVelocity.Parent =  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
					BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
					BodyVelocity.Velocity = Vector3.new(0, 0, 0)
					end
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			else
				if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
					game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy();
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
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then
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

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()

function CurrentWeapon()
	local ac = CombatFrameworkR.activeController
	local ret = ac.blades[1]
	if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
	pcall(function()
		while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
	end)
	if not ret then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end
	return ret
end

function getAllBladeHitsPlayers(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()
	for i=1,#Characters do local v = Characters[i]
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes + 5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end

function getAllBladeHits(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()
	for i=1,#Enemies do local v = Enemies[i]
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes + 5 then
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
					v:Play(0.01, 0.01, 0.01)
				end                 
				if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then 
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
					game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
					game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
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
					v:Play(0.01, 0.01, 0.01)
				end                 
				if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then 
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
					game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
					game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
				end
			end
		end
	end
end

-- Isnetwork Owner

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

-- Abandoned Quest

function Com(com,...)
	local Remote = game:GetService('ReplicatedStorage').Remotes:FindFirstChild("Comm"..com)
	if Remote:IsA("RemoteEvent") then
		Remote:FireServer(...)
	elseif Remote:IsA("RemoteFunction") then
		Remote:InvokeServer(...)
	end
end

function topos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
            pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/150, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
            tween:Play()
        if Distance <= 1000 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
        _G.Clip = false
    end
end

-- Tween Functions

local function GetIsLand(...)
	local RealtargetPos = {...}
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

-- Tween Functions (toTarget)

local function toTarget(...)
	local RealtargetPos = {...}
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
		Speed = 350
	elseif Distance >= 1000 then
		Speed = 370
	end
	if _G.Settings.Setting["Bypass TP"] then
		if Distance > 3000 and not _G.Settings.Main["Auto Holy Torch"] and not _G.Settings.Main["Auto Saber"] and not AutoFarmMaterial and not _G.Settings.FightingStyle["Auto God Human"] and not _G.Settings.Raids["Auto Raids"] and not (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")) then
			pcall(function()
				tween:Cancel()
				fkwarp = false
				if game:GetService("Players")["LocalPlayer"].Data:FindFirstChild("SpawnPoint").Value == tostring(GetIsLand(RealTarget)) then 
					wait(0.01)
					Com("F_","TeleportToSpawn")
				elseif game:GetService("Players")["LocalPlayer"].Data:FindFirstChild("LastSpawnPoint").Value == tostring(GetIsLand(RealTarget)) then
					game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
					wait(0.01)
					repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
				else
					if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
						if fkwarp == false then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = RealTarget
						end
						fkwarp = true
					end
					wait(0.01)
					game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
					repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
					wait(0.01)
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
		tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = RealTarget})
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
	tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end

-- Functions Click

function ClickCamera()
	game:GetService("VirtualUser"):CaptureController()
	game:GetService("VirtualUser"):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
function Click()
	game:GetService("VirtualUser"):CaptureController()
	game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
end

-- Remove Text Fruits

function RemoveFruit(str)
	return str:gsub("Fruit", "")
end

-- Comma Value

function comma_value(p1)
	local v1 = p1;
	while true do
		local v2, v3 = string.gsub(v1, "^(-?%d+)(%d%d%d)", "%1,%2");
		v1 = v2;
		if v3 ~= 0 then else
			break;
		end;	
	end;
	return v1;
end;

-- Check Fruit 1M

_G.CheckFruitLocal1M = false
function CheckFruit1M()
	for i,v in pairs(game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("getInventoryFruits")) do
		if v.Price >= 1000000 then 
			_G.CheckFruitLocal1M = true
		end
	end
end

-- Get FightingStyle

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

-- CheckMasteryWeapon

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

--GetWeaponInventory

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

-- GetMaterial

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
	}
elseif World2 then
	AllMaterial = {
		"Magma Ore",
		"Scrap Metal",
		"Radioactive Material",
		"Vampire Fang",
		"Mystic Droplet",
	}
elseif World3 then
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

-- CheckMaterial

local function CheckMaterial(v1)
	if World1 then 
		if (v1=="Magma Ore") then 
			MaterialMob={"Military Soldier","Military Spy"};
			CFrameMon=CFrame.new( -5815,84,8820);
		elseif ((v1=="Leather") or (v1=="Scrap Metal")) then 
			MaterialMob={"Brute"};
			CFrameMon=CFrame.new( -1145,15,4350);
		elseif (v1=="Angel Wings") then 
			MaterialMob={"God's Guard"};
			CFrameMon=CFrame.new( -4698,845, -1912);
		elseif (v1=="Fish Tail") then 
			MaterialMob={"Fishman Warrior","Fishman Commando"};
			CFrameMon=CFrame.new(61123,19,1569);
		end 
	end 
	if World2 then 
		if (v1=="Magma Ore") then 
			MaterialMob={"Magma Ninja"};
			CFrameMon=CFrame.new( -5428,78, -5959);
		elseif (v1=="Scrap Metal") then
			MaterialMob={"Swan Pirate"};
			CFrameMon=CFrame.new(878,122,1235);
		elseif (v1=="Radioactive Material") then 
			MaterialMob={"Factory Staff"};
			CFrameMon=CFrame.new(295,73, -56);
		elseif (v1=="Vampire Fang") then 
			MaterialMob={"Vampire"};
			CFrameMon=CFrame.new( -6033,7, -1317);
		elseif (v1=="Mystic Droplet") then 
			MaterialMob={"Water Fighter","Sea Soldier"};
			CFrameMon=CFrame.new( -3385,239, -10542);
		end 
	end 
	if World3 then 
		if (v1=="Mini Tusk") then 
			MaterialMob={"Mythological Pirate"};
			CFrameMon=CFrame.new( -13545,470, -6917);
		elseif (v1=="Fish Tail") then 
			MaterialMob={"Fishman Raider","Fishman Captain"};
			CFrameMon=CFrame.new( -10993,332, -8940);
		elseif (v1=="Scrap Metal") then 
			MaterialMob={"Jungle Pirate"};
			CFrameMon=CFrame.new( -12107,332, -10549);
		elseif (v1=="Dragon Scale") then 
			MaterialMob={"Dragon Crew Archer","Dragon Crew Warrior"};
			CFrameMon=CFrame.new(6594,383,139);
		elseif (v1=="Conjured Cocoa") then 
			MaterialMob={"Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel"};
			CFrameMon=CFrame.new(620.6344604492188,78.93644714355469, -12581.369140625);
		elseif (v1=="Demonic Wisp") then MaterialMob={"Demonic Soul"};
			CFrameMon=CFrame.new( -9507,172,6158);
		elseif (v1=="Gunpowder") then MaterialMob={"Pistol Billionaire"};
			CFrameMon=CFrame.new( -469,74,5904);
		end 
	end 
end

function CheckQuest()
	local MyLevel = game.Players.LocalPlayer.Data.Level.Value
	if World1 then
		if MyLevel == 1 or MyLevel <= 9 then -- Bandit
			LevelFarm = 1

			Name = "Bandit"
			QuestName = "BanditQuest1"

			LevelQuest = 1
			NameMon = "Bandit"

			CFrameMon = CFrame.new(1145, 17, 1634)
			VectorMon = Vector3.new(1145, 17, 1634)

			CFrameQuest = CFrame.new(1060, 17, 1547)
			VectorQuest = Vector3.new(1060, 17, 1547)
		elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
			LevelFarm = 2

			Name = "Monkey"
			QuestName = "JungleQuest"

			LevelQuest = 1
			NameMon = "Monkey"

			CFrameMon = CFrame.new(-1496, 39, 35)
			VectorMon = Vector3.new(-1496, 39, 35)

			CFrameQuest = CFrame.new(-1602, 37, 152)
			VectorQuest = Vector3.new(-1602, 37, 152)
		elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
			LevelFarm = 3

			Name = "Gorilla"
			QuestName = "JungleQuest"

			LevelQuest = 2
			NameMon = "Gorilla"

			CFrameMon = CFrame.new(-1237, 6, -486)
			VectorMon = Vector3.new(-1237, 7, -486)

			CFrameQuest = CFrame.new(-1602, 37, 152)
			VectorQuest = Vector3.new(-1602, 37, 152)
		elseif MyLevel == 30 or MyLevel <= 39 then -- Pirate
			LevelFarm = 4

			Name = "Pirate"
			QuestName = "BuggyQuest1"

			LevelQuest = 1
			NameMon = "Pirate"

			CFrameMon = CFrame.new(-1115, 14, 3938)
			VectorMon = Vector3.new(-1115, 14, 3938)

			CFrameQuest = CFrame.new(-1140, 5, 3828)
			VectorQuest = Vector3.new(-1140, 5, 3828)
		elseif MyLevel == 40 or MyLevel <= 59 then -- Brute
			LevelFarm = 5

			Name = "Brute"
			QuestName = "BuggyQuest1"

			LevelQuest = 2
			NameMon = "Brute"

			CFrameMon = CFrame.new(-1145, 15, 4350)
			VectorMon = Vector3.new(-1146, 15, 4350)

			CFrameQuest = CFrame.new(-1140, 5, 3828)
			VectorQuest = Vector3.new(-1140, 5, 3828)
		elseif MyLevel == 60 or MyLevel <= 74 then -- Desert Bandit
			LevelFarm = 6

			Name = "Desert Bandit"
			QuestName = "DesertQuest"

			LevelQuest = 1
			NameMon = "Desert Bandit"

			CFrameMon = CFrame.new(932, 7, 4484)
			VectorMon = Vector3.new(932, 7, 4484)

			CFrameQuest = CFrame.new(897, 7, 4388)
			VectorQuest = Vector3.new(897, 7, 4388)
		elseif MyLevel == 75 or MyLevel <= 89 then -- Desert Officre
			LevelFarm = 7

			Name = "Desert Officer"
			QuestName = "DesertQuest"

			LevelQuest = 2
			NameMon = "Desert Officer"

			CFrameMon = CFrame.new(1572, 10, 4373)
			VectorMon = Vector3.new(1572, 10, 4373)

			CFrameQuest = CFrame.new(897, 7, 4388)
			VectorQuest = Vector3.new(897, 7, 4388)
		elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits
			LevelFarm = 8

			Name = "Snow Bandit"
			QuestName = "SnowQuest"

			LevelQuest = 1
			NameMon = "Snow Bandits"

			CFrameMon = CFrame.new(1289, 150, -1442)
			VectorMon = Vector3.new(1289, 106, -1442)

			CFrameQuest = CFrame.new(1386, 87, -1297)
			VectorQuest = Vector3.new(1386, 87, -1297)
		elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman
			LevelFarm = 9

			Name = "Snowman"
			QuestName = "SnowQuest"

			LevelQuest = 2
			NameMon = "Snowman"

			CFrameMon = CFrame.new(1289, 150, -1442)
			VectorMon = Vector3.new(1289, 106, -1442)

			CFrameQuest = CFrame.new(1386, 87, -1297)
			VectorQuest = Vector3.new(1386, 87, -1297)
		elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer
			LevelFarm = 10

			Name = "Chief Petty Officer"
			QuestName = "MarineQuest2"

			LevelQuest = 1
			NameMon = "Chief Petty Officer"

			CFrameMon = CFrame.new(-4855, 23, 4308)
			VectorMon = Vector3.new(-4855, 23, 4308)

			CFrameQuest = CFrame.new(-5036, 29, 4325)
			VectorQuest = Vector3.new(-5036, 29, 4325)
		elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit
			LevelFarm = 11

			Name = "Sky Bandit"
			QuestName = "SkyQuest"

			LevelQuest = 1
			NameMon = "Sky Bandit"

			CFrameMon = CFrame.new(-4981, 278, -2830)
			VectorMon = Vector3.new(-4981, 278, -2830)

			CFrameQuest = CFrame.new(-4842, 718, -2623)
			VectorQuest = Vector3.new(-4842, 718, -2623)
		elseif MyLevel == 175 or MyLevel <= 189 then -- Dark Master
			LevelFarm = 12

			Name = "Dark Master"
			QuestName = "SkyQuest"

			LevelQuest = 2
			NameMon = "Dark Master"

			CFrameMon = CFrame.new(-5250, 389, -2272)
			VectorMon = Vector3.new(-5250, 389, -2272)

			CFrameQuest = CFrame.new(-4842, 718, -2623)
			VectorQuest = Vector3.new(-4842, 718, -2623)
		elseif MyLevel == 190 or MyLevel <= 209 then -- Dark Master
			LevelFarm = 13

			Name = "Prisoner"
			QuestName = "PrisonerQuest"

			LevelQuest = 1
			NameMon = "Prisoner"

			CFrameMon = CFrame.new(5411, 96, 690)
			VectorMon = Vector3.new(5411, 96, 690)

			CFrameQuest = CFrame.new(5308, 2, 474)
			VectorQuest = Vector3.new(5308, 2, 474)
		elseif MyLevel == 210 or MyLevel <= 249 then -- Dark Master
			LevelFarm = 14

			Name = "Dangerous Prisoner"
			QuestName = "PrisonerQuest"

			LevelQuest = 2
			NameMon = "Dangerous Prisoner"

			CFrameMon = CFrame.new(5411, 96, 690)
			VectorMon = Vector3.new(5411, 96, 690)

			CFrameQuest = CFrame.new(5308, 2, 474)
			VectorQuest = Vector3.new(5308, 2, 474)
		elseif MyLevel == 250 or MyLevel <= 299 then -- Toga Warrior
			LevelFarm = 15

			Name = "Toga Warrior"
			QuestName = "ColosseumQuest"

			LevelQuest = 1
			NameMon = "Toga Warrior"

			CFrameMon = CFrame.new(-1824, 50, -2743)
			VectorMon = Vector3.new(-1824, 50, -2743)

			CFrameQuest = CFrame.new(-1576, 8, -2985)
			VectorQuest = Vector3.new(-1576, 8, -2985)
		elseif MyLevel == 300 or MyLevel <= 324 then -- Military Soldier
			LevelFarm = 16

			Name = "Military Soldier"
			QuestName = "MagmaQuest"

			LevelQuest = 1
			NameMon = "Military Soldier"

			CFrameMon = CFrame.new(-5408, 11, 8447)
			VectorMon = Vector3.new(-5408, 11, 8447)

			CFrameQuest = CFrame.new(-5316, 12, 8517)
			VectorQuest = Vector3.new(-5316, 12, 8517)
		elseif MyLevel == 325 or MyLevel <= 374 then -- Military Spy
			LevelFarm = 17

			Name = "Military Spy"
			QuestName = "MagmaQuest"

			LevelQuest = 2
			NameMon = "Military Spy"

			CFrameMon = CFrame.new(-5815, 84, 8820)
			VectorMon = Vector3.new(-5815, 84, 8820)

			CFrameQuest = CFrame.new(-5316, 12, 8517)
			VectorQuest = Vector3.new(-5316, 12, 8517)
		elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior
			LevelFarm = 18

			Name = "Fishman Warrior"
			QuestName = "FishmanQuest"

			LevelQuest = 1
			NameMon = "Fishman Warrior"

			CFrameMon = CFrame.new(60859, 19, 1501)
			VectorMon = Vector3.new(60859, 19, 1501)

			CFrameQuest = CFrame.new(61123, 19, 1569)
			VectorQuest = Vector3.new(61123, 19, 1569)
		elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando
			LevelFarm = 19

			Name = "Fishman Commando"
			QuestName = "FishmanQuest"

			LevelQuest = 2
			NameMon = "Fishman Commando"

			CFrameMon = CFrame.new(61891, 19, 1470)
			VectorMon = Vector3.new(61891, 19, 1470)

			CFrameQuest = CFrame.new(61123, 19, 1569)
			VectorQuest = Vector3.new(61123, 19, 1569)
		elseif MyLevel == 450 or MyLevel <= 474 then -- God's Guards
			LevelFarm = 20

			Name = "God's Guard"
			QuestName = "SkyExp1Quest"

			LevelQuest = 1
			NameMon = "God's Guards"

			CFrameMon = CFrame.new(-4698, 845, -1912)
			VectorMon = Vector3.new(-4698, 845, -1912)

			CFrameQuest = CFrame.new(-4722, 845, -1954)
			VectorQuest = Vector3.new(-4722, 846, -1954)
		elseif MyLevel == 475 or MyLevel <= 524 then -- Shandas
			LevelFarm = 21

			Name = "Shanda"
			QuestName = "SkyExp1Quest"

			LevelQuest = 2
			NameMon = "Shandas"

			CFrameMon = CFrame.new(-7685, 5567, -502)
			VectorMon = Vector3.new(-7685, 5567, -502)

			CFrameQuest = CFrame.new(-7862, 5546, -380)
			VectorQuest = Vector3.new(-7862, 5546, -380)
		elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad
			LevelFarm = 22

			Name = "Royal Squad"
			QuestName = "SkyExp2Quest"

			LevelQuest = 1
			NameMon = "Royal Squad"

			CFrameMon = CFrame.new(-7670, 5607, -1460)
			VectorMon = Vector3.new(-7670, 5607, -1460)

			CFrameQuest = CFrame.new(-7904, 5636, -1412)
			VectorQuest = Vector3.new(-7904, 5636, -1412)
		elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier
			LevelFarm = 23

			Name = "Royal Soldier"
			QuestName = "SkyExp2Quest"

			LevelQuest = 2
			NameMon = "Royal Soldier"

			CFrameMon = CFrame.new(-7828, 5607, -1744)
			VectorMon = Vector3.new(-7828, 5607, -1744)

			CFrameQuest = CFrame.new(-7904, 5636, -1412)
			VectorQuest = Vector3.new(-7904, 5636, -1412)
		elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate
			LevelFarm = 24

			Name = "Galley Pirate"
			QuestName = "FountainQuest"

			LevelQuest = 1
			NameMon = "Galley Pirate"

			CFrameMon = CFrame.new(5589, 45, 3996)
			VectorMon = Vector3.new(5589, 45, 3996)

			CFrameQuest = CFrame.new(5256, 39, 4050)
			VectorQuest = Vector3.new(5256, 39, 4050)
		elseif MyLevel >= 650 then -- Galley Captain
			LevelFarm = 25

			Name = "Galley Captain"
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

			Name = "Raider"
			QuestName = "Area1Quest"

			LevelQuest = 1
			NameMon = "Raider"

			CFrameQuest = CFrame.new(-425, 73, 1837)
			VectorQuest = Vector3.new(-425, 73, 1837)

			CFrameMon = CFrame.new(-746, 39, 2390)
			VectorMon = Vector3.new(-746, 39, 2389)
		elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary [Lv. 725]
			LevelFarm = 2

			Name = "Mercenary"
			QuestName = "Area1Quest"

			LevelQuest = 2
			NameMon = "Mercenary"

			CFrameQuest = CFrame.new(-425, 73, 1837)
			VectorQuest = Vector3.new(-425, 73, 1837)

			CFrameMon = CFrame.new(-874, 141, 1312)
			VectorMon = Vector3.new(-874, 141, 1312)
		elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate [Lv. 775]
			LevelFarm = 3

			Name = "Swan Pirate"
			QuestName = "Area2Quest"

			LevelQuest = 1
			NameMon = "Swan Pirate"

			CFrameQuest = CFrame.new(634, 73, 918)
			VectorQuest = Vector3.new(634, 73, 918)

			CFrameMon = CFrame.new(878, 122, 1235)
			VectorMon = Vector3.new(878, 122, 1235)
		elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff [Lv. 800]
			LevelFarm = 4

			Name = "Factory Staff"
			QuestName = "Area2Quest"

			LevelQuest = 2
			NameMon = "Factory Staff"

			CFrameQuest = CFrame.new(634, 73, 918)
			VectorQuest = Vector3.new(634, 73, 918)

			CFrameMon = CFrame.new(295, 73, -56)
			VectorMon = Vector3.new(295, 73, -56)
		elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant [Lv. 875]
			LevelFarm = 5

			Name = "Marine Lieutenant"
			QuestName = "MarineQuest3"

			LevelQuest = 1
			NameMon = "Marine Lieutenant"

			CFrameMon = CFrame.new(-2806, 73, -3038)
			VectorMon = Vector3.new(-2806, 73, -3038)

			CFrameQuest = CFrame.new(-2443, 73, -3219)
			VectorQuest = Vector3.new(-2443, 73, -3219)
		elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain [Lv. 900]
			LevelFarm = 6

			Name = "Marine Captain"
			QuestName = "MarineQuest3"

			LevelQuest = 2
			NameMon = "Marine Captain"

			CFrameMon = CFrame.new(-1869, 73, -3320)
			VectorMon = Vector3.new(-1869, 73, -3320)

			CFrameQuest = CFrame.new(-2443, 73, -3219)
			VectorQuest = Vector3.new(-2443, 73, -3219)
		elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie [Lv. 950]
			LevelFarm = 7

			Name = "Zombie"
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

			Name = "Snow Trooper"
			QuestName = "SnowMountainQuest"

			LevelQuest = 1
			NameMon = "Snow Trooper"

			CFrameMon = CFrame.new(478, 402, -5362)
			VectorMon = Vector3.new(478, 402, -5362)

			CFrameQuest = CFrame.new(605, 402, -5371)
			VectorQuest = Vector3.new(605, 402, -5371)
		elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior [Lv. 1050]
			LevelFarm = 10

			Name = "Winter Warrior"
			QuestName = "SnowMountainQuest"

			LevelQuest = 2
			NameMon = "Winter Warrior"

			CFrameMon = CFrame.new(1157, 430, -5188)
			VectorMon = Vector3.new(1157, 430, -5188)

			CFrameQuest = CFrame.new(605, 402, -5371)
			VectorQuest = Vector3.new(605, 402, -5371)
		elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate [Lv. 1100]
			LevelFarm = 11

			Name = "Lab Subordinate"
			QuestName = "IceSideQuest"

			LevelQuest = 1
			NameMon = "Lab Subordinate"

			CFrameMon = CFrame.new(-5782, 42, -4484)
			VectorMon = Vector3.new(-5782, 42, -4484)

			CFrameQuest = CFrame.new(-6060, 16, -4905)
			VectorQuest = Vector3.new(-6060, 16, -4905)
		elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior [Lv. 1125]
			LevelFarm = 12

			Name = "Horned Warrior"
			QuestName = "IceSideQuest"

			LevelQuest = 2
			NameMon = "Horned Warrior"

			CFrameMon = CFrame.new(-6406, 24, -5805)
			VectorMon = Vector3.new(-6406, 24, -5805)

			CFrameQuest = CFrame.new(-6060, 16, -4905)
			VectorQuest = Vector3.new(-6060, 16, -4905)
		elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja [Lv. 1175]
			LevelFarm = 13

			Name = "Magma Ninja"
			QuestName = "FireSideQuest"
			LevelQuest = 1
			NameMon = "Magma Ninja"

			CFrameMon = CFrame.new(-5428, 78, -5959)
			VectorMon = Vector3.new(-5428, 78, -5959)

			CFrameQuest = CFrame.new(-5430, 16, -5295)
			VectorQuest = Vector3.new(-5430, 16, -5296)
		elseif MyLevel == 1200 or MyLevel <= 1249 then -- Lava Pirate [Lv. 1200]
			LevelFarm = 14

			Name = "Lava Pirate"
			QuestName = "FireSideQuest"

			LevelQuest = 2
			NameMon = "Lava Pirate"

			CFrameMon = CFrame.new(-5270, 42, -4800)
			VectorMon = Vector3.new(-5270, 42, -4800)

			CFrameQuest = CFrame.new(-5430, 16, -5295)
			VectorQuest = Vector3.new(-5430, 16, -5296)
		elseif MyLevel == 1250 or MyLevel <= 1274 then -- Ship Deckhand [Lv. 1250]
			LevelFarm = 15

			Name = "Ship Deckhand"
			QuestName = "ShipQuest1"

			LevelQuest = 1
			NameMon = "Ship Deckhand"

			CFrameMon = CFrame.new(1198, 126, 33031)
			VectorMon = Vector3.new(1198, 126, 33031)

			CFrameQuest = CFrame.new(1038, 125, 32913)
			VectorQuest = Vector3.new(1038, 125, 32913)
		elseif MyLevel == 1275 or MyLevel <= 1299 then -- Ship Engineer [Lv. 1275]
			LevelFarm = 16

			Name = "Ship Engineer"
			QuestName = "ShipQuest1"

			LevelQuest = 2
			NameMon = "Ship Engineer"

			CFrameMon = CFrame.new(918, 44, 32787)
			VectorMon = Vector3.new(918, 44, 32787)

			CFrameQuest = CFrame.new(1038, 125, 32913)
			VectorQuest = Vector3.new(1038, 125, 32913)
		elseif MyLevel == 1300 or MyLevel <= 1324 then -- Ship Steward [Lv. 1300]
			LevelFarm = 17

			Name = "Ship Steward"
			QuestName = "ShipQuest2"

			LevelQuest = 1
			NameMon = "Ship Steward"

			CFrameMon = CFrame.new(915, 130, 33419)
			VectorMon = Vector3.new(915, 130, 33419)

			CFrameQuest = CFrame.new(969, 125, 33245)
			VectorQuest = Vector3.new(969, 125, 33245)
		elseif MyLevel == 1325 or MyLevel <= 1349 then -- Ship Officer [Lv. 1325]
			LevelFarm = 18

			Name = "Ship Officer"
			QuestName = "ShipQuest2"

			LevelQuest = 2
			NameMon = "Ship Officer"

			CFrameMon = CFrame.new(916, 181, 33335)
			VectorMon = Vector3.new(916, 181, 33335)

			CFrameQuest = CFrame.new(969, 125, 33245)
			VectorQuest = Vector3.new(969, 125, 33245)
		elseif MyLevel == 1350 or MyLevel <= 1374 then -- Arctic Warrior [Lv. 1350]
			LevelFarm = 19

			Name = "Arctic Warrior"
			QuestName = "FrostQuest"

			LevelQuest = 1
			NameMon = "Arctic Warrior"

			CFrameMon = CFrame.new(6038, 29, -6231)
			VectorMon = Vector3.new(6038, 29, -6231)

			VectorQuest = Vector3.new(5669, 28, -6482)
			CFrameQuest = CFrame.new(5669, 28, -6482)
		elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker [Lv. 1375]
			LevelFarm = 20

			Name = "Snow Lurker"
			QuestName = "FrostQuest"

			LevelQuest = 2
			NameMon = "Snow Lurker"

			CFrameMon = CFrame.new(5560, 42, -6826)
			VectorMon = Vector3.new(5560, 42, -6826)

			VectorQuest = Vector3.new(5669, 28, -6482)
			CFrameQuest = CFrame.new(5669, 28, -6482)
		elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier [Lv. 1425]
			LevelFarm = 21
			Name = "Sea Soldier"
			QuestName = "ForgottenQuest"

			LevelQuest = 1
			NameMon = "Sea Soldier"

			CFrameMon = CFrame.new(-3022, 16, -9722)
			VectorMon = Vector3.new(-3022, 16, -9722)

			CFrameQuest = CFrame.new(-3054, 237, -10148)
			VectorQuest = Vector3.new(-3054, 237, -10148)
		elseif MyLevel >= 1450 then -- Water Fighter [Lv. 1450]
			LevelFarm = 22
			Name = "Water Fighter"
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

			Name = "Pirate Millionaire"
			QuestName = "PiratePortQuest"

			LevelQuest = 1
			NameMon = "Pirate"

			CFrameMon = CFrame.new(-373, 75, 5550)
			VectorMon = Vector3.new(-373, 75, 5550)

			CFrameQuest = CFrame.new(-288, 44, 5576)
			VectorQuest = Vector3.new(-288, 44, 5576)
		elseif MyLevel == 1525 or MyLevel <= 1574 then
			LevelFarm = 2

			Name = "Pistol Billionaire"
			QuestName = "PiratePortQuest"

			LevelQuest = 2
			NameMon = "Pistol"

			CFrameMon = CFrame.new(-469, 74, 5904)
			VectorMon = Vector3.new(-469, 74, 5904)

			CFrameQuest = CFrame.new(-288, 44, 5576)
			VectorQuest = Vector3.new(-288, 44, 5576)
		elseif MyLevel == 1575 or MyLevel <= 1599 then
			LevelFarm = 3

			Name = "Dragon Crew Warrior"
			QuestName = "AmazonQuest"

			LevelQuest = 1
			NameMon = "Warrior"

			CFrameMon = CFrame.new(6339, 52, -1213)
			VectorMon = Vector3.new(6338, 52, -1213)

			CFrameQuest = CFrame.new(5835, 52, -1105)
			VectorQuest = Vector3.new(5835, 52, -1105)
		elseif MyLevel == 1600 or MyLevel <= 1624 then
			LevelFarm = 4

			Name = "Dragon Crew Archer"
			QuestName = "AmazonQuest"

			LevelQuest = 2
			NameMon = "Archer"

			CFrameMon = CFrame.new(6594, 383, 139)
			VectorMon = Vector3.new(6594, 383, 139)

			CFrameQuest = CFrame.new(5835, 52, -1105)
			VectorQuest = Vector3.new(5835, 52, -1105)
		elseif MyLevel == 1625 or MyLevel <= 1649 then
			LevelFarm = 5

			Name = "Female Islander"
			QuestName = "AmazonQuest2"

			LevelQuest = 1
			NameMon = "Female"

			CFrameMon = CFrame.new(5308, 819, 1047)
			VectorMon = Vector3.new(5308, 819, 1047)

			CFrameQuest = CFrame.new(5443, 602, 751)
			VectorQuest = Vector3.new(5443, 602, 751)
		elseif MyLevel == 1650 or MyLevel <= 1699 then
			LevelFarm = 6

			Name = "Giant Islander"
			QuestName = "AmazonQuest2"

			LevelQuest = 2
			NameMon = "Giant Islanders"

			CFrameMon = CFrame.new(4951, 602, -68)
			VectorMon = Vector3.new(4951, 602, -68)

			CFrameQuest = CFrame.new(5443, 602, 751)
			VectorQuest = Vector3.new(5443, 602, 751)
		elseif MyLevel == 1700 or MyLevel <= 1724 then
			LevelFarm = 7

			Name = "Marine Commodore"
			QuestName = "MarineTreeIsland"

			LevelQuest = 1
			NameMon = "Marine Commodore"

			CFrameMon = CFrame.new(2447, 73, -7470)
			VectorMon = Vector3.new(2447, 73, -7470)

			CFrameQuest = CFrame.new(2180, 29, -6737)
			VectorQuest = Vector3.new(2180, 29, -6737)
		elseif MyLevel == 1725 or MyLevel <= 1774 then
			LevelFarm = 8

			Name = "Marine Rear Admiral"
			QuestName = "MarineTreeIsland"

			LevelQuest = 2
			NameMon = "Marine Rear Admiral"

			CFrameMon = CFrame.new(3671, 161, -6932)
			VectorMon = Vector3.new(3671, 161, -6932)

			CFrameQuest = CFrame.new(2180, 29, -6737)
			VectorQuest = Vector3.new(2180, 29, -6737)
		elseif MyLevel == 1775 or MyLevel <= 1800 then
			LevelFarm = 9

			Name = "Fishman Raider"
			QuestName = "DeepForestIsland3"

			LevelQuest = 1
			NameMon = "Fishman Raider"

			CFrameMon = CFrame.new(-10560, 332, -8466)
			VectorMon = Vector3.new(-10560, 332, -8466)

			CFrameQuest = CFrame.new(-10584, 332, -8758)
			VectorQuest = Vector3.new(-10584, 332, -8758)
		elseif MyLevel == 1800 or MyLevel <= 1824 then
			LevelFarm = 10

			Name = "Fishman Captain"
			QuestName = "DeepForestIsland3"

			LevelQuest = 2
			NameMon = "Fishman Captain"

			CFrameMon = CFrame.new(-10993, 332, -8940)
			VectorMon = Vector3.new(-10993, 332, -8940)

			CFrameQuest = CFrame.new(-10584, 332, -8758)
			VectorQuest = Vector3.new(-10584, 332, -8758)
		elseif MyLevel == 1825 or MyLevel <= 1849 then
			LevelFarm = 11

			Name = "Forest Pirate"
			QuestName = "DeepForestIsland"

			LevelQuest = 1
			NameMon = "Forest Pirate"

			CFrameMon = CFrame.new(-13479, 333, -7905)
			VectorMon = Vector3.new(-13479, 333, -7905)

			CFrameQuest = CFrame.new(-13232, 333, -7627)
			VectorQuest = Vector3.new(-13232, 333, -7627)
		elseif MyLevel == 1850 or MyLevel <= 1899 then
			LevelFarm = 12

			Name = "Mythological Pirate"
			QuestName = "DeepForestIsland"

			LevelQuest = 2
			NameMon = "Mythological Pirate"

			CFrameMon = CFrame.new(-13545, 470, -6917)
			VectorMon = Vector3.new(-13545, 470, -6917)

			CFrameQuest = CFrame.new(-13232, 333, -7627)
			VectorQuest = Vector3.new(-13232, 333, -7627)
		elseif MyLevel == 1900 or MyLevel <= 1924 then
			LevelFarm = 13

			Name = "Jungle Pirate"
			QuestName = "DeepForestIsland2"

			LevelQuest = 1
			NameMon = "Jungle Pirate"

			CFrameMon = CFrame.new(-12107, 332, -10549)
			VectorMon = Vector3.new(-12106, 332, -10549)

			CFrameQuest = CFrame.new(-12684, 391, -9902)
			VectorQuest = Vector3.new(-12684, 391, -9902)
		elseif MyLevel == 1925 or MyLevel <= 1974 then
			LevelFarm = 14

			Name = "Musketeer Pirate"
			QuestName = "DeepForestIsland2"

			LevelQuest = 2
			NameMon = "Musketeer Pirate"

			CFrameMon = CFrame.new(-13286, 392, -9769)
			VectorMon = Vector3.new(-13286, 392, -9768)

			CFrameQuest = CFrame.new(-12684, 391, -9902)
			VectorQuest = Vector3.new(-12684, 391, -9902)
		elseif MyLevel == 1975 or MyLevel <= 1999 then
			LevelFarm = 15
			Name = "Reborn Skeleton"
			QuestName = "HauntedQuest1"

			LevelQuest = 1
			NameMon = "Reborn Skeleton"

			CFrameMon = CFrame.new(-8760, 142, 6039)
			VectorMon = Vector3.new(-8760, 142, 6039)

			CFrameQuest = CFrame.new(-9482, 142, 5567)
			VectorQuest = Vector3.new(-9482, 142, 5567)
		elseif MyLevel == 2000 or MyLevel <= 2024 then
			LevelFarm = 16

			Name = "Living Zombie"
			QuestName = "HauntedQuest1"

			LevelQuest = 2
			NameMon = "Living Zombie"

			CFrameMon = CFrame.new(-10144, 140, 5932)
			VectorMon = Vector3.new(-10144, 140, 5932)

			CFrameQuest = CFrame.new(-9482, 142, 5567)
			VectorQuest = Vector3.new(-9482, 142, 5567)
		elseif MyLevel == 2025 or MyLevel <= 2049 then
			LevelFarm = 17

			Name = "Demonic Soul"
			QuestName = "HauntedQuest2"

			LevelQuest = 1
			NameMon = "Demonic Soul"

			CFrameMon = CFrame.new(-9507, 172, 6158)
			VectorMon = Vector3.new(-9506, 172, 6158)

			CFrameQuest = CFrame.new(-9513, 172, 6079)
			VectorQuest = Vector3.new(-9513, 172, 6079)
		elseif MyLevel == 2050 or MyLevel <= 2074 then
			LevelFarm = 18

			Name = "Posessed Mummy"
			QuestName = "HauntedQuest2"

			LevelQuest = 2
			NameMon = "Posessed Mummy"

			CFrameMon = CFrame.new(-9577, 6, 6223)
			VectorMon = Vector3.new(-9577, 6, 6223)

			CFrameQuest = CFrame.new(-9513, 172, 6079)
			VectorQuest = Vector3.new(-9513, 172, 6079)

		elseif MyLevel == 2075 or MyLevel <= 2099 then
			LevelFarm = 19

			Name = "Peanut Scout"
			QuestName = "NutsIslandQuest"

			LevelQuest = 1
			NameMon = "Peanut Scout"

			CFrameMon = CFrame.new(-2124, 123, -10435)
			VectorMon = Vector3.new(-2124, 123, -10435)

			CFrameQuest = CFrame.new(-2104, 38, -10192)
			VectorQuest = Vector3.new(-2104, 38, -10192)
		elseif MyLevel == 2100 or MyLevel <= 2124 then
			LevelFarm = 20

			Name = "Peanut President"
			QuestName = "NutsIslandQuest"

			LevelQuest = 2
			NameMon = "Peanut President"

			CFrameMon = CFrame.new(-2124, 123, -10435)
			VectorMon = Vector3.new(-2124, 123, -10435)

			CFrameQuest = CFrame.new(-2104, 38, -10192)
			VectorQuest = Vector3.new(-2104, 38, -10192)
		elseif MyLevel == 2125 or MyLevel <= 2149 then
			LevelFarm = 21

			Name = "Ice Cream Chef"
			QuestName = "IceCreamIslandQuest"

			LevelQuest = 1
			NameMon = "Ice Cream Chef"

			CFrameMon = CFrame.new(-641, 127, -11062)
			VectorMon = Vector3.new(-641, 127, -11062)

			CFrameQuest = CFrame.new(-822, 66, -10965)
			VectorQuest = Vector3.new(-822, 66, -10965)
		elseif MyLevel == 2150 or MyLevel <= 2199 then
			LevelFarm = 22

			Name = "Ice Cream Commander"
			QuestName = "IceCreamIslandQuest"

			LevelQuest = 2
			NameMon = "Ice Cream Commander"

			CFrameMon = CFrame.new(-641, 127, -11062)
			VectorMon = Vector3.new(-641, 127, -11062)

			CFrameQuest = CFrame.new(-822, 66, -10965)
			VectorQuest = Vector3.new(-822, 66, -10965)
		elseif MyLevel == 2200 or MyLevel <= 2224 then
			LevelFarm = 23

			Name = "Cookie Crafter"
			QuestName = "CakeQuest1"

			LevelQuest = 1
			NameMon = "Cookie Crafter"

			CFrameMon = CFrame.new(-2365, 38, -12099)
			VectorMon = Vector3.new(-2365, 38, -12099)

			CFrameQuest = CFrame.new(-2020, 38, -12025)
			VectorQuest = Vector3.new(-2020, 38, -12025)
		elseif MyLevel == 2225 or MyLevel <= 2249 then
			LevelFarm = 24

			Name = "Cake Guard"
			QuestName = "CakeQuest1"

			LevelQuest = 2
			NameMon = "Cake Guard"

			CFrameMon = CFrame.new(-1651, 38, -12308)
			VectorMon = Vector3.new(-1651, 38, -12308)

			CFrameQuest = CFrame.new(-2020, 38, -12025)
			VectorQuest = Vector3.new(-2020, 38, -12025)
		elseif MyLevel == 2250 or MyLevel <= 2274 then
			LevelFarm = 25

			Name = "Baking Staff"
			QuestName = "CakeQuest2"

			LevelQuest = 1
			NameMon = "Baking Staff"

			CFrameMon = CFrame.new(-1870, 38, -12938)
			VectorMon = Vector3.new(-1870, 38, -12938)

			CFrameQuest = CFrame.new(-1926, 38, -12850)
			VectorQuest = Vector3.new(-1926, 38, -12850)
		elseif MyLevel == 2275 or MyLevel <= 2299 then
			LevelFarm = 26

			Name = "Head Baker"
			QuestName = "CakeQuest2"

			LevelQuest = 2
			NameMon = "Head Baker"

			CFrameMon = CFrame.new(-1926, 88, -12850)
			VectorMon = CFrame.new(-1870, 38, -12938)

			CFrameQuest = CFrame.new(-1926, 38, -12850)
			VectorQuest = Vector3.new(-1926, 38, -12850)
		elseif MyLevel == 2300 or MyLevel <= 2324 then
			LevelFarm = 27

			Name = "Cocoa Warrior"
			QuestName = "ChocQuest1"

			LevelQuest = 1
			NameMon = "Cocoa Warrior"

			CFrameMon = CFrame.new(231, 23, -12194)
			VectorMon = CFrame.new(231, 23, -12194)

			CFrameQuest = CFrame.new(231, 23, -12194)
			VectorQuest = Vector3.new(231, 23, -12194)
		elseif MyLevel == 2325 or MyLevel <= 2349 then
			LevelFarm = 28

			Name = "Chocolate Bar Battler"
			QuestName = "ChocQuest1"

			LevelQuest = 2
			NameMon = "Chocolate Bar Battler"

			CFrameMon = CFrame.new(231, 23, -12194)
			VectorMon = CFrame.new(231, 23, -12194)

			CFrameQuest = CFrame.new(231, 23, -12194)
			VectorQuest = Vector3.new(231, 23, -12194)
		elseif MyLevel == 2350 or MyLevel <= 2374 then
			LevelFarm = 29

			Name = "Sweet Thief"
			QuestName = "ChocQuest2"

			LevelQuest = 1
			NameMon = "Sweet Thief"

			CFrameMon = CFrame.new(71, 77, -12632)
			VectorMon = CFrame.new(71, 77, -12632)

			CFrameQuest = CFrame.new(151, 23, -12774)
			VectorQuest = Vector3.new(151, 23, -12774)
		elseif MyLevel == 2375 or MyLevel <= 2399 then
			LevelFarm = 30

			Name = "Candy Rebel"
			QuestName = "ChocQuest2"

			LevelQuest = 2
			NameMon = "Candy Rebel"

			CFrameMon = CFrame.new(134, 77, -12882)
			VectorMon = CFrame.new(134, 77, -12882)

			CFrameQuest = CFrame.new(151, 23, -12774)
			VectorQuest = Vector3.new(151, 23, -12774)
		elseif MyLevel == 2400 or MyLevel <= 2424 then
			LevelFarm = 31

			Name = "Candy Pirate"
			QuestName = "CandyQuest1"

			LevelQuest = 1
			NameMon = "Candy Pirate"

			CFrameMon = CFrame.new(-1347.97034, 48.202549, -14320.1348)
			VectorMon = CFrame.new(-1347.97034, 48.202549, -14320.1348)

			CFrameQuest = CFrame.new(-1149.41968, 13.7529411, -14445.0352)
			VectorQuest = Vector3.new(-1149.41968, 13.7529411, -14445.0352)
		elseif MyLevel >= 2425 then
			LevelFarm = 32

			Name = "Snow Demon"
			QuestName = "CandyQuest1"

			LevelQuest = 2
			NameMon = "Snow Demon"

			CFrameMon = CFrame.new(-928.981567, 16.1330452, -14501.04)
			VectorMon = CFrame.new(-928.981567, 16.1330452, -14501.04)

			CFrameQuest = CFrame.new(-1149.41968, 13.7529411, -14445.0352)
			VectorQuest = Vector3.new(-1149.41968, 13.7529411, -14445.0352)
		end
	end
end

function CheckOldQuest(LevelFarm)
	if World1 then
		if LevelFarm == 1 then -- Bandit
			Name = "Bandit"
			QuestName = "BanditQuest1"

			LevelQuest = 1
			NameMon = "Bandit"

			CFrameMon = CFrame.new(1145, 17, 1634)
			VectorMon = Vector3.new(1145, 17, 1634)

			CFrameQuest = CFrame.new(1060, 17, 1547)
			VectorQuest = Vector3.new(1060, 17, 1547)
		elseif LevelFarm == 2 then -- Monkey
			Name = "Monkey"
			QuestName = "JungleQuest"

			LevelQuest = 1
			NameMon = "Monkey"

			CFrameMon = CFrame.new(-1496, 39, 35)
			VectorMon = Vector3.new(-1496, 39, 35)

			CFrameQuest = CFrame.new(-1602, 37, 152)
			VectorQuest = Vector3.new(-1602, 37, 152)
		elseif LevelFarm == 3 then -- Gorilla
			Name = "Gorilla"
			QuestName = "JungleQuest"

			LevelQuest = 2
			NameMon = "Gorilla"

			CFrameMon = CFrame.new(-1237, 6, -486)
			VectorMon = Vector3.new(-1237, 7, -486)

			CFrameQuest = CFrame.new(-1602, 37, 152)
			VectorQuest = Vector3.new(-1602, 37, 152)
		elseif LevelFarm == 4 then -- Pirate
			Name = "Pirate"
			QuestName = "BuggyQuest1"

			LevelQuest = 1
			NameMon = "Pirate"

			CFrameMon = CFrame.new(-1115, 14, 3938)
			VectorMon = Vector3.new(-1115, 14, 3938)

			CFrameQuest = CFrame.new(-1140, 5, 3828)
			VectorQuest = Vector3.new(-1140, 5, 3828)
		elseif LevelFarm == 5 then -- Brute
			Name = "Brute"
			QuestName = "BuggyQuest1"

			LevelQuest = 2
			NameMon = "Brute"

			CFrameMon = CFrame.new(-1145, 15, 4350)
			VectorMon = Vector3.new(-1146, 15, 4350)

			CFrameQuest = CFrame.new(-1140, 5, 3828)
			VectorQuest = Vector3.new(-1140, 5, 3828)
		elseif LevelFarm == 6 then -- Desert Bandit
			Name = "Desert Bandit"
			QuestName = "DesertQuest"

			LevelQuest = 1
			NameMon = "Desert Bandit"

			CFrameMon = CFrame.new(932, 7, 4484)
			VectorMon = Vector3.new(932, 7, 4484)

			CFrameQuest = CFrame.new(897, 7, 4388)
			VectorQuest = Vector3.new(897, 7, 4388)
		elseif LevelFarm == 7 then -- Desert Officre
			Name = "Desert Officer"
			QuestName = "DesertQuest"

			LevelQuest = 2
			NameMon = "Desert Officer"

			CFrameMon = CFrame.new(1572, 10, 4373)
			VectorMon = Vector3.new(1572, 10, 4373)

			CFrameQuest = CFrame.new(897, 7, 4388)
			VectorQuest = Vector3.new(897, 7, 4388)
		elseif LevelFarm == 8 then -- Snow Bandits
			Name = "Snow Bandit"
			QuestName = "SnowQuest"

			LevelQuest = 1
			NameMon = "Snow Bandits"

			CFrameMon = CFrame.new(1289, 150, -1442)
			VectorMon = Vector3.new(1289, 106, -1442)

			CFrameQuest = CFrame.new(1386, 87, -1297)
			VectorQuest = Vector3.new(1386, 87, -1297)
		elseif LevelFarm == 9 then -- Snowman
			Name = "Snowman"
			QuestName = "SnowQuest"

			LevelQuest = 2
			NameMon = "Snowman"

			CFrameMon = CFrame.new(1289, 150, -1442)
			VectorMon = Vector3.new(1289, 106, -1442)

			CFrameQuest = CFrame.new(1386, 87, -1297)
			VectorQuest = Vector3.new(1386, 87, -1297)
		elseif LevelFarm == 10 then -- Chief Petty Officer
			Name = "Chief Petty Officer"
			QuestName = "MarineQuest2"

			LevelQuest = 1
			NameMon = "Chief Petty Officer"

			CFrameMon = CFrame.new(-4855, 23, 4308)
			VectorMon = Vector3.new(-4855, 23, 4308)

			CFrameQuest = CFrame.new(-5036, 29, 4325)
			VectorQuest = Vector3.new(-5036, 29, 4325)
		elseif LevelFarm == 11 then -- Sky Bandit
			Name = "Sky Bandit"
			QuestName = "SkyQuest"

			LevelQuest = 1
			NameMon = "Sky Bandit"

			CFrameMon = CFrame.new(-4981, 278, -2830)
			VectorMon = Vector3.new(-4981, 278, -2830)

			CFrameQuest = CFrame.new(-4842, 718, -2623)
			VectorQuest = Vector3.new(-4842, 718, -2623)
		elseif LevelFarm == 12 then -- Dark Master
			Name = "Dark Master"
			QuestName = "SkyQuest"

			LevelQuest = 2
			NameMon = "Dark Master"

			CFrameMon = CFrame.new(-5250, 389, -2272)
			VectorMon = Vector3.new(-5250, 389, -2272)

			CFrameQuest = CFrame.new(-4842, 718, -2623)
			VectorQuest = Vector3.new(-4842, 718, -2623)
		elseif LevelFarm == 13 then -- Dark Master
			Name = "Prisoner"
			QuestName = "PrisonerQuest"

			LevelQuest = 1
			NameMon = "Prisoner"

			CFrameMon = CFrame.new(5411, 96, 690)
			VectorMon = Vector3.new(5411, 96, 690)

			CFrameQuest = CFrame.new(5308, 2, 474)
			VectorQuest = Vector3.new(5308, 2, 474)
		elseif LevelFarm == 14 then -- Dark Master
			Name = "Dangerous Prisoner"
			QuestName = "PrisonerQuest"

			LevelQuest = 2
			NameMon = "Dangerous Prisoner"

			CFrameMon = CFrame.new(5411, 96, 690)
			VectorMon = Vector3.new(5411, 96, 690)

			CFrameQuest = CFrame.new(5308, 2, 474)
			VectorQuest = Vector3.new(5308, 2, 474)
		elseif LevelFarm == 15 then -- Toga Warrior
			Name = "Toga Warrior"
			QuestName = "ColosseumQuest"

			LevelQuest = 1
			NameMon = "Toga Warrior"

			CFrameMon = CFrame.new(-1770, 8, -2777)
			VectorMon = Vector3.new(-1770, 8, -2777)

			CFrameQuest = CFrame.new(-1576, 8, -2985)
			VectorQuest = Vector3.new(-1576, 8, -2985)
		elseif LevelFarm == 16 then -- Military Soldier
			Name = "Military Soldier"
			QuestName = "MagmaQuest"

			LevelQuest = 1
			NameMon = "Military Soldier"

			CFrameMon = CFrame.new(-5408, 11, 8447)
			VectorMon = Vector3.new(-5408, 11, 8447)

			CFrameQuest = CFrame.new(-5316, 12, 8517)
			VectorQuest = Vector3.new(-5316, 12, 8517)
		elseif LevelFarm == 17 then -- Military Spy
			Name = "Military Spy"
			QuestName = "MagmaQuest"

			LevelQuest = 2
			NameMon = "Military Spy"

			CFrameMon = CFrame.new(-5815, 84, 8820)
			VectorMon = Vector3.new(-5815, 84, 8820)

			CFrameQuest = CFrame.new(-5316, 12, 8517)
			VectorQuest = Vector3.new(-5316, 12, 8517)
		elseif LevelFarm == 18 then -- Fishman Warrior
			Name = "Fishman Warrior"
			QuestName = "FishmanQuest"

			LevelQuest = 1
			NameMon = "Fishman Warrior"

			CFrameMon = CFrame.new(60859, 19, 1501)
			VectorMon = Vector3.new(60859, 19, 1501)

			CFrameQuest = CFrame.new(61123, 19, 1569)
			VectorQuest = Vector3.new(61123, 19, 1569)
		elseif LevelFarm == 19 then -- Fishman Commando
			Name = "Fishman Commando"
			QuestName = "FishmanQuest"

			LevelQuest = 2
			NameMon = "Fishman Commando"

			CFrameMon = CFrame.new(61891, 19, 1470)
			VectorMon = Vector3.new(61891, 19, 1470)

			CFrameQuest = CFrame.new(61123, 19, 1569)
			VectorQuest = Vector3.new(61123, 19, 1569)
		elseif LevelFarm == 20 then -- God's Guards
			Name = "God's Guard"
			QuestName = "SkyExp1Quest"

			LevelQuest = 1
			NameMon = "God's Guards"

			CFrameMon = CFrame.new(-4698, 845, -1912)
			VectorMon = Vector3.new(-4698, 845, -1912)

			CFrameQuest = CFrame.new(-4722, 845, -1954)
			VectorQuest = Vector3.new(-4722, 846, -1954)
		elseif LevelFarm == 21 then -- Shandas
			Name = "Shanda"
			QuestName = "SkyExp1Quest"

			LevelQuest = 2
			NameMon = "Shandas"

			CFrameMon = CFrame.new(-7685, 5567, -502)
			VectorMon = Vector3.new(-7685, 5567, -502)

			CFrameQuest = CFrame.new(-7862, 5546, -380)
			VectorQuest = Vector3.new(-7862, 5546, -380)
		elseif LevelFarm == 22 then -- Royal Squad
			Name = "Royal Squad"
			QuestName = "SkyExp2Quest"

			LevelQuest = 1
			NameMon = "Royal Squad"

			CFrameMon = CFrame.new(-7670, 5607, -1460)
			VectorMon = Vector3.new(-7670, 5607, -1460)

			CFrameQuest = CFrame.new(-7904, 5636, -1412)
			VectorQuest = Vector3.new(-7904, 5636, -1412)
		elseif LevelFarm == 22 then -- Royal Soldier
			Name = "Royal Soldier"
			QuestName = "SkyExp2Quest"

			LevelQuest = 2
			NameMon = "Royal Soldier"

			CFrameMon = CFrame.new(-7828, 5607, -1744)
			VectorMon = Vector3.new(-7828, 5607, -1744)

			CFrameQuest = CFrame.new(-7904, 5636, -1412)
			VectorQuest = Vector3.new(-7904, 5636, -1412)
		elseif LevelFarm == 24 then -- Galley Pirate
			Name = "Galley Pirate"
			QuestName = "FountainQuest"

			LevelQuest = 1
			NameMon = "Galley Pirate"

			CFrameMon = CFrame.new(5589, 45, 3996)
			VectorMon = Vector3.new(5589, 45, 3996)

			CFrameQuest = CFrame.new(5256, 39, 4050)
			VectorQuest = Vector3.new(5256, 39, 4050)
		elseif LevelFarm == 25 then -- Galley Captain
			Name = "Galley Captain"
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
			Name = "Raider"
			QuestName = "Area1Quest"

			LevelQuest = 1
			NameMon = "Raider"

			CFrameQuest = CFrame.new(-425, 73, 1837)
			VectorQuest = Vector3.new(-425, 73, 1837)

			CFrameMon = CFrame.new(-746, 39, 2390)
			VectorMon = Vector3.new(-746, 39, 2389)
		elseif LevelFarm == 2 then -- Mercenary [Lv. 725]
			Name = "Mercenary"
			QuestName = "Area1Quest"

			LevelQuest = 2
			NameMon = "Mercenary"

			CFrameQuest = CFrame.new(-425, 73, 1837)
			VectorQuest = Vector3.new(-425, 73, 1837)

			CFrameMon = CFrame.new(-874, 141, 1312)
			VectorMon = Vector3.new(-874, 141, 1312)
		elseif LevelFarm == 3 then -- Swan Pirate [Lv. 775]
			Name = "Swan Pirate"
			QuestName = "Area2Quest"

			LevelQuest = 1
			NameMon = "Swan Pirate"

			CFrameQuest = CFrame.new(634, 73, 918)
			VectorQuest = Vector3.new(634, 73, 918)

			CFrameMon = CFrame.new(878, 122, 1235)
			VectorMon = Vector3.new(878, 122, 1235)
		elseif LevelFarm == 4 then -- Factory Staff [Lv. 800]
			Name = "Factory Staff"
			QuestName = "Area2Quest"

			LevelQuest = 2
			NameMon = "Factory Staff"

			CFrameQuest = CFrame.new(634, 73, 918)
			VectorQuest = Vector3.new(634, 73, 918)

			CFrameMon = CFrame.new(295, 73, -56)
			VectorMon = Vector3.new(295, 73, -56)
		elseif LevelFarm == 5 then -- Marine Lieutenant [Lv. 875]
			Name = "Marine Lieutenant"
			QuestName = "MarineQuest3"

			LevelQuest = 1
			NameMon = "Marine Lieutenant"

			CFrameMon = CFrame.new(-2806, 73, -3038)
			VectorMon = Vector3.new(-2806, 73, -3038)

			CFrameQuest = CFrame.new(-2443, 73, -3219)
			VectorQuest = Vector3.new(-2443, 73, -3219)
		elseif LevelFarm == 6 then -- Marine Captain [Lv. 900]
			Name = "Marine Captain"
			QuestName = "MarineQuest3"

			LevelQuest = 2
			NameMon = "Marine Captain"

			CFrameMon = CFrame.new(-1869, 73, -3320)
			VectorMon = Vector3.new(-1869, 73, -3320)

			CFrameQuest = CFrame.new(-2443, 73, -3219)
			VectorQuest = Vector3.new(-2443, 73, -3219)
		elseif LevelFarm == 7 then -- Zombie [Lv. 950]
			Name = "Zombie"
			QuestName = "ZombieQuest"

			LevelQuest = 1
			NameMon = "Zombie"

			CFrameMon = CFrame.new(-5736, 126, -728)
			VectorMon = Vector3.new(-5736, 126, -728)

			CFrameQuest = CFrame.new(-5494, 49, -795)
			VectorQuest = Vector3.new(-5494, 49, -794)
		elseif LevelFarm == 8 then -- Vampire [Lv. 975]
			Name = "Vampire"
			QuestName = "ZombieQuest"

			LevelQuest = 2
			NameMon = "Vampire"

			CFrameMon = CFrame.new(-6033, 7, -1317)
			VectorMon = Vector3.new(-6033, 7, -1317)

			CFrameQuest = CFrame.new(-5494, 49, -795)
			VectorQuest = Vector3.new(-5494, 49, -795)
		elseif LevelFarm == 9 then -- Snow Trooper [Lv. 1000] **
			Name = "Snow Trooper"
			QuestName = "SnowMountainQuest"

			LevelQuest = 1
			NameMon = "Snow Trooper"

			CFrameMon = CFrame.new(478, 402, -5362)
			VectorMon = Vector3.new(478, 402, -5362)

			CFrameQuest = CFrame.new(605, 402, -5371)
			VectorQuest = Vector3.new(605, 402, -5371)
		elseif LevelFarm == 10 then -- Winter Warrior [Lv. 1050]
			Name = "Winter Warrior"
			QuestName = "SnowMountainQuest"

			LevelQuest = 2
			NameMon = "Winter Warrior"

			CFrameMon = CFrame.new(1157, 430, -5188)
			VectorMon = Vector3.new(1157, 430, -5188)

			CFrameQuest = CFrame.new(605, 402, -5371)
			VectorQuest = Vector3.new(605, 402, -5371)
		elseif LevelFarm == 11 then -- Lab Subordinate [Lv. 1100]
			Name = "Lab Subordinate"
			QuestName = "IceSideQuest"

			LevelQuest = 1
			NameMon = "Lab Subordinate"

			CFrameMon = CFrame.new(-5782, 42, -4484)
			VectorMon = Vector3.new(-5782, 42, -4484)

			CFrameQuest = CFrame.new(-6060, 16, -4905)
			VectorQuest = Vector3.new(-6060, 16, -4905)
		elseif LevelFarm == 12 then -- Horned Warrior [Lv. 1125]
			Name = "Horned Warrior"
			QuestName = "IceSideQuest"

			LevelQuest = 2
			NameMon = "Horned Warrior"

			CFrameMon = CFrame.new(-6406, 24, -5805)
			VectorMon = Vector3.new(-6406, 24, -5805)

			CFrameQuest = CFrame.new(-6060, 16, -4905)
			VectorQuest = Vector3.new(-6060, 16, -4905)
		elseif LevelFarm == 13 then -- Magma Ninja [Lv. 1175]
			Name = "Magma Ninja"
			QuestName = "FireSideQuest"
			LevelQuest = 1
			NameMon = "Magma Ninja"

			CFrameMon = CFrame.new(-5428, 78, -5959)
			VectorMon = Vector3.new(-5428, 78, -5959)

			CFrameQuest = CFrame.new(-5430, 16, -5295)
			VectorQuest = Vector3.new(-5430, 16, -5296)
		elseif LevelFarm == 14 then -- Lava Pirate [Lv. 1200]
			Name = "Lava Pirate"
			QuestName = "FireSideQuest"

			LevelQuest = 2
			NameMon = "Lava Pirate"

			CFrameMon = CFrame.new(-5270, 42, -4800)
			VectorMon = Vector3.new(-5270, 42, -4800)

			CFrameQuest = CFrame.new(-5430, 16, -5295)
			VectorQuest = Vector3.new(-5430, 16, -5296)
		elseif LevelFarm == 15 then -- Ship Deckhand [Lv. 1250]
			Name = "Ship Deckhand"
			QuestName = "ShipQuest1"

			LevelQuest = 1
			NameMon = "Ship Deckhand"

			CFrameMon = CFrame.new(1198, 126, 33031)
			VectorMon = Vector3.new(1198, 126, 33031)

			CFrameQuest = CFrame.new(1038, 125, 32913)
			VectorQuest = Vector3.new(1038, 125, 32913)
		elseif LevelFarm == 16 then -- Ship Engineer [Lv. 1275]
			Name = "Ship Engineer"
			QuestName = "ShipQuest1"

			LevelQuest = 2
			NameMon = "Ship Engineer"

			CFrameMon = CFrame.new(918, 44, 32787)
			VectorMon = Vector3.new(918, 44, 32787)

			CFrameQuest = CFrame.new(1038, 125, 32913)
			VectorQuest = Vector3.new(1038, 125, 32913)
		elseif LevelFarm == 17 then -- Ship Steward [Lv. 1300]
			Name = "Ship Steward"
			QuestName = "ShipQuest2"

			LevelQuest = 1
			NameMon = "Ship Steward"

			CFrameMon = CFrame.new(915, 130, 33419)
			VectorMon = Vector3.new(915, 130, 33419)

			CFrameQuest = CFrame.new(969, 125, 33245)
			VectorQuest = Vector3.new(969, 125, 33245)
		elseif LevelFarm == 18 then -- Ship Officer [Lv. 1325]
			Name = "Ship Officer"
			QuestName = "ShipQuest2"

			LevelQuest = 2
			NameMon = "Ship Officer"

			CFrameMon = CFrame.new(916, 181, 33335)
			VectorMon = Vector3.new(916, 181, 33335)

			CFrameQuest = CFrame.new(969, 125, 33245)
			VectorQuest = Vector3.new(969, 125, 33245)
		elseif LevelFarm == 19 then -- Arctic Warrior [Lv. 1350]
			Name = "Arctic Warrior"
			QuestName = "FrostQuest"

			LevelQuest = 1
			NameMon = "Arctic Warrior"

			CFrameMon = CFrame.new(6038, 29, -6231)
			VectorMon = Vector3.new(6038, 29, -6231)

			VectorQuest = Vector3.new(5669, 28, -6482)
			CFrameQuest = CFrame.new(5669, 28, -6482)
		elseif LevelFarm == 20 then -- Snow Lurker [Lv. 1375]
			Name = "Snow Lurker"
			QuestName = "FrostQuest"

			LevelQuest = 2
			NameMon = "Snow Lurker"

			CFrameMon = CFrame.new(5560, 42, -6826)
			VectorMon = Vector3.new(5560, 42, -6826)

			VectorQuest = Vector3.new(5669, 28, -6482)
			CFrameQuest = CFrame.new(5669, 28, -6482)
		elseif LevelFarm == 21 then -- Sea Soldier [Lv. 1425]
			Name = "Sea Soldier"
			QuestName = "ForgottenQuest"

			LevelQuest = 1
			NameMon = "Sea Soldier"

			CFrameMon = CFrame.new(-3022, 16, -9722)
			VectorMon = Vector3.new(-3022, 16, -9722)

			CFrameQuest = CFrame.new(-3054, 237, -10148)
			VectorQuest = Vector3.new(-3054, 237, -10148)
		elseif LevelFarm == 22 then -- Water Fighter [Lv. 1450]
			Name = "Water Fighter"
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
			Name = "Pirate Millionaire"
			QuestName = "PiratePortQuest"

			LevelQuest = 1
			NameMon = "Pirate Millionaire"

			CFrameMon = CFrame.new(-373, 75, 5550)
			VectorMon = Vector3.new(-373, 75, 5550)

			CFrameQuest = CFrame.new(-288, 44, 5576)
			VectorQuest = Vector3.new(-288, 44, 5576)
		elseif LevelFarm == 2 then
			Name = "Pistol Billionaire"
			QuestName = "PiratePortQuest"

			LevelQuest = 2
			NameMon = "Pistol Billionaire"

			CFrameMon = CFrame.new(-469, 74, 5904)
			VectorMon = Vector3.new(-469, 74, 5904)

			CFrameQuest = CFrame.new(-288, 44, 5576)
			VectorQuest = Vector3.new(-288, 44, 5576)
		elseif LevelFarm == 3 then
			Name = "Dragon Crew Warrior [Lv. 1575]"
			QuestName = "AmazonQuest"

			LevelQuest = 1
			NameMon = "Dragon Crew Warrior"

			CFrameMon = CFrame.new(6339, 52, -1213)
			VectorMon = Vector3.new(6338, 52, -1213)

			CFrameQuest = CFrame.new(5835, 52, -1105)
			VectorQuest = Vector3.new(5835, 52, -1105)
		elseif LevelFarm == 4 then
			Name = "Dragon Crew Archer"
			QuestName = "AmazonQuest"

			LevelQuest = 2
			NameMon = "Dragon Crew Archer"

			CFrameMon = CFrame.new(6594, 383, 139)
			VectorMon = Vector3.new(6594, 383, 139)

			CFrameQuest = CFrame.new(5835, 52, -1105)
			VectorQuest = Vector3.new(5835, 52, -1105)
		elseif LevelFarm == 5 then
			Name = "Female Islander"
			QuestName = "AmazonQuest2"

			LevelQuest = 1
			NameMon = "Female Islander"

			CFrameMon = CFrame.new(5308, 819, 1047)
			VectorMon = Vector3.new(5308, 819, 1047)

			CFrameQuest = CFrame.new(5443, 602, 751)
			VectorQuest = Vector3.new(5443, 602, 751)
		elseif LevelFarm == 6 then
			Name = "Giant Islander"
			QuestName = "AmazonQuest2"

			LevelQuest = 2
			NameMon = "Giant Islanders"

			CFrameMon = CFrame.new(4951, 602, -68)
			VectorMon = Vector3.new(4951, 602, -68)

			CFrameQuest = CFrame.new(5443, 602, 751)
			VectorQuest = Vector3.new(5443, 602, 751)
		elseif LevelFarm == 7 then
			Name = "Marine Commodore"
			QuestName = "MarineTreeIsland"

			LevelQuest = 1
			NameMon = "Marine Commodore"

			CFrameMon = CFrame.new(2447, 73, -7470)
			VectorMon = Vector3.new(2447, 73, -7470)

			CFrameQuest = CFrame.new(2180, 29, -6737)
			VectorQuest = Vector3.new(2180, 29, -6737)
		elseif LevelFarm == 8 then
			Name = "Marine Rear Admiral"
			QuestName = "MarineTreeIsland"

			LevelQuest = 2
			NameMon = "Marine Rear Admiral"

			CFrameMon = CFrame.new(3671, 161, -6932)
			VectorMon = Vector3.new(3671, 161, -6932)

			CFrameQuest = CFrame.new(2180, 29, -6737)
			VectorQuest = Vector3.new(2180, 29, -6737)
		elseif LevelFarm == 9 then
			Name = "Fishman Raider"
			QuestName = "DeepForestIsland3"

			LevelQuest = 1
			NameMon = "Fishman Raider"

			CFrameMon = CFrame.new(-10560, 332, -8466)
			VectorMon = Vector3.new(-10560, 332, -8466)

			CFrameQuest = CFrame.new(-10584, 332, -8758)
			VectorQuest = Vector3.new(-10584, 332, -8758)
		elseif LevelFarm == 10 then
			Name = "Fishman Captain"
			QuestName = "DeepForestIsland3"

			LevelQuest = 2
			NameMon = "Fishman Captain"

			CFrameMon = CFrame.new(-10993, 332, -8940)
			VectorMon = Vector3.new(-10993, 332, -8940)

			CFrameQuest = CFrame.new(-10584, 332, -8758)
			VectorQuest = Vector3.new(-10584, 332, -8758)
		elseif LevelFarm == 11 then
			Name = "Forest Pirate"
			QuestName = "DeepForestIsland"

			LevelQuest = 1
			NameMon = "Forest Pirate"

			CFrameMon = CFrame.new(-13479, 333, -7905)
			VectorMon = Vector3.new(-13479, 333, -7905)

			CFrameQuest = CFrame.new(-13232, 333, -7627)
			VectorQuest = Vector3.new(-13232, 333, -7627)
		elseif LevelFarm == 12 then
			Name = "Mythological Pirate"
			QuestName = "DeepForestIsland"

			LevelQuest = 2
			NameMon = "Mythological Pirate"

			CFrameMon = CFrame.new(-13545, 470, -6917)
			VectorMon = Vector3.new(-13545, 470, -6917)

			CFrameQuest = CFrame.new(-13232, 333, -7627)
			VectorQuest = Vector3.new(-13232, 333, -7627)
		elseif LevelFarm == 13 then
			Name = "Jungle Pirate"
			QuestName = "DeepForestIsland2"

			LevelQuest = 1
			NameMon = "Jungle Pirate"

			CFrameMon = CFrame.new(-12107, 332, -10549)
			VectorMon = Vector3.new(-12106, 332, -10549)

			CFrameQuest = CFrame.new(-12684, 391, -9902)
			VectorQuest = Vector3.new(-12684, 391, -9902)
		elseif LevelFarm == 14 then
			Name = "Musketeer Pirate"
			QuestName = "DeepForestIsland2"

			LevelQuest = 2
			NameMon = "Musketeer Pirate"

			CFrameMon = CFrame.new(-13286, 392, -9769)
			VectorMon = Vector3.new(-13286, 392, -9768)

			CFrameQuest = CFrame.new(-12684, 391, -9902)
			VectorQuest = Vector3.new(-12684, 391, -9902)
		elseif LevelFarm == 15 then
			Name = "Reborn Skeleton"
			QuestName = "HauntedQuest1"

			LevelQuest = 1
			NameMon = "Reborn Skeleton"

			CFrameMon = CFrame.new(-8760, 142, 6039)
			VectorMon = Vector3.new(-8760, 142, 6039)

			CFrameQuest = CFrame.new(-9482, 142, 5567)
			VectorQuest = Vector3.new(-9482, 142, 5567)
		elseif LevelFarm == 16 then
			Name = "Living Zombie"
			QuestName = "HauntedQuest1"

			LevelQuest = 2
			NameMon = "Living Zombie"

			CFrameMon = CFrame.new(-10144, 140, 5932)
			VectorMon = Vector3.new(-10144, 140, 5932)

			CFrameQuest = CFrame.new(-9482, 142, 5567)
			VectorQuest = Vector3.new(-9482, 142, 5567)
		elseif LevelFarm == 17 then
			Name = "Demonic Soul"
			QuestName = "HauntedQuest2"

			LevelQuest = 1
			NameMon = "Demonic Soul"

			CFrameMon = CFrame.new(-9507, 172, 6158)
			VectorMon = Vector3.new(-9506, 172, 6158)

			CFrameQuest = CFrame.new(-9513, 172, 6079)
			VectorQuest = Vector3.new(-9513, 172, 6079)
		elseif LevelFarm == 18 then
			Name = "Posessed Mummy"
			QuestName = "HauntedQuest2"

			LevelQuest = 2
			NameMon = "Posessed Mummy"

			CFrameMon = CFrame.new(-9577, 6, 6223)
			VectorMon = Vector3.new(-9577, 6, 6223)

			CFrameQuest = CFrame.new(-9513, 172, 6079)
			VectorQuest = Vector3.new(-9513, 172, 6079)

		elseif LevelFarm == 19 then
			Name = "Peanut Scout"
			QuestName = "NutsIslandQuest"

			LevelQuest = 1
			NameMon = "Peanut Scout"

			CFrameMon = CFrame.new(-2124, 123, -10435)
			VectorMon = Vector3.new(-2124, 123, -10435)

			CFrameQuest = CFrame.new(-2104, 38, -10192)
			VectorQuest = Vector3.new(-2104, 38, -10192)
		elseif LevelFarm == 20 then
			Name = "Peanut President"
			QuestName = "NutsIslandQuest"

			LevelQuest = 2
			NameMon = "Peanut President"

			CFrameMon = CFrame.new(-2124, 123, -10435)
			VectorMon = Vector3.new(-2124, 123, -10435)

			CFrameQuest = CFrame.new(-2104, 38, -10192)
			VectorQuest = Vector3.new(-2104, 38, -10192)
		elseif LevelFarm == 21 then
			Name = "Ice Cream Chef"
			QuestName = "IceCreamIslandQuest"

			LevelQuest = 1
			NameMon = "Ice Cream Chef"

			CFrameMon = CFrame.new(-641, 127, -11062)
			VectorMon = Vector3.new(-641, 127, -11062)

			CFrameQuest = CFrame.new(-822, 66, -10965)
			VectorQuest = Vector3.new(-822, 66, -10965)
		elseif LevelFarm == 22 then
			Name = "Ice Cream Commander"
			QuestName = "IceCreamIslandQuest"

			LevelQuest = 2
			NameMon = "Ice Cream Commander"

			CFrameMon = CFrame.new(-641, 127, -11062)
			VectorMon = Vector3.new(-641, 127, -11062)

			CFrameQuest = CFrame.new(-822, 66, -10965)
			VectorQuest = Vector3.new(-822, 66, -10965)
		elseif LevelFarm == 23 then
			Name = "Cookie Crafter"
			QuestName = "CakeQuest1"

			LevelQuest = 1
			NameMon = "Cookie Crafter"

			CFrameMon = CFrame.new(-2365, 38, -12099)
			VectorMon = Vector3.new(-2365, 38, -12099)

			CFrameQuest = CFrame.new(-2020, 38, -12025)
			VectorQuest = Vector3.new(-2020, 38, -12025)
		elseif LevelFarm == 24 then
			Name = "Cake Guard"
			QuestName = "CakeQuest1"

			LevelQuest = 2
			NameMon = "Cake Guard"

			CFrameMon = CFrame.new(-1651, 38, -12308)
			VectorMon = Vector3.new(-1651, 38, -12308)

			CFrameQuest = CFrame.new(-2020, 38, -12025)
			VectorQuest = Vector3.new(-2020, 38, -12025)
		elseif LevelFarm == 25 then
			Name = "Baking Staff"
			QuestName = "CakeQuest2"

			LevelQuest = 1
			NameMon = "Baking Staff"

			CFrameMon = CFrame.new(-1870, 38, -12938)
			VectorMon = Vector3.new(-1870, 38, -12938)

			CFrameQuest = CFrame.new(-1926, 38, -12850)
			VectorQuest = Vector3.new(-1926, 38, -12850)
		elseif LevelFarm == 26 then
			Name = "Head Baker"
			QuestName = "CakeQuest2"

			LevelQuest = 2
			NameMon = "Head Baker"

			CFrameMon = CFrame.new(-1926, 88, -12850)
			VectorMon = CFrame.new(-1870, 38, -12938)

			CFrameQuest = CFrame.new(-1926, 38, -12850)
			VectorQuest = Vector3.new(-1926, 38, -12850)
		elseif LevelFarm == 27 then
			Name = "Cocoa Warrior"
			QuestName = "ChocQuest1"

			LevelQuest = 1
			NameMon = "Cocoa Warrior"

			CFrameMon = CFrame.new(231, 23, -12194)
			VectorMon = CFrame.new(231, 23, -12194)

			CFrameQuest = CFrame.new(231, 23, -12194)
			VectorQuest = Vector3.new(231, 23, -12194)
		elseif LevelFarm == 28 then				
			Name = "Chocolate Bar Battler"
			QuestName = "ChocQuest1"

			LevelQuest = 2
			NameMon = "Chocolate Bar Battler"

			CFrameMon = CFrame.new(231, 23, -12194)
			VectorMon = CFrame.new(231, 23, -12194)

			CFrameQuest = CFrame.new(231, 23, -12194)
			VectorQuest = Vector3.new(231, 23, -12194)
		elseif LevelFarm == 29 then				
			Name = "Sweet Thief"
			QuestName = "ChocQuest2"

			LevelQuest = 1
			NameMon = "Sweet Thief"

			CFrameMon = CFrame.new(71, 77, -12632)
			VectorMon = CFrame.new(71, 77, -12632)

			CFrameQuest = CFrame.new(151, 23, -12774)
			VectorQuest = Vector3.new(151, 23, -12774)
		elseif LevelFarm == 30 then				
			Name = "Candy Rebel"
			QuestName = "ChocQuest2"

			LevelQuest = 2
			NameMon = "Candy Rebel"

			CFrameMon = CFrame.new(134, 77, -12882)
			VectorMon = CFrame.new(134, 77, -12882)

			CFrameQuest = CFrame.new(151, 23, -12774)
			VectorQuest = Vector3.new(151, 23, -12774)
		elseif LevelFarm == 31 then
			Name = "Candy Pirate"
			QuestName = "CandyQuest1"

			LevelQuest = 1
			NameMon = "Candy Pirate"

			CFrameMon = CFrame.new(-1347.97034, 48.202549, -14320.1348)
			VectorMon = CFrame.new(-1347.97034, 48.202549, -14320.1348)

			CFrameQuest = CFrame.new(-1149.41968, 13.7529411, -14445.0352)
			VectorQuest = Vector3.new(-1149.41968, 13.7529411, -14445.0352)
		elseif LevelFarm == 32 then
			Name = "Snow Demon"
			QuestName = "CandyQuest1"

			LevelQuest = 2
			NameMon = "Snow Demon"

			CFrameMon = CFrame.new(-928.981567, 16.1330452, -14501.04)
			VectorMon = CFrame.new(-928.981567, 16.1330452, -14501.04)

			CFrameQuest = CFrame.new(-1149.41968, 13.7529411, -14445.0352)
			VectorQuest = Vector3.new(-1149.41968, 13.7529411, -14445.0352)
		end
	end
end

function CheckBossQuest()
	if _G.Settings.Boss["Select Boss"] == "Saber Expert" then
		MsBoss = "Saber Expert"
		NameBoss = "Saber Expert"
		CFrameBoss = CFrame.new(-1484.5423583984375, 23.852006912231445, -87.94239044189453)
	elseif _G.Settings.Boss["Select Boss"] == "The Saw" then
		MsBoss = "The Saw"
		NameBoss = "The Saw"
		CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
	elseif _G.Settings.Boss["Select Boss"] == "Greybeard" then
		MsBoss = "Greybeard"
		NameBoss = "Greybeard"
		CFrameBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666, -0.433646321, -1.03394289e-08, 0.901083171, -3.0443168e-08, 1, -3.17633075e-09, -0.901083171, -2.88092288e-08, -0.433646321)
	elseif _G.Settings.Boss["Select Boss"] == "The Gorilla King" then
		MsBoss = "The Gorilla King"
		NameBoss = "The Gorilla King"
		NameQuestBoss = "JungleQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
		CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
	elseif _G.Settings.Boss["Select Boss"] == "Bobby" then
		MsBoss = "Bobby"
		NameBoss = "Bobby"
		NameQuestBoss = "BuggyQuest1"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
		CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
	elseif _G.Settings.Boss["Select Boss"] == "Yeti" then
		MsBoss = "Yeti"
		NameBoss = "Yeti"
		NameQuestBoss = "SnowQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
		CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
	elseif _G.Settings.Boss["Select Boss"] == "Mob Leader" then
		MsBoss = "Mob Leader"
		NameBoss = "Mob Leader"
		CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.92824)
	elseif _G.Settings.Boss["Select Boss"] == "Vice Admiral" then
		MsBoss = "Vice Admiral"
		NameBoss = "Vice Admiral"
		NameQuestBoss = "MarineQuest2"
		LevelQuestBoss = 2
		CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
		CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
	elseif _G.Settings.Boss["Select Boss"] == "Warden" then
		MsBoss = "Warden"
		NameBoss = "Warden"
		NameQuestBoss = "ImpelQuest"
		LevelQuestBoss = 1
		CFrameQuestBoss = CFrame.new(5190.8173828125, 3.537222146987915, 687.6902465820312)
		CFrameBoss = CFrame.new(5248.3037109375, 3.5421788692474365, 935.4749755859375)
	elseif _G.Settings.Boss["Select Boss"] == "Chief Warden" then
		MsBoss = "Chief Warden"
		NameBoss = "Chief Warden"
		NameQuestBoss = "ImpelQuest"
		LevelQuestBoss = 2
		CFrameQuestBoss = CFrame.new(5190.8173828125, 3.537222146987915, 687.6902465820312)
		CFrameBoss = CFrame.new(5198.11181640625, 3.5383265018463135, 809.4231567382812)
	elseif _G.Settings.Boss["Select Boss"] == "Swan" then
		MsBoss = "Swan"
		NameBoss = "Swan"
		NameQuestBoss = "ImpelQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(5190.8173828125, 3.537222146987915, 687.6902465820312)
		CFrameBoss = CFrame.new(5304.3583984375, 7.787471771240234, 723.2423095703125)
	elseif _G.Settings.Boss["Select Boss"] == "Magma Admiral" then
		MsBoss = "Magma Admiral"
		NameBoss = "Magma Admiral"
		NameQuestBoss = "MagmaQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
		CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
	elseif _G.Settings.Boss["Select Boss"] == "Fishman Lord" then
		MsBoss = "Fishman Lord"
		NameBoss = "Fishman Lord"
		NameQuestBoss = "FishmanQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
		CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
	elseif _G.Settings.Boss["Select Boss"] == "Wysper" then
		MsBoss = "Wysper"
		NameBoss = "Wysper"
		NameQuestBoss = "SkyExp1Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
		CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
	elseif _G.Settings.Boss["Select Boss"] == "Thunder God" then
		MsBoss = "Thunder God"
		NameBoss = "Thunder God"
		NameQuestBoss = "SkyExp2Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
		CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
	elseif _G.Settings.Boss["Select Boss"] == "Cyborg" then
		MsBoss = "Cyborg"
		NameBoss = "Cyborg"
		NameQuestBoss = "FountainQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
		CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
		-- New World
	elseif _G.Settings.Boss["Select Boss"] == "Diamond" then
		MsBoss = "Diamond"
		NameBoss = "Diamond"
		NameQuestBoss = "Area1Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
		CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
	elseif _G.Settings.Boss["Select Boss"] == "Jeremy" then
		MsBoss = "Jeremy"
		NameBoss = "Jeremy"
		NameQuestBoss = "Area2Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
		CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
	elseif _G.Settings.Boss["Select Boss"] == "Fajita" then
		MsBoss = "Fajita"
		NameBoss = "Fajita"
		NameQuestBoss = "MarineQuest3"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
		CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
	elseif _G.Settings.Boss["Select Boss"] == "Don Swan" then
		MsBoss = "Don Swan"
		NameBoss = "Don Swan"
		CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
	elseif _G.Settings.Boss["Select Boss"] == "Smoke Admiral" then
		MsBoss = "Smoke Admiral [Lv. 1150] [Boss]"
		NameBoss = "Smoke Admiral"
		NameQuestBoss = "IceSideQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
		CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
	elseif _G.Settings.Boss["Select Boss"] == "Cursed Captain" then
		MsBoss = "Cursed Captain"
		NameBoss = "Cursed Captain"
		CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
	elseif _G.Settings.Boss["Select Boss"] == "Darkbeard" then
		MsBoss = "Darkbeard"
		NameBoss = "Darkbeard"
		CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
	elseif _G.Settings.Boss["Select Boss"] == "Order" then
		MsBoss = "Order"
		NameBoss = "Order"
		CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
	elseif _G.Settings.Boss["Select Boss"] == "Awakened Ice Admiral" then
		MsBoss = "Awakened Ice Admiral"
		NameBoss = "Awakened Ice Admiral"
		NameQuestBoss = "FrostQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
		CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
	elseif _G.Settings.Boss["Select Boss"] == "Tide Keeper" then
		MsBoss = "Tide Keeper"
		NameBoss = "Tide Keeper"
		NameQuestBoss = "ForgottenQuest"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
		CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
		-- Third World
	elseif _G.Settings.Boss["Select Boss"] == "Stone" then
		MsBoss = "Stone"
		NameBoss = "Stone"
		NameQuestBoss = "PiratePortQuest"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-290, 44, 5577)
		CFrameBoss = CFrame.new(-1085, 40, 6779)
	elseif _G.Settings.Boss["Select Boss"] == "Island Empress" then
		MsBoss = "Island Empress"
		NameBoss = "Island Empress"
		NameQuestBoss = "AmazonQuest2"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(5443, 602, 752)
		CFrameBoss = CFrame.new(5659, 602, 244)
	elseif _G.Settings.Boss["Select Boss"] == "Kilo Admiral" then
		MsBoss = "Kilo Admiral"
		NameBoss = "Kilo Admiral"
		NameQuestBoss = "MarineTreeIsland"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(2178, 29, -6737)
		CFrameBoss =CFrame.new(2846, 433, -7100)
	elseif _G.Settings.Boss["Select Boss"] == "Captain Elephant" then
		MsBoss = "Captain Elephant"
		NameBoss = "Captain Elephant"
		NameQuestBoss = "DeepForestIsland"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-13232, 333, -7631)
		CFrameBoss = CFrame.new(-13221, 325, -8405)
	elseif _G.Settings.Boss["Select Boss"] == "Beautiful Pirate" then
		MsBoss = "Beautiful Pirate"
		NameBoss = "Beautiful Pirate"
		NameQuestBoss = "DeepForestIsland2"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-12686, 391, -9902)
		CFrameBoss = CFrame.new(5182, 23, -20)
	elseif _G.Settings.Boss["Select Boss"] == "Cake Queen" then
		MsBoss = "Cake Queen"
		NameBoss = "Cake Queen"
		NameQuestBoss = "IceCreamIslandQuest"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-716, 382, -11010)
		CFrameBoss = CFrame.new(-821, 66, -10965)
	elseif _G.Settings.Boss["Select Boss"] == "rip_indra True Form" then
		MsBoss = "rip_indra True Form"
		NameBoss = "rip_indra True Form"
		CFrameBoss = CFrame.new(-5359, 424, -2735)
	elseif _G.Settings.Boss["Select Boss"] == "Longma" then
		MsBoss = "Longma"
		NameBoss = "Longma"
		CFrameBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
	elseif _G.Settings.Boss["Select Boss"] == "Soul Reaper" then
		MsBoss = "Soul Reaper"
		NameBoss = "Soul Reaper"
		CFrameBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
	end
end

_G.GetBoss = false
function GetBossName()
	for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
		if not _G.GetBoss then
			if v.Name == "The Gorilla King" and game.Players.localPlayer.Data.Level.Value >= 20  then
				_G.Settings.Boss["Select Boss"] = "The Gorilla King"
			elseif v.Name == "Bobby" and game.Players.localPlayer.Data.Level.Value >= 55  then
				_G.Settings.Boss["Select Boss"] = "Bobby" 
			elseif v.Name == "Yeti" and game.Players.localPlayer.Data.Level.Value >= 105  then
				_G.Settings.Boss["Select Boss"] = "Yeti"
			elseif v.Name == "Mob Leader"  and game.Players.localPlayer.Data.Level.Value >= 120 then
				_G.Settings.Boss["Select Boss"] = "Mob Leader"
			elseif v.Name == "Vice Admiral"  and game.Players.localPlayer.Data.Level.Value >= 130 then
				_G.Settings.Boss["Select Boss"] = "Vice Admiral"
			elseif v.Name == "Warden" and game.Players.localPlayer.Data.Level.Value >= 175 then
				_G.Settings.Boss["Select Boss"] = "Warden"
			elseif v.Name == "Saber Expert" and game.Workspace.Map.Jungle.Final.Part.Transparency == 1 then
				_G.Settings.Boss["Select Boss"] = "Saber Expert"
			elseif v.Name == "Chief Warden"  and game.Players.localPlayer.Data.Level.Value >= 200 then
				_G.Settings.Boss["Select Boss"] = "Chief Warden"
			elseif v.Name == "Swan"  and game.Players.localPlayer.Data.Level.Value >= 250 then
				_G.Settings.Boss["Select Boss"] = "Swan"
			elseif v.Name == "Magma Admiral" and game.Players.localPlayer.Data.Level.Value >= 350  then
				_G.Settings.Boss["Select Boss"] = "Magma Admiral"
			elseif v.Name == "Fishman Lord" and game.Players.localPlayer.Data.Level.Value >= 425  then
				_G.Settings.Boss["Select Boss"] = "Fishman Lord"
			elseif v.Name == "Wysper" and game.Players.localPlayer.Data.Level.Value >= 500 then
				_G.Settings.Boss["Select Boss"] = "Wysper"
			elseif v.Name == "Thunder God"  and game.Players.localPlayer.Data.Level.Value >= 575 then
				_G.Settings.Boss["Select Boss"] = "Thunder God"
			elseif v.Name == "Cyborg" and game.Players.localPlayer.Data.Level.Value >= 675 then
				_G.Settings.Boss["Select Boss"] = "Cyborg"
			elseif v.Name == "Diamond" and game.Players.localPlayer.Data.Level.Value >= 750 then
				_G.Settings.Boss["Select Boss"] = "Diamond"
			elseif v.Name == "Jeremy" and game.Players.localPlayer.Data.Level.Value >= 850 then
				_G.Settings.Boss["Select Boss"] = "Jeremy"
			elseif v.Name == "Fajita" and game.Players.localPlayer.Data.Level.Value >= 925  then
				_G.Settings.Boss["Select Boss"] = "Fajita"
			elseif v.Name == "Don Swan" and game.Players.localPlayer.Data.Level.Value >= 1000 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") == 0 then
				_G.Settings.Boss["Select Boss"] = "Don Swan" 
			elseif v.Name == "Smoke Admiral" and game.Players.localPlayer.Data.Level.Value >= 1150 then
				_G.Settings.Boss["Select Boss"] = "Smoke Admiral"
			elseif v.Name == "Cursed Captain" and game.Players.localPlayer.Data.Level.Value >= 1325 then
				_G.Settings.Boss["Select Boss"] = "Cursed Captain"
			elseif v.Name == "Awakened Ice Admiral" and game.Players.localPlayer.Data.Level.Value >= 1400  then
				_G.Settings.Boss["Select Boss"] = "Awakened Ice Admiral"
			elseif v.Name == "Tide Keeper" and game.Players.localPlayer.Data.Level.Value >= 1475  then
				_G.Settings.Boss["Select Boss"] = "Tide Keeper"
			elseif v.Name == "Stone" and game.Players.localPlayer.Data.Level.Value >= 1550 then
				_G.Settings.Boss["Select Boss"] = "Stone"
			elseif v.Name == "Island Empress" and game.Players.localPlayer.Data.Level.Value >= 1675 then
				_G.Settings.Boss["Select Boss"] = "Island Empress"
			elseif v.Name == "Kilo Admiral" and game.Players.localPlayer.Data.Level.Value >= 1750 then
				_G.Settings.Boss["Select Boss"] = "Kilo Admiral"
			elseif v.Name == "Captain Elephant" and game.Players.localPlayer.Data.Level.Value >= 1875 then
				_G.Settings.Boss["Select Boss"] = "Captain Elephant"
			elseif v.Name == "Beautiful Pirate" and game.Players.localPlayer.Data.Level.Value >= 1950 then
				_G.Settings.Boss["Select Boss"] = "Beautiful Pirate"
			elseif v.Name == "Cake Queen" and game.Players.localPlayer.Data.Level.Value >= 2175 then
				_G.Settings.Boss["Select Boss"] = "Cake Queen"
			end 
		end 
	end
end

local ScreenGui1 = Instance.new("ScreenGui")
local ImageButton1 = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui1.Name = "ImageButton"
ScreenGui1.Parent = game.CoreGui
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton1.Parent = ScreenGui1
ImageButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton1.BorderSizePixel = 0
ImageButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton1.Size = UDim2.new(0, 50, 0, 50)
ImageButton1.Draggable = true
ImageButton1.Image = "rbxassetid://"
ImageButton1.MouseButton1Down:connect(function()
  game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
  game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
UICorner.Parent = ImageButton1

if game:GetService("CoreGui"):FindFirstChild("THUNDERZHUB") then
    game:GetService("CoreGui"):FindFirstChild("THUNDERZHUB"):Destroy()
end

repeat wait(1) until game:IsLoaded()
local LocalPlayer = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")
local pfp
local user
local tag
local userinfo = {}

pcall(function()
    userinfo = HttpService:JSONDecode(readfile(""));
end)
 
pfp = userinfo["pfp"] or "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
user =  userinfo["user"] or game.Players.LocalPlayer.Name
tag = userinfo["tag"] or tostring(math.random(1,10))

local function SaveInfo()
    userinfo["pfp"] = pfp
    userinfo["user"] = user
    userinfo["tag"] = tag
    writefile("", HttpService:JSONEncode(userinfo));
end


local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil
    
    local function Update(input)
        local Delta = input.Position - DragStart
        local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
        local Tween = TweenService:Create(object, TweenInfo.new(0.15), {
        Position = pos
        })
        Tween:Play()
    end
    
    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position
    
                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
             end
        end
    )
    
    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )
    
    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

local Update = {}
local pfp = "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"

function Update:Window(text,logo,keybind)
    local osfunc = {}
    local uihide = false
    local abc = false
    local currentpage = ""
    local keybind = keybind or Enum.KeyCode.RightControl
    local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")

    local THUNDERZHUB = Instance.new("ScreenGui")
    THUNDERZHUB.Name = "THUNDERZHUB"
    THUNDERZHUB.Parent = game.CoreGui
    THUNDERZHUB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = THUNDERZHUB
    Main.ClipsDescendants = true
    Main.AnchorPoint = Vector2.new(0.5,0.5)
    Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)

    Main:TweenSize(UDim2.new(0, 540, 0, 340),"Out","Quad",0.4,true)

    local BtnStroke = Instance.new("UIStroke")

    BtnStroke.Name = "BtnStroke"
    BtnStroke.Parent = Main
    BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    BtnStroke.Color = Color3.fromRGB(255, 255, 255)
    BtnStroke.LineJoinMode = Enum.LineJoinMode.Round
    BtnStroke.Thickness = 1
    BtnStroke.Transparency = 0
    BtnStroke.Enabled = true
    BtnStroke.Archivable = true

    local MCNR = Instance.new("UICorner")
    MCNR.Name = "MCNR"
    MCNR.Parent = Main

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Top.Size = UDim2.new(0, 556, 0, 30)
    Top.BackgroundTransparency = 1.000
    local TCNR = Instance.new("UICorner")
    TCNR.Name = "TCNR"
    TCNR.Parent = Top
    TCNR.CornerRadius = UDim.new(0,5) 

    local ServerTime = Instance.new("TextLabel")
    ServerTime.Name = "ServerTime"
    ServerTime.Parent = Top
    ServerTime.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ServerTime.BackgroundTransparency = 1.000
    ServerTime.Position = UDim2.new(0.68, 0,0.074, 0)
    ServerTime.Size = UDim2.new(0, 225, 0, 25)
    ServerTime.Font = Enum.Font.GothamSemibold
    ServerTime.Text = ""
    ServerTime.TextSize = 11.000
    ServerTime.TextColor3 = Color3.fromRGB(255,255,255)
    ServerTime.TextXAlignment = Enum.TextXAlignment.Left

    function osfunc:Set(textadd)
        ServerTime.Text = textadd
    end

    local function UpdateOS()
        local date = os.date("*t")
        local hour = (date.hour) % 24
        local ampm = hour < 12 and "AM" or "PM"
        local timezone = string.format("%02i:%02i:%02i %s", ((hour -1) % 12) + 1, date.min, date.sec, ampm)
        local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
        local LocalizationService = game:GetService("LocalizationService")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local name = player.Name
        local result, code = pcall(function()
            return LocalizationService:GetCountryRegionForPlayerAsync(player)
        end)
        osfunc:Set(datetime.." - "..timezone.." [ " .. code .. " ]")
    end
    spawn(function()
        while true do
            UpdateOS()
            game:GetService("RunService").RenderStepped:Wait()
        end
    end)
 
    local Ping = Instance.new("TextLabel")
	Ping.Name = "Ping"
	Ping.Parent = Top
	Ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Ping.BackgroundTransparency = 1.000
	Ping.Position = UDim2.new(0.28, 0,0.074, 0)
	Ping.Size = UDim2.new(0, 225, 0, 25)
	Ping.Font = Enum.Font.GothamSemibold
	Ping.Text = "N/A"
	Ping.TextColor3 = Color3.fromRGB(255,255,255)
	Ping.TextSize = 11.000
	Ping.TextXAlignment = Enum.TextXAlignment.Left

	local Fps = Instance.new("TextLabel")
	Fps.Name = "Fps"
	Fps.Parent = Top
	Fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Fps.BackgroundTransparency = 1.000
	Fps.Position = UDim2.new(0.55, 0,0.074, 0)
	Fps.Size = UDim2.new(0, 225, 0, 25)
	Fps.Font = Enum.Font.GothamSemibold
	Fps.Text = "N/A"
	Fps.TextColor3 = Color3.fromRGB(255,255,255)
	Fps.TextSize = 11.000
	Fps.TextXAlignment = Enum.TextXAlignment.Left

    game:GetService("RunService").RenderStepped:Connect(function(frame)
        Instance.new('LocalScript', Fps).Parent.Text = ("[FPS] : "..math.round(1/frame)) 
    end)

    game:GetService("RunService").RenderStepped:Connect(function(ping) 
        Instance.new('LocalScript', Ping).Parent.Text = ("[Ping] : " ..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(math.round(2/ping)))
    end)

    local User = Instance.new("Frame")
    User.Name = "User"
    User.Parent = Top
    User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    User.BackgroundTransparency = 1.000
    User.Position = UDim2.new(0, 0,0, 25)
    User.Size = UDim2.new(0, 125, 0, 40)
    
    local UserText = Instance.new("TextLabel")
    UserText.Name = "UserText"
    UserText.Parent = User
    UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UserText.BackgroundTransparency = 1.000
    UserText.Position = UDim2.new(0.4, 0,0, -17)
	UserText.TextColor3 = Color3.fromRGB(255, 255, 255)
    UserText.Size = UDim2.new(0, 80, 0, 20)
    UserText.Font = Enum.Font.GothamSemibold
    UserText.Text = "Vỹ-Gaming Hub"
    UserText.TextScaled = true
    UserText.TextSize = 17.000
    UserText.TextWrapped = true
    UserText.TextXAlignment = Enum.TextXAlignment.Left
    
    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint.Parent = UserText
    UITextSizeConstraint.MaxTextSize = 17
    
    local UserImage = Instance.new("ImageLabel")
    UserImage.Name = "UserImage"
    UserImage.Parent = User
    UserImage.BackgroundTransparency = 0
    UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    UserImage.Position = UDim2.new(0, 10, 0, -15)
    UserImage.Size = UDim2.new(0, 25, 0, 25)
    UserImage.Image = "rbxassetid://"
    local UserImageCorner = Instance.new("UICorner")
    UserImageCorner.CornerRadius = UDim.new(0, 100)
    UserImageCorner.Name = "UserImageCorner"
    UserImageCorner.Parent = UserImage

    local Logo = Instance.new("ImageLabel")
	Logo.Name = "Logo"
	Logo.Parent = Main
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.Position = UDim2.new(0, -5, 0, -5)
	Logo.Size = UDim2.new(0, 135, 0, 135)
	Logo.Image = "rbxassetid://"
    local Tab = Instance.new("Frame")
    Tab.Name = "Tab"
    Tab.Parent = Main
    Tab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Tab.Position = UDim2.new(0, 5, 0, 135)
    Tab.Size = UDim2.new(0, 0, 0, 0)

    local TabCorner = Instance.new("UIListLayout")
    TabCorner.Name = "TabCorner"
    TabCorner.Parent = Tab
    TabCorner.SortOrder = Enum.SortOrder.LayoutOrder
    TabCorner.Padding = UDim.new(0,15)
    local BtnStroke = Instance.new("UIStroke")
    local ScrollTab = Instance.new("ScrollingFrame")
    local Crner = Instance.new("UICorner")
    ScrollTab.Name = "ScrollTab"
    ScrollTab.Parent = Tab
    ScrollTab.Active = true
    ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollTab.BackgroundTransparency = 1.000
    ScrollTab.Size = UDim2.new(0, 133, 0, 203)
    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTab.ScrollBarThickness = 0

    local PLL = Instance.new("UIListLayout")
    PLL.Name = "PLL"
    PLL.Parent = ScrollTab
    PLL.SortOrder = Enum.SortOrder.LayoutOrder
    PLL.Padding = UDim.new(0, 15)

    local PPD = Instance.new("UIPadding")
    PPD.Name = "PPD"
    PPD.Parent = ScrollTab
    PPD.PaddingLeft = UDim.new(0, 9)
    PPD.PaddingTop = UDim.new(0, 2)
    local BtnStroke = Instance.new("UIStroke")
    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Page.Position = UDim2.new(0.255426834, 0, 0.086000003, 0)
    Page.Size = UDim2.new(0, 410, 0, 308)

    local PCNR = Instance.new("UICorner")
    PCNR.Parent = Page
    PCNR.CornerRadius = UDim.new(0,3)

    local MainPage = Instance.new("Frame")
    MainPage.Name = "MainPage"
    MainPage.Parent = Page
    MainPage.ClipsDescendants = true
    MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainPage.BackgroundTransparency = 1.000
    MainPage.Size = UDim2.new(0, 410, 0, 308)

    local PageList = Instance.new("Folder")
    PageList.Name = "PageList"
    PageList.Parent = MainPage

    local UIPageLayout = Instance.new("UIPageLayout")

    UIPageLayout.Parent = PageList
    UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
    UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
    UIPageLayout.FillDirection = Enum.FillDirection.Vertical
    UIPageLayout.Padding = UDim.new(0, 10)
    UIPageLayout.TweenTime = 0.400
    UIPageLayout.GamepadInputEnabled = false
    UIPageLayout.ScrollWheelInputEnabled = false
    UIPageLayout.TouchInputEnabled = false

    MakeDraggable(Top,Main)


    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.RightControl then
            if uihide == false then
                uihide = true
                Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
            else
                uihide = false
                Main:TweenSize(UDim2.new(0, 540, 0, 340),"Out","Quad",0.5,true)
            end
        end
    end)

    local uitab = {}

    function uitab:AddTab(text,img)
        local BtnStroke = Instance.new("UIStroke")
        local bc = Instance.new("UICorner")
        local TabButton = Instance.new("TextButton")
        local title = Instance.new("TextLabel")
        local TUICorner = Instance.new("UICorner")
        local Title = Instance.new("TextLabel")
        TabButton.Parent = ScrollTab
        TabButton.Name = text.."Server"
        TabButton.Text = ""
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 1.000
        TabButton.Size = UDim2.new(0, 120, 0, 25)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 12.000
        TabButton.TextTransparency = 0.5

        Title.Parent = TabButton
        Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0, 25, 0, 0)
        Title.Size = UDim2.new(0, 100, 0, 25)
        Title.Font = Enum.Font.GothamSemibold
        Title.Text = text
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 15.000
        Title.TextXAlignment = Enum.TextXAlignment.Left 

        local IDK = Instance.new("ImageLabel")
        IDK.Name = "LogoIDK"
        IDK.Parent = TabButton
        IDK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        IDK.BackgroundTransparency = 1.000
        IDK.Position = UDim2.new(0, 3, 0, 3)
        IDK.Size = UDim2.new(0, 20, 0, 20)
        IDK.Image = "rbxassetid://" .. tostring(img)
        TUICorner.CornerRadius = UDim.new(0, 3)
        TUICorner.Parent = TabButton

        BtnStroke.Name = "BtnStroke"
        BtnStroke.Parent = TabButton
        BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        BtnStroke.Color = Color3.fromRGB(255, 255, 255)
        BtnStroke.LineJoinMode = Enum.LineJoinMode.Round
        BtnStroke.Thickness = 1
        BtnStroke.Transparency = 0
        BtnStroke.Enabled = true
        BtnStroke.Archivable = true 

        local MainFramePage = Instance.new("ScrollingFrame")
        MainFramePage.Name = text.."_Page"
        MainFramePage.Parent = PageList
        MainFramePage.Active = true
        MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainFramePage.BackgroundTransparency = 1.000
        MainFramePage.BorderSizePixel = 0
        MainFramePage.Size = UDim2.new(0, 400, 0, 308)
        MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
        MainFramePage.ScrollBarThickness = 0

        local UIPadding = Instance.new("UIPadding")
        local UIListLayout = Instance.new("UIListLayout")

        UIPadding.Parent = MainFramePage
        UIPadding.PaddingLeft = UDim.new(0, 10)
        UIPadding.PaddingTop = UDim.new(0, 5)

        UIListLayout.Padding = UDim.new(0,15)
        UIListLayout.Parent = MainFramePage
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        TabButton.MouseButton1Click:Connect(function()
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                    v,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        TextTransparency = 0.5
                    }
                    ):Play()
                end
                    TweenService:Create(
                        TabButton,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {
                            TextTransparency = 0
                        }
                )   :Play()
            end

            for i,v in next, PageList:GetChildren() do
                currentpage = string.gsub(TabButton.Name,"Server","").."_Page"
                if v.Name == currentpage then
                    UIPageLayout:JumpTo(v)
                end
            end
        end)

        if abc == false then
            for i,v in next, ScrollTab:GetChildren() do     
                if v:IsA("TextButton") then
                    TweenService:Create(
                    v,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        TextTransparency = 0.5
                    }
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        TextTransparency = 0
                    }
                ):Play()
            end
            UIPageLayout:JumpToIndex(1)
            abc = true
        end

        game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                MainFramePage.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
                ScrollTab.CanvasSize = UDim2.new(0,0,0,PLL.AbsoluteContentSize.Y + 20)
            end)
        end)

        function Update:AddNotification(textdesc)
        local NotificationHold = Instance.new("TextButton")
        local NotificationFrame = Instance.new("Frame")
        local OkayBtn = Instance.new("TextButton")
        local OkayBtnCorner = Instance.new("UICorner")
        local OkayBtnTitle = Instance.new("TextLabel")
        local NotificationTitle = Instance.new("TextLabel")
        local NotificationDesc = Instance.new("TextLabel")
        local NotifCorner = Instance.new("UICorner")
        local NotifHolderUIStroke = Instance.new("UIStroke")
        local Line = Instance.new("Frame")

        NotificationHold.Name = "NotificationHold"
        NotificationHold.Parent = Main
        NotificationHold.BackgroundColor3 = Color3.new(125,125,125)
        NotificationHold.BackgroundTransparency = 1
        NotificationHold.BorderSizePixel = 0
        NotificationHold.Size = UDim2.new(0, 589, 0, 378)
        NotificationHold.AutoButtonColor = false
        NotificationHold.Font = Enum.Font.SourceSans
        NotificationHold.Text = ""
        NotificationHold.TextColor3 = Color3.new(125,0,125)
        NotificationHold.TextSize = 13.000

        TweenService:Create(NotificationHold, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
        }):Play()
        wait(0.4)

        NotificationFrame.Name = "NotificationFrame"
        NotificationFrame.Parent = NotificationHold
        NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        NotificationFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        NotificationFrame.BorderColor3 = Color3.new(125,0,125)
        NotificationFrame.BorderSizePixel = 0
        NotificationFrame.Transparency = 0
        NotificationFrame.ClipsDescendants = true
        NotificationFrame.Position = UDim2.new(0, 295, 0, 190)
        NotificationFrame.Size = UDim2.new(0, 0, 0, 0)

        NotificationFrame:TweenSize(UDim2.new(0, 400, 0, 250), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

        NotifCorner.Name = "NotifCorner"
        NotifCorner.Parent = NotificationFrame
        NotifCorner.CornerRadius = UDim.new(0, 5)

        NotifHolderUIStroke.Name = "NotifHolderUIStroke"
        NotifHolderUIStroke.Parent = NotificationFrame
        NotifHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        NotifHolderUIStroke.Color = Color3.new(125,0,125)
        NotifHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
        NotifHolderUIStroke.Thickness = 2
        NotifHolderUIStroke.Transparency = 0
        NotifHolderUIStroke.Enabled = true
        NotifHolderUIStroke.Archivable = true

        OkayBtn.Name = "OkayBtn"
        OkayBtn.Parent = NotificationFrame
        OkayBtn.BackgroundColor3 = Color3.fromRGB(190, 190, 190)
        OkayBtn.BorderSizePixel = 2
        OkayBtn.BorderColor3 = Color3.new(125,0,125)
        OkayBtn.Position = UDim2.new(0, 125, 0, 190)
        OkayBtn.Size = UDim2.new(0, 150, 0, 30)
        OkayBtn.AutoButtonColor = true
        OkayBtn.Font = Enum.Font.SourceSans
        OkayBtn.Text = ""
        OkayBtn.TextColor3 = Color3.new(125,0,125)
        OkayBtn.TextSize = 13.000

        OkayBtnCorner.CornerRadius = UDim.new(0, 5)
        OkayBtnCorner.Name = "OkayBtnCorner"
        OkayBtnCorner.Parent = OkayBtn

        OkayBtnTitle.Name = "OkayBtnTitle"
        OkayBtnTitle.Parent = OkayBtn
        OkayBtnTitle.BackgroundColor3 = Color3.new(125,0,125)
        OkayBtnTitle.BackgroundTransparency = 1.000
        OkayBtnTitle.Size = UDim2.new(0, 150, 0, 30)
        OkayBtnTitle.Text = "OK"
        OkayBtnTitle.Font = Enum.Font.GothamSemibold
        OkayBtnTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
        OkayBtnTitle.TextSize = 22.000

        NotificationTitle.Name = "NotificationTitle"
        NotificationTitle.Parent = NotificationFrame
        NotificationTitle.BackgroundColor3 = Color3.new(125,0,125)
        NotificationTitle.BackgroundTransparency = 1.000
        NotificationTitle.Position = UDim2.new(0, 0, 0, 10)
        NotificationTitle.Size = UDim2.new(0, 400, 0, 25)
        NotificationTitle.ZIndex = 3
        NotificationTitle.Font = Enum.Font.GothamSemibold
        NotificationTitle.Text = "Notification"
        NotificationTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
        NotificationTitle.TextSize = 22.000

        Line.Name = "Line"
        Line.Parent = NotificationFrame
        Line.BackgroundColor3 = Color3.new(125,0,125)
        Line.BorderSizePixel = 0
        Line.Position = UDim2.new(0, 10, 0, 40)
        Line.Size = UDim2.new(0, 380, 0, 1)

        NotificationDesc.Name = "NotificationDesc"
        NotificationDesc.Parent = NotificationFrame
        NotificationDesc.BackgroundColor3 = _G.SectionColor
        NotificationDesc.BackgroundTransparency = 1.000
        NotificationDesc.Position = UDim2.new(0, 10, 0, 80)
        NotificationDesc.Size = UDim2.new(0, 380, 0, 200)
        NotificationDesc.Font = Enum.Font.GothamSemibold
        NotificationDesc.Text = textdesc
        NotificationDesc.TextScaled = false
        NotificationDesc.TextColor3 = Color3.new(125,0,125)
        NotificationDesc.TextSize = 16.000
        NotificationDesc.TextWrapped = true
        NotificationDesc.TextXAlignment = Enum.TextXAlignment.Center
        NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top

        OkayBtn.MouseEnter:Connect(function()
            TweenService:Create(OkayBtn, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(34,34,34)}):Play()
        end)

        OkayBtn.MouseLeave:Connect(function()
            TweenService:Create(OkayBtn, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
        end)

        OkayBtn.MouseButton1Click:Connect(function()
            NotificationFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

            wait(0.4)
        
            TweenService:Create(NotificationHold, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
            }):Play()
        
            wait(.3)
        
            NotificationHold:Destroy()
        end)
    end

    local main = {}
    function main:AddButton(text, callback)
        if logo == nil then
            logo = "12523036534"
        end
        local Button = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local TextBtn = Instance.new("TextButton")
        local ImageButton = Instance.new("ImageLabel")
        local UICorner_2 = Instance.new("UICorner")
        local Space = Instance.new("TextLabel")
        local Black = Instance.new("Frame")
        local UICorner_3 = Instance.new("UICorner")

        Button.Name = "Button"
        Button.Parent = MainFramePage
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.Size = UDim2.new(0, 387, 0, 31)

        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Button

        TextBtn.Name = "TextBtn"
        TextBtn.Parent = Button
        TextBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        TextBtn.Position = UDim2.new(0, 1, 0, 1)
        TextBtn.Size = UDim2.new(0, 385, 0, 29)
        TextBtn.AutoButtonColor = false
        TextBtn.Font = Enum.Font.GothamSemibold
        TextBtn.Text = text
        TextBtn.TextColor3 = Color3.fromRGB(225, 225, 225)
        TextBtn.TextSize = 15.000

        ImageButton.Name = "ImageButton"
        ImageButton.Parent = Button
        ImageButton.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        ImageButton.BackgroundTransparency = 1.000
        ImageButton.BorderSizePixel = 0
        ImageButton.Position = UDim2.new(0, 350, 0, 6)
        ImageButton.Size = UDim2.new(0, 20, 0, 20)
        ImageButton.Image = "rbxassetid://"
        ImageButton.ImageColor3 = Color3.fromRGB(255, 255, 255)

        UICorner_2.CornerRadius = UDim.new(0, 5)
        UICorner_2.Parent = TextBtn

        Space.Name = "Space"
        Space.Parent = Button
        Space.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        Space.BackgroundTransparency = 1.000
        Space.Position = UDim2.new(0, 330, 0, 0)
        Space.Size = UDim2.new(0, 15, 0, 30)
        Space.Font = Enum.Font.GothamSemibold
        Space.Text = "|"
        Space.TextSize = 15.000
        Space.TextColor3 = Color3.fromRGB(255, 255, 255)
        Space.TextXAlignment = Enum.TextXAlignment.Right

        Black.Name = "Black"
        Black.Parent = Button
        Black.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Black.BackgroundTransparency = 1.000
        Black.BorderSizePixel = 0
        Black.Position = UDim2.new(0, 1, 0, 1)
        Black.Size = UDim2.new(0, 385, 0, 29)

        UICorner_3.CornerRadius = UDim.new(0, 5)
        UICorner_3.Parent = Black

        TextBtn.MouseEnter:Connect(
            function()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.7}
                ):Play()
            end
        )
        TextBtn.MouseLeave:Connect(
            function()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()
            end
        )
        TextBtn.MouseButton1Click:Connect(
            function()
                TextBtn.TextSize = 0
                TweenService:Create(
                    TextBtn,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextSize = 15}
                ):Play()
                callback()
            end
        )
    end

    function main:AddToggle(TogInfo ,default, callback)
        local toggle = false
        if logo == nil then
            logo = "12523036534"
        end
        local CheckFrame = Instance.new("Frame")
        local CheckFrame2 = Instance.new("Frame")
        local UIStroke = Instance.new("UIStroke")
        local UIListLayout = Instance.new("UIListLayout")
        local UICorner = Instance.new("UICorner")
        local ImageLabel = Instance.new("ImageLabel")
        local Space = Instance.new("TextLabel")
        local Title = Instance.new("TextLabel")
        local ImageButton = Instance.new("ImageButton")

        -- Prop --
        CheckFrame.Name = TogInfo or "CheckFrame"
        CheckFrame.Parent = MainFramePage
        CheckFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        CheckFrame.BackgroundTransparency = 1.000
        CheckFrame.BorderSizePixel = 0
        CheckFrame.Size = UDim2.new(0, 387, 0, 31)

        CheckFrame2.Name = "CheckFrame2"
        CheckFrame2.Parent = CheckFrame
        CheckFrame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        CheckFrame2.BorderSizePixel = 0
        CheckFrame2.Position = UDim2.new(0, 3, 0, 0)
        CheckFrame2.Size = UDim2.new(0, 381, 0, 30)

        UIStroke.Name = "UIStroke"
        UIStroke.Parent = CheckFrame2
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Color = Color3.fromRGB(255, 255, 255)
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.Thickness = 1
        UIStroke.Transparency = 0
        UIStroke.Enabled = true
        UIStroke.Archivable = true

        UICorner.Parent = CheckFrame2
        UICorner.CornerRadius = UDim.new(0, 3)

        ImageLabel.Name = "ImageLabel"
        ImageLabel.Parent = CheckFrame2
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255,255,255)
        ImageLabel.BackgroundTransparency = 1.000
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Position = UDim2.new(0, 5, 0, 6)
        ImageLabel.Size = UDim2.new(0, 20, 0, 20)
        ImageLabel.Image = "rbxassetid://"
        ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)

        Space.Name = "Space"
        Space.Parent = CheckFrame2
        Space.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Space.BackgroundTransparency = 1.000
        Space.Position = UDim2.new(0, 30, 0, 0)
        Space.Size = UDim2.new(0, 15, 0, 30)
        Space.Font = Enum.Font.GothamSemibold
        Space.Text = "|"
        Space.TextSize = 15.000
        Space.TextColor3 = Color3.fromRGB(255, 255, 255)
        Space.TextXAlignment = Enum.TextXAlignment.Center

        Title.Name = "Title"
        Title.Parent = CheckFrame2
        Title.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0, 50, 0, 0)
        Title.Size = UDim2.new(0, 280, 0, 30)
        Title.Font = Enum.Font.GothamSemibold
        Title.Text = TogInfo or "checkBox Title"
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 15.000
        Title.TextXAlignment = Enum.TextXAlignment.Left

        ImageButton.Name = "ImageButton"
        ImageButton.Parent = CheckFrame2
        ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageButton.BackgroundTransparency = 1.000
        ImageButton.Position = UDim2.new(0, 352, 0, 4)
        ImageButton.Size = UDim2.new(0, 23, 0, 23)
        ImageButton.ZIndex = 2
        ImageButton.Image = "rbxassetid://3926311105"
        ImageButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
        ImageButton.ImageRectOffset = Vector2.new(940, 784)
        ImageButton.ImageRectSize = Vector2.new(48, 48)

        -- Toggle Script --

        if default == true then
            ImageButton.ImageRectOffset = Vector2.new(4, 836)
            game.TweenService:Create(
                ImageButton,
                TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                {ImageColor3 = Color3.fromRGB(255, 255, 255)}
            ):Play()
            toggle = not toggle
            pcall(callback, toggle)
        end

        ImageButton.MouseButton1Click:Connect(
            function()
                if toggle == false then
                    game.TweenService:Create(
                        ImageButton,
                        TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                        {ImageColor3 = Color3.fromRGB(255, 255, 255)}
                    ):Play()
                    ImageButton.ImageRectOffset = Vector2.new(4, 836)
                else
                    game.TweenService:Create(
                        ImageButton,
                        TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                        {ImageColor3 = Color3.fromRGB(255, 255, 255)}
                    ):Play()
                    ImageButton.ImageRectOffset = Vector2.new(940, 784)
                end
                toggle = not toggle
                pcall(callback, toggle)
            end
        )
    end

    function main:AddDropdown(text,option,callback)
        local isdropping = false
        local Dropdown = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local DropTitle = Instance.new("TextLabel")
        local DropScroll = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")
        local DropButton = Instance.new("TextButton")
        local DropImage = Instance.new("ImageLabel")
        local UIStroke = Instance.new("UIStroke")

        Dropdown.Name = "Dropdown"
        Dropdown.Parent = MainFramePage
        Dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Dropdown.ClipsDescendants = true
        Dropdown.Size = UDim2.new(0, 387, 0, 31)

        UIStroke.Name = "UIStroke"
        UIStroke.Parent = Dropdown
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Color = Color3.fromRGB(255, 255, 255)
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.Thickness = 1
        UIStroke.Transparency = 0
        UIStroke.Enabled = true
        UIStroke.Archivable = true

        UICorner.CornerRadius = UDim.new(0, 3)
        UICorner.Parent = Dropdown

        DropTitle.Name = "DropTitle"
        DropTitle.Parent = Dropdown
        DropTitle.BackgroundColor3 = Color3.fromRGB(255,255,255)
        DropTitle.BackgroundTransparency = 1.000
        DropTitle.Size = UDim2.new(0, 385, 0, 31)
        DropTitle.Font = Enum.Font.GothamSemibold
        DropTitle.Text = text.. " : "
        DropTitle.TextColor3 = Color3.fromRGB(255,255,255)
        DropTitle.TextSize = 15.000

        DropScroll.Name = "DropScroll"
        DropScroll.Parent = DropTitle
        DropScroll.Active = true
        DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DropScroll.BackgroundTransparency = 1.000
        DropScroll.BorderSizePixel = 0
        DropScroll.Position = UDim2.new(0, 0, 0, 31)
        DropScroll.Size = UDim2.new(0, 385, 0, 100)
        DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        DropScroll.ScrollBarThickness = 3

        UIListLayout.Parent = DropScroll
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 5)

        UIPadding.Parent = DropScroll
        UIPadding.PaddingLeft = UDim.new(0, 5)
        UIPadding.PaddingTop = UDim.new(0, 5)

        DropButton.Name = "DropButton"
        DropButton.Parent = Dropdown
        DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DropButton.BackgroundTransparency = 1.000
        DropButton.Size = UDim2.new(0, 385, 0, 31)
        DropButton.Font = Enum.Font.SourceSans
        DropButton.Text = ""
        DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        DropButton.TextSize = 14.000

        DropImage.Name = "DropImage"
        DropImage.Parent = Dropdown
        DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DropImage.BackgroundTransparency = 1.000
        DropImage.Position = UDim2.new(0, 350, 0, 6)
        DropImage.Rotation = 180.000
        DropImage.Size = UDim2.new(0, 20, 0, 20)
        DropImage.Image = "rbxassetid://6031090990"

        for i,v in next,option do
            local Item = Instance.new("TextButton")

            Item.Name = "Item"
            Item.Parent = DropScroll
            Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Item.BackgroundTransparency = 1.000
            Item.Size = UDim2.new(0, 385, 0, 26)
            Item.Font = Enum.Font.GothamSemibold
            Item.Text = tostring(v)
            Item.TextColor3 = Color3.fromRGB(255,255,255)
            Item.TextSize = 13.000
            Item.TextTransparency = 0.500

            Item.MouseEnter:Connect(function()
                TweenService:Create(
                    Item,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        TextTransparency = 0
                    }
                ):Play()
            end)

            Item.MouseLeave:Connect(function()
                TweenService:Create(
                    Item,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        TextTransparency = 0.5
                    }
                ):Play()
            end)

            Item.MouseButton1Click:Connect(function()
                isdropping = false
                Dropdown:TweenSize(UDim2.new(0,385,0,31),"Out","Quad",0.3,true)
                TweenService:Create(
                    DropImage,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        Rotation = 180
                    }
                ):Play()
                callback(Item.Text)
                DropTitle.Text = text.." : "..Item.Text
            end)
        end

        DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

        DropButton.MouseButton1Click:Connect(function()
            if isdropping == false then
                isdropping = true
                Dropdown:TweenSize(UDim2.new(0,385,0,131),"Out","Quad",0.3,true)
                TweenService:Create(
                    DropImage,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        Rotation = 0
                    }
                ):Play()
            else
                isdropping = false
                Dropdown:TweenSize(UDim2.new(0,385,0,31),"Out","Quad",0.3,true)
                TweenService:Create(
                    DropImage,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        Rotation = 180
                    }
                ):Play()
            end
        end)

        local dropfunc = {}
        function dropfunc:Add(t)
            local Item = Instance.new("TextButton")
            Item.Name = "Item"
            Item.Parent = DropScroll
            Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Item.BackgroundTransparency = 1.000
            Item.Size = UDim2.new(0, 385, 0, 26)
            Item.Font = Enum.Font.GothamSemibold
            Item.Text = tostring(t)
            Item.TextColor3 = Color3.fromRGB(255,255,255)
            Item.TextSize = 13.000
            Item.TextTransparency = 0.500

            Item.MouseEnter:Connect(function()
                TweenService:Create(
                    Item,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                     TextTransparency = 0
                    }
                ):Play()
            end)

            Item.MouseLeave:Connect(function()
                TweenService:Create(
                    Item,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                     TextTransparency = 0.5
                    }
                ):Play()
            end)
        
            Item.MouseButton1Click:Connect(function()
                isdropping = false
                Dropdown:TweenSize(UDim2.new(0,387,0,31),"Out","Quad",0.3,true)
                TweenService:Create(
                    DropImage,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                     Rotation = 180
                    }
                ):Play()
                callback(Item.Text)
                DropTitle.Text = text.." : "..Item.Text
            end)
        end
        function dropfunc:Clear()
            DropTitle.Text = tostring(text).." : "
            isdropping = false
            Dropdown:TweenSize(UDim2.new(0,385,0,31),"Out","Quad",0.3,true)
            TweenService:Create(
                DropImage,
                TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {
                 Rotation = 180
                }
            ):Play()
            for i,v in next, DropScroll:GetChildren() do
                if v:IsA("TextButton") then
                    v:Destroy()
                end
            end
        end
        return dropfunc
    end
  
    function main:AddSlider(text, min, max, start, callback)
        local sliderfunc = {}
        local SliderFrame = Instance.new("Frame")
        local SliderFrame_2 = Instance.new("Frame")
        local UIStroke = Instance.new("UIStroke")
        local UICorner = Instance.new("UICorner")
        local ImageLabel = Instance.new("ImageLabel")
        local Space = Instance.new("TextLabel")
        local Title = Instance.new("TextLabel")
        local SliderInput = Instance.new("Frame")
        local SliderButton = Instance.new("Frame")
        local SliderCount = Instance.new("Frame")
        local SliderCorner = Instance.new("UICorner")
        local SliderCorner2 = Instance.new("UICorner")
        local BoxFrame = Instance.new("Frame")
        local SliderBox = Instance.new("TextBox")
        local SliderStroke = Instance.new("UIStroke")
        local Title_2 = Instance.new("TextButton")
        local UICorner_2 = Instance.new("UICorner")
        local UICorner_3 = Instance.new("UICorner")
        
        -- Prop --
        SliderFrame.Name = slidertitle or "SliderFrame"
        SliderFrame.Parent = MainFramePage
        SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderFrame.BackgroundTransparency = 1.000
        SliderFrame.BorderSizePixel = 0
        SliderFrame.Size = UDim2.new(0, 387, 0, 60)
    
        SliderFrame_2.Name = "SliderFrame_2"
        SliderFrame_2.Parent = SliderFrame
        SliderFrame_2.BackgroundColor3 = Color3.fromRGB(0,0,0)
        SliderFrame_2.BackgroundTransparency = 0
        SliderFrame_2.BorderSizePixel = 0
        SliderFrame_2.Position = UDim2.new(0, 1, 0, 1)
        SliderFrame_2.Size = UDim2.new(0, 387, 0, 60)
        
        UIStroke.Name = "UIStroke"
        UIStroke.Parent = SliderFrame_2
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Color = Color3.fromRGB(255, 255, 255)
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.Thickness = 1
        UIStroke.Transparency = 0
        UIStroke.Enabled = true
        UIStroke.Archivable = true
        
        UICorner.Parent = SliderFrame_2
        UICorner.CornerRadius = UDim.new(0, 3)
        
        ImageLabel.Name = "ImageLabel"
        ImageLabel.Parent = SliderFrame_2
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.BackgroundTransparency = 1.000
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Position = UDim2.new(0, 7.5, 0, 7.5)
        ImageLabel.Size = UDim2.new(0, 30, 0, 30)
        ImageLabel.Image = "rbxassetid://"
            
        Title.Parent = SliderFrame_2
        Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0, 45, 0, 5)
        Title.Size = UDim2.new(0, 280, 0, 30)
        Title.Font = Enum.Font.GothamSemibold
        Title.Text = "|  "..text
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 15.000
        Title.TextXAlignment = Enum.TextXAlignment.Left
                
        SliderInput.Name = "SliderInput"
        SliderInput.Parent = SliderFrame_2
        SliderInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderInput.BackgroundTransparency = 0.7
        SliderInput.BorderSizePixel = 0
        SliderInput.Position = UDim2.new(0, 8, 0, 42)
        SliderInput.Size = UDim2.new(0, 365, 0, 6)
        
        SliderCorner2.CornerRadius = UDim.new(0, 100000)
        SliderCorner2.Parent = SliderInput
        
        SliderButton.Name = "SliderButton"
        SliderButton.Parent = SliderInput
        SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderButton.BackgroundTransparency = 1.000
        SliderButton.BorderSizePixel = 0
        SliderButton.Position = UDim2.new(0, 0, 0, -7)
        SliderButton.Size = UDim2.new(0, 346, 0, 25)
    
        SliderCount.Name = "SliderCount"
        SliderCount.Parent = SliderButton
        SliderCount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderCount.BackgroundTransparency = 0.3
        SliderCount.BorderSizePixel = 0
        SliderCount.Position = UDim2.new(0,start,0,0)
        SliderCount.Size = UDim2.new(0, 18, 0, 18)
    
        Title_2.Name = "Title_2"
        Title_2.Parent = SliderButton
        Title_2.AnchorPoint = Vector2.new(0, 0)
        Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title_2.AutoButtonColor = false
        Title_2.BackgroundTransparency = 1.000
        Title_2.Position = UDim2.new(0,start,0,0)
        Title_2.Size = UDim2.new(0, 18, 0, 18)
        Title_2.Font = Enum.Font.GothamBold
        Title_2.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
        Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title_2.TextSize = 8.000
        Title_2.TextXAlignment = Enum.TextXAlignment.Center
        
        UICorner_2.Parent = Title_2
        UICorner_2.CornerRadius = UDim.new(0, 100000)
        
        SliderCorner.CornerRadius = UDim.new(0, 100000)
        SliderCorner.Parent = SliderCount
        
        SliderStroke.Name = "SliderStroke"
        SliderStroke.Parent = BoxFrame
        SliderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        SliderStroke.Color = Color3.fromRGB(255, 255, 255)
        SliderStroke.LineJoinMode = Enum.LineJoinMode.Round
        SliderStroke.Thickness = 1
        SliderStroke.Transparency = 0.5
        SliderStroke.Enabled = true
        SliderStroke.Archivable = true
        
        BoxFrame.Name = "BoxFrame"
        BoxFrame.Parent = SliderFrame_2
        BoxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        BoxFrame.BackgroundTransparency = 1.000
        BoxFrame.Size = UDim2.new(0, 50, 0, 15)
        BoxFrame.Position = UDim2.new(0, 323, 0, 8)
    
        SliderBox.Name = "SliderBox"
        SliderBox.Parent = BoxFrame
        SliderBox.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        SliderBox.BackgroundTransparency = 1.000
        SliderBox.Position = UDim2.new(0, 0, 0, 1.65)
        SliderBox.Size = UDim2.new(0, 50, 0, 15)
        SliderBox.ClearTextOnFocus = false
        SliderBox.Font = Enum.Font.Code
        SliderBox.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
        SliderBox.TextColor3 = Color3.fromRGB(200,200,200)
        SliderBox.TextSize = 10.000
        SliderBox.TextTransparency = 0
        SliderBox.TextXAlignment = Enum.TextXAlignment.Center
        SliderBox.TextEditable = true
        
        UICorner_3.Parent = BoxFrame
        UICorner_3.CornerRadius = UDim.new(0, 2)
        
        -- Slider Script --
        local dragging
        local SliderButtonStart
        local SliderButtonInput
        local slide = SliderButton
        
        local function slide(input)
            local slidein = UDim2.new(math.clamp((input.Position.X - SliderButton.AbsolutePosition.X) / SliderButton.AbsoluteSize.X, 0, 1), 0, 0, 0)
            SliderCount:TweenPosition(slidein, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.08, true)
            Title_2:TweenPosition(slidein, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.12, true)
            local Value = math.floor(((slidein.X.Scale * max) / max) * (max - min) + min)
            SliderBox.Text = tostring(Value)
            Title_2.Text = tostring(Value)
            pcall(callback, Value, slidein)
        end
    
        SliderButton.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                SliderButtonInput = input
                SliderButtonStart = input.Position.X
                slidein = SliderButton.AbsolutePosition.X
                game.TweenService:Create(SliderCount, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0, Size = UDim2.new(0, 14, 0, 14)}):Play()
                game.TweenService:Create(Title_2, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {AnchorPoint = Vector2.new(0.22, 0.8), TextSize = 13.000, BackgroundTransparency = 0, Size = UDim2.new(0, 25, 0, 25)}):Play()
                game.TweenService:Create(SliderBox, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
                game.TweenService:Create(SliderInput, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.5}):Play()
                game.TweenService:Create(SliderStroke, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Transparency = 0}):Play()
            end
            input.Changed:Connect(function(input)
                if input.UserInputType == Enum.UserInputState.End then
                dragging = false
                
                end
            end)
        end)
        SliderButton.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
                SliderButtonInput = input
                game.TweenService:Create(SliderCount, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.3, Size = UDim2.new(0, 18, 0, 18)}):Play()
                game.TweenService:Create(Title_2, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {AnchorPoint = Vector2.new(0, 0), TextSize = 8.000, BackgroundTransparency = 1.000, Size = UDim2.new(0, 18, 0, 18)}):Play()
                game.TweenService:Create(SliderBox, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0.5}):Play()
                game.TweenService:Create(SliderInput, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.7}):Play()
                game.TweenService:Create(SliderStroke, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Transparency = 0.5}):Play()
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input == SliderButtonInput and dragging then
                slide(input)
            end
        end)
        
        function set(property)
            if property == "Text" then
                if tonumber(SliderBox.Text) then 
                    if tonumber(SliderBox.Text) <= max then
                        Value = SliderBox.Text
                        Title_2.Text = SliderBox.Text
                        SliderCount:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                        Title_2:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                        pcall(function()
                            callback(Value)
                        end)
                    end
                    if tonumber(SliderBox.Text) > max then
                        SliderBox.Text = max
                        Title_2.Text = max
                        Value = max
                        SliderCount:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                        Title_2:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                        pcall(function()
                            callback(Value)
                        end)
                    end
                    if tonumber(SliderBox.Text) >= min then
                        Value = SliderBox.Text
                        Title_2.Text = SliderBox.Text
                        SliderCount:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                        Title_2:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                        pcall(function()
                            callback(Value)
                        end)
                    end
                    if tonumber(SliderBox.Text) < min then
                        Value = min
                        Title_2 = min
                        SliderCount.Position = UDim2.new(((min or min) - min) / (max - min), 0, 0, 0)
                        Title_2.Position = UDim2.new(((min or min) - min) / (max - min), 0, 0, 0)
                        pcall(function()
                            callback(Value)
                        end)
                    end
                else
                    SliderBox.Text = "" or Value
                    Title_2.Text = Value
                end
            end
        end
        
        SliderBox.Focused:Connect(function()
            SliderBox.Changed:Connect(set)
        end)
        
        SliderBox.FocusLost:Connect(function(enterP)
            if not enterP then
                if SliderBox.Text == "" then
                    SliderBox.Text = min
                    Title_2.Text = min
                    Value = min
                    SliderCount:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                    Title_2:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                    pcall(function()
                        callback(Value)
                    end)
                end
                if tonumber(SliderBox.Text) > tonumber(max) then
                    Value = max
                    SliderBox.Text = max
                    Title_2.Text = max
                    SliderCount:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                    Title_2:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                    pcall(function()
                        callback(Value)
                    end)
                else
                    Value = tonumber(SliderBox.Text)
                end
                if tonumber(SliderBox.Text) < min then
                    SliderBox.Text = min
                    Title_2.Text = min
                    Value = min
                    SliderCount:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                    Title_2:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                    pcall(function()
                        callback(Value)
                    end)
                else
                    Value = tonumber(SliderBox.Text)
                end
            end
            if tonumber(SliderBox.Text) > max then
                SliderBox.Text = max
                Title_2.Text = max
                Value = max
                SliderCount:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                Title_2:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                pcall(function()
                    callback(Value)
                end)
            else
                Value = tonumber(SliderBox.Text)
            end
            if tonumber(SliderBox.Text) < min then
                SliderBox.Text = min
                Title_2.Text = min
                Value = min
                SliderCount.Position = UDim2.new(((min) - min) / (max - min), 0, 0, 0)
                Title_2.Position = UDim2.new(((min) - min) / (max - min), 0, 0, 0)
                pcall(function()
                    callback(Value)
                end)
            else
                Value = tonumber(SliderBox.Text)
            end
            if SliderBox.Text == "" then
                SliderBox.Text = min
                Title_2.Text = min
                Value = min
                SliderCount:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                Title_2:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                pcall(function()
                    callback(Value)
                end)
            end
        end)
        return sliderfunc
    end

    function main:AddTextbox(text,disappear,callback)
        local Textbox = Instance.new("Frame")
        local TextboxCorner = Instance.new("UICorner")
        local Textboxx = Instance.new("Frame")
        local TextboxxCorner = Instance.new("UICorner")
        local TextboxLabel = Instance.new("TextLabel")
        local txtbtn = Instance.new("TextButton")
        local RealTextbox = Instance.new("TextBox")
        local UICorner = Instance.new("UICorner")

        Textbox.Name = "Textbox"
        Textbox.Parent = MainFramePage
        Textbox.BackgroundColor3 = Color3.new(255, 255, 255)
        Textbox.BackgroundTransparency = 0
        Textbox.Size = UDim2.new(0, 387, 0, 31)

        TextboxCorner.CornerRadius = UDim.new(0, 5)
        TextboxCorner.Name = "TextboxCorner"
        TextboxCorner.Parent = Textbox

        Textboxx.Name = "Textboxx"
        Textboxx.Parent = Textbox
        Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Textboxx.Position = UDim2.new(0, 1, 0, 1)
        Textboxx.Size = UDim2.new(0, 385, 0, 29)

        TextboxxCorner.CornerRadius = UDim.new(0, 5)
        TextboxxCorner.Name = "TextboxxCorner"
        TextboxxCorner.Parent = Textboxx

        TextboxLabel.Name = "TextboxLabel"
        TextboxLabel.Parent = Textbox
        TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 128,0)
        TextboxLabel.BackgroundTransparency = 1.000
        TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
        TextboxLabel.Text = text
        TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
        TextboxLabel.Font = Enum.Font.GothamSemibold
        TextboxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextboxLabel.TextSize = 16.000
        TextboxLabel.TextTransparency = 0
        TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

        txtbtn.Name = "txtbtn"
        txtbtn.Parent = Textbox
        txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        txtbtn.BackgroundTransparency = 1.000
        txtbtn.Position = UDim2.new(0, 1, 0, 1)
        txtbtn.Size = UDim2.new(0, 387, 0, 29)
        txtbtn.Font = Enum.Font.SourceSans
        txtbtn.Text = ""
        txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        txtbtn.TextSize = 14.000

        RealTextbox.Name = "RealTextbox"
        RealTextbox.Parent = Textbox
        RealTextbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        RealTextbox.BackgroundTransparency = 0
        RealTextbox.Position = UDim2.new(0, 275, 0, 4)
        RealTextbox.Size = UDim2.new(0, 100, 0, 24)
        RealTextbox.Font = Enum.Font.GothamSemibold
        RealTextbox.Text = ""
        RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
        RealTextbox.TextSize = 11.000
        RealTextbox.TextTransparency = 0

        RealTextbox.FocusLost:Connect(function()
            callback(RealTextbox.Text)
            if disappear then
                RealTextbox.Text = ""
            end
        end)

        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = RealTextbox
    end

    function main:AddLabel(text)
        local Label = Instance.new("TextLabel")
        local PaddingLabel = Instance.new("UIPadding")
        local labelfunc = {}

        Label.Name = "Label"
        Label.Parent = MainFramePage
        Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1.000
        Label.Size = UDim2.new(0, 410, 0, 20)
        Label.Font = Enum.Font.GothamSemibold
        Label.TextColor3 = Color3.fromRGB(225, 225, 225)
        Label.TextSize = 16.000
        Label.Text = text
        Label.TextXAlignment = Enum.TextXAlignment.Left

        PaddingLabel.PaddingLeft = UDim.new(0,15)
        PaddingLabel.Parent = Label
        PaddingLabel.Name = "PaddingLabel"

        function labelfunc:Set(newtext)
            Label.Text = newtext
        end
        return labelfunc
    end

    function main:AddLabel1(text)
        local Label1 = Instance.new("TextLabel")
        local PaddingLabel1 = Instance.new("UIPadding")
        local Label1func = {}
        
        Label1.Name = "Label1"
        Label1.Parent = MainFramePage
        Label1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label1.BackgroundTransparency = 1.000
        Label1.Size = UDim2.new(0, 410, 0, 20)
        Label1.Font = Enum.Font.GothamSemibold
        Label1.TextColor3 = Color3.fromRGB(255,255,255)
        Label1.TextSize = 15.000
        Label1.Text = text
        Label1.TextXAlignment = Enum.TextXAlignment.Left
        
        PaddingLabel1.PaddingLeft = UDim.new(0,15)
        PaddingLabel1.Parent = Label1
        PaddingLabel1.Name = "PaddingLabel1"
        function Label1func:Refresh(tochange)
        Label1.Text = tochange
        end
        
        return Label1func
    end    

    function main:AddTextbox(text,disappear,callback)
        local Textbox = Instance.new("Frame")
        local TextboxCorner = Instance.new("UICorner")
        local Textboxx = Instance.new("Frame")
        local TextboxxCorner = Instance.new("UICorner")
        local TextboxLabel = Instance.new("TextLabel")
        local txtbtn = Instance.new("TextButton")
        local RealTextbox = Instance.new("TextBox")
        local UICorner = Instance.new("UICorner")
        
        Textbox.Name = "Textbox"
        Textbox.Parent = MainFramePage
        Textbox.BackgroundColor3 = Color3.new(255, 255, 255)
        Textbox.BackgroundTransparency = 0
        Textbox.Size = UDim2.new(0, 387, 0, 31)
        
        TextboxCorner.CornerRadius = UDim.new(0, 5)
        TextboxCorner.Name = "TextboxCorner"
        TextboxCorner.Parent = Textbox
        
        Textboxx.Name = "Textboxx"
        Textboxx.Parent = Textbox
        Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Textboxx.Position = UDim2.new(0, 1, 0, 1)
        Textboxx.Size = UDim2.new(0, 385, 0, 29)
        
        TextboxxCorner.CornerRadius = UDim.new(0, 3)
        TextboxxCorner.Name = "TextboxxCorner"
        TextboxxCorner.Parent = Textboxx
        
        TextboxLabel.Name = "TextboxLabel"
        TextboxLabel.Parent = Textbox
        TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextboxLabel.BackgroundTransparency = 1.000
        TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
        TextboxLabel.Text = text
        TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
        TextboxLabel.Font = Enum.Font.GothamSemibold
        TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
        TextboxLabel.TextSize = 16.000
        TextboxLabel.TextTransparency = 0
        TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        txtbtn.Name = "txtbtn"
        txtbtn.Parent = Textbox
        txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        txtbtn.BackgroundTransparency = 1.000
        txtbtn.Position = UDim2.new(0, 1, 0, 1)
        txtbtn.Size = UDim2.new(0, 387, 0, 29)
        txtbtn.Font = Enum.Font.SourceSans
        txtbtn.Text = ""
        txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        txtbtn.TextSize = 14.000
        
        RealTextbox.Name = "RealTextbox"
        RealTextbox.Parent = Textbox
        RealTextbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        RealTextbox.BackgroundTransparency = 0
        RealTextbox.Position = UDim2.new(0, 275, 0, 4)
        RealTextbox.Size = UDim2.new(0, 100, 0, 24)
        RealTextbox.Font = Enum.Font.GothamSemibold
        RealTextbox.Text = ""
        RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
        RealTextbox.TextSize = 11.000
        RealTextbox.TextTransparency = 0

        RealTextbox.FocusLost:Connect(function()
            callback(RealTextbox.Text)
            if disappear then
                RealTextbox.Text = ""
            end
        end)

        UICorner.CornerRadius = UDim.new(0, 3)
        UICorner.Parent = RealTextbox
    end
    
    function main:AddLabel(text)
        local Label = Instance.new("TextLabel")
        local PaddingLabel = Instance.new("UIPadding")
        local labelfunc = {}

        Label.Name = "Label"
        Label.Parent = MainFramePage
        Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1.000
        Label.Size = UDim2.new(0, 410, 0, 20)
        Label.Font = Enum.Font.GothamSemibold
        Label.TextColor3 = Color3.fromRGB(225, 225, 225)
        Label.TextSize = 16.000
        Label.Text = text
        Label.TextXAlignment = Enum.TextXAlignment.Left

        PaddingLabel.PaddingLeft = UDim.new(0,15)
        PaddingLabel.Parent = Label
        PaddingLabel.Name = "PaddingLabel"

        function labelfunc:Set(newtext)
            Label.Text = newtext
        end
        return labelfunc
    end

    function main:AddLabel1(text)
        local Label1 = Instance.new("TextLabel")
        local PaddingLabel1 = Instance.new("UIPadding")
        local Label1func = {}
        
        Label1.Name = "Label1"
        Label1.Parent = MainFramePage
        Label1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label1.BackgroundTransparency = 1.000
        Label1.Size = UDim2.new(0, 410, 0, 20)
        Label1.Font = Enum.Font.GothamSemibold
        Label1.TextColor3 = Color3.fromRGB(255,255,255)
        Label1.TextSize = 15.000
        Label1.Text = text
        Label1.RichText = true
        Label1.TextXAlignment = Enum.TextXAlignment.Left
        
        PaddingLabel1.PaddingLeft = UDim.new(0,15)
        PaddingLabel1.Parent = Label1
        PaddingLabel1.Name = "PaddingLabel1"
        function Label1func:Refresh(tochange)
            Label1.Text = tochange
        end

        return Label1func
    end

    function main:Dis(text,display)
        local Label1 = Instance.new("TextLabel")
        local PaddingLabel1 = Instance.new("UIPadding")
        local Label1func = {}

        Label1.Name = "Label1"
        Label1.Parent = MainFramePage
        Label1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label1.BackgroundTransparency = 1.000
        Label1.Size = UDim2.new(0, 410, 0, 20)
        Label1.Font = Enum.Font.GothamSemibold
        Label1.TextColor3 = Color3.fromRGB(255,255,255)
        Label1.TextSize = 15.000
        Label1.Text = text
        Label1.TextXAlignment = Enum.TextXAlignment.Left

        Labeld.Name = "Labeld"
        Labeld.Parent = MainFramePage
        Labeld.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Labeld.BackgroundTransparency = 1.000
        Labeld.Size = UDim2.new(0, 410, 0, 20)
        Labeld.Font = Enum.Font.GothamSemibold
        Labeld.TextColor3 = Color3.fromRGB(255, 255, 255)
        Labeld.TextSize = 15.000
        Labeld.Text = display or ""
        Labeld.TextXAlignment = Enum.TextXAlignment.Left

        PaddingLabel1.PaddingLeft = UDim.new(0,15)
        PaddingLabel1.Parent = Label1
        PaddingLabel1.Name = "PaddingLabel1"
        function Label1func:Refresh(tochange)
            Label1.Text = tochange
        end

        return Label1func
    end

    function main:AddSeperator(text)
        local Seperator = Instance.new("Frame")
        local Sep1 = Instance.new("Frame")
        local Sep2 = Instance.new("TextLabel")
        local Sep3 = Instance.new("Frame")

        Seperator.Name = "Seperator"
        Seperator.Parent = MainFramePage
        Seperator.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Seperator.BackgroundTransparency = 1.000
        Seperator.Size = UDim2.new(0, 310, 0, 20)

        Sep1.Name = "Sep1"
        Sep1.Parent = Seperator
        Sep1.BackgroundColor3 = Color3.new(125, 125, 125)
        Sep1.BorderSizePixel = 0
        Sep1.Position = UDim2.new(0, 0, 0, 10)
        Sep1.Size = UDim2.new(0, 80, 0, 1)

        Sep2.Name = "Sep2"
        Sep2.Parent = Seperator
        Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Sep2.BackgroundTransparency = 1.000
        Sep2.Position = UDim2.new(0, 140, 0, 0)
        Sep2.Size = UDim2.new(0, 100, 0, 20)
        Sep2.Font = Enum.Font.GothamSemibold
        Sep2.Text = text
        Sep2.TextColor3 = Color3.fromRGB(255,255,255)
        Sep2.TextSize = 14.000

        Sep3.Name = "Sep3"
        Sep3.Parent = Seperator
        Sep3.BackgroundColor3 = Color3.new(125,125,125)
        Sep3.BorderSizePixel = 0
        Sep3.Position = UDim2.new(0, 300, 0, 10)
        Sep3.Size = UDim2.new(0, 80, 0, 1)
    end

    function main:AddLine()
        local Linee = Instance.new("Frame")
        local Line = Instance.new("Frame")
        
        Linee.Name = "Linee"
        Linee.Parent = MainFramePage
        Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Linee.BackgroundTransparency = 1.000
        Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
        Linee.Size = UDim2.new(0, 310, 0, 20)
        
        Line.Name = "Line"
        Line.Parent = Linee
        Line.BackgroundColor3 = Color3.new(125,125,125)
        Line.BorderSizePixel = 0
        Line.Position = UDim2.new(0, 0, 0, 10)
        Line.Size = UDim2.new(0, 410, 0, 1)
    end

    return main
end
return uitab
end

local Library = Update:Window("Vỹ-Gaming HUB","",Enum.KeyCode.RightControl);
local H = Library:AddTab("Dev","12950870585")

local Time = H:AddLabel("Executor Time");spawn(function() getgenv().Time = true;while true do wait(.1) UpdateTime() end end);function UpdateTime() local date = os.date("*t");local hour = (date.hour) % 24;local ampm = hour < 12 and "AM" or "PM";local timezone = string.format("%02i:%02i:%02i %s", ((hour -1) % 12) + 1, date.min, date.sec, ampm);local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year);local LocalizationService = game:GetService("LocalizationService");local Players = game:GetService("Players");local player = Players.LocalPlayer;local name = player.Name;local result, code = pcall(function()   return LocalizationService:GetCountryRegionForPlayerAsync(player)  end);Time:Set(" : " .. timezone);Time:Set("Executor Time: " .. datetime .. " [ " .. code .. " ]");spawn(function() if getgenv().Time then pcall(function()  while wait() do  Time()  end end) end end) end
H:AddLabel("Support Mobile")
H:AddLabel("Script By Me Update")

H:AddSeperator("Status")

H:AddLabel("Mobile: ✅")

H:AddSeperator("Support Execute")

H:AddLabel("Mobile:")
H:AddLabel("Fluxus, DeltaX, Codex, Hydrogen")
H:AddLabel("Flodded V")

H:AddSeperator("Developer")

H:AddLabel("Code By Vỹ-Gaming Admin")

H:AddLabel("Vỹ-Gaming Hub Discord")
H:AddLabel("https://discord.gg/49asfgKNyY")
H:AddLabel("Discord: Vỹ-Gaming Admin")

H:AddButton("Youtube Vỹ-Gaming Hub",function()
    setclipboard("https://www.youtube.com/@caythuebloxfruitnguyenvy5311")
    game.StarterGui:SetCore("SendNotification", {
        Icon = "rbxassetid://";
        Title = "Vỹ-Gaming Hub", 
        Text = "Copied";
    })
end)

local Main = Library:AddTab("Main","6026568198")

Main:AddToggle("Auto Farm Level",_G.Settings.Main["Auto Farm Level"],function(value)
	_G.Settings.Main["Auto Farm Level"] = value
    Auto_Farm_Level = value
    SaveSettings()
	if value == false then
		toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
	end
end)

AttackRandomType = 1
spawn(function()
	while wait() do 
		AttackRandomType = math.random(1,4)
		wait(0.01)
	end
end)

function AutoFarmLevel()
	GetQuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title
	GetQuest = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
	local MyLevel = game.Players.LocalPlayer.Data.Level.Value

	if _G.Settings.Setting["Skip Level"] and (MyLevel >= 10 and MyLevel <= 300 or MyLevel >= 347 and MyLevel <= 390 or MyLevel >= 438 and MyLevel <= 475 or MyLevel >= 517 and MyLevel <= 530 or MyLevel >= 583 and MyLevel <= 590 or MyLevel >= 637 and MyLevel <= 650 or MyLevel >= 692 and MyLevel <= 700) then
		if MyLevel >= 10 and MyLevel <= 46 then
			local CFrameMon = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4658.3388671875, 872.5684814453125, -1767.7735595703125))
			if game:GetService("Workspace").Enemies:FindFirstChild("God's Guard") then
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if _G.Settings.Setting["Skip Level"] and v.Name == "God's Guard" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
						repeat wait()
							FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
								if FarmtoTarget then FarmtoTarget:Stop() end
								for i2,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if _G.Settings.Setting["Skip Level"] and v2.Name == "God's Guard" and v2:FindFirstChild("HumanoidRootPart") and v2:FindFirstChild("Humanoid") and v2.Humanoid.Health > 0 then
										if InMyNetWork(v2.HumanoidRootPart) then
											v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
											v2.Humanoid.JumpPower = 0
											v2.Humanoid.WalkSpeed = 0
											v2.HumanoidRootPart.Size = Vector3.new(60,60,60)
											v2.HumanoidRootPart.Transparency = 1
											v2.HumanoidRootPart.CanCollide = false
											v2.Head.CanCollide = false
											if v2.Humanoid:FindFirstChild("Animator") then
												v2.Humanoid.Animator:Destroy()
											end
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											v2.Humanoid:ChangeState(14)
											v2.Humanoid:ChangeState(11)
										end
									end
								end
								if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
									game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
									game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
								end
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
								FastAttack = true
								EquipWeapon(_G.Settings.Setting["Select Weapon"])
							end
						until not (game:GetService("Workspace").Enemies:FindFirstChild("God's Guard")) or not (_G.Settings.Setting["Skip Level"] or _G.Settings.Main["Auto Farm Level"]) or v.Humanoid.Health <= 0 or not v.Parent
						FastAttack = false
					end
				end
			else
				Modstween = toTarget(CFrameMon)
				if FirstSea and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
					if Modstween then Modstween:Stop() end wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4658.3388671875, 872.5684814453125, -1767.7735595703125))
				elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
					if Modstween then Modstween:Stop() end
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				end
			end
		elseif MyLevel >= 46 and MyLevel <= 300 or MyLevel >= 347 and MyLevel <= 390 or MyLevel >= 438 and MyLevel <= 475 or MyLevel >= 517 and MyLevel <= 530 or MyLevel >= 583 and MyLevel <= 590 or MyLevel >= 637 and MyLevel <= 650 or MyLevel >= 692 and MyLevel <= 700 then
			if GetQuest.Visible == false then
				if not tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")):find("We heard some") then
					local CFrameMon = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4658.3388671875, 872.5684814453125, -1767.7735595703125))
					if game:GetService("Workspace").Enemies:FindFirstChild("God's Guard") then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if _G.Settings.Setting["Skip Level"] and v.Name == "God's Guard" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat wait()
									FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
									if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
										if FarmtoTarget then FarmtoTarget:Stop() end
										for i2,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
											if _G.Settings.Setting["Skip Level"] and v2.Name == "God's Guard" and v2:FindFirstChild("HumanoidRootPart") and v2:FindFirstChild("Humanoid") and v2.Humanoid.Health > 0 then
												if InMyNetWork(v2.HumanoidRootPart) then
													v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
													v2.Humanoid.JumpPower = 0
													v2.Humanoid.WalkSpeed = 0
													v2.HumanoidRootPart.Size = Vector3.new(60,60,60)
													v2.HumanoidRootPart.Transparency = 1
													v2.HumanoidRootPart.CanCollide = false
													v2.Head.CanCollide = false
													if v2.Humanoid:FindFirstChild("Animator") then
														v2.Humanoid.Animator:Destroy()
													end
													sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
													v2.Humanoid:ChangeState(14)
													v2.Humanoid:ChangeState(11)
												end
											end
										end
										if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
											game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
											game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
										end
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
										FastAttack = true
										EquipWeapon(_G.Settings.Setting["Select Weapon"])
									end
								until not (game:GetService("Workspace").Enemies:FindFirstChild("God's Guard")) or not (_G.Settings.Setting["Skip Level"] or _G.Settings.Main["Auto Farm Level"]) or v.Humanoid.Health <= 0 or not v.Parent
								FastAttack = false
							end
						end
					else
						Modstween = toTarget(CFrameMon)
						if FirstSea and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 300 then
							if Modstween then Modstween:Stop() end wait(.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4658.3388671875, 872.5684814453125, -1767.7735595703125))
						elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
							if Modstween then Modstween:Stop() end
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
						end 
					end
				end
			elseif GetQuest.Visible == true then
				local AllPlayersTableSkipFarm = {}
				for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
					table.insert(AllPlayersTableSkipFarm,v.Name)
				end
				if table.find(AllPlayersTableSkipFarm,GetQuestTitle.Text:split(" ")[2]) then
					for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
						if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
							if _G.Settings.Main["Auto Farm Level"] and _G.Settings.Setting["Skip Level"] and v.Name == GetQuestTitle.Text:split(" ")[2] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat wait()
									if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 150 then
										FarmtoTarget = toTargetP(v.HumanoidRootPart.CFrame)
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
										if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
											game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
											game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
										end
										if AttackRandomType == 1 then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 30)
										elseif AttackRandomType == 2 then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(-30, 0, 0)
										elseif AttackRandomType == 3 then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -30)
										elseif AttackRandomType == 4 then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(30, 0, 0)
										elseif AttackRandomType == 5 then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
										else
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
										end
										EquipWeapon(_G.Settings.Setting["Select Weapon"])
										AttackPlayers()
										wait(.1)
										game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
										game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
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
											FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
										elseif v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
											if FarmtoTarget then FarmtoTarget:Stop() end
											StartMagnet = true
											PosMon = v.HumanoidRootPart.CFrame
											HealthMin = v.Humanoid.MaxHealth * 40/100
											if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
												game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
												game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
											end
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
											FastAttack = true
											EquipWeapon(_G.Settings.Setting["Select Weapon"])
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
						FastAttack = false
						if not string.find(GetQuestTitle.Text, NameMon) then Com("F_","AbandonQuest"); end
						Modstween = toTarget(CFrameMon.Position,CFrameMon)
						if World1 and (Name == "Fishman Commando" or Name == "Fishman Warrior") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
							if Modstween then Modstween:Stop() end wait(.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
						elseif World1 and not (Name == "Fishman Commando" or Name == "Fishman Warrior") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
							if Modstween then Modstween:Stop() end wait(.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
						elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
							if Modstween then Modstween:Stop() end wait(.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
						elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
							if Modstween then Modstween:Stop() end wait(.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
						elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
							if Modstween then Modstween:Stop() end
							for i ,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
								if v.Name == NameMon then
									wait(.3)
									topos(v.CFrame * CFrame.new(0, 10, 0))
								end
							end
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
			if World1 and (Name == "Fishman Commando" or Name == "Fishman Warrior") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
				if Questtween then Questtween:Stop() end wait(.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			elseif World1 and not (Name == "Fishman Commando" or Name == "Fishman Warrior") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
				if Questtween then Questtween:Stop() end wait(.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
			elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
				if Questtween then Questtween:Stop() end
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
				if Questtween then Questtween:Stop() end
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
			elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
				if Questtween then Questtween:Stop() end
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
				Com("F_","StartQuest", QuestName, LevelQuest)
			end
		elseif GetQuest.Visible == true then
			if game:GetService("Workspace").Enemies:FindFirstChild(Name) then
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if _G.Settings.Main["Auto Farm Level"] and v.Name == Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
						if string.find(GetQuestTitle.Text, NameMon) then
							repeat wait()
								FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
								if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
									if FarmtoTarget then FarmtoTarget:Stop() end
									if _G.Settings.Setting["Auto Haki"] then
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
										end
									end
									if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Setting["Select Weapon"]) then
										wait()
										EquipWeapon(_G.Settings.Setting["Select Weapon"])
									end
									StartMagnet = true
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
									FastAttack = true
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
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
				if World1 and (Name == "Fishman Commando" or Name == "Fishman Warrior") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
					if Modstween then Modstween:Stop() end wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
				elseif World1 and not (Name == "Fishman Commando" or Name == "Fishman Warrior") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
					if Modstween then Modstween:Stop() end wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
				elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
					if Modstween then Modstween:Stop() end wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
					if Modstween then Modstween:Stop() end wait(.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
				elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
					if Modstween then Modstween:Stop() end
					for i ,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
						if v.Name == NameMon then
							wait(.3)
							topos(v.CFrame * CFrame.new(0, 10, 0))
						end
					end
				end
			end
		end
	end
end

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
				if _G.Settings.Setting["Double Quest"] then 
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
												break;
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

Main:AddToggle("Mob Aura",_G.Settings.Main["Mob Aura"],function(value)
	_G.Settings.Main["Mob Aura"] = value
	SaveSettings()
	if value == false then
		wait()
		toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
		wait()
	end
end)

task.spawn(function()
	while wait() do
		if _G.Settings.Main["Mob Aura"] then
			for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
				if _G.Settings.Main["Mob Aura"] and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= _G.Settings.Main["Distance Mob Aura"] then
					repeat wait()
						StartMagnet = true
						FastAttack = true
						if _G.Settings.Setting["Auto Buso Haki"] then
							if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
							end
						end
						if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Setting["Select Weapon"]) then
							wait()
							EquipWeapon(_G.Settings.Setting["Select Weapon"])
						end
						PosMon = v.HumanoidRootPart.CFrame
						if not _G.Settings.Setting["Fast Attack"] then
							game:GetService'VirtualUser':CaptureController()
							game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
						end
						v.HumanoidRootPart.Size = Vector3.new(60,60,60)
						v.Humanoid.JumpPower = 0
						v.Humanoid.WalkSpeed = 0
						v.HumanoidRootPart.CanCollide = false
						v.Humanoid:ChangeState(11)
						toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
						MagnetMobAura = true
						if delay then
							delay(1,function()
								MagnetMobAura = true
							end)
						end 
					until not _G.Settings.Main["Mob Aura"] or not v.Parent or v.Humanoid.Health <= 0
					MagnetMobAura = false
					FastAttack = false
					StartMagnet = false
				end
			end
		end
	end
end)

if World1 then
	Main:AddToggle("Auto Second Sea",_G.Settings.Main["Auto New World"],function(value)
		_G.Settings.Main["Auto New World"] = value
		SaveSettings()
		if value == false then
			wait()
			toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
			wait()
		end
	end)

	spawn(function()
		while wait() do
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
						if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Ice Admiral" and v.Humanoid.Health > 0 then
									repeat wait()
										if _G.Settings.Setting["Auto Buso Haki"] then
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
											end
										end
										if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Setting["Select Weapon"]) then
											wait()
											EquipWeapon(_G.Settings.Setting["Select Weapon"])
										end
										toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
										FastAttack = true
										if not _G.Settings.Setting["Fast Attack"] then
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										end
										v.HumanoidRootPart.Size = Vector3.new(60,60,60)
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
		end
	end)
end

if World2 then
	Main:AddToggle("Auto Third Sea",_G.Settings.Main["Auto Third World"],function(value)
		_G.Settings.Main["Auto Third World"] = value
		SaveSettings()
	end)
end

Main:AddLine()
Main:AddSeperator("Chest Farm")

Main:AddLine()
Main:AddSeperator("Boss Farm")

local Boss = {}

for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if string.find(v.Name, "Boss") then
        if v.Name == "Ice Admiral" then
            else
            table.insert(Boss, v.Name)
        end
    end
end

local bossCheck = {}
local bossNames = {"The Gorilla King", "Bobby", "The Saw", "Yeti", "Mob Leader", "Vice Admiral", "Warden", "Chief Warden", "Swan", "Saber Expert", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg", "Greybeard", "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Awakened Ice Admiral", "Tide Keeper", "Order", "Darkbeard", "Cursed Captain", "Stone", "Island Empress", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Longma", "Cake Queen", "Soul Reaper", "Rip_Indra", "Cake Prince", "Dough King" }

if World1 or World2 or World3 then
    for _, bossName in pairs(bossNames) do
        if game:GetService("ReplicatedStorage"):FindFirstChild(bossName) then
            table.insert(bossCheck, bossName)
        end
    end
end

-- Menggabungkan kedua daftar nama bos
for _, name in pairs(Boss) do
    table.insert(bossCheck, name)
end

local BossName = Main:AddDropdown("Select Boss",bossCheck,function(value)
    _G.Settings.Boss["Select Boss"] = value
end)

Main:AddButton("Refresh Boss",function()
	BossName:Clear()
	wait(0.1)
	for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
		if (v.Name == "rip_indra" or v.Name == "Ice Admiral")
		or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Vice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg")
		or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard")
		or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
			BossName:Add(v.Name)
    	end
	end
end)

Main:AddToggle("Auto Farm Boss",_G.Settings.Boss["Auto Farm Boss"],function(value)
	_G.Settings.Boss["Auto Farm Boss"] = value
	SaveSettings()
	if value == false then
		wait()
		toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
		wait()
	end
end)

spawn(function()
	while wait() do
		if _G.Settings.Boss["Auto Farm Boss"] then
			CheckBossQuest()
			if MsBoss == "Soul Reaper" or MsBoss == "Longma" or MsBoss == "Don Swan" or MsBoss == "Cursed Captain" or MsBoss == "Order" or MsBoss == "rip_indra True Form" then
				if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == MsBoss then
							repeat wait()
								if _G.Settings.Setting["Auto Buso Haki"] then
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
									end
								end
								if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Setting["Select Weapon"]) then
									wait()
									EquipWeapon(_G.Settings.Setting["Select Weapon"])
								end
								StartMagnet = true
								FastAttack = true
								toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
								PosMon = v.HumanoidRootPart.CFrame
								v.HumanoidRootPart.Size = Vector3.new(60,60,60)
								v.Humanoid.JumpPower = 0
								v.Humanoid.WalkSpeed = 0
								v.HumanoidRootPart.CanCollide = false
								v.Humanoid:ChangeState(11)
							until _G.Settings.Boss["Auto Farm Boss"] == false or not v.Parent or v.Humanoid.Health <= 0
						end
					end
				else
					toTarget(CFrameBoss)
				end
			else
				if _G.Settings.Boss["Auto Quest Boss"] then
					CheckBossQuest()
					if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
					end
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
						repeat wait() toTarget(CFrameQuestBoss) until (CFrameQuestBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.Boss["Auto Farm Boss"]
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
											if _G.Settings.Setting["Auto Buso Haki"] then
												if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
												end
											end
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Setting["Select Weapon"]) then
												wait()
												EquipWeapon(_G.Settings.Setting["Select Weapon"])
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
									until _G.Settings.Boss["Auto Farm Boss"] == false or not v.Parent or v.Humanoid.Health <= 0
								end
							end
						else
							toTarget(CFrameBoss)
						end
					else
						if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == MsBoss then
									repeat wait()
										if _G.Settings.Setting["Auto Buso Haki"] then
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
											end
										end
										if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Setting["Select Weapon"]) then
											wait()
											EquipWeapon(_G.Settings.Setting["Select Weapon"])
										end
										StartMagnet = true
										FastAttack = true
										toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
										PosMon = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.Size = Vector3.new(60,60,60)
										v.Humanoid.JumpPower = 0
										v.Humanoid.WalkSpeed = 0
										v.HumanoidRootPart.CanCollide = false
										v.Humanoid:ChangeState(11)								
									until _G.Settings.Boss["Auto Farm Boss"] == false or not v.Parent or v.Humanoid.Health <= 0
								end
							end
						else
							toTarget(CFrameBoss)
						end
					end
				end
			end
		end
	end
end)

Main:AddToggle("Auto Quest Boss",_G.Settings.Boss["Auto Quest Boss"],function(value)
	_G.Settings.Boss["Auto Quest Boss"] = value
	SaveSettings()
end)

Main:AddToggle("Auto Farm All Boss",_G.Settings.Boss["Auto Farm All Boss"],function(value)
	_G.Settings.Boss["Auto Farm All Boss"] = value
	SaveSettings()
end)

spawn(function()
	while wait() do
		if _G.Settings.Boss["Auto Farm All Boss"] then
			CheckBossQuest()
			if MsBoss == "Soul Reaper" or MsBoss == "Longma" or MsBoss == "Don Swan" or MsBoss == "Cursed Captain" or MsBoss == "Order" or MsBoss == "rip_indra True Form" then
				if game:GetService("ReplicatedStorage"):FindFirstChild(MsBoss) or game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
					if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == MsBoss then
								repeat wait()
									_G.GetBoss = true
									if _G.Settings.Setting["Auto Buso Haki"] then
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
										end
									end
									if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Setting["Select Weapon"]) then
										wait()
										EquipWeapon(_G.Settings.Setting["Select Weapon"])
									end
									StartMagnet = true
									FastAttack = true
									toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
									PosMon = v.HumanoidRootPart.CFrame
									v.HumanoidRootPart.Size = Vector3.new(60,60,60)
									v.Humanoid.JumpPower = 0
									v.Humanoid.WalkSpeed = 0
									v.HumanoidRootPart.CanCollide = false
									v.Humanoid:ChangeState(11)
								until _G.Settings.Boss["Auto Farm All Boss"] == false or not v.Parent or v.Humanoid.Health <= 0
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
				if _G.Settings.Boss["Auto Quest Boss"] then
					CheckBossQuest()
					if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
					end
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
						_G.GetBoss = true
						repeat wait() toTarget(CFrameQuestBoss) until (CFrameQuestBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.Boss["Auto Farm All Boss"]
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
												if _G.Settings.Setting["Auto Buso Haki"] then
													if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
													end
												end
												if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Setting["Select Weapon"]) then
													wait()
													EquipWeapon(_G.Settings.Setting["Select Weapon"])
												end
												StartMagnet = true
												FastAttack = true
												toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
												PosMon = v.HumanoidRootPart.CFrame
												v.HumanoidRootPart.Size = Vector3.new(60,60,60)
												v.Humanoid.JumpPower = 0
												v.Humanoid.WalkSpeed = 0
												v.HumanoidRootPart.CanCollide = false
												v.Humanoid:ChangeState(11)								
											else
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
											end
										until _G.Settings.Boss["Auto Farm All Boss"] == false or not v.Parent or v.Humanoid.Health <= 0
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
										if _G.Settings.Setting["Auto Buso Haki"] then
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
											end
										end
										if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Setting["Select Weapon"]) then
											wait()
											EquipWeapon(_G.Settings.Setting["Select Weapon"])
										end
										StartMagnet = true
										FastAttack = true
										toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
										PosMon = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.Size = Vector3.new(60,60,60)
										v.Humanoid.JumpPower = 0
										v.Humanoid.WalkSpeed = 0
										v.HumanoidRootPart.CanCollide = false
										v.Humanoid:ChangeState(11)								
									until _G.Settings.Boss["Auto Farm All Boss"] == false or not v.Parent or v.Humanoid.Health <= 0
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
		end
	end
end)

local Setting = Library:AddTab("Setting","9606644121")

Setting:AddSeperator("Choose Setting")

local WeaponList = {"Melee","Sword","Fruit"}

Setting:AddDropdown("Select Weapon",WeaponList,function(value)
    _G.Settings.Setting["Select Weapon"] = value
    SaveSettings()
end)

task.spawn(function()
	while wait() do
		pcall(function()
			if _G.Settings.Setting["Select Weapon"] == "Melee" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.Settings.Setting["Select Weapon"] = v.Name
						end
					end
				end
			elseif _G.Settings.Setting["Select Weapon"] == "Sword" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Sword" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.Settings.Setting["Select Weapon"] = v.Name
						end
					end
				end
			elseif _G.Settings.Setting["Select Weapon"] == "Fruit" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Blox Fruit" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.Settings.Setting["Select Weapon"] = v.Name
						end
					end
				end
			end
		end)
	end
end)

Setting:AddToggle("Auto Ken Haki",_G.Settings.Setting["Auto Ken Haki"],function(value)
    _G.Settings.Setting["Auto Ken Haki"] = value
    SaveSettings()
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Setting["Auto Ken Haki"] then
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"E",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"E",false,game)
            end
        end)
    end
end)

Setting:AddToggle("Auto Buso Haki",_G.Settings.Setting["Auto Buso Haki"],function(value)
    _G.Settings.Setting["Auto Buso Haki"] = value
    SaveSettings()
end)

spawn(function()
    while wait() do
        if _G.Settings.Setting["Auto Buso Haki"] then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end
end)

Setting:AddToggle("Auto Active Race V4",_G.Settings.Setting["Auto Active Race V4"],function(value)
    _G.Settings.Setting["Auto Active Race V4"] = value
    SaveSettings()
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Setting["Auto Active Race V4"] then
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
            end
        end)
    end
end)

EXPCode =  {
	'SECRET_ADMIN'
	,'staffbattle'
	,'Sub2CaptainMaui'
	,'SUB2GAMERROBOT_RESET1'
	,'JULYUPDATE_RESET'
	,'KITT_RESET'
	,'KittGaming'
	,'Sub2Fer999'
	,'Enyu_is_Pro'
	,'Magicbus'
	,'JCWK'
	,'StarcodeHEO'
	,'Bluxxy'
	,'fudd10_v2'
	,'FUDD10'
	,'BIGNEWS'
	,'THEGREATACE'
	,'SUB2GAMERROBOT_EXP1'
	,'Sub2OfficialNoobie'
	,'StrawHatMaine'
	,'SUB2NOOBMASTER123'
	,'Sub2UncleKizaru'
	,'SUB2DAIGROCK'
	,'Axiore'
	,'TantaiGaming'
}

Setting:AddToggle("Auto Redeem Code",_G.Settings.Setting["Auto Redeem Code"],function(value)
	_G.Settings.Setting["Auto Redeem Code"] = value
	SaveSettings()
end)

task.spawn(function()
	while wait(5) do
		pcall(function()
			local MyLevel = game.Players.LocalPlayer.Data.Level.Value
			if _G.Settings.Setting["Auto Redeem Code"] then
				if MyLevel >= _G.Settings.Setting["Level Redeem Code"] then
					function Redeem(Value)
						game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Value)
					end
					for i,v in pairs(EXPCode) do
						Redeem(v)
					end
					wait(3)
					_G.Settings.Setting["Auto Redeem Code"] = false
				end
			end
		end)
	end
end)

Setting:AddSlider("Level Redeem Code",1,100,1,function(value)
	_G.Settings.Setting["Level Redeem Code"] = value
	SaveSettings()
end)

Setting:AddToggle("Auto Active Race V3",_G.Settings.Setting["Auto Active Race V3"],function(value)
    _G.Settings.Setting["Auto Active Race V3"] = value
    SaveSettings()
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Settings.Setting["Auto Active Race V3"] then
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"T",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"T",false,game)
            end
        end)
    end
end)

Setting:AddToggle("Bring Mob",_G.Settings.Setting["Bring Mob"],function(value)
    _G.Settings.Setting["Bring Mob"] = value
    SaveSettings()
end)

Setting:AddToggle("Bypass TP",_G.Settings.Setting["Bypass TP"],function(value)
    _G.Settings.Setting["Bypass TP"] = value
    SaveSettings()
end)

Setting:AddToggle("Fast Attack",_G.Settings.Setting["Fast Attack"],function(value)
    _G.Settings.Setting["Fast Attack"] = value
    SaveSettings()
end)

coroutine.wrap(function()
	while task.wait() do
		local ac = CombatFrameworkR.activeController
		if ac and ac.equipped then
			if FastAttack and _G.Settings.Setting["Fast Attack"] then
				AttackFunction()
				if tick() - cooldownfastattack > .1 then wait(.3) cooldownfastattack = tick() end
			elseif FastAttack and _G.Settings.Setting["Fast Attack"] == false then
				if ac.hitboxMagnitude ~= 55 then
					ac.hitboxMagnitude = 55
				end
				ac:attack()
			end
		end
	end
end)()

Setting:AddToggle("Double Quest",_G.Settings.Setting["Double Quest"],function(value)
    _G.Settings.Setting["Double Quest"] = value
    SaveSettings()
end)

if World1 then
    Setting:AddToggle("Skip Level",_G.Settings.Setting["Skip Level"],function(value)
        _G.Settings.Setting["Skip Level"] = value
        SaveSettings()
    end)

    Setting:AddToggle("Auto Buy Ablility",_G.Settings.Setting["Auto Buy Ablility"],function(value)
        _G.Settings.Setting["Auto Buy Ablility"] = value
        SaveSettings()
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.Settings.Setting["Auto Buy Ablility"] then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
                end
            end)
        end
    end)
end

_G.Settings.Main["Distance Mob Aura"] = 1000
Setting:AddSlider("Distance Mob Aura",1,5000,1000,function(value)
	_G.Settings.Main["Distance Mob Aura"] = value
	SaveSettings()
end)

Setting:AddSeperator("Mastery Fruit Setting Skill")
Setting:AddToggle("Skill Z",_G.Settings.Setting["Skill Z"],function(value)
    _G.Settings.Setting["Skill Z"] = value
    SaveSettings()
end)

Setting:AddToggle("Skill X",_G.Settings.Setting["Skill X"],function(value)
    _G.Settings.Setting["Skill X"] = value
    SaveSettings()
end)

Setting:AddToggle("Skill C",_G.Settings.Setting["Skill C"],function(value)
    _G.Settings.Setting["Skill C"] = value
    SaveSettings()
end)

Setting:AddToggle("Skill V",_G.Settings.Setting["Skill V"],function(value)
    _G.Settings.Setting["Skill V"] = value
    SaveSettings()
end)

Setting:AddToggle("Skill F",_G.Settings.Setting["Skill F"],function(value)
    _G.Settings.Setting["Skill F"] = value
    SaveSettings()
end)

_G.Settings.Setting["Select Health %"] = 25
Setting:AddSlider("Select Health %",1,100,25,function(value)
    _G.Settings.Setting["Select Health %"] = value
    SaveSettings()
end)

Setting:AddSeperator("Mastery Gun Setting Skill")
Setting:AddToggle("Skill Z",_G.Settings.Setting["Skill Z"],function(value)
    _G.Settings.Setting["Skill Z"] = value
    SaveSettings()
end)

Setting:AddToggle("Skill X",_G.Settings.Setting["Skill X"],function(value)
    _G.Settings.Setting["Skill X"] = value
    SaveSettings()
end)