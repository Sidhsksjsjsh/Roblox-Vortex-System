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
