--[[
About this system:
This system is an anti-cheat and Loading screen bypass system
]]

local Vortex = {}
local contentprovider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService('StarterGui')
local RunService = game:GetService("RunService")
local oldgrav = game:GetService("Workspace").Gravity
local http = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local PathfindingService = game:GetService("PathfindingService")
local chat = game:GetService("Chat")
local PetOwner = ""
local bannedWords = {"mom","dad","parent"}
local Asset = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local cmdFrame = Instance.new("Frame")
cmdFrame.Parent = screenGui
cmdFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
cmdFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
cmdFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
cmdFrame.BorderSizePixel = 0
cmdFrame.ClipsDescendants = true
cmdFrame.Visible = false

local cmdFrameCorner = Instance.new("UICorner")
cmdFrameCorner.CornerRadius = UDim.new(0.03, 0)
cmdFrameCorner.Parent = cmdFrame

local glowEffect = Instance.new("ImageLabel")
glowEffect.Parent = cmdFrame
glowEffect.Size = UDim2.new(1.1, 0, 1.1, 0)
glowEffect.Position = UDim2.new(-0.05, 0, -0.05, 0)
glowEffect.Image = "rbxassetid://3570695787" 
glowEffect.ImageColor3 = Color3.fromRGB(0, 255, 150)
glowEffect.BackgroundTransparency = 1
glowEffect.ZIndex = 0

local titleBar = Instance.new("TextLabel")
titleBar.Parent = cmdFrame
titleBar.Size = UDim2.new(1, 0, 0.05, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
titleBar.TextColor3 = Color3.fromRGB(0, 255, 150)
titleBar.Text = "Command Prompt V1.0.0"
titleBar.Font = Enum.Font.SourceSansSemibold

local closeButton = Instance.new("TextButton")
closeButton.Parent = titleBar
closeButton.Size = UDim2.new(0.03, 0, 1, 0)
closeButton.Position = UDim2.new(0.97, 0, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(192, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.BorderSizePixel = 0

closeButton.MouseButton1Click:Connect(function()
    cmdFrame.Visible = false
end)

local cmdInput = Instance.new("TextBox")
cmdInput.Parent = cmdFrame
cmdInput.Size = UDim2.new(1, -10, 0.9, -titleBar.Size.Y.Offset)
cmdInput.Position = UDim2.new(0, 5, 0.05, 5)
cmdInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
cmdInput.TextColor3 = Color3.fromRGB(0, 255, 150)
cmdInput.TextXAlignment = Enum.TextXAlignment.Left
cmdInput.TextYAlignment = Enum.TextYAlignment.Top
cmdInput.MultiLine = true
cmdInput.ClearTextOnFocus = false
cmdInput.Font = Enum.Font.Code
cmdInput.PlaceholderColor3 = Color3.fromRGB(60, 60, 60)
cmdInput.Text = "> "
cmdInput.BorderSizePixel = 0

local cmdInputCorner = Instance.new("UICorner")
cmdInputCorner.CornerRadius = UDim.new(0.03, 0)
cmdInputCorner.Parent = cmdInput

local properties = {
    Color = Color3.new(1,1,0);
    Font = Enum.Font.SourceSansItalic;
    TextSize = 16;
}

local function _str_index(str)
for i,v in pairs(game.Players:GetChildren()) do
if (string.sub(string.lower(v.DisplayName),1,string.len(str))) == string.lower(str) then
   return v.Name
  end
 end
end

properties.Text = "Vortex anti-cheat monitoring is active, it will automatically bypass when anti-cheat is detected or triggered by the server-sided or client sided Anti-Cheat."
StarterGui:SetCore("ChatMakeSystemMessage", properties)

local function Toast(title)
properties.Text = title
StarterGui:SetCore("ChatMakeSystemMessage", properties)
end

function Vortex:GlobalToast(title)
properties.Text = title
StarterGui:SetCore("ChatMakeSystemMessage", properties)
end

function Vortex:BypassLoadingScreen()
local mt = getrawmetatable(game)
local oldnc = mt.__namecall
local oldidx = mt.__index
     
setreadonly(mt, false)

mt.__namecall = newcclosure(function(obj, ...)
   local method = getnamecallmethod()
   if method == "PreloadAsync" and obj == contentprovider then
        return wait(0.1)
          --hint.Text = "Successfully bypassed the loading screen."
          --wait()
          --hint.Text = ""
   end
   return oldnc(obj, ...)
end)

mt.__index = newcclosure(function(obj, idx)
   if idx == "RequestQueueSize" and obj == contentprovider then
        -- Msgreq("Bypassed Loading Screen","success makes RequestQueueSize duration become 0!",999999999,"Hide Notify","")
       return 0
   end
   return oldidx(obj, idx)
end)

setreadonly(mt, true)
end

function Vortex:GUID(ignorelist,GUIDtoggle)
 local GUID = HttpService:GenerateGUID(GUIDtoggle)

     if ignorelist == "-" then
          return GUID:gsub("-","")
     elseif ignorelist == "abc" then
          return GUID:gsub("a",""):gsub("b",""):gsub("c",""):gsub("d",""):gsub("e",""):gsub("f",""):gsub("g",""):gsub("h",""):gsub("i",""):gsub("j",""):gsub("k",""):gsub("l",""):gsub("m",""):gsub("n",""):gsub("o",""):gsub("p",""):gsub("q",""):gsub("r",""):gsub("s",""):gsub("t",""):gsub("u",""):gsub("v",""):gsub("w",""):gsub("x",""):gsub("y",""):gsub("z",""):gsub("A",""):gsub("B",""):gsub("C",""):gsub("D",""):gsub("E",""):gsub("F",""):gsub("G",""):gsub("H",""):gsub("I",""):gsub("J",""):gsub("K",""):gsub("L",""):gsub("M",""):gsub("N",""):gsub("O",""):gsub("P",""):gsub("Q",""):gsub("R",""):gsub("S",""):gsub("T",""):gsub("U",""):gsub("V",""):gsub("W",""):gsub("X",""):gsub("Y",""):gsub("Z","")
     elseif ignorelist == "abc and -" or ignorelist == "- and abc" then
          return GUID:gsub("a",""):gsub("b",""):gsub("c",""):gsub("d",""):gsub("e",""):gsub("f",""):gsub("g",""):gsub("h",""):gsub("i",""):gsub("j",""):gsub("k",""):gsub("l",""):gsub("m",""):gsub("n",""):gsub("o",""):gsub("p",""):gsub("q",""):gsub("r",""):gsub("s",""):gsub("t",""):gsub("u",""):gsub("v",""):gsub("w",""):gsub("x",""):gsub("y",""):gsub("z",""):gsub("A",""):gsub("B",""):gsub("C",""):gsub("D",""):gsub("E",""):gsub("F",""):gsub("G",""):gsub("H",""):gsub("I",""):gsub("J",""):gsub("K",""):gsub("L",""):gsub("M",""):gsub("N",""):gsub("O",""):gsub("P",""):gsub("Q",""):gsub("R",""):gsub("S",""):gsub("T",""):gsub("U",""):gsub("V",""):gsub("W",""):gsub("X",""):gsub("Y",""):gsub("Z",""):gsub("-","")
     else
          return GUID
     end
end

local function FuckAdonisV1()
for k,v in pairs(getgc(true)) do
   if pcall(function() return rawget(v,"indexInstance") end) and type(rawget(v,"indexInstance")) == "table" and  (rawget(v,"indexInstance"))[1] == "kick" then
       v.tvk = {"kick",function() return game.Workspace:WaitForChild("") end}
     end
   end
end

--repeat task.wait() until game:IsLoaded()

local function isAdonisAC(table) -- stupid check
	return rawget(table, "Detected") and typeof(rawget(table, "Detected")) == "function" and rawget(table, "RLocked")
end

local function FuckAdonisV2()
for _, v in next, getgc(true) do
	if typeof(v) == "table" and isAdonisAC(v) then
		for i, v in next, v do
			warn(print, i, typeof(v))
			if rawequal(i, "Detected") then
				local old;
				old = hookfunction(v, function(action, info, nocrash)
					if rawequal(action, "_") and rawequal(info, "_") and rawequal(nocrash, true) then
						return old(action, info, nocrash)
					end
					return task.wait(9e9)
				end)
				break
			end
		end
	end
end
end

local Config = {
    ["Adonis"] = true,
    ["Enable Kill Logs"] = true
}

local function performKillLog(...)
if Config["Enable Kill Logs"] then
warn("VORTEX ANTI CHEAT BYPASS [ADONIS VERSION]", ...)
properties.Text = "Adonis Detected Break | Anti-Log"
StarterGui:SetCore("ChatMakeSystemMessage",properties)
end
end

local function breakFunction()
return task.wait(10e10)
end;

local function find(gcObject, ...)
    local gcResult = true;
    for _, constant in next, {...} do
        if not table.find(gcObject, constant) then
            gcResult = false
            break
        end
    end
    if gcResult then return gcObject end;
    return nil;
end

local SearchFunctions = {
    GarbageCollection = {
        ConstantsLookup = function(...) 
            for _, gcObject in next, getgc() do
                if type(gcObject) == "function" and islclosure(gcObject) then
                    return find(debug.getconstants(gcObject), ...)
                end
            end
        end,
        UpValuesLookup = function(...) 
            for _, gcObject in next, getgc() do
                if type(gcObject) == "function" and islclosure(gcObject) then
                    return find(debug.getupvalues(gcObject), ...)
                end
            end
        end,
        FunctionNameLookup = function(functionName)
            for _, gcObject in next, getgc() do
                if type(gcObject) == "function" and islclosure(gcObject) and getinfo(gcObject).name == functionName then
                    return gcObject
                end
            end
        end,
    },
    Registry = {
        ConstantsLookup = function(...) 
            for _, RegObject in next, getreg() do
                if type(RegObject) == "function" and islclosure(RegObject) then
                    return find(debug.getconstants(RegObject), ...)
                end
            end
        end,
        UpValuesLookup = function(...) 
            for _, RegObject in next, getreg() do
                if type(RegObject) == "function" and islclosure(RegObject) then
                    return find(debug.getupvalues(RegObject), ...)
                end
            end
        end,
        FunctionNameLookup = function(functionName)
            for _, RegObject in next, getgc() do
                if type(RegObject) == "function" and islclosure(RegObject) and getinfo(RegObject).name == functionName then
                    return RegObject
                end
            end
        end,
    }
}

local function FuckAdonisV3()
if Config["Adonis"] then
    local detectedFunction = SearchFunctions.GarbageCollection.ConstantsLookup("_", "crash", ":: Adonis Anti Cheat::", "Detected");
    if detectedFunction then
        performKillLog("{Adonis} Detected Break");
        hookfunction(detectedFunction, breakFunction)
	properties.Text = "Bypassed Adonis Anti-Cheat 🐧"
        StarterGui:SetCore("ChatMakeSystemMessage", properties)
    end
end
end

function Vortex:AdonisBypass(versionbypass)
     if versionbypass == "v1" or versionbypass == "V1" then
          FuckAdonisV1()
     elseif versionbypass == "v2" or versionbypass == "V2" then
          FuckAdonisV2()
     elseif versionbypass == "v3" or versionbypass == "V3" then
          FuckAdonisV3()
     elseif versionbypass == "auto" or versionbypass == "Auto" then
          local success, result = pcall(function()
                    FuckAdonisV1()
          end)

          if not success then
               FuckAdonisV2()
          end
     else
          warn("Invalid Argument #1 \nargument 'version_type'")
     end
end

function Vortex:Write(v,a)
writefile(v,a)
end

function Vortex:Read(v)
   return readfile(v)
end

function Vortex:IsFile(v)
    return isfile(v)
end

function Vortex:Run(v)
loadstring(v)()
end

function Vortex:Connection(v)
   return http(v)
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

--local DEFAULT_GRAVITY = 196.2
local THRESHOLD = 10
local function checkGravity(player)
    local char = player.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid and (humanoid.Gravity < oldgrav - THRESHOLD or humanoid.Gravity > oldgrav + THRESHOLD) then
            Toast("[ Vortex Detector ]: " .. tostring(player.DisplayName) .." (@" .. tostring(player.Name) .. ") having unusual or suspicious gravity!")
        end
    end
end

local function handleSwimming(char)
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.StateChanged:Connect(function(_,newState)
            if newState == Enum.HumanoidStateType.Swimming then
                Toast("[ Vortex Detector ]: " .. tostring(char.Parent.Name) .. " Swimming!")
            end
        end)
    end
end

local function checkSitting(player)
    local char = player.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
	humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
           if humanoid and humanoid.Sit then
              Toast("[ Vortex Detector ]: " .. tostring(player.DisplayName) .." (@" .. tostring(player.Name) .. ") Sitting!")
        end
	end)
    end
end

local FLY_DETECTION_HEIGHT = 50
local function detectExploits(player)
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") and character:FindFirstChild("HumanoidRootPart") then
        local humanoid = character.Humanoid
        local humanoidRootPart = character.HumanoidRootPart

        humanoidRootPart.Touched:Connect(function(hit)
            if hit:IsA("BasePart") and hit.CanCollide then
                local isInside = humanoidRootPart.Position.Y > hit.Position.Y and humanoidRootPart.Position.Y < hit.Position.Y + hit.Size.Y
                if isInside then
                    Toast("[ Vortex Detector ]: " .. tostring(player.DisplayName) .." (@" .. tostring(player.Name) .. ") Currently Using Noclip!")
                end
            end
        end)

        RunService.RenderStepped:Connect(function()
            if humanoid.FloorMaterial == nil and humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and humanoidRootPart.Position.Y > FLY_DETECTION_HEIGHT then
                Toast("[ Vortex Detector ]: " .. tostring(player.DisplayName) .." (@" .. tostring(player.Name) .. ") Flying!")
            end
        end)
    end
end

local MAX_WALKSPEED = 32
local function detectSpeed(player)
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        local humanoid = character.Humanoid
        
        humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if humanoid.WalkSpeed > MAX_WALKSPEED then
                Toast("[ Vortex Detector ]: " .. tostring(player.DisplayName) .." (@" .. tostring(player.Name) .. ") Is Using Speed ​​Scripts!")
            end
        end)
    end
end

local function checkDeathByDamage(character)
    local humanoid = character.Humanoid
    local damaged = false

    humanoid.Died:Connect(function()
        if damaged == true then
            Toast("[ Vortex Detector ]: " .. tostring(character.Parent.Name) .. " Dies from damage.")
            damaged = false
	else
	    Toast("[ Vortex Detector ]: " .. tostring(character.Parent.Name) .. " Died due to resetting the character.")
        end
    end)
end
--[[
local path = PathfindingService:CreatePath({
    AgentRadius = 2,
    AgentHeight = 5,
    AgentCanJump = true,
    AgentJumpHeight = 10,
    AgentMaxSlope = 45,
})
]]

local path = PathfindingService:CreatePath()

function Vortex:PathFinding(targetPosition)
path:ComputeAsync(LocalPlayer.Character.HumanoidRootPart.Position,targetPosition)

if path.Status == Enum.PathStatus.Success then
Toast("[ Vortex AI ]: Path found!")
local waypoints = path:GetWaypoints()
		local distance 
		for waypointIndex, waypoint in pairs(waypoints) do
			local waypointPosition = waypoint.Position
			LocalPlayer.Character.Humanoid:MoveTo(waypointPosition)
			repeat 
				distance = (waypointPosition - LocalPlayer.Character.Humanoid.Parent.PrimaryPart.Position).magnitude
			wait()
			until distance <= 5
	end
    else
           Toast("[ Vortex AI ]: Failed to find path.")
    end
end

local function PathFinding(targetPosition)
path:ComputeAsync(LocalPlayer.Character.HumanoidRootPart.Position,targetPosition)

if LocalPlayer.Character.Humanoid.Sit == true then
	LocalPlayer.Character.Humanoid.Sit = false
end

if path.Status == Enum.PathStatus.Success then
Toast("[ Vortex PET ]: Path found!")
local waypoints = path:GetWaypoints()
		local distance 
		for waypointIndex, waypoint in pairs(waypoints) do
			local waypointPosition = waypoint.Position
			LocalPlayer.Character.Humanoid:MoveTo(waypointPosition)
			repeat 
				distance = (waypointPosition - LocalPlayer.Character.Humanoid.Parent.PrimaryPart.Position).magnitude
			wait()
			until distance <= 5
	end
	else
           Toast("[ Vortex PET ]: Failed to find path.")
    end
end

function Vortex:SystemChatted(cht)
	chat:Chat(LocalPlayer.Character,cht)
end

local function isBannedWord(message)
    for _, word in pairs(bannedWords) do
        if string.match(string.lower(message),word) then
            return true
        end
    end
    return false
end

function Vortex:addBannedWord(word)
    table.insert(bannedWords,word)
end

local PetCommander = false
local function ActPet(player,msg)
msg = msg:lower()
local str
local space = string.find(msg," ")
if space then
   str = string.sub(msg,1,space-1)
else
   str = string.sub(msg,1)
end
-- _str_index(str)
if player == PetOwner and PetCommander == true then
	if str == "come" or str == "follow me" then
		PathFinding(player.Character.HumanoidRootPart.Position)
	elseif str == "jump" then
		LocalPlayer.Character.Humanoid.Jump = true
	elseif str == "sit" then
		LocalPlayer.Character.Humanoid.Sit = true
	elseif str == "kill" then
		PathFinding(game.Players[_str_index(string.sub(msg,space+1))].Character.HumanoidRootPart.Position)
	elseif str == "find" then
		PathFinding(game.Players[_str_index(string.sub(msg,space+1))].Character.HumanoidRootPart.Position)
	else
		Toast("[ Vortex PET ]: COMMAND NOT FOUND!")
	end
end
end

function Vortex:SetOwner(own)
	PetOwner = own
end

function Vortex:PetEnabled()
	PetCommander = true
	Toast("[ Vortex PET ]: Pet Enabled! Other players will control you like their pet.")
end

function Vortex:PetDisabled()
	PetCommander = false
	Toast("[ Vortex PET ]: Pet Disabled!")
end

function Vortex:CheckError(str)
local index,error = pcall(function()
	str()
end)

if not index then
	chat:Chat(LocalPlayer.Character,error)
end
end

local function CheckError(str)
local index,error = pcall(function()
	str()
end)

if not index then
	cmdInput.Text = cmdInput.Text .. "\n" .. error .. "\n" .. "> "
end
end

function Vortex:ShowCommandPrompt()
	cmdFrame.Visible = true
end

function Vortex:WriteCommandPrompt(str)
	cmdInput.Text = cmdInput.Text .. "\n" .. tostring(str) .. "\n" .. "> "
end

cmdInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local lines = cmdInput.Text:split("\n")
        local command = lines[#lines]
        if command == "> exit" then
            cmdFrame.Visible = false
	    cmdInput.Text = cmdInput.Text .. "\n" .. "> "
	elseif command:sub(1,11) == "> run-http " then
	    CheckError(function()
		loadstring(game:HttpGet(command:sub(12)))()
		cmdInput.Text = cmdInput.Text .. "\n" .. "Executed!" .. "\n" .. "> "
	   end)
	elseif command == "> get-game-id" then
		cmdInput.Text = cmdInput.Text .. "\n" .. "game ID: " .. tostring(game.PlaceId) .. "\n" .. "> "
	elseif command == "> get-game-job-id" then
		cmdInput.Text = cmdInput.Text .. "\n" .. "game/server Job ID: " .. tostring(game.JobId) .. "\n" .. "> "
	elseif command == "> get-game-name" then
		cmdInput.Text = cmdInput.Text .. "\n" .. "game name: " .. tostring(Asset.Name) .. "\n" .. "> "
	elseif command:sub(1,22) == "> change-textbox-size " then
	    CheckError(function()
		cmdInput.TextSize = tonumber(command:sub(23))
		cmdInput.Text = cmdInput.Text .. "\n" .. "Texbox Text size successfully changed!" .. "\n" .. "> "
	   end)
	elseif command:sub(1,20) == "> change-title-size " then
	    CheckError(function()
		titleBar.TextSize = tonumber(command:sub(21))
		cmdInput.Text = cmdInput.Text .. "\n" .. "Title Text size successfully changed!" .. "\n" .. "> "
	   end)
	else
	     cmdInput.Text = cmdInput.Text .. "\n" .. "Command Error or Invalid, Please enter the command again." .. "\n" .. "> "
        end
    end
end)

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        detectExploits(player)
	detectSpeed(player)
	checkDeathByDamage(player.Character)
	checkSitting(player)
	--checkGravity(player)
	handleSwimming(player.Character)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        detectExploits(player)
	detectSpeed(player)
	checkDeathByDamage(player.Character)
	checkSitting(player)
	--checkGravity(player)
	handleSwimming(player.Character)
    end
end)

Players.PlayerAdded:Connect(function(player)
	Toast("[ Vortex Detector ]: " .. tostring(player.DisplayName) .. " (@" .. tostring(player.Name) .. ") Has joined.")
end)

Players.PlayerRemoving:Connect(function(player)
	Toast("[ Vortex Detector ]: " .. tostring(player.DisplayName) .. " (@" .. tostring(player.Name) .. ") Has left experience.")
end)

for i,v in pairs(game.Players:GetChildren()) do
if v.Name ~= LocalPlayer then
    v.Chatted:Connect(function(msg)
	if isBannedWord(msg) then
		chat:Chat(LocalPlayer.Character,"Bad Word Detected.")
	else
                ActPet(v.Name,msg)
      end
    end)
end
end

Players.PlayerAdded:Connect(function(player)
if player.Name ~= LocalPlayer then
    player.Chatted:Connect(function(msg)
        if isBannedWord(msg) then
		chat:Chat(LocalPlayer.Character,"Bad Word Detected.")
	else
                ActPet(player.Name,msg)
      end
    end)
end
end)

return Vortex

--[[Roblox chat translator:

if not game['Loaded'] then game['Loaded']:Wait() end; repeat wait(.06) until game:GetService('Players').LocalPlayer ~= nil
local YourLang = "en" 

local googlev = isfile'googlev.txt' and readfile'googlev.txt' or ''

local function googleConsent(Body) 
    local args = {}

    for match in Body:gmatch('<input type="hidden" name=".-" value=".-">') do
        local k,v = match:match('<input type="hidden" name="(.-)" value="(.-)">')
        args[k] = v
    end
    googlev = args.v
    writefile('googlev.txt', args.v)
end

local function got(url, Method, Body) -- Basic version of https://www.npmjs.com/package/got using synapse's request API for google websites
    Method = Method or "GET"
    
    local res = syn.request({
        Url = url,
        Method = Method,
        Headers = {cookie="CONSENT=YES+"..googlev},
        Body = Body
    })
    
    if res.Body:match('https://consent.google.com/s') then
        print('consent')
        googleConsent(res.Body)
        res = syn.request({
            Url = url,
            Method = "GET",
            Headers = {cookie="CONSENT=YES+"..googlev}
        })
    end
    
    return res
end

local languages = {
    auto = "Automatic",
    af = "Afrikaans",
    sq = "Albanian",
    am = "Amharic",
    ar = "Arabic",
    hy = "Armenian",
    az = "Azerbaijani",
    eu = "Basque",
    be = "Belarusian",
    bn = "Bengali",
    bs = "Bosnian",
    bg = "Bulgarian",
    ca = "Catalan",
    ceb = "Cebuano",
    ny = "Chichewa",
    ['zh-cn'] = "Chinese Simplified",
    ['zh-tw'] = "Chinese Traditional",
    co = "Corsican",
    hr = "Croatian",
    cs = "Czech",
    da = "Danish",
    nl = "Dutch",
    en = "English",
    eo = "Esperanto",
    et = "Estonian",
    tl = "Filipino",
    fi = "Finnish",
    fr = "French",
    fy = "Frisian",
    gl = "Galician",
    ka = "Georgian",
    de = "German",
    el = "Greek",
    gu = "Gujarati",
    ht = "Haitian Creole",
    ha = "Hausa",
    haw = "Hawaiian",
    iw = "Hebrew",
    hi = "Hindi",
    hmn = "Hmong",
    hu = "Hungarian",
    is = "Icelandic",
    ig = "Igbo",
    id = "Indonesian",
    ga = "Irish",
    it = "Italian",
    ja = "Japanese",
    jw = "Javanese",
    kn = "Kannada",
    kk = "Kazakh",
    km = "Khmer",
    ko = "Korean",
    ku = "Kurdish (Kurmanji)",
    ky = "Kyrgyz",
    lo = "Lao",
    la = "Latin",
    lv = "Latvian",
    lt = "Lithuanian",
    lb = "Luxembourgish",
    mk = "Macedonian",
    mg = "Malagasy",
    ms = "Malay",
    ml = "Malayalam",
    mt = "Maltese",
    mi = "Maori",
    mr = "Marathi",
    mn = "Mongolian",
    my = "Myanmar (Burmese)",
    ne = "Nepali",
    no = "Norwegian",
    ps = "Pashto",
    fa = "Persian",
    pl = "Polish",
    pt = "Portuguese",
    pa = "Punjabi",
    ro = "Romanian",
    ru = "Russian",
    sm = "Samoan",
    gd = "Scots Gaelic",
    sr = "Serbian",
    st = "Sesotho",
    sn = "Shona",
    sd = "Sindhi",
    si = "Sinhala",
    sk = "Slovak",
    sl = "Slovenian",
    so = "Somali",
    es = "Spanish",
    su = "Sundanese",
    sw = "Swahili",
    sv = "Swedish",
    tg = "Tajik",
    ta = "Tamil",
    te = "Telugu",
    th = "Thai",
    tr = "Turkish",
    uk = "Ukrainian",
    ur = "Urdu",
    uz = "Uzbek",
    vi = "Vietnamese",
    cy = "Welsh",
    xh = "Xhosa",
    yi = "Yiddish",
    yo = "Yoruba",
    zu = "Zulu"
};

local function find(lang)
    for i,v in pairs(languages) do
        if i == lang or v == lang then
            return i
        end
    end
end

local function isSupported(lang)
    local key = find(lang)
    return key and true or false 
end

local function getISOCode(lang)
    local key = find(lang)
    return key
end

local function stringifyQuery(dataFields)
    local data = ""
    for k, v in pairs(dataFields) do
        if type(v) == "table" then
            for _,v in pairs(v) do
                data = data .. ("&%s=%s"):format(
                    game.HttpService:UrlEncode(k),
                    game.HttpService:UrlEncode(v)
                )
            end
        else
            data = data .. ("&%s=%s"):format(
                game.HttpService:UrlEncode(k),
                game.HttpService:UrlEncode(v)
            )
        end
    end
    data = data:sub(2)
    return data
end

local reqid = math.random(1000,9999)
local rpcidsTranslate = "MkEWBc"
local rootURL = "https://translate.google.com/"
local executeURL = "https://translate.google.com/_/TranslateWebserverUi/data/batchexecute"
local fsid, bl

do -- init
	print('initialize')
    local InitialReq = got(rootURL)
    fsid = InitialReq.Body:match('"FdrFJe":"(.-)"')
    bl = InitialReq.Body:match('"cfb2h":"(.-)"')
end

local function jsonE(o)
    return HttpService:JSONEncode(o)
end

local function jsonD(o)
    return HttpService:JSONDecode(o)
end

local function translate(str, to, from)
    reqid+=10000
    from = from and getISOCode(from) or 'auto'
    to = to and getISOCode(to) or 'en'

    local data = {{str, from, to, true}, {nil}}

    local freq = {
        {
            {
                rpcidsTranslate, 
                jsonE(data),
                nil,
                "generic"
            }
        }
    }

    local url = executeURL..'?'..stringifyQuery{rpcids = rpcidsTranslate, ['f.sid'] = fsid, bl = bl, hl="en", _reqid = reqid-10000, rt = 'c'}
    local body = stringifyQuery{['f.req'] = jsonE(freq)}
    
    local req = got(url, "POST", body)
	
    local body = jsonD(req.Body:match'%[.-%]\n')
    local translationData = jsonD(body[1][3])
    local result = {
        text = "",
        from = {
            language = "",
            text = ""
        },
        raw = ""
    }
    result.raw = translationData
    result.text = translationData[2][1][1][6][1][1]
    
    result.from.language = translationData[3]
    result.from.text = translationData[2][5][1]

    return result
end

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
for i=1, 15 do
    local r = pcall(StarterGui["SetCore"])
    if r then break end
    game:GetService('RunService').RenderStepped:wait()
end
wait()

game:GetService("StarterGui"):SetCore("SendNotification",
    {
        Title = "Vortex Translator",
        Text = "Thanks for using Vortex Translator. The pastebin link to see the translate cods has been coppied to your clipboard.",
        --setclipboard ("https://pastebin.com/raw/Y312VK60"),
        Duration = 5
    }
)
                  
properties.Text = "[Vortex] pastebin link to Key letters/Words has been copied to clipboard. If you have script in autoexecute and join murder mystery 2 take out of auto execute and rejoin this will make the chat break (Wont be able to chat at all.)."
StarterGui:SetCore("ChatMakeSystemMessage", properties)

local function translateFrom(message)
    local translation = translate(message, YourLang)

    local text
    if translation.from.language ~= YourLang then 
        text = translation.text
    end

    return {text, translation.from.language}
end

local function get(plr, msg)
    local tab = translateFrom(msg)
    local translation = tab[1]
    if translation and sendEnabled == true then
        properties.Text = "("..tab[2]:upper()..") ".."[".. plr.Name .."]: "..translation
        StarterGui:SetCore("ChatMakeSystemMessage", properties)
    end
end

for i, plr in ipairs(Players:GetPlayers()) do
    plr.Chatted:Connect(function(msg)
        get(plr, msg)
    end)
end
Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        get(plr, msg)
    end)
end)

local sendEnabled = false
local target = ""

local function translateTo(message, target)
    target = target:lower() 
    local translation = translate(message, target, "auto")

    return translation.text
end

local function disableSend()
    sendEnabled = false
    properties.Text = "[Vortex] Sending Disabled"
    StarterGui:SetCore("ChatMakeSystemMessage", properties)
end

local CBar, CRemote, Connected = LP['PlayerGui']:WaitForChild('Chat')['Frame'].ChatBarParentFrame['Frame'].BoxFrame['Frame'].ChatBar, game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents['SayMessageRequest'], {}

local HookChat = function(Bar)
    coroutine.wrap(function()
        if not table.find(Connected,Bar) then
            local Connect = Bar['FocusLost']:Connect(function(Enter)
                if Enter ~= false and Bar['Text'] ~= '' then
                    local Message = Bar['Text']
                    Bar['Text'] = '';
                    if Message == ">d" then
                        disableSend()
                    elseif Message:sub(1,1) == ">" and not Message:find(" ") then
                        if getISOCode(Message:sub(2)) then
                            sendEnabled = true
                            target = Message:sub(2)
                        else
                            properties.Text = "[Vortex]  Invalid language"
                            StarterGui:SetCore("ChatMakeSystemMessage", properties)
                        end
                    elseif sendEnabled then
                        Message = translateTo(Message, target)
                        game:GetService('Players'):Chat(Message); CRemote:FireServer(Message,'All')
                    else
                        game:GetService('Players'):Chat(Message); CRemote:FireServer(Message,'All')
                    end
                end
            end)
            Connected[#Connected+1] = Bar; Bar['AncestryChanged']:Wait(); Connect:Disconnect()
        end
    end)()
end

HookChat(CBar); local BindHook = Instance.new('BindableEvent')

local MT = getrawmetatable(game); local NC = MT.__namecall; setreadonly(MT, false)

MT.__namecall = newcclosure(function(...)
    local Method, Args = getnamecallmethod(), {...}
    if rawequal(tostring(Args[1]),'ChatBarFocusChanged') and rawequal(Args[2],true) then 
        if LP['PlayerGui']:FindFirstChild('Chat') then
            BindHook:Fire()
        end
    end
    return NC(...)
end)

BindHook['Event']:Connect(function()
    CBar = LP['PlayerGui'].Chat['Frame'].ChatBarParentFrame['Frame'].BoxFrame['Frame'].ChatBar
    HookChat(CBar)
end)
]]
