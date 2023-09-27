--[[
About this system:
This system is an anti-cheat and Loading screen bypass system
]]

local Vortex = {}
local contentprovider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
--local hint = Instance.new("Hint",game:GetService("Workspace"))
--[[
local NotificationBindable = Instance.new("BindableFunction")
function Msgreq(Title,Text,Duration,Button1Text,Button2Text)
game.StarterGui:SetCore("SendNotification", {
     Title = Title;
     Text = Text;
     Icon = "";
     Duration = Duration;
     Button1 = Button1Text;
     Button2 = Button2Text;
     Callback = NotificationBindable;
  })
end

NotificationBindable.OnInvoke = function(result)
if result == "Hide Notify" then
        print("FUCK YOU!")
   end
end

--Msgreq("","",999999999,"Hide Notify","")
]]

function BypassLoadingScreen()
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

function GUID(ignorelist,GUIDtoggle)
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

function AdonisBypass(versionbypass)
     if versionbypass == "V1" then
          FuckAdonisV1()
     elseif versionbypass == "V2" then
          FuckAdonisV2()
     elseif versionbypass == "Auto" then
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

--[[
    R(oblox)C(hat)T(ranslate)
    Made by Gabe.#7458
--]]

if not game['Loaded'] then game['Loaded']:Wait() end; repeat wait(.06) until game:GetService('Players').LocalPlayer ~= nil
local YourLang = "en" 

local googlev = isfile'googlev.txt' and readfile'googlev.txt' or ''

function googleConsent(Body) 
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

function find(lang)
    for i,v in pairs(languages) do
        if i == lang or v == lang then
            return i
        end
    end
end

function isSupported(lang)
    local key = find(lang)
    return key and true or false 
end

function getISOCode(lang)
    local key = find(lang)
    return key
end

function stringifyQuery(dataFields)
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

local HttpService = game:GetService("HttpService")
function jsonE(o)
    return HttpService:JSONEncode(o)
end
function jsonD(o)
    return HttpService:JSONDecode(o)
end

function translate(str, to, from)
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
local StarterGui = game:GetService('StarterGui')
for i=1, 15 do
    local r = pcall(StarterGui["SetCore"])
    if r then break end
    game:GetService('RunService').RenderStepped:wait()
end
wait()

local properties = {
    Color = Color3.new(1,1,0);
    Font = Enum.Font.SourceSansItalic;
    TextSize = 16;
}

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

function translateFrom(message)
    local translation = translate(message, YourLang)

    local text
    if translation.from.language ~= YourLang then 
        text = translation.text
    end

    return {text, translation.from.language}
end

function get(plr, msg)
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

function translateTo(message, target)
    target = target:lower() 
    local translation = translate(message, target, "auto")

    return translation.text
end

function disableSend()
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
