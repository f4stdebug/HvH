-- ==============================================================
-- ░██                          ░████    ░████                 ░██           ░██            ░██                              
-- ░██                         ░██      ░██ ██                 ░██           ░██            ░██                              
-- ░████████  ░██    ░██    ░████████  ░██  ██    ░███████  ░████████  ░████████  ░███████  ░████████  ░██    ░██  ░████████ 
-- ░██    ░██ ░██    ░██       ░██    ░██   ██   ░██           ░██    ░██    ░██ ░██    ░██ ░██    ░██ ░██    ░██ ░██    ░██ 
-- ░██    ░██ ░██    ░██       ░██    ░█████████  ░███████     ░██    ░██    ░██ ░█████████ ░██    ░██ ░██    ░██ ░██    ░██ 
-- ░███   ░██ ░██   ░███       ░██         ░██          ░██    ░██    ░██   ░███ ░██        ░███   ░██ ░██   ░███ ░██   ░███ 
-- ░██░█████   ░█████░██       ░██         ░██    ░███████      ░████  ░█████░██  ░███████  ░██░█████   ░█████░██  ░█████░██ 
--                   ░██                                                                                                 ░██ 
--             ░███████                                                                                            ░███████  
--                                                                                                                           
-- https://github.com/f4stdebug
-- https://github.com/f4stdebug
-- https://github.com/f4stdebug
-- https://github.com/f4stdebug
-- ==============================================================

--setup: nl

gui.add_checkbox("try hard gameplay mode", "lua>tab a")
gui.add_checkbox("undefeated mode", "lua>tab a")
gui.add_checkbox("very fast 2shot", "lua>tab a")
gui.add_checkbox("crouch god", "lua>tab a")
gui.add_checkbox("air angel", "lua>tab a")
gui.add_checkbox("jitter abuser fix ", "lua>tab a")
gui.add_checkbox("subscribe to arsa ", "lua>tab a")




local player = entities.get_entity(engine.get_local_player())
local Find = gui.get_config_item
local Checkbox = gui.add_checkbox
local Slider = gui.add_slider
local Combo = gui.add_combo
local MultiCombo = gui.add_multi_combo
local AddKeybind = gui.add_keybind
local CPicker = gui.add_colorpicker
local AddButton = gui.add_button
local clipboard = require("clipboard")
local playerstate = 0;
local ConditionalStates = { }
local configs = {}
local j = { anim_list = {} }
j.math_clamp = function(k, j, s) return math.min(s, math.max(j, k)) end
j.math_lerp = function(k, s, c)
    local N = j.math_clamp(.02, 0, 1)
    if type(k) == 'userdata' then
        r, g, b, k = k.r, k.g, k.b, k.a
        e_r, e_g, e_b, e_a = s.r, s.g, s.b, s.a
        r = j.math_lerp(r, e_r, N)
        g = j.math_lerp(g, e_g, N)
        b = j.math_lerp(b, e_b, N)
        k = j.math_lerp(k, e_a, N)
        return color(r, g, b, k)
    end
    local m = s - k
    m = m * N
    m = m + k
    if s == 0 and (m < .01 and m > -0.01) then
        m = 0
    elseif s == 1 and (m < 1.01 and m > .99) then
        m = 1
    end
    return m
end
j.vector_lerp = function(k, j, s) return k + (j - k) * s end
j.anim_new = function(k, s, c, N)
    if not j.anim_list[k] then
        j.anim_list[k] = {}
        j.anim_list[k].color = render.color(0, 0, 0, 0)
        j.anim_list[k].number = 0
        j.anim_list[k].call_frame = true
    end
    if c == nil then j.anim_list[k].call_frame = true end
    if N == nil then N = .1 end
    if type(s) == 'userdata' then
        lerp = j.math_lerp(j.anim_list[k].color, s, N)
        j.anim_list[k].color = lerp
        return lerp
    end
    lerp = j.math_lerp(j.anim_list[k].number, s, N)
    j.anim_list[k].number = lerp
    return lerp
end

local s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function c(k)
    return (k:gsub('.', function(k)
        local j, s = '', k:byte()
        for k = 8, 1, -1 do j = j .. (s % 2 ^ k - s % 2 ^ (k - 1) > 0 and '1' or '0') end
        return j
    end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(k)
        if #k < 6 then return '' end
        local j = 0
        for s = 1, 6, 1 do j = j + (k:sub(s, s) == '1' and 2 ^ (6 - s) or 0) end
        return s:sub(j + 1, j + 1)
    end) .. ({ '', '==', '=' })[#k % 3 + 1]
end
local function N(k)
    k = string.gsub(k, '[^' .. (s .. '=]'), '')
    return (k:gsub('.', function(k)
        if k == '=' then return '' end
        local j, c = '', s:find(k) - 1
        for k = 6, 1, -1 do j = j .. (c % 2 ^ k - c % 2 ^ (k - 1) > 0 and '1' or '0') end
        return j
    end)):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(k)
        if #k ~= 8 then return '' end
        local j = 0
        for s = 1, 8, 1 do j = j + (k:sub(s, s) == '1' and 2 ^ (8 - s) or 0) end
        return string.char(j)
    end)
end
local function m(k, j)
    local s = {}
    for k in string.gmatch(k, '([^' .. (j .. ']+)')) do s[#s + 1] = string.gsub(k, '\n', ' ') end
    return s
end
local function D(k)
    if k == 'true' or k == 'false' then
        return k == 'true'
    else
        return k
    end
end

local pixel = render.font_esp
local calibri11 = render.create_font("calibri.ttf", 11, render.font_flag_outline)
local calibri13 = render.create_font("calibri.ttf", 13, render.font_flag_shadow)
local verdana = render.create_font("verdana.ttf", 13, render.font_flag_outline)
local tahoma = render.create_font("tahoma.ttf", 13, render.font_flag_shadow)


local refs = {
    yawadd = Find("Rage>Anti-Aim>Angles>Yaw add");
    yawaddamount = Find("Rage>Anti-Aim>Angles>Add");
    spin = Find("Rage>Anti-Aim>Angles>Spin");
    jitter = Find("Rage>Anti-Aim>Angles>Jitter");
    spinrange = Find("Rage>Anti-Aim>Angles>Spin range");
    spinspeed = Find("Rage>Anti-Aim>Angles>Spin speed");
    jitterrandom = Find("Rage>Anti-Aim>Angles>Random");
    jitterrange = Find("Rage>Anti-Aim>Angles>Jitter Range");
    desync = Find("Rage>Anti-Aim>Desync>Fake amount");
    compAngle = Find("Rage>Anti-Aim>Desync>Compensate angle");
    freestandFake = Find("Rage>Anti-Aim>Desync>Freestand fake");
    flipJittFake = Find("Rage>Anti-Aim>Desync>Flip fake with jitter");
    leanMenu = Find("Rage>Anti-Aim>Desync>Roll lean");
    leanamount = Find("Rage>Anti-Aim>Desync>Lean amount");
    ensureLean = Find("Rage>Anti-Aim>Desync>Ensure Lean");
    flipJitterRoll = Find("Rage>Anti-Aim>Desync>Flip lean with jitter");
};

local var = {
    player_states = {"Standing", "Moving", "Slow motion", "Air", "Air Duck", "Crouch"};
};

---speed function
function get_local_speed()
    local local_player = entities.get_entity(engine.get_local_player())
    if local_player == nil then
      return
    end

    local velocity_x = local_player:get_prop("m_vecVelocity[0]")
    local velocity_y = local_player:get_prop("m_vecVelocity[1]")
    local velocity_z = local_player:get_prop("m_vecVelocity[2]")

    local velocity = math.vec3(velocity_x, velocity_y, velocity_z)
    local speed = math.ceil(velocity:length2d())
    if speed < 10 then
        return 0
    else
        return speed
    end
end

--fps stuff
function accumulate_fps()
    return math.ceil(1 / global_vars.frametime)
end
--tickrate function
function get_tickrate()
    if not engine.is_in_game() then return end

    return math.floor( 1.0 / global_vars.interval_per_tick )
end
---ping function
function get_ping()
    if not engine.is_in_game() then return end

    return math.ceil(utils.get_rtt() * 1000);
end

-- character table string
local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

-- encoding
local function enc(data)
    return ((data:gsub('.', function(x)
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

-- decoding
local function dec(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

--import and export system
local function str_to_sub(text, sep)
    local t = {}
    for str in string.gmatch(text, "([^"..sep.."]+)") do
        t[#t + 1] = string.gsub(str, "\n", " ")
    end
    return t
end

local function to_boolean(str)
    if str == "true" or str == "false" then
        return (str == "true")
    else
        return str
    end
end

local function animation(check, name, value, speed)
    if check then
        return name + (value - name) * global_vars.frametime * speed / 1.5
    else
        return name - (value + name) * global_vars.frametime * speed / 1.5

    end
end

function animate(value, cond, max, speed, dynamic, clamp)

    -- animation speed
    speed = speed * global_vars.frametime * 20

    -- static animation
    if dynamic == false then
        if cond then
            value = value + speed
        else
            value = value - speed
        end

    -- dynamic animation
    else
        if cond then
            value = value + (max - value) * (speed / 100)
        else
            value = value - (0 + value) * (speed / 100)
        end
    end

    -- clamp value
    if clamp then
        if value > max then
            value = max
        elseif value < 0 then
            value = 0
        end
    end

    return value
end



function drag(var_x, var_y, size_x, size_y)
    local mouse_x, mouse_y = input.get_cursor_pos()

    local drag = false

    if input.is_key_down(0x01) then
        if mouse_x > var_x:get_int() and mouse_y > var_y:get_int() and mouse_x < var_x:get_int() + size_x and mouse_y < var_y:get_int() + size_y then
            drag = true
        end
    else
        drag = false
    end

    if (drag) then
        var_x:set_int(mouse_x - (size_x / 2))
        var_y:set_int(mouse_y - (size_y / 2))
    end

end


engine.exec("fps_max 0")


print(" _______________________________________ ")
print("| angelwings Hard edit Loaded           |")
print("| Version: Purchase                     |")
print("| discord: https://discord.gg/qUQYueXUwt|")
print("|_______________________________________|")

local MenuSelection = Combo("[angelwings]", "lua>tab b", {"Ragebot", "Anti-Aim", "Fakelag", "Anti-Aim Helpers", "Anti-Brute", "Misc", "Visuals"})

--ragebot
local resolver_reference = gui.get_config_item("rage>aimbot>aimbot>resolver mode")
local checkbox = gui.add_checkbox("Force roll resolver", "lua>tab b")
gui.add_keybind("lua>tab b>force roll resolver")
local default = resolver_reference:get_int()
local DAMain = Checkbox("Dormant Aimbot", "lua>tab b")
local DA = AddKeybind("lua>tab b>Dormant Aimbot")
local FL0 = Checkbox("Better Hideshots", "lua>tab b")
local hstype = Combo("Hideshots Type", "lua>tab b", {"Favor firerate", "Favor fakelag", "Break lagcomp"})
local ragebotlogs = Checkbox("Ragebot logs", "lua>tab b")
local ideal_peek_enable = gui.add_checkbox("Ideal peek", "lua>tab b")
local cl_sidespeed = cvar.cl_sidespeed
local cl_forwardspeed = cvar.cl_forwardspeed
local cl_backspeed = cvar.cl_backspeed
local slowwalk_box = gui.add_checkbox("Slow Walk", "lua>tab b")
local slowwalk_slider = gui.add_slider("Speed", "lua>tab b", 1, 100, 1)
local doubletapspeedfr = gui.add_checkbox("Doubletap Speed Override", "lua>tab b")
local doubletapspeeeedfr = gui.add_slider("DT Speed", "lua>tab b", 1, 18, 1)

function doubletap_speed()
    if doubletapspeedfr:set_int(1) then
        local localplayer = EntityList.GetClientEntity(EngineClient.GetLocalPlayer())
        if not localplayer then return end

        local my_index = EntityList.GetClientEntity(EngineClient.GetLocalPlayer()):GetPlayer()
        if not my_index then return end

        local active_weapon = my_index:GetActiveWeapon()
        if not active_weapon then return end

        if EngineClient.IsConnected() and my_index:IsAlive() then
            local speed = doubletapspeeeedfr:set_int(1)
            Exploits.OverrideDoubleTapSpeed(speed)
        end
    end
end

local omgdtfr = Checkbox("DT shit omg", "lua>tab a")
gui.set_visible("lua>tab a>DT shit omg", false)


function handle_dt()
    if omgdtfr:set_int(1) then
    local me_ent = EntityList.GetClientEntity(EngineClient.GetLocalPlayer())
    if not me_ent then
        return
    end
    local me = me_ent:GetPlayer()
    if not me or not me:IsAlive() then
        return
    end
    if not EngineClient.IsConnected() then
        return
    end
    local GetNetChannelInfo = EngineClient.GetNetChannelInfo()
    local ping = GetNetChannelInfo:GetAvgLatency(0) * 1000
        if DTModes:Get() == 0 then
            activeDTMode = "DT"
            -- Ping smaller than 50
            if(ping <= 50) then
                tickbase = "17"
                Exploits.OverrideDoubleTapSpeed(17)
                CVar.FindVar("cl_clock_correction"):SetInt(0)
                CVar.FindVar("cl_clock_correction_adjustment_max_amount"):SetInt(450)
            end
            -- 50-60 ping
            if(ping >= 60 and ping < 60) then

                tickbase = "14"
                Exploits.OverrideDoubleTapSpeed(14)
                CVar.FindVar("cl_clock_correction"):SetInt(0)
                CVar.FindVar("cl_clock_correction_adjustment_max_amount"):SetInt(300)
            end
            -- Ping more than 60
            if(ping >= 60) then
                tickbase = "13"
                Exploits.OverrideDoubleTapSpeed(13)
                CVar.FindVar("cl_clock_correction"):SetInt(1)
                CVar.FindVar("cl_clock_correction_adjustment_max_amount"):SetInt(200)
            end
        end
       if DTModes:Get() == 1 then
            local me = EntityList.GetLocalPlayer()
            local health = me:GetProp("m_iHealth")
            -- Health lower than 40
            if health < 40 then
                activeDTMode = "russian dt"
                if(SafetyMode:GetInt() == 0) then
                    tickbase = "14"
                    Exploits.OverrideDoubleTapSpeed(14)
                    CVar.FindVar("cl_clock_correction"):SetInt(1)
                    CVar.FindVar("cl_clock_correction_adjustment_max_amount"):SetInt(200)
                elseif(SafetyMode:GetInt() == 1) then
                    tickbase = "17"
                    Exploits.OverrideDoubleTapSpeed(17)
                    CVar.FindVar("cl_clock_correction"):SetInt(0)
                    CVar.FindVar("cl_clock_correction_adjustment_max_amount"):SetInt(450)
                end
            end
        end
    end
end

--ax fix
local axomgomg = gui.add_checkbox("AX Prediction Fix", "lua>tab b")

--checks
local axcheck = gui.get_config_item("rage>aimbot>aimbot>anti-exploit"):get_bool()
local safepointscheck = gui.get_config_item("rage>aimbot>aimbot>force extra safety")

function axshit()
    if axomgomg:get_bool() then
    if axcheck then
        safepointscheck:set_bool(true)
    else
        safepointscheck:set_bool(false)
        end
    end
end



function set_speed( new_speed )
    if ( cl_sidespeed:get_int() == 450 and new_speed == 450 ) then
        return;
    end
     cl_sidespeed:set_float( new_speed );
     cl_forwardspeed:set_float( new_speed );
     cl_backspeed:set_float( new_speed );
end



--end of ragebot

--start of AA

local yawadd = gui.get_config_item("Rage>Anti-Aim>Angles>Add")
local jitterange = gui.get_config_item("Rage>Anti-Aim>Angles>Jitter range")
local pitch = gui.get_config_item("Rage>Anti-Aim>Angles>Pitch")

local aaim = gui.add_slider("5-Way", "lua>tab b", -50, 50, 0)
local pitch = gui.get_config_item("Rage>Anti-Aim>Angles>Pitch")
local defensivedt = gui.add_checkbox("Pitch exploit", "lua>tab b")

local aa = {
    cheker = 0,
    defensive = false,
}

function UpdateAll()
    if engine.is_in_game() == false then return end
    local localplayer = entities.get_entity(engine.get_local_player())
    local tickbase = localplayer:get_prop("m_nTickBase")
     aa.defensive = math.abs(tickbase - aa.cheker) >= 3
     aa.cheker = math.max(tickbase, aa.cheker or 0)
    if defensivedt:get_bool() then
        if aa.defensive then
            pitch:set_int(2)
        else
            pitch:set_int(1)
        end
    end
end

function AA5way()
    jitterange:set_int(aaim:get_int() * 2)
    if aaim:get_bool() then
        local clic = global_vars.tickcount % 5
        if clic == 1 then yawadd:set_int(aaim:get_int()) end
        if clic == 3 then yawadd:set_int(math.max(aaim:get_int() / 5)) end
        if clic == 4 then yawadd:set_int(math.max(aaim:get_int() / -5)) end
        if clic == 2 then yawadd:set_int(aaim:get_int() / 1) end
    end
end

ConditionalStates[0] = {
        player_state = Combo("[Conditions]", "lua>tab b", var.player_states);
}
for i=1, 6 do
        ConditionalStates[i] = {
        ---Anti-Aim
        yawadd = Checkbox("Yaw add " .. var.player_states[i], "lua>tab b");
        yawaddamount = Slider("Add " .. var.player_states[i], "lua>tab b", -180, 180, 1);
        spin = Checkbox("Spin " .. var.player_states[i], "lua>tab b");
        spinrange = Slider("Spin range " .. var.player_states[i], "lua>tab b", 0, 360, 1);
        spinspeed = Slider("Spin speed " .. var.player_states[i], "lua>tab b", 0, 360, 1);
        jitter = Checkbox("Jitter " .. var.player_states[i], "lua>tab b");
        jittertype = Combo("Jitter Type " .. var.player_states[i], "lua>tab b", {"Center", "Offset", "Random"});
        jitterrange = Slider("Jitter range " .. var.player_states[i], "lua>tab b", 0, 360, 1);
        ---Desync
        desynctype = Combo("Desync Type " .. var.player_states[i], "lua>tab b", {"Static", "Jitter", "Random"});
        desync = Slider("Desync " .. var.player_states[i], "lua>tab b", -60, 60, 1);
        compAngle = Slider("Comp " .. var.player_states[i], "lua>tab b", 0, 100, 1);
        flipJittFake = Checkbox("Flip fake " .. var.player_states[i], "lua>tab b");
        leanMenu = Combo("Roll lean " .. var.player_states[i], "lua>tab b", {"None", "Static", "Extend fake", "Invert fake", "Freestand", "Freestand Opposite", "Jitter"});
        leanamount = Slider("Lean amount " .. var.player_states[i], "lua>tab b", 0, 50, 1);
    };
end

local cImport = AddButton("Import settings", "LUA>TAB b", function() configs.import() end);
local cExport = AddButton("Export settings", "LUA>TAB b", function() configs.export() end);
local cDefault = AddButton("Load default settings", "LUA>TAB b", function() configs.importDefault() end);
local StaticFS = Checkbox("Static Freestand", "lua>tab b")
local FF = Checkbox("Fake Flick", "lua>tab b")
local FFK = AddKeybind("lua>tab b>Fake Flick")
local IV = Checkbox("Inverter", "lua>tab b")
local IVK = AddKeybind("lua>tab b>Inverter")
local antibrute1337 = Checkbox("Anti-Brute", "lua>tab b")
local antibrute228 = Slider("Phase 1", "lua>tab b", -60, 60, -60)
local antibrute229 = Slider("Phase 2", "lua>tab b", -60, 60, 60)
local antibrute230 = Slider("Phase 3", "lua>tab b", -60,60, -58)
local inverter_spam = gui.add_checkbox("Invert Spammer", "lua>tab b")
gui.add_keybind("lua>tab b>Invert Spammer")
--end of AA
--visuals and misc
local colormains = Checkbox("Color", "lua>tab b")
local colormain = CPicker("lua>tab b>Color", false)
local indicatorsmain = Combo("Indicators", "lua>tab b", {"None", "Modern","Alternative"})
local watermark, keybinds = MultiCombo("Solus UI", "lua>tab b", {"Watermark","Keybinds list"})
local clantagmain = Checkbox("Clantag", "lua>tab b")
local trashtalk = gui.add_checkbox("Killsay", "lua>tab b")
local line_nl = Checkbox("Neverlose Line", "lua>tab b")




--end of visuals and misc
--skeet ind

local tU = { { text = 'AA', path = 'lua>tab b>Skeet Indicators' }, { text = 'INVERT', path = 'lua>tab b>Inverter'}, { text = 'FD', path = 'misc>movement>fake duck' }, { text = 'DT', path = 'rage>aimbot>aimbot>double tap' },
{ text = 'HS', path = 'rage>aimbot>aimbot>hide shot' }, { text = 'DMG', path = 'rage>aimbot>ssg08>scout>override'}, { text = 'RR OFF', path = 'rage>aimbot>aimbot>resolver mode'}, { text = 'FS', path = 'rage>anti-aim>angles>freestand' }, { text = 'HEAD-ONLY', path = 'rage>aimbot>aimbot>headshot only' },
{ text = 'ROLL', path = 'rage>anti-aim>desync>ensure lean' }, { text = 'DA', path = 'rage>aimbot>aimbot>Target dormant' }, { text = 'AX', path = 'rage>aimbot>aimbot>Anti-exploit' } }

local fU = gui.add_checkbox("Skeet Indicators", "lua>tab b")
local VU = function()
    local k = entities.get_entity(engine.get_local_player())
    local j = k:get_prop('m_vecVelocity[0]')
    local s = k:get_prop('m_vecVelocity[1]')
    return math.sqrt(j * j + s * s)
end
local eU = function()
    local k = {}
    for j, s in pairs(tU) do if (gui.get_config_item(s.path)):get_bool() then table.insert(k, s.text) end end
    return k
end
local pU = math.vec3(render.get_screen_size())
local JU = function(k, j, s) return math.floor(k + (j - k) * s) end
local GU = { 0, 0, 0, 0, 0 }
local iU = render.create_font('calibrib.ttf', 23, render.font_flag_shadow)

function skeetind()
    if fU:get_bool() then
        local k = entities.get_entity(engine.get_local_player())
        if not k then return end
        add_y = 0
        if info.fatality.can_fastfire then
            GU[1] = JU(GU[1], 255, global_vars.frametime * 11)
            add_y = add_y + 7
        else
            if GU[1] > 0 then add_y = add_y + 7 end
            GU[1] = JU(GU[1], 0, global_vars.frametime * 11)
        end
        local s = j.anim_new('m_bIsScoped add dbbx2', info.fatality.can_fastfire and 1 or .01)
        local c = gui.get_config_item('rage>anti-aim>desync>lean amount')
        local N = (c:get_int() / 100) * 2
        local m = info.fatality.can_fastfire and render.color(255, 0, 233, GU[1]) or render.color(226, 54, 55, 255)
        for k, c in pairs(eU()) do
            local D = { x = 10, y = (pU.y / 2 + 98) + 35 * (k - 1) }
            local H = utils.random_int(15, 100) / 100
            local v = j.anim_new('aainverted1xq34', fU:get_bool() and utils.random_int(15, 100) / 100 or 0)
            local l = render.color(150, 200, 30)
            if c == 'AA' then
                l = render.color(85, 91, 194)
                render.circle(D.x + 50, D.y + 10, 5, render.color(0, 0, 0, 255), 3, 22, 1, 1)
                render.circle(D.x + 50, D.y + 10, 5, render.color(85, 91, 194, 255), 3, 12, H, 1)
            end
            if c == 'DT' then
                l = m
                render.circle(D.x + 44, D.y + 10, 5, render.color(0, 0, 0, 255), 3, 22, 1, 1)
                render.circle(D.x + 44, D.y + 10, 5, m, 3, 12, s, 1)
            end
            if c == 'HS' then if not info.fatality.can_onshot then l = render.color(252, 52, 211) end end
            if c == 'HS' then if not info.fatality.can_onshot then l = render.color(214, 97, 190) end end
            if c == 'ROLL' then
                l = render.color(239, 142, 255)
                render.circle(D.x + 68, D.y + 10, 5, render.color(239, 142, 255), 3, 22, 1, 1)
                render.circle(D.x + 68, D.y + 10, 5, render.color(239, 142, 255), 3, 12, N, 1)
            end
            local U = math.floor(math.abs(math.sin(global_vars.realtime) * 2) * 255)
            if c == 'FW' then l = render.color((M:get_color()).r, (M:get_color()).g, (M:get_color()).b, U) end
            local Y = math.vec3(render.get_text_size(iU, c))
            for k = 1, 10, 1 do render.rect_filled_rounded((D.x + 4) - k, D.y - k, ((D.x + Y.x) + 8) + k, ((D.y + Y.y) - 3) + k, render.color(l.r, l.g, l.b, (20 - 2 * k) * .35), 10) end
            render.text(iU, D.x + 8, D.y, c, l)
        end
    end
end

--skin color chooser
local skin_color = cvar.r_skin
local skin_colors = gui.add_combo("Skin color chooser", "lua>tab b>", {"white", "black ", "brown", "asian", "mexican", "pale"})
local skin_choice = 0

--fakelag
local fluctuateswitch = gui.add_checkbox("Fluctuate Fakelag", "lua>tab b")
local fakelaglimit = gui.get_config_item("rage>anti-aim>fakelag>limit")
local flmode = gui.get_config_item("rage>anti-aim>fakelag>mode")
local hs = gui.get_config_item("rage>aimbot>aimbot>hide shot")
local disflonhsswitch = gui.add_checkbox("Disable FL on HS", "lua>tab b")
local defaultfl = gui.add_combo("Fake Lag", "lua>tab b", {"Always on", "Adaptive"})
local fllimit = gui.add_slider("Limit", "lua>tab b", 0, 14, 7)


--updates menu elements and refs
function MenuElements()
    for i=1, 6 do
        local tab = MenuSelection:get_int()
        local state = ConditionalStates[0].player_state:get_int() + 1
        local yawAddCheck = ConditionalStates[i].yawadd:get_bool()
        local spinCheck = ConditionalStates[i].spin:get_bool()
        local jitterCheck = ConditionalStates[i].jitter:get_bool()
        local leanamountCheck = ConditionalStates[i].leanamount:get_int()
        local BH = FL0:get_bool()


        --ragebot
        gui.set_visible("lua>tab b>Dormant Aimbot", tab == 0);
        gui.set_visible("lua>tab b>Better Hideshots", tab == 0);
        gui.set_visible("lua>tab b>Hideshots Type", tab == 0 and BH);
        gui.set_visible("lua>tab b>Ragebot logs", tab == 0);
        gui.set_visible("lua>tab b>Ideal peek", tab == 0);
        gui.set_visible("lua>tab b>Force roll resolver", tab == 0);
        gui.set_visible("lua>tab b>AX Prediction Fix", tab == 0);
        gui.set_visible("lua>tab b>Doubletap Speed Override", tab == 0);
        gui.set_visible("lua>tab b>DT Speed", tab == 0);
        --antiaim
        gui.set_visible("lua>tab b>[Conditions]", tab == 1);
        gui.set_visible("lua>tab b>Yaw add " .. var.player_states[i], tab == 1 and state == i);
        gui.set_visible("lua>tab b>Add " .. var.player_states[i], tab == 1 and state == i and yawAddCheck);
        gui.set_visible("lua>tab b>Spin " .. var.player_states[i], tab == 1 and state == i);
        gui.set_visible("lua>tab b>Spin range " .. var.player_states[i], tab == 1 and state == i and spinCheck);
        gui.set_visible("lua>tab b>Spin speed " .. var.player_states[i], tab == 1 and state == i and spinCheck);
        gui.set_visible("lua>tab b>Jitter " .. var.player_states[i], tab == 1 and state == i);
        gui.set_visible("lua>tab b>Jitter Type " .. var.player_states[i], tab == 1 and state == i and jitterCheck);
        gui.set_visible("lua>tab b>Jitter range " .. var.player_states[i], tab == 1 and state == i and jitterCheck);
        --desync
        gui.set_visible("lua>tab b>Desync Type " .. var.player_states[i], tab == 1 and state == i);
        gui.set_visible("lua>tab b>Desync " .. var.player_states[i], tab == 1 and state == i);
        gui.set_visible("lua>tab b>Comp " .. var.player_states[i], tab == 1 and state == i);
        gui.set_visible("lua>tab b>Flip fake " .. var.player_states[i], tab == 1 and state == i);
        gui.set_visible("lua>tab b>Roll lean " .. var.player_states[i], tab == 1 and state == i);
        gui.set_visible("lua>tab b>Lean Amount " .. var.player_states[i], tab == 1 and state == i);
        gui.set_visible("lua>tab b>Slow walk", tab ==0)
        gui.set_visible("lua>tab b>Speed", tab == 0)
        --config system
        gui.set_visible("lua>tab b>Import settings", tab == 1);
        gui.set_visible("lua>tab b>Export settings", tab == 1);
        gui.set_visible("lua>tab b>Load default settings", tab == 1);
        --aa helpers
        gui.set_visible("lua>tab b>Static Freestand", tab == 3);
        gui.set_visible("lua>tab b>Pitch exploit", tab == 3);
        gui.set_visible("lua>tab b>Fake Flick", tab == 3);
        gui.set_visible("lua>tab b>Inverter", tab == 3);
        gui.set_visible("lua>tab b>5-Way", tab == 3);
        gui.set_visible("lua>tab b>Invert Spammer", tab == 3);
        --fakelag
        gui.set_visible("lua>tab b>Fluctuate Fakelag", tab == 2);
        gui.set_visible("lua>tab b>Fake Lag", tab == 2);
        gui.set_visible("lua>tab b>Limit", tab == 2);
        gui.set_visible("lua>tab b>Disable FL on HS", tab == 2);
        --anti-brute
        gui.set_visible("lua>tab b>Anti-Brute", tab == 4);
        gui.set_visible("lua>tab b>Phase 1", tab == 4);
        gui.set_visible("lua>tab b>Phase 2", tab == 4);
        gui.set_visible("lua>tab b>Phase 3", tab == 4);
        --misc
        gui.set_visible("lua>tab b>Killsay", tab == 5);
        gui.set_visible("lua>tab b>Show Weapon in Scope", tab == 5);
        gui.set_visible("lua>tab b>Aspect Ratio", tab == 5);
        gui.set_visible("lua>tab b>Skin color chooser", tab == 5);
        gui.set_visible("lua>tab b>Skeet Indicators", tab == 5);
        gui.set_visible("lua>tab b>Neverlose Line", tab == 5);
        --visuals tab
        gui.set_visible("lua>tab b>Color", tab == 6);
        gui.set_visible("lua>tab b>Indicators", tab == 6);
        gui.set_visible("lua>tab b>Solus UI", tab == 6);
        gui.set_visible("lua>tab b>Clantag", tab == 6);
        gui.set_visible("lua>tab b>Enabled", tab == 6);
        gui.set_visible("lua>tab b>Player Model Changer", tab == 6);

    end
end
--end of menu elements and refs
--ragebot start
local hs = gui.get_config_item("Rage>Aimbot>Aimbot>Hide shot")
local dt = gui.get_config_item("Rage>Aimbot>Aimbot>Double tap")
local limit = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")

-- cache fakelag limit
local cache = {
  backup = limit:get_int(),
  override = false,
}

function RB()

if FL0:get_bool() then
  if hstype:get_int() == 0 and not dt:get_bool() then
    if hs:get_bool() then
        limit:set_int(1)
        cache.override = true
    else
        if cache.override then
        limit:set_int(cache.backup)
        cache.override = false
        else
        cache.backup = limit:get_int()
        end
      end
    end
  end

  if FL0:get_bool() then
    if hstype:get_int() == 1 and not dt:get_bool() then
      if hs:get_bool() then
          limit:set_int(9)
          cache.override = true
      else
          if cache.override then
          limit:set_int(cache.backup)
          cache.override = false
          else
          cache.backup = limit:get_int()
          end
        end
      end
    end

if FL0:get_bool() then
    if hstype:get_int() == 2 and not dt:get_bool() then
        if hs:get_bool() then
            limit:set_int(global_vars.tickcount % 32 >= 4 and 14 or 1)
            cache.override = true
        else
            if cache.override then
            limit:set_int(cache.backup)
            cache.override = false
            else
            cache.backup = limit:get_int()
            end
        end
    end
end
end

local TargetDormant = Find("rage>aimbot>aimbot>target dormant")

local function DA()

TargetDormant:set_bool(DAMain:get_bool())
    local local_player = entities.get_entity(engine.get_local_player())
    if not engine.is_in_game() or not local_player:is_valid() or not DAMain:get_bool() then
        return
    end
end
--ragebot end
--start of getting AA states and setting valeus

function UpdateStateandAA()

    local isSW = info.fatality.in_slowwalk
    local local_player = entities.get_entity(engine.get_local_player())
    local inAir = local_player:get_prop("m_hGroundEntity") == -1
    local vel_x = math.floor(local_player:get_prop("m_vecVelocity[0]"))
    local vel_y = math.floor(local_player:get_prop("m_vecVelocity[1]"))
    local still = math.sqrt(vel_x ^ 2 + vel_y ^ 2) < 5
    local cupic = bit.band(local_player:get_prop("m_fFlags"),bit.lshift(2, 0)) ~= 0
    local flag = local_player:get_prop("m_fFlags")

    playerstate = 0

    if inAir and cupic then
        playerstate = 5
    else
        if inAir then
            playerstate = 4
        else
            if isSW then
                playerstate = 3
            else
                if cupic then
                    playerstate = 6
                else
                    if still and not cupic then
                        playerstate = 1
                    elseif not still then
                        playerstate = 2
                    end
                end
            end
        end
    end

    refs.yawadd:set_bool(ConditionalStates[playerstate].yawadd:get_bool());
    if ConditionalStates[playerstate].jittertype:get_int() == 1 then
        refs.yawaddamount:set_int((ConditionalStates[playerstate].yawaddamount:get_int()) + (global_vars.tickcount % 4 >= 2 and 0 or ConditionalStates[playerstate].jitterrange:get_int()))
    else
        refs.yawaddamount:set_int(ConditionalStates[playerstate].yawaddamount:get_int());
    end
    refs.spin:set_bool(ConditionalStates[playerstate].spin:get_bool());
    refs.jitter:set_bool(ConditionalStates[playerstate].jitter:get_bool());
    refs.spinrange:set_int(ConditionalStates[playerstate].spinrange:get_int());
    refs.spinspeed:set_int(ConditionalStates[playerstate].spinspeed:get_int());
    refs.jitterrandom:set_bool(ConditionalStates[playerstate].jittertype:get_int() == 2);
    --jitter types
    if ConditionalStates[playerstate].jittertype:get_int() == 0 or ConditionalStates[playerstate].jittertype:get_int() == 2 then
            refs.jitterrange:set_int(ConditionalStates[playerstate].jitterrange:get_int());
        else
            refs.jitterrange:set_int(0);
        end
    --desync
    if ConditionalStates[playerstate].desync:get_int() == 60 and ConditionalStates[playerstate].desynctype:get_int() == 0 then
        refs.desync:set_int((ConditionalStates[playerstate].desync:get_int() * 1.666666667) - 2);
        else if ConditionalStates[playerstate].desync:get_int() == -60 and ConditionalStates[playerstate].desynctype:get_int() == 0 then
            refs.desync:set_int((ConditionalStates[playerstate].desync:get_int() * 1.666666667) + 2);
              else if ConditionalStates[playerstate].desynctype:get_int() == 0 then
                refs.desync:set_int(ConditionalStates[playerstate].desync:get_int() * 1.666666667);
                    else if ConditionalStates[playerstate].desynctype:get_int() == 1 and 0 >= ConditionalStates[playerstate].desync:get_int() then
                        refs.desync:set_int(global_vars.tickcount % 4 >= 2 and -18 * 1.666666667 or ConditionalStates[playerstate].desync:get_int() * 1.666666667 + 2);
                            else if ConditionalStates[playerstate].desynctype:get_int() == 1 and ConditionalStates[playerstate].desync:get_int() >= 0 then
                                refs.desync:set_int(global_vars.tickcount % 4 >= 2 and 18 * 1.666666667 or ConditionalStates[playerstate].desync:get_int() * 1.666666667 - 2);
                                    else if ConditionalStates[playerstate].desynctype:get_int() == 2 and ConditionalStates[playerstate].desync:get_int() >= 0 then
                                        refs.desync:set_int(utils.random_int(0, ConditionalStates[playerstate].desync:get_int() * 1.666666667));
                                            else if ConditionalStates[playerstate].desynctype:get_int() == 2 and ConditionalStates[playerstate].desync:get_int() <= 0 then
                                                refs.desync:set_int(utils.random_int(ConditionalStates[playerstate].desync:get_int() * 1.666666667, 0));
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
    refs.compAngle:set_int(ConditionalStates[playerstate].compAngle:get_int());
    refs.flipJittFake:set_bool(ConditionalStates[playerstate].flipJittFake:get_bool());
    refs.leanMenu:set_int(ConditionalStates[playerstate].leanMenu:get_int());
    refs.leanamount:set_int(ConditionalStates[playerstate].leanamount:get_int());
end
--end of getting AA states and setting valeus
--start of static freestand
local AAfreestand = Find("Rage>Anti-Aim>Angles>Freestand")
local add = Find("Rage>Anti-Aim>Angles>Add")
local jitter = Find("Rage>Anti-Aim>Angles>Jitter Range")
local attargets = Find("Rage>Anti-Aim>Angles>At fov target")
local flipfake = Find("Rage>Anti-Aim>Desync>Flip fake with jitter")
local compfreestand = Find("Rage>Anti-Aim>Desync>Compensate Angle")
local fakefreestand = Find("Rage>Anti-Aim>Desync>Fake Amount")
local freestandfake  = Find("Rage>Anti-Aim>Desync>Freestand Fake")
local add_backup = add:get_int()
local jitter_backup = jitter:get_int()
local attargets_backup = attargets:get_bool()
local flipfake_backup = flipfake:get_bool()
local compfreestand_backup = compfreestand:get_int()
local fakefreestand_backup = fakefreestand:get_int()
local freestandfake_backup = freestandfake:get_int()
local restore_aa = false

local function StaticFreestand()
    if AAfreestand:get_bool() and StaticFS:get_bool() then
        add:set_int(0)
        jitter:set_int(0)
        flipfake:set_bool(false)
        compfreestand:set_int(0)
        freestandfake:set_int(0)
        restore_aa = true
    else
        if (restore_aa == true) then
            add:set_int(add_backup)
            jitter:set_int(jitter_backup)
            attargets:set_bool(attargets_backup)
            flipfake:set_bool(flipfake_backup)
            compfreestand:set_int(compfreestand_backup)
            freestandfake:set_int(freestandfake_backup)
            restore_aa = false
        else
            add_backup = add:get_int()
            jitter_backup = jitter:get_int()
            attargets_backup = attargets:get_bool()
            flipfake_backup = flipfake:get_bool()
            compfreestand_backup = compfreestand:get_int()
            freestandfake_backup = freestandfake:get_int()
        end
    end
end
--end of static freestand
local add = Find("Rage>Anti-Aim>Angles>Add")
local fakeangle = Find("Rage>Anti-Aim>Desync>Fake Amount")
local fakeamount = fakeangle:get_int() >= 0

local function fakeflick()
    if FF:get_bool() then
        if global_vars.tickcount % 19 == 13 and fakeangle:get_int() >= 0 then
            add:set_int(92)
        else
            if global_vars.tickcount % 19 == 13 and 0 >= fakeangle:get_int() then
                add:set_int(-92)
            end
        end
    end
end
--end of fakeflick

local fakeangle = Find("Rage>Anti-Aim>Desync>Fake Amount")
local function InvertDesync()
    if IV:get_bool() then
        fakeangle:set_int(fakeangle:get_int() * -1)
    end
end

--end of inverter
--aa end
--start of killsay

local first = {
    "бля, братишка, ПОШЁЛ НАХУЙ ",
    "чел тебе далеко до моего пениса",
    "даже в дубае признали мой член лучшим для мастурбации",
    "мой член в переводе значит твоя смерть",
    "если хочешь что-то на фаталити, то втопи ебло и покупай мой пенис ",
    "бля братан твой рот бустит",
    "ты так долго искал мой хуец, что моя мать успела родить мне сестру",
    "бля чувак что ты делаешь? купи себе мать.lua и летай как я",
    "знаешь когда мы тебя выкидовали из дома, мы не подозривал что ты не сможешь взлететь",
    "знаешь в чём счастье, брат? в angelwings, брат.",
    "знаешь чем мы отличаемся? тем что я летаю как комета, а ты упал в начале",
    "от твоей спины я захоетл улететь. купи себе мать чтобы я этого больше не видел",
    "что ты выбирешь? мой член за 66 рублей, или нл за 1000 рублей?",
    "можешь не писать мне в личку, там уже сидит мой провайдер бот член луа",
    "не знаешь куда идти? иди в ангелы и взлетай",
    "что делать после 18? всё просто купи себе мамку и ты узнаешь что такое счастье!",
    "даже мамонты доверяли мне они знали, что комета упадёт на них",
    "гнев бога осуществляется через мой хуй",
    "чел это wings технологии ",
    "I can't sleep if you cry",
    "ты лучше, чем хохол, но не лучше чем я",
    "знаешь, а я хотел дать тебе шанс... но ты подвёл меня.",
    "angelwings.exe activated",
    "знаешь, чем качественнее ты управляешь жизнью, тем лучше ты станешь в angelwings",
    "1 хохол",
    "они говорят 1, потому что знает что их у тебя нет",
    "забустит бабка на базаре, а подкачнёт только мой член",
    "why you sleep dog???",
    "возьми мой хуй и ты увидешь свою любовь",
    "гхгхгхгх ты тоже можешь дать мне в рот, если купишь себе мамку",
    "твоя мать стоит ∞$, потому что она опробовала мой хуй",
    "твоё местопроживание киев? иба как ты упал?",
    "я живу в раю, потому что купил себе собачку как тебя",
    "до этого я говорил тебе что ты лох, но ты опустился ниже... просто купи себе отца",
    "0 iq ебание твоей мамы busted",
    "ты до этого из деревни вышел? иба где твой член",
    "не вывез без мамы",
    "в москве выбрали меня, а ты что выберишь?",
    "кто-то говорит я слабый, но когда я обрёл ангельские крылья я начал сиять",
    "idi naxuy(activated)",
}


function on_player_death(event)
    if trashtalk:get_bool() then
    local lp = engine.get_local_player();
    local attacker = engine.get_player_for_user_id(event:get_int('attacker'));
    local userid = engine.get_player_for_user_id(event:get_int('userid'));
    local userInfo = engine.get_player_info(userid);
        if attacker == lp and userid ~= lp then
            engine.exec("say " .. first[utils.random_int(1, #first)] .. "")
        end
    else
    end
end



local function WM()

    if player == nil then return end
    if watermark:get_bool() then
    local latency  = math.floor((utils.get_rtt() or 0)*1000)
    local Time = utils.get_time()
    local realtime = string.format("%02d:%02d:%02d", Time.hour, Time.min, Time.sec)
    local watermarkText = ' angelwings / tipo4ek / ' .. realtime .. ' time / Delay: ' .. latency .. 'ms';

        w, h = render.get_text_size(verdana, watermarkText);
        local watermarkWidth = w;
        x, y = render.get_screen_size();
        x, y = x - watermarkWidth - 5, y * 0.010;

        render.rect_filled_rounded(x - 4, y - 3, x + watermarkWidth + 2, y + h + 2.5, colormain:get_color(), 6, render.all);
        render.rect_filled_rounded(x - 2, y - 1, x + watermarkWidth, y + h , render.color(24, 24, 26, 255), 4, render.all);
        render.text(verdana, x - 2.5, y - 1.2, watermarkText, render.color(221, 9, 255));
    end
end

local screen_size = {render.get_screen_size()}
local keybindsx = Slider("keybindsx", "lua>tab a", 0, screen_size[1], 1)
local keybindsy = Slider("keybindsy", "lua>tab a", 0, screen_size[2], 1)
gui.set_visible("lua>tab a>keybindsx", false)
gui.set_visible("lua>tab a>keybindsy", false)

local function KB()

if keybinds:get_bool() then

local lp = entities.get_entity(engine.get_local_player())
if not lp then return end
if not lp:is_alive() then return end

if not engine.is_in_game() then return end

    local pos = {keybindsx:get_int(), keybindsy:get_int()}

    local size_offset = 0

    local binds =
    {
        Find("lua>tab b>Dormant Aimbot"):get_bool(),
        Find("rage>aimbot>aimbot>double tap"):get_bool(),
        Find("rage>aimbot>aimbot>hide shot"):get_bool(),
        Find("rage>aimbot>ssg08>scout>override"):get_bool(), -- override dmg is taken from the scout
        Find("rage>aimbot>aimbot>force extra safety"):get_bool(),
        Find("rage>aimbot>aimbot>headshot only"):get_bool(),
        Find("misc>movement>fake duck"):get_bool(),
        Find("rage>anti-aim>angles>freestand"):get_bool(),
        Find("lua>tab b>Fake Flick"):get_bool(),
        Find("lua>tab b>Inverter"):get_bool(),
    }

    local binds_name =
    {
        "Dormant Aimbot",
        "Double tap",
        "On Shot anti-aim",
        "Damage override",
        "Force extra safety",
        "Headshot only",
        "Duck peek assist",
        "Freestanding",
        "Fake flick",
        "Inverter"
    }


    size_offset = 80

    animated_size_offset = animate(animated_size_offset or 0, true, size_offset, 60, true, false)

    local size = {75 + animated_size_offset, 22}

    local enabled = "[active]"
    local text_size = render.get_text_size(tahoma, enabled) + 7

    local override_active = binds[1] or binds[2] or binds[3] or binds[4] or binds[5] or binds[6] or binds[7] or binds[8] or binds[9] or binds[10] or binds[11] or binds[12]

    drag(keybindsx, keybindsy, size[1] + 15, size[2] + 15)

    -- top rect
    render.push_clip_rect(pos[1], pos[2], pos[1] + size[1], pos[2] + 22)
    render.rect_filled_rounded(pos[1], pos[2], pos[1] + size[1], pos[2] + size[2], render.color(colormain:get_color().r,colormain:get_color().g,colormain:get_color().b, 255), 8)
    render.pop_clip_rect()

    -- bot rect
    render.push_clip_rect(pos[1], pos[2] + 17, pos[1] + size[1], pos[2] + 22)
    render.rect_filled_rounded(pos[1], pos[2], pos[1] + size[1], pos[2] + 22, render.color(colormain:get_color().r,colormain:get_color().g,colormain:get_color().b, 255), 8)
    render.pop_clip_rect()

    -- other
    render.rect_filled_rounded(pos[1] + 2, pos[2] + 2, pos[1] + size[1] - 2, pos[2] + 20, render.color(24, 24, 26, 255), 6)
    render.text(calibri13, pos[1] + size[1] / 2 - render.get_text_size(tahoma, "keybinds") / 2 - 1, pos[2] + 4, "keybinds", render.color(255, 255, 255, 255))


    local bind_offset = 0

    if binds[1] then
    render.text(tahoma, pos[1] + 6, pos[2] + size[2] + 2, binds_name[1], render.color(255, 255, 255, 255))
    render.text(tahoma, pos[1] + size[1] - text_size, pos[2] + size[2] + 2, enabled, render.color(255, 255, 255, 255))
    bind_offset = bind_offset + 15
    end

    if binds[2] then
    render.text(tahoma, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[2], render.color(255, 255, 255, 255))
    render.text(tahoma, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255))
    bind_offset = bind_offset + 15
    end

    if binds[3] then
    render.text(tahoma, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[3], render.color(255, 255, 255, 255))
    render.text(tahoma, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255))
    bind_offset = bind_offset + 15
    end

    if binds[4] then
    render.text(tahoma, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[4], render.color(255, 255, 255, 255))
    render.text(tahoma, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255))
    bind_offset = bind_offset + 15
    end

    if binds[5] then
    render.text(tahoma, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[5], render.color(255, 255, 255, 255))
    render.text(tahoma, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255))
    bind_offset = bind_offset + 15
    end

    if binds[6] then
    render.text(tahoma, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[6], render.color(255, 255, 255, 255))
    render.text(tahoma, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255))
    bind_offset = bind_offset + 15
    end

    if binds[7] then
    render.text(tahoma, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[7], render.color(255, 255, 255, 255))
    render.text(tahoma, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255))
    bind_offset = bind_offset + 15
    end

    if binds[8] then
    render.text(tahoma, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[8], render.color(255, 255, 255, 255))
    render.text(tahoma, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255))
    bind_offset = bind_offset + 15
    end

    if binds[9] then
    render.text(tahoma, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[9], render.color(255, 255, 255, 255))
    render.text(tahoma, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255))
    bind_offset = bind_offset + 15
    end

    if binds[10] then
    render.text(tahoma, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[10], render.color(255, 255, 255, 255))
    render.text(tahoma, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255))
    bind_offset = bind_offset + 15
    end
end
end




--indicators and arrows start
local offset_scope = 0

function ID()

local lp = entities.get_entity(engine.get_local_player())
if not lp then return end
if not lp:is_alive() then return end
local scoped = lp:get_prop("m_bIsScoped")
offset_scope = animation(scoped, offset_scope, 25, 10)

local function Clamp(Value, Min, Max)
    return Value < Min and Min or (Value > Max and Max or Value)
end

if indicatorsmain:get_int() == 1 then

    local alpha2 = math.floor(math.abs(math.sin(global_vars.realtime) * 2) * 255)
    local lp = entities.get_entity(engine.get_local_player())
    if not lp then return end
    if not lp:is_alive() then return end
    local screen_width, screen_height = render.get_screen_size( )
    local x = screen_width / 2
    local y = screen_height / 2
    local ay = 0

    local RAGE = Find("rage>aimbot>aimbot>aimbot"):get_bool()
    local is_dt = Find("rage>aimbot>aimbot>double tap"):get_bool()
    local is_hs = Find("rage>aimbot>aimbot>hide shot"):get_bool()
    local DMG = Find("rage>aimbot>ssg08>scout>override"):get_bool()
    local SP = Find("rage>aimbot>aimbot>force extra safety"):get_bool()
    local FS = Find("rage>anti-aim>angles>freestand"):get_bool()
--main text
    local text =  "angelwings"
    local text2 = "LIVE"
    local text3 = "DT"
    local text4 = "DMG"
    local text5 = "FS"
    local text6 = "SP"
    local text7 = "OS"

    local textx, texty = render.get_text_size(pixel, text)
    local text2x, text2y = render.get_text_size(pixel, text2)
    local text3x, text3y = render.get_text_size(pixel, text3)
    local text4x, text4y = render.get_text_size(pixel, text4)
    local text5x, text5y = render.get_text_size(pixel, text5)
    local text6x, text6y = render.get_text_size(pixel, text6)
    local text7x, text7y = render.get_text_size(pixel, text7)
--StateIndicator
    local StateIndicator = "STANDING"
    local StateIndicator1 = "RUNNING"
    local StateIndicator2 = "WALKING"
    local StateIndicator3 = "IN-AIR"
    local StateIndicator4 = "IN-AIR+"
    local StateIndicator5 = "DUCKING"

    local StateIndicatorx, StateIndicatory = render.get_text_size(pixel, StateIndicator)
    local StateIndicator1x, StateIndicator1y = render.get_text_size(pixel, StateIndicator1)
    local StateIndicator2x, StateIndicator2y = render.get_text_size(pixel, StateIndicator2)
    local StateIndicator3x, StateIndicator3y = render.get_text_size(pixel, StateIndicator3)
    local StateIndicator4x, StateIndicator4y = render.get_text_size(pixel, StateIndicator4)
    local StateIndicator5x, StateIndicator5y = render.get_text_size(pixel, StateIndicator5)

        render.text(pixel, x+offset_scope, y + 6, text, render.color(255,255, 255, 255))
        render.text(pixel, x+offset_scope + 33, y + 6, text2, render.color(colormain:get_color().r, colormain:get_color().g, colormain:get_color().b, alpha2))

    if playerstate == 1 and not scoped then
        render.text(pixel, x+offset_scope + 7, y + 16, StateIndicator, colormain:get_color())
    else
        if playerstate == 2 and not scoped then
            render.text(pixel, x+offset_scope + 8, y + 16, StateIndicator1, colormain:get_color())
        else
            if playerstate == 3 and not scoped then
                render.text(pixel, x+offset_scope + 7, y + 16, StateIndicator2, colormain:get_color())
            else
                if playerstate == 4 and not scoped then
                    render.text(pixel, x+offset_scope + 14, y + 16, StateIndicator3, colormain:get_color())
                else
                    if playerstate == 5 and not scoped then
                        render.text(pixel, x+offset_scope + 12, y + 16, StateIndicator4, colormain:get_color())
                    else
                        if playerstate == 6 and not scoped then
                            render.text(pixel, x+offset_scope + 8, y + 16, StateIndicator5, colormain:get_color())
                        else
                            if playerstate == 1 and scoped then
                                render.text(pixel, x+offset_scope, y + 16, StateIndicator, colormain:get_color())
                            else
                                if playerstate == 2 and scoped then
                                    render.text(pixel, x+offset_scope, y + 16, StateIndicator1, colormain:get_color())
                                else
                                    if playerstate == 3 and scoped then
                                        render.text(pixel, x+offset_scope, y + 16, StateIndicator2, colormain:get_color())
                                    else
                                        if playerstate == 4 and scoped then
                                            render.text(pixel, x+offset_scope, y + 16, StateIndicator3, colormain:get_color())
                                        else
                                            if playerstate == 5 and scoped then
                                                render.text(pixel, x+offset_scope, y + 16, StateIndicator4, colormain:get_color())
                                            else
                                                if playerstate == 6 and scoped then
                                                    render.text(pixel, x+offset_scope, y + 16, StateIndicator5, colormain:get_color())
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    if is_dt and info.fatality.can_fastfire and not scoped then
        render.text(pixel, x+offset_scope + 22, y + 26+ay, text3, render.color(75, 255, 75, 255))
        ay = ay + 10
    else if is_dt and not info.fatality.can_fastfire and not scoped then
            render.text(pixel, x+offset_scope + 22, y + 26+ay, text3, render.color(255, 0, 0, 185))
            ay = ay + 10
    else if is_dt and info.fatality.can_fastfire and scoped then
        render.text(pixel, x+offset_scope, y + 26+ay, text3, render.color(75, 255, 75, 255))
        ay = ay + 10
    else
        if is_dt and not info.fatality.can_fastfire and scoped then
            render.text(pixel, x+offset_scope, y + 26+ay, text3, render.color(255, 0, 0, 185))
            ay = ay + 10
        end
        end
    end
end

    if is_hs then
            render.text(pixel, x+offset_scope + 18, y + 26+ay, text7, render.color(255,255, 255, 255))
        else
            render.text(pixel, x+offset_scope + 18, y + 26+ay, text7, render.color(255,255, 255, 128))
        end

    if DMG then
            render.text(pixel, x+offset_scope, y + 26+ay, text4, render.color(255,255, 255, 255))
        else
            render.text(pixel, x+offset_scope, y + 26+ay, text4, render.color(255,255, 255, 128))
        end

    if FS then
            render.text(pixel, x+offset_scope + 30, y + 26+ay, text5, render.color(255,255, 255, 255))
        else
            render.text(pixel, x+offset_scope + 30, y + 26+ay, text5, render.color(255,255, 255, 128))
        end

    if SP then
            render.text(pixel, x+offset_scope + 42, y + 26+ay, text6, render.color(255,255, 255, 255))
        else
            render.text(pixel, x+offset_scope + 42, y + 26+ay, text6, render.color(255,255, 255, 128))
        end
    end

if indicatorsmain:get_int() == 2 then

    local alpha2 = math.floor(math.abs(math.sin(global_vars.realtime) * 2) * 255)
    local lp = entities.get_entity(engine.get_local_player())
    if not lp then return end
    if not lp:is_alive() then return end
    local local_player = entities.get_entity(engine.get_local_player())
    local ay = 0
    local desync_percentage = Clamp(math.abs(local_player:get_prop("m_flPoseParameter", 11) * 120 - 60.5), 0.5 / 60, 60) / 56
    local w, h = 35, 3
    local screen_width, screen_height = render.get_screen_size( )
    local x = screen_width / 2
    local y = screen_height / 2
    local color1 = render.color(colormain:get_color().r, colormain:get_color().g, colormain:get_color().b, 255)
    local color2 = render.color(colormain:get_color().r - 70, colormain:get_color().g - 90, colormain:get_color().b - 70, 185)

    local text =  "angelwings"
    local textx, texty = render.get_text_size(pixel, text)

    render.text(calibri11, x+offset_scope + 5, y + 6, text, render.color(colormain:get_color().r, colormain:get_color().g, colormain:get_color().b, 255))

    render.rect_filled(x + 4 +offset_scope, y + 17, x+offset_scope + w + 5, y + 18 + h + 1, render.color("#000000"))
    render.rect_filled_multicolor(x+offset_scope + 5, y + 18, x+offset_scope + 2 + w * desync_percentage, y + 18 + h, color1, color2, color2, color1)

end
end
--indicators and arrows end

--syncing clantag
local old_time = 0;
local animation = {

    " a ",
    " an ",
    " ang",
    " ange ",
    " angel  ",
    " angelw  ",
    " angelwi    ",
    " angelwin    ",
    " angelwing  ",
    " angelwings   ",
    " not found    ",
    " angelwings   ",
    " not found  ",
    " angelwings ",
    " angelwing ",
    " angelwin ",
    " angelwi ",
    " angelw ",
    " angel ",
    " ange ",
    " ang ",
    " an ",
    " a ",

}

--clantag menu element
local function CT()
    if clantagmain:get_bool() then
        local defaultct = Find("misc>various>clan tag")
        local realtime = math.floor((global_vars.realtime) * 4)
        if old_time ~= realtime then
            utils.set_clan_tag(animation[realtime % #animation+1]);
        old_time = realtime;
        defaultct:set_bool(false);
        end
    end
end
--clantag end
--ragebot logs
local function main(shot)
if shot.manual then return end
    local hitgroup_names = {"generic", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "?", "gear"}
    local p = entities.get_entity(shot.target)
    local n = p:get_player_info()
    local hitgroup = shot.server_hitgroup
    local clienthitgroup = shot.client_hitgroup
    local health = p:get_prop("m_iHealth")

        if ragebotlogs:get_bool() then
            if shot.server_damage > 0 then
                print( "[angelwings] Hurt " , n.name  , "'s ", hitgroup_names[hitgroup + 1]," for " , shot.server_damage, " damage [hc=", math.floor(shot.hitchance), ", bt=", math.floor(shot.backtrack),"]")
            else
                print( "[angelwings] Missed " , n.name  , "'s ", hitgroup_names[shot.client_hitgroup + 1]," due to ", shot.result)
            end
        end

end
--ragebot logs end

--import and export system
configs.import = function(input)
    local protected = function()
        local clipboardP = input == nil and dec(clipboard.get()) or input
        local tbl = str_to_sub(clipboardP, "|")
        ConditionalStates[1].yawadd:set_bool(to_boolean(tbl[1]))
        ConditionalStates[1].yawaddamount:set_int(tonumber(tbl[2]))
        ConditionalStates[1].spin:set_bool(to_boolean(tbl[3]))
        ConditionalStates[1].spinrange:set_int(tonumber(tbl[4]))
        ConditionalStates[1].spinspeed:set_int(tonumber(tbl[5]))
        ConditionalStates[1].jitter:set_bool(to_boolean(tbl[6]))
        ConditionalStates[1].jittertype:set_int(tonumber(tbl[7]))
        ConditionalStates[1].jitterrange:set_int(tonumber(tbl[8]))
        ConditionalStates[1].desynctype:set_int(tonumber(tbl[9]))
        ConditionalStates[1].desync:set_int(tonumber(tbl[10]))
        ConditionalStates[1].compAngle:set_int(tonumber(tbl[11]))
        ConditionalStates[1].flipJittFake:set_bool(to_boolean(tbl[12]))
        ConditionalStates[1].leanMenu:set_int(tonumber(tbl[13]))
        ConditionalStates[1].leanamount:set_int(tonumber(tbl[14]))
        ConditionalStates[2].yawadd:set_bool(to_boolean(tbl[15]))
        ConditionalStates[2].yawaddamount:set_int(tonumber(tbl[16]))
        ConditionalStates[2].spin:set_bool(to_boolean(tbl[17]))
        ConditionalStates[2].spinrange:set_int(tonumber(tbl[18]))
        ConditionalStates[2].spinspeed:set_int(tonumber(tbl[19]))
        ConditionalStates[2].jitter:set_bool(to_boolean(tbl[20]))
        ConditionalStates[2].jittertype:set_int(tonumber(tbl[21]))
        ConditionalStates[2].jitterrange:set_int(tonumber(tbl[22]))
        ConditionalStates[2].desynctype:set_int(tonumber(tbl[23]))
        ConditionalStates[2].desync:set_int(tonumber(tbl[24]))
        ConditionalStates[2].compAngle:set_int(tonumber(tbl[25]))
        ConditionalStates[2].flipJittFake:set_bool(to_boolean(tbl[26]))
        ConditionalStates[2].leanMenu:set_int(tonumber(tbl[27]))
        ConditionalStates[2].leanamount:set_int(tonumber(tbl[28]))
        ConditionalStates[3].yawadd:set_bool(to_boolean(tbl[29]))
        ConditionalStates[3].yawaddamount:set_int(tonumber(tbl[30]))
        ConditionalStates[3].spin:set_bool(to_boolean(tbl[31]))
        ConditionalStates[3].spinrange:set_int(tonumber(tbl[32]))
        ConditionalStates[3].spinspeed:set_int(tonumber(tbl[33]))
        ConditionalStates[3].jitter:set_bool(to_boolean(tbl[34]))
        ConditionalStates[3].jittertype:set_int(tonumber(tbl[35]))
        ConditionalStates[3].jitterrange:set_int(tonumber(tbl[36]))
        ConditionalStates[3].desynctype:set_int(tonumber(tbl[37]))
        ConditionalStates[3].desync:set_int(tonumber(tbl[38]))
        ConditionalStates[3].compAngle:set_int(tonumber(tbl[39]))
        ConditionalStates[3].flipJittFake:set_bool(to_boolean(tbl[40]))
        ConditionalStates[3].leanMenu:set_int(tonumber(tbl[41]))
        ConditionalStates[3].leanamount:set_int(tonumber(tbl[42]))
        ConditionalStates[4].yawadd:set_bool(to_boolean(tbl[43]))
        ConditionalStates[4].yawaddamount:set_int(tonumber(tbl[44]))
        ConditionalStates[4].spin:set_bool(to_boolean(tbl[45]))
        ConditionalStates[4].spinrange:set_int(tonumber(tbl[46]))
        ConditionalStates[4].spinspeed:set_int(tonumber(tbl[47]))
        ConditionalStates[4].jitter:set_bool(to_boolean(tbl[48]))
        ConditionalStates[4].jittertype:set_int(tonumber(tbl[49]))
        ConditionalStates[4].jitterrange:set_int(tonumber(tbl[50]))
        ConditionalStates[4].desync:set_int(tonumber(tbl[51]))
        ConditionalStates[4].desynctype:set_int(tonumber(tbl[52]))
        ConditionalStates[4].compAngle:set_int(tonumber(tb4l[53]))
        ConditionalStates[4].flipJittFake:set_bool(to_boolean(tbl[54]))
        ConditionalStates[4].leanMenu:set_int(tonumber(tbl[55]))
        ConditionalStates[4].leanamount:set_int(tonumber(tbl[56]))
        ConditionalStates[5].yawadd:set_bool(to_boolean(tbl[57]))
        ConditionalStates[5].yawaddamount:set_int(tonumber(tbl[58]))
        ConditionalStates[5].spin:set_bool(to_boolean(tbl[59]))
        ConditionalStates[5].spinrange:set_int(tonumber(tbl[60]))
        ConditionalStates[5].spinspeed:set_int(tonumber(tbl[61]))
        ConditionalStates[5].jitter:set_bool(to_boolean(tbl[62]))
        ConditionalStates[5].jittertype:set_int(tonumber(tbl[63]))
        ConditionalStates[5].jitterrange:set_int(tonumber(tbl[64]))
        ConditionalStates[5].desynctype:set_int(tonumber(tbl[65]))
        ConditionalStates[5].desync:set_int(tonumber(tbl[66]))
        ConditionalStates[5].compAngle:set_int(tonumber(tbl[67]))
        ConditionalStates[5].flipJittFake:set_bool(to_boolean(tbl[68]))
        ConditionalStates[5].leanMenu:set_int(tonumber(tbl[69]))
        ConditionalStates[5].leanamount:set_int(tonumber(tbl[70]))
        ConditionalStates[6].yawadd:set_bool(to_boolean(tbl[71]))
        ConditionalStates[6].yawaddamount:set_int(tonumber(tbl[72]))
        ConditionalStates[6].spin:set_bool(to_boolean(tbl[73]))
        ConditionalStates[6].spinrange:set_int(tonumber(tbl[74]))
        ConditionalStates[6].spinspeed:set_int(tonumber(tbl[75]))
        ConditionalStates[6].jitter:set_bool(to_boolean(tbl[76]))
        ConditionalStates[6].jittertype:set_int(tonumber(tbl[77]))
        ConditionalStates[6].jitterrange:set_int(tonumber(tbl[78]))
        ConditionalStates[6].desynctype:set_int(tonumber(tbl[79]))
        ConditionalStates[6].desync:set_int(tonumber(tbl[80]))
        ConditionalStates[6].compAngle:set_int(tonumber(tbl[81]))
        ConditionalStates[6].flipJittFake:set_bool(to_boolean(tbl[82]))
        ConditionalStates[6].leanMenu:set_int(tonumber(tbl[83]))
        ConditionalStates[6].leanamount:set_int(tonumber(tbl[84]))


        print("Config loaded")

    end
    local status, message = pcall(protected)
    if not status then
        print("Failed to load config")
        return
    end
end


configs.export = function()
    local str = {
        tostring(ConditionalStates[1].yawadd:get_bool()) .. "|",
        tostring(ConditionalStates[1].yawaddamount:get_int()) .. "|",
        tostring(ConditionalStates[1].spin:get_bool()) .. "|",
        tostring(ConditionalStates[1].spinrange:get_int()) .. "|",
        tostring(ConditionalStates[1].spinspeed:get_int()) .. "|",
        tostring(ConditionalStates[1].jitter:get_bool()) .. "|",
        tostring(ConditionalStates[1].jittertype:get_int()) .. "|",
        tostring(ConditionalStates[1].jitterrange:get_int()) .. "|",
        tostring(ConditionalStates[1].desynctype:get_int()) .. "|",
        tostring(ConditionalStates[1].desync:get_int()) .. "|",
        tostring(ConditionalStates[1].compAngle:get_int()) .. "|",
        tostring(ConditionalStates[1].flipJittFake:get_bool()) .. "|",
        tostring(ConditionalStates[1].leanMenu:get_int()) .. "|",
        tostring(ConditionalStates[1].leanamount:get_int()) .. "|",
        tostring(ConditionalStates[2].yawadd:get_bool()) .. "|",
        tostring(ConditionalStates[2].yawaddamount:get_int()) .. "|",
        tostring(ConditionalStates[2].spin:get_bool()) .. "|",
        tostring(ConditionalStates[2].spinrange:get_int()) .. "|",
        tostring(ConditionalStates[2].spinspeed:get_int()) .. "|",
        tostring(ConditionalStates[2].jitter:get_bool()) .. "|",
        tostring(ConditionalStates[2].jittertype:get_int()) .. "|",
        tostring(ConditionalStates[2].jitterrange:get_int()) .. "|",
        tostring(ConditionalStates[2].desynctype:get_int()) .. "|",
        tostring(ConditionalStates[2].desync:get_int()) .. "|",
        tostring(ConditionalStates[2].compAngle:get_int()) .. "|",
        tostring(ConditionalStates[2].flipJittFake:get_bool()) .. "|",
        tostring(ConditionalStates[2].leanMenu:get_int()) .. "|",
        tostring(ConditionalStates[2].leanamount:get_int()) .. "|",
        tostring(ConditionalStates[3].yawadd:get_bool()) .. "|",
        tostring(ConditionalStates[3].yawaddamount:get_int()) .. "|",
        tostring(ConditionalStates[3].spin:get_bool()) .. "|",
        tostring(ConditionalStates[3].spinrange:get_int()) .. "|",
        tostring(ConditionalStates[3].spinspeed:get_int()) .. "|",
        tostring(ConditionalStates[3].jitter:get_bool()) .. "|",
        tostring(ConditionalStates[3].jittertype:get_int()) .. "|",
        tostring(ConditionalStates[3].jitterrange:get_int()) .. "|",
        tostring(ConditionalStates[3].desynctype:get_int()) .. "|",
        tostring(ConditionalStates[3].desync:get_int()) .. "|",
        tostring(ConditionalStates[3].compAngle:get_int()) .. "|",
        tostring(ConditionalStates[3].flipJittFake:get_bool()) .. "|",
        tostring(ConditionalStates[3].leanMenu:get_int()) .. "|",
        tostring(ConditionalStates[3].leanamount:get_int()) .. "|",
        tostring(ConditionalStates[4].yawadd:get_bool()) .. "|",
        tostring(ConditionalStates[4].yawaddamount:get_int()) .. "|",
        tostring(ConditionalStates[4].spin:get_bool()) .. "|",
        tostring(ConditionalStates[4].spinrange:get_int()) .. "|",
        tostring(ConditionalStates[4].spinspeed:get_int()) .. "|",
        tostring(ConditionalStates[4].jitter:get_bool()) .. "|",
        tostring(ConditionalStates[4].jittertype:get_int()) .. "|",
        tostring(ConditionalStates[4].jitterrange:get_int()) .. "|",
        tostring(ConditionalStates[4].desynctype:get_int()) .. "|",
        tostring(ConditionalStates[4].desync:get_int()) .. "|",
        tostring(ConditionalStates[4].compAngle:get_int()) .. "|",
        tostring(ConditionalStates[4].flipJittFake:get_bool()) .. "|",
        tostring(ConditionalStates[4].leanMenu:get_int()) .. "|",
        tostring(ConditionalStates[4].leanamount:get_int()) .. "|",
        tostring(ConditionalStates[5].yawadd:get_bool()) .. "|",
        tostring(ConditionalStates[5].yawaddamount:get_int()) .. "|",
        tostring(ConditionalStates[5].spin:get_bool()) .. "|",
        tostring(ConditionalStates[5].spinrange:get_int()) .. "|",
        tostring(ConditionalStates[5].spinspeed:get_int()) .. "|",
        tostring(ConditionalStates[5].jitter:get_bool()) .. "|",
        tostring(ConditionalStates[5].jittertype:get_int()) .. "|",
        tostring(ConditionalStates[5].jitterrange:get_int()) .. "|",
        tostring(ConditionalStates[5].desynctype:get_int()) .. "|",
        tostring(ConditionalStates[5].desync:get_int()) .. "|",
        tostring(ConditionalStates[5].compAngle:get_int()) .. "|",
        tostring(ConditionalStates[5].flipJittFake:get_bool()) .. "|",
        tostring(ConditionalStates[5].leanMenu:get_int()) .. "|",
        tostring(ConditionalStates[5].leanamount:get_int()) .. "|",
        tostring(ConditionalStates[6].yawadd:get_bool()) .. "|",
        tostring(ConditionalStates[6].yawaddamount:get_int()) .. "|",
        tostring(ConditionalStates[6].spin:get_bool()) .. "|",
        tostring(ConditionalStates[6].spinrange:get_int()) .. "|",
        tostring(ConditionalStates[6].spinspeed:get_int()) .. "|",
        tostring(ConditionalStates[6].jitter:get_bool()) .. "|",
        tostring(ConditionalStates[6].jittertype:get_int()) .. "|",
        tostring(ConditionalStates[6].jitterrange:get_int()) .. "|",
        tostring(ConditionalStates[6].desynctype:get_int()) .. "|",
        tostring(ConditionalStates[6].desync:get_int()) .. "|",
        tostring(ConditionalStates[6].compAngle:get_int()) .. "|",
        tostring(ConditionalStates[6].flipJittFake:get_bool()) .. "|",
        tostring(ConditionalStates[6].leanMenu:get_int()) .. "|",
        tostring(ConditionalStates[6].leanamount:get_int()) .. "|",
    }

        clipboard.set(enc(table.concat(str)))
        print("config was copied")

end

configs.importDefault = function(input)
    input = "dHJ1ZXwtMzJ8ZmFsc2V8MHwwfHRydWV8MXw2MHwyfC02MHwxMDB8ZmFsc2V8MHwwfHRydWV8LTMwfGZhbHNlfDB8MHx0cnVlfDF8NjB8MXw2MHwxMDB8ZmFsc2V8MHwwfHRydWV8LTIwfGZhbHNlfDB8MHx0cnVlfDF8NDV8MHwtNjB8MTAwfGZhbHNlfDB8MHx0cnVlfDN8ZmFsc2V8MHwwfHRydWV8MHw1MnwxfC02MHwxMDB8dHJ1ZXwwfDB8dHJ1ZXw2fGZhbHNlfDB8MHx0cnVlfDB8NDJ8MXw2MHwxMDB8dHJ1ZXwwfDB8dHJ1ZXwzfGZhbHNlfDB8MHx0cnVlfDB8MjR8Mnw2MHwxMDB8dHJ1ZXwwfDB8"
    local clipboardp = dec(input)
    local tbl = str_to_sub(clipboardp, "|")
    ConditionalStates[1].yawadd:set_bool(to_boolean(tbl[1]))
    ConditionalStates[1].yawaddamount:set_int(tonumber(tbl[2]))
    ConditionalStates[1].spin:set_bool(to_boolean(tbl[3]))
    ConditionalStates[1].spinrange:set_int(tonumber(tbl[4]))
    ConditionalStates[1].spinspeed:set_int(tonumber(tbl[5]))
    ConditionalStates[1].jitter:set_bool(to_boolean(tbl[6]))
    ConditionalStates[1].jittertype:set_int(tonumber(tbl[7]))
    ConditionalStates[1].jitterrange:set_int(tonumber(tbl[8]))
    ConditionalStates[1].desynctype:set_int(tonumber(tbl[9]))
    ConditionalStates[1].desync:set_int(tonumber(tbl[10]))
    ConditionalStates[1].compAngle:set_int(tonumber(tbl[11]))
    ConditionalStates[1].flipJittFake:set_bool(to_boolean(tbl[12]))
    ConditionalStates[1].leanMenu:set_int(tonumber(tbl[13]))
    ConditionalStates[1].leanamount:set_int(tonumber(tbl[14]))
    ConditionalStates[2].yawadd:set_bool(to_boolean(tbl[15]))
    ConditionalStates[2].yawaddamount:set_int(tonumber(tbl[16]))
    ConditionalStates[2].spin:set_bool(to_boolean(tbl[17]))
    ConditionalStates[2].spinrange:set_int(tonumber(tbl[18]))
    ConditionalStates[2].spinspeed:set_int(tonumber(tbl[19]))
    ConditionalStates[2].jitter:set_bool(to_boolean(tbl[20]))
    ConditionalStates[2].jittertype:set_int(tonumber(tbl[21]))
    ConditionalStates[2].jitterrange:set_int(tonumber(tbl[22]))
    ConditionalStates[2].desynctype:set_int(tonumber(tbl[23]))
    ConditionalStates[2].desync:set_int(tonumber(tbl[24]))
    ConditionalStates[2].compAngle:set_int(tonumber(tbl[25]))
    ConditionalStates[2].flipJittFake:set_bool(to_boolean(tbl[26]))
    ConditionalStates[2].leanMenu:set_int(tonumber(tbl[27]))
    ConditionalStates[2].leanamount:set_int(tonumber(tbl[28]))
    ConditionalStates[3].yawadd:set_bool(to_boolean(tbl[29]))
    ConditionalStates[3].yawaddamount:set_int(tonumber(tbl[30]))
    ConditionalStates[3].spin:set_bool(to_boolean(tbl[31]))
    ConditionalStates[3].spinrange:set_int(tonumber(tbl[32]))
    ConditionalStates[3].spinspeed:set_int(tonumber(tbl[33]))
    ConditionalStates[3].jitter:set_bool(to_boolean(tbl[34]))
    ConditionalStates[3].jittertype:set_int(tonumber(tbl[35]))
    ConditionalStates[3].jitterrange:set_int(tonumber(tbl[36]))
    ConditionalStates[3].desynctype:set_int(tonumber(tbl[37]))
    ConditionalStates[3].desync:set_int(tonumber(tbl[38]))
    ConditionalStates[3].compAngle:set_int(tonumber(tbl[39]))
    ConditionalStates[3].flipJittFake:set_bool(to_boolean(tbl[40]))
    ConditionalStates[3].leanMenu:set_int(tonumber(tbl[41]))
    ConditionalStates[3].leanamount:set_int(tonumber(tbl[42]))
    ConditionalStates[4].yawadd:set_bool(to_boolean(tbl[43]))
    ConditionalStates[4].yawaddamount:set_int(tonumber(tbl[44]))
    ConditionalStates[4].spin:set_bool(to_boolean(tbl[45]))
    ConditionalStates[4].spinrange:set_int(tonumber(tbl[46]))
    ConditionalStates[4].spinspeed:set_int(tonumber(tbl[47]))
    ConditionalStates[4].jitter:set_bool(to_boolean(tbl[48]))
    ConditionalStates[4].jittertype:set_int(tonumber(tbl[49]))
    ConditionalStates[4].jitterrange:set_int(tonumber(tbl[50]))
    ConditionalStates[4].desync:set_int(tonumber(tbl[51]))
    ConditionalStates[4].desynctype:set_int(tonumber(tbl[52]))
    ConditionalStates[4].compAngle:set_int(tonumber(tbl[53]))
    ConditionalStates[4].flipJittFake:set_bool(to_boolean(tbl[54]))
    ConditionalStates[4].leanMenu:set_int(tonumber(tbl[55]))
    ConditionalStates[4].leanamount:set_int(tonumber(tbl[56]))
    ConditionalStates[5].yawadd:set_bool(to_boolean(tbl[57]))
    ConditionalStates[5].yawaddamount:set_int(tonumber(tbl[58]))
    ConditionalStates[5].spin:set_bool(to_boolean(tbl[59]))
    ConditionalStates[5].spinrange:set_int(tonumber(tbl[60]))
    ConditionalStates[5].spinspeed:set_int(tonumber(tbl[61]))
    ConditionalStates[5].jitter:set_bool(to_boolean(tbl[62]))
    ConditionalStates[5].jittertype:set_int(tonumber(tbl[63]))
    ConditionalStates[5].jitterrange:set_int(tonumber(tbl[64]))
    ConditionalStates[5].desynctype:set_int(tonumber(tbl[65]))
    ConditionalStates[5].desync:set_int(tonumber(tbl[66]))
    ConditionalStates[5].compAngle:set_int(tonumber(tbl[67]))
    ConditionalStates[5].flipJittFake:set_bool(to_boolean(tbl[68]))
    ConditionalStates[5].leanMenu:set_int(tonumber(tbl[69]))
    ConditionalStates[5].leanamount:set_int(tonumber(tbl[70]))
    ConditionalStates[6].yawadd:set_bool(to_boolean(tbl[71]))
    ConditionalStates[6].yawaddamount:set_int(tonumber(tbl[72]))
    ConditionalStates[6].spin:set_bool(to_boolean(tbl[73]))
    ConditionalStates[6].spinrange:set_int(tonumber(tbl[74]))
    ConditionalStates[6].spinspeed:set_int(tonumber(tbl[75]))
    ConditionalStates[6].jitter:set_bool(to_boolean(tbl[76]))
    ConditionalStates[6].jittertype:set_int(tonumber(tbl[77]))
    ConditionalStates[6].jitterrange:set_int(tonumber(tbl[78]))
    ConditionalStates[6].desynctype:set_int(tonumber(tbl[79]))
    ConditionalStates[6].desync:set_int(tonumber(tbl[80]))
    ConditionalStates[6].compAngle:set_int(tonumber(tbl[81]))
    ConditionalStates[6].flipJittFake:set_bool(to_boolean(tbl[82]))
    ConditionalStates[6].leanMenu:set_int(tonumber(tbl[83]))
    ConditionalStates[6].leanamount:set_int(tonumber(tbl[84]))

    print("Config loaded")
end

--ideal peek
autopeek = gui.get_config_item("Misc>Movement>Peek Assist")
doubletap = gui.get_config_item("Rage>Aimbot>Aimbot>Double tap")
freestand = gui.get_config_item("Rage>Anti-Aim>Angles>Freestand")
local powrot = (0)
savedd = doubletap:get_bool()
savedf = doubletap:get_bool()
function ideal_peek()
        if ideal_peek_enable:get_bool() then
                if autopeek:get_int() == 1 and getsave == (1) then
                        savedd = doubletap:get_bool()
                        savedf = freestand:get_bool()
                        getsave = (0)
                        end
       if autopeek:get_int() == 1 then
                        doubletap:set_int(1)
                        freestand:set_int(1)
                        powrot = (1)
           end
           if autopeek:get_int() == 0 and powrot == (1) then
                doubletap:set_bool(savedd)
                freestand:set_bool(savedf)
                powrot = (0)
                getsave = (1)
                end
        end
end


local function vtable_bind(class, _type, index)
    local this = ffi.cast("void***", class)
    local ffitype = ffi.typeof(_type)
    return function (...)
        return ffi.cast(ffitype, this[0][index])(this, ...)
    end
end

local function vtable_thunk(_type, index)
    local ffitype = ffi.typeof(_type)
    return function (class, ...)
        local this = ffi.cast("void***", class)
        return ffi.cast(ffitype, this[0][index])(this, ...)
    end
end

--model changer
ffi.cdef [[
    typedef struct{
     void*   handle;
     char    name[260];
     int     load_flags;
     int     server_count;
     int     type;
     int     flags;
     float   mins[3];
     float   maxs[3];
     float   radius;
     char    pad[0x1C];
 } model_t;
 typedef struct {void** this;}aclass;
 typedef void*(__thiscall* get_client_entity_t)(void*, int);
 typedef void(__thiscall* find_or_load_model_fn_t)(void*, const char*);
 typedef const int(__thiscall* get_model_index_fn_t)(void*, const char*);
 typedef const int(__thiscall* add_string_fn_t)(void*, bool, const char*, int, const void*);
 typedef void*(__thiscall* find_table_t)(void*, const char*);
 typedef void(__thiscall* full_update_t)();
 typedef int(__thiscall* get_player_idx_t)();
 typedef void*(__thiscall* get_client_networkable_t)(void*, int);
 typedef void(__thiscall* pre_data_update_t)(void*, int);
 typedef int(__thiscall* get_model_index_t)(void*, const char*);
 typedef const model_t(__thiscall* find_or_load_model_t)(void*, const char*);
 typedef int(__thiscall* add_string_t)(void*, bool, const char*, int, const void*);
 typedef void(__thiscall* set_model_index_t)(void*, int);
 typedef int(__thiscall* precache_model_t)(void*, const char*, bool);
]]
local a = ffi.cast(ffi.typeof("void***"), utils.find_interface("client.dll", "VClientEntityList003")) or
    error("rawientitylist is nil", 2)
local b = ffi.cast("get_client_entity_t", a[0][3]) or error("get_client_entity is nil", 2)
local c = ffi.cast(ffi.typeof("void***"), utils.find_interface("engine.dll", "VModelInfoClient004")) or
    error("model info is nil", 2)
local d = ffi.cast("get_model_index_fn_t", c[0][2]) or error("Getmodelindex is nil", 2)
local e = ffi.cast("find_or_load_model_fn_t", c[0][43]) or error("findmodel is nil", 2)
local f = ffi.cast(ffi.typeof("void***"), utils.find_interface("engine.dll", "VEngineClientStringTable001")) or
    error("clientstring is nil", 2)
local g = ffi.cast("find_table_t", f[0][3]) or error("find table is nil", 2)
function p(pa)
    local a_p = ffi.cast(ffi.typeof("void***"), g(f, "modelprecache"))
    if a_p ~= nil then
        e(c, pa)
        local ac = ffi.cast("add_string_fn_t", a_p[0][8]) or error("ac nil", 2)
        local acs = ac(a_p, false, pa, -1, nil)
        if acs == -1 then print("failed")
            return false
        end
    end
    return true
end

function smi(en, i)
    local rw = b(a, en)
    if rw then
        local gc = ffi.cast(ffi.typeof("void***"), rw)
        local se = ffi.cast("set_model_index_t", gc[0][75])
        if se == nil then
            error("smi is nil")
        end
        se(gc, i)
    end
end

function cm(ent, md)
    if md:len() > 5 then
        if p(md) == false then
            error("invalid model", 2)
        end
        local i = d(c, md)
        if i == -1 then
            return
        end
        smi(ent, i)
    end
end


-------------------------------------EDIT THAT ONLY------------------------------------------

local path = {
    --path
    "models/player/custom_player/ctm_fbi_variantg.mdl",
    "models/player/custom_player/ctm_st6_variantm.mdl",
    "models/player/custom_player/gta_crip.mdl",
    "models/player/custom_player/tm_balkan_variantg.mdl",
    "models/player/custom_player/tm_phoenix_variantf",
    "models/player/custom_player/remilia_scarlet_arms",
    "models/player/custom_player/remilia_scarlet",
}

local menu = {}
menu.add = {
    en = gui.add_checkbox("Enabled", "lua>tab b"),
    path = gui.add_combo("Player Model Changer", "lua>tab b", path),
}

-------------------------------------EDIT THAT ONLY------------------------------------------

function on_frame_stage_notify(stage, pre_original)
    if stage == csgo.frame_render_start then
        if player == nil then return end
        if player:is_alive() then
            if menu.add.en:get_bool() then
                cm(player:get_index(), path[menu.add.path:get_int() + 1])
            end
        end
    end
end


--aspect ratio
local aspect_ratio_slider = gui.add_slider("Aspect ratio", "lua>tab b", 1, 200, 1)

local r_aspectratio = cvar.r_aspectratio

local default_value = r_aspectratio:get_float()

local function set_aspect_ratio(multiplier)
    local screen_width,screen_height = render.get_screen_size()

    local value = (screen_width * multiplier) / screen_height

    if multiplier == 1 then
        value = 0
    end
    r_aspectratio:set_float(value)
end


--show weapon in scope

local function vtable_bind(class, _type, index)
    local this = ffi.cast("void***", class)
    local ffitype = ffi.typeof(_type)
    return function (...)
        return ffi.cast(ffitype, this[0][index])(this, ...)
    end
end


local ShowWeaponInScope = gui.add_checkbox("Show weapon in scope", "lua>tab b")

local WeaponSystem  = ffi.cast("void**", utils.find_pattern("client.dll", "8B 35 ? ? ? ? FF 10 0F B7 C0") + 2)[0]
local GetWeaponData = vtable_bind(WeaponSystem, "uintptr_t(__thiscall*)(void*, short)", 2)


local function GetWeaponDataAddress(player_index)
    local Player = entities.get_entity(player_index)
    if not Player or not Player:is_alive() then
        return nil
    end

    local Weapon = Player:get_weapon()
    if not Weapon then
        return nil
    end

    return GetWeaponData(Weapon:get_prop("m_iItemDefinitionIndex"))
end

--callbacks
function on_shutdown()
    --clantag
    utils.set_clan_tag("");
    --idk
    local pWeaponData = GetWeaponDataAddress(engine.get_local_player())
    if not pWeaponData then
        return
    end

    ffi.cast("bool*", tonumber(pWeaponData) + 0x1CD)[0] = true
    --aspect ratio
    r_aspectratio:set_float(default_value)
    --roll resolver on key
    resolver_reference:set_int(default)
end

function on_create_move()
    UpdateStateandAA()
    StaticFreestand()
    fakeflick()
    InvertDesync()
    local pWeaponData = GetWeaponDataAddress(engine.get_local_player())
    if not pWeaponData then
        return
    end

    ffi.cast("bool*", tonumber(pWeaponData) + 0x1CD)[0] = not ShowWeaponInScope:get_bool()
end


function on_paint()
    --slowwalk speed
    if slowwalk_box:get_bool() == true then
        gui.set_visible("lua>tab b>Speed", true)
        local is_down = input.is_key_down( 16 );
        if not ( is_down ) then
            set_speed( 450 )
        else
            local final_val = 250 * slowwalk_slider:get_float( ) / 100
            set_speed( final_val )
        end
    else
        gui.set_visible("lua>tab b>Speed", false)
    end
    --aspect ratio
    local aspect_ratio = aspect_ratio_slider:get_int() * 0.01
    aspect_ratio = 2 - aspect_ratio
    set_aspect_ratio(aspect_ratio)
    --skin color chooser
    skin_color:set_int(skin_colors:get_int()) -- thanks for snt for coming up with a way to shorten the code
    --skeet indicators
    skeetind()
    --roll resolver on key
    if checkbox:get_bool() then resolver_reference:set_int(0) else resolver_reference:set_int(default) end
    --ax
    axshit()
    --dt speed
    doubletap_speed()
        --better dt
        handle_dt()
    MenuElements()
    ideal_peek()
    RB()
    DA()
    WM()
    KB()
    ID()
    CT()
    UpdateAll()
    AA5way()
end

local OldTickCount = -1
    -- This fixes the issue of cmd callbacks not being called while recharging dt
    if OldTickCount == global_vars.tickcount then
        return
    else
        OldTickCount = global_vars.tickcount
    end