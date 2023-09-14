local Vortex = {}
local contentprovider = game:GetService("ContentProvider")
local mt = getrawmetatable(game)
local oldnc = mt.__namecall
local oldidx = mt.__index

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

function Vortex:BypassLoadingScreen()
setreadonly(mt, false)

mt.__namecall = newcclosure(function(obj, ...)
   local method = getnamecallmethod()
   if method == "PreloadAsync" and obj == contentprovider then
        --notify("Bypassed Loading Screen","success makes PreloadAsync wait() duration become 0.1!")
        Msgreq("Bypassed Loading Screen","success makes PreloadAsync wait() duration become 0.1!",999999999,"Hide Notify","")
       return wait(0.1)
   end
   return oldnc(obj, ...)
end)

mt.__index = newcclosure(function(obj, idx)
   if idx == "RequestQueueSize" and obj == contentprovider then
        Msgreq("Bypassed Loading Screen","success makes RequestQueueSize duration become 0!",999999999,"Hide Notify","")
       return 0
   end
   return oldidx(obj, idx)
end)

setreadonly(mt, true)
end

function Vortex:AntiHookFunction(tbl,funcName)
    local originalFunction = tbl[funcName]
    
    setmetatable(tbl, {
        __index = function(_, key)
            if key == funcName then
                return originalFunction
            end
        end
        
        __newindex = function(_, key, value)
            if key == funcName then
                --notify("Attempt to overwrite",funcName .. " detected!")
                Msgreq("Attempt to overwrite",tostring(funcName) .. " detected!",999999999,"Hide Notify","")
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player and player:IsA("Player") then
                        --notify("Hookfunction Detected!","Player " .. player.Name .. " is suspected of attempting to use hookfunction!")
                        Msgreq("Hookfunction Detected!","Player " .. tostring(player.Name) .. " is suspected of attempting to use hookfunction!",999999999,"Hide Notify","")
                    end
                end
                return
            end
            rawset(tbl, key, value)
        end
    })
end

-- protectFunctionWithPrint(game, "SomeFunction")
