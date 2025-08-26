local samp = require("samp.events")
local memory = require("memory")
local encoding = require("encoding")
encoding.default = "CP1251"

local anos_script = {
    active = false,
    last_action = 0,
    anti_detect = {
        delay_min = 500,
        delay_max = 2000,
        random_offset = 0
    }
}

function main()
    while not isSampAvailable() do
        wait(100)
    end
    
    sampAddChatMessage("Script Loaded. copyright: anos.py", -1)
    sampAddChatMessage("anos health manager aktif - /km /td", 0x00FF00)
    
    anos_script.active = true
    
    sampRegisterChatCommand("km", cmd_kill_me)
    sampRegisterChatCommand("td", cmd_tambah_darah)
    
    while true do
        wait(0)
        
        if anos_script.active then
            local current_time = os.clock() * 1000
            if current_time - anos_script.last_action > anos_script.anti_detect.delay_min then
                anos_script.anti_detect.random_offset = math.random(-100, 100)
            end
        end
    end
end

function cmd_kill_me()
    if not anos_script.active then
        return
    end
    
    local current_time = os.clock() * 1000
    if current_time - anos_script.last_action < anos_script.anti_detect.delay_min then
        sampAddChatMessage("tunggu sebentar", 0xFF0000)
        return
    end
    
    anos_script.last_action = current_time
    
    lua_thread.create(function()
        local delay = math.random(anos_script.anti_detect.delay_min, anos_script.anti_detect.delay_max)
        wait(delay)
        
        if isCharInAnyCar(PLAYER_PED) then
            setCharHealth(PLAYER_PED, 0)
        else
            setCharHealth(PLAYER_PED, 0)
        end
        
        sampAddChatMessage("anos script executed", 0x808080)
    end)
end

function cmd_tambah_darah()
    if not anos_script.active then
        return
    end
    
    local current_time = os.clock() * 1000
    if current_time - anos_script.last_action < anos_script.anti_detect.delay_min then
        sampAddChatMessage("tunggu sebentar", 0xFF0000)
        return
    end
    
    anos_script.last_action = current_time
    
    lua_thread.create(function()
        local delay = math.random(anos_script.anti_detect.delay_min, anos_script.anti_detect.delay_max)
        wait(delay)
        
        local current_health = getCharHealth(PLAYER_PED)
        if current_health < 100 then
            setCharHealth(PLAYER_PED, 100)
            sampAddChatMessage("darah full bro", 0x00FF00)
        else
            sampAddChatMessage("darah udah full", 0xFFFF00)
        end
        
        wait(100)
        sampAddChatMessage("anos health boost", 0x808080)
    end)
end

function samp.onSendCommand(command)
    if not anos_script.active then
        return
    end
    
    if command:find("/km") or command:find("/td") then
        return false
    end
end

function samp.onServerMessage(color, text)
    if text:find("Anti") or text:find("cheat") or text:find("hack") then
        anos_script.active = false
        sampAddChatMessage("anos protection activated", 0xFF0000)
        return false
    end
end

function onScriptTerminate(script, quitGame)
    if script == thisScript() then
        anos_script.active = false
    end
end