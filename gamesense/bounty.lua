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

    local v186 = "bozo"
    local v187 = "Nightly"
    local function require_lib(a0, a1)
        local v188, v189 = pcall(require, a0)
        if v188 then
            return v189
        else
            return error(a1)
        end
    end
    local images = require_lib("gamesense/images", "Download images library: https://gamesense.pub/forums/viewtopic.php?id=22917")
    local bit = require_lib("bit")
    local base64 = require_lib("gamesense/base64", "Download base64 encode/decode library: https://gamesense.pub/forums/viewtopic.php?id=21619")
    local antiaim = require_lib("gamesense/antiaim_funcs", "Download anti-aim functions library: https://gamesense.pub/forums/viewtopic.php?id=29665")
    local ffi = require_lib("ffi", "Failed to require FFI, please make sure Allow unsafe scripts is enabled!")
    local vector = require_lib("vector", "Missing vector")
    local http = require_lib("gamesense/http", "Download HTTP library: https://gamesense.pub/forums/viewtopic.php?id=21619")
    local clipboard = require_lib("gamesense/clipboard", "Download Clipboard library: https://gamesense.pub/forums/viewtopic.php?id=28678")
    local entity = require_lib("gamesense/entity", "Download Entity Object library: https://gamesense.pub/forums/viewtopic.php?id=27529")
    local weapons = require_lib("gamesense/csgo_weapons", "Download CS:GO weapon data library: https://gamesense.pub/forums/viewtopic.php?id=18807")
    local v190 = vtable_bind("client_panorama.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
    local v191 = (require_lib("gamesense/steamworks") or error("Missing https://gamesense.pub/forums/viewtopic.php?id=26526"))
    local trace = require_lib("gamesense/trace", "https://gamesense.pub/forums/viewtopic.php?id=32949")
    local surface = require("gamesense/surface")
    local v192 = surface.draw_line
    local v193 = "BOUNTY"
    local v194 = true
    local v195 = 0
    function sway()
        if (v194 == true) then
            v195 = (v195 + 1)
            if (v195 > 255) then
                v194 = false
            end
        else
            v195 = (v195 - 1)
            if (v195 == 0) then
                v194 = true
            end
        end
        return v195
    end
    function lerp(a0_662, a1_664, a2)
        if ((not a1_664 or not a0_662) or not a2) then
            return
        end
        return (a0_662 + ((a1_664 - a0_662) * a2))
    end
    function text_clamp(a0_667, a1_669, a2_671)
        if (a0_667 < a1_669) then
            return a1_669
        elseif (a0_667 > a2_671) then
            return a2_671
        else
            return a0_667
        end
    end
    function ui.multiReference(a0_673, a1_675, a2_677)
        local ui_reference, v196, v197 = ui.reference(a0_673, a1_675, a2_677)
        return { ui_reference, v196, v197 }
    end
    rgba_to_hex = function(a0_679, a1_681, a2_683, a3)
        return bit.tohex(((((math.floor((a0_679 + 0.5)) * 16777216) + (math.floor((a1_681 + 0.5)) * 65536)) + (math.floor((a2_683 + 0.5)) * 256)) + math.floor((a3 + 0.5))))
    end
    animate_text = function(a0_686, a1_688, a2_690, a3_692, a4, a5, a6, a7, a8, a9)
        local v198, v199, v200, v201 = a6, a7, a8, a9
        local v202 = {}
        local v203 = (a1_688:len() - 1)
        local v204 = (v198 - a2_690)
        local v205 = (v199 - a3_692)
        local v206 = (v200 - a4)
        local v207 = (v201 - a5)
        for i208 = 1, #a1_688, 1 do
            local v209 = (((i208 - 1) / (#a1_688 - 1)) + a0_686)
            v202[(#v202 + 1)] = ("\a" .. rgba_to_hex((a2_690 + (v204 * math.abs(math.cos(v209)))), (a3_692 + (v205 * math.abs(math.cos(v209)))), (a4 + (v206 * math.abs(math.cos(v209)))), (a5 + (v207 * math.abs(math.cos(v209))))))
            v202[(#v202 + 1)] = a1_688:sub(i208, i208)
        end
        return table.concat(v202)
    end
    function animate_color(a0_700, a1_702, a2_704, a3_706, a4_708, a5_710, a6_712, a7_714, a8_716)
        local v210 = false
        local v211, v212, v213, v214 = a1_702, a2_704, a3_706, a4_708
        if ((((v211 == a5_710) and (v212 == a6_712)) and (v213 == a7_714)) and (v214 == a8_716)) then
            v211 = lerp(a1_702, a5_710, a0_700)
            v212 = lerp(a2_704, a6_712, a0_700)
            v213 = lerp(a3_706, a7_714, a0_700)
            v214 = lerp(a4_708, a8_716, a0_700)
        else
            v211 = lerp(a5_710, a1_702, a0_700)
            v212 = lerp(a6_712, a2_704, a0_700)
            v213 = lerp(a7_714, a3_706, a0_700)
            v214 = lerp(a8_716, a4_708, a0_700)
        end
        return v211, v212, v213, v214
    end
    local client_unix_time = client.unix_time()
    local function fn141()
        local v215 = (client.unix_time() - client_unix_time)
        local math_floor = math.floor((v215 / 3600))
        local math_floor_1 = math.floor(((v215 - (math_floor * 3600)) / 60))
        local math_floor_2 = math.floor(((v215 - (math_floor * 3600)) - (math_floor_1 * 60)))
        return string.format("%02d:%02d:%02d", math_floor, math_floor_1, math_floor_2)
    end
    local function fn142(a0_718)
        return (globals.curtime() >= entity.get_prop(a0_718, "m_flNextAttack"))
    end
    local function fn143(a0_720)
        return (globals.curtime() >= entity.get_prop(a0_720, "m_flNextPrimaryAttack"))
    end
    function create_data(a0_722, a1_724)
        return { flags = (a0_722 or 0), velocity = (a1_724 or vector()) }
    end
    local function fn144(a0_726, a1_728)
        local math_sin = math.sin(math.rad(a1_728))
        local math_cos = math.cos(math.rad(a1_728))
        local math_sin_3 = math.sin(math.rad(a0_726))
        local math_cos_4 = math.cos(math.rad(a0_726))
        return (math_cos_4 * math_cos), (math_cos_4 * math_sin), -math_sin_3
    end
    local v216 = create_data()
    local v217 = create_data()
    local function fn145(a0_730, a1_732)
        local entity_get_local_player = entity.get_local_player()
        if (entity_get_local_player == nil) then
            return
        end
        local v218 = v216.velocity
        local v219 = v218:length2d()
        local v220 = vector(v218:angles())
        local v221 = vector(client.camera_angles())
        v220.y = (v221.y - v220.y)
        local v222 = vector(fn144(v220.x, v220.y))
        local v223 = -cvar.cl_sidespeed:get_float()
        local v224 = (v223 * v222)
        a0_730.in_speed = 1
        a0_730.forwardmove = v224.x
        a0_730.sidemove = v224.y
    end
    local function fn146(a0_734, a1_736)
        a1_736 = (a1_736 or "")
        local v225 = { { a0_734, a1_736 } }
        while (#v225 > 0) do
            local table_remove = table.remove(v225)
            local v226 = table_remove[1]
            local v227 = table_remove[2]
            for i228, i229 in pairs(v226) do
                local v230 = (v227 .. i228)
                if (type(i229) == "table") then
                    table.insert(v225, { i229, (v230 .. ".") })
                else
                    ui.set_visible(i229, false)
                end
            end
        end
    end
    local function fn147(a0_738, a1_740)
        a1_740 = (a1_740 or "")
        local v231 = { { a0_738, a1_740 } }
        while (#v231 > 0) do
            local table_remove_5 = table.remove(v231)
            local v232 = table_remove_5[1]
            local v233 = table_remove_5[2]
            for i234, i235 in pairs(v232) do
                local v236 = (v233 .. i234)
                if (type(i235) == "table") then
                    table.insert(v231, { i235, (v236 .. ".") })
                else
                    ui.set_visible(i235, true)
                end
            end
        end
    end
    local v237 = 0
    local v238 = 0
    local v239 = true
    local v240 = true
    local v241 = false
    client.set_event_callback("paint_ui", function()
        local v242 = vector(client.screen_size())
        local v243 = vector(v242.x, v242.y)
        if (v239 == true) then
            local l_33_, v244 = { 184, 184, 184, v238 }, { 62, 62, 62, 100 }
            local v245 = "welcome back!"
            local v246 = lerp(0, 360, (globals.realtime() % 1))
            if (v240 == true) then
                v238 = lerp(v238, 255, (globals.frametime() * 24))
            end
            renderer.blur(0, 0, v243.x, v243.y)
            renderer.text((v242.x / 2), ((v242.y / 2) + 50), 255, 255, 255, v238, "c", 0, v245)
            if (v238 > 210) then
                if (v240 == true) then
                    v237 = lerp(v237, 150, (globals.frametime() * 24))
                end
            end
            if (v237 > 149) then
                v240 = false
                v238 = lerp(v238, 0, (globals.frametime() * 24))
                if (v238 < 1) then
                    v239 = false
                end
            end
            if (v241 == true) then
                renderer.text((v242.x / 2), ((v242.y - (v237 / 2)) + 65), 184, 184, 184, v238, "c", 0, "")
            end
        end
    end)
    local v247 = {
    antiaim = {
    anti_aim = ui.multiReference("AA", "Anti-aimbot angles", "Enabled"),
    pitch = ui.multiReference("AA", "Anti-aimbot angles", "Pitch"),
    yaw = { ui.reference("AA", "Anti-aimbot angles", "Yaw") },
    yaw_base = ui.reference("AA", "Anti-aimbot angles", "Yaw Base"),
    jitter = { ui.reference("AA", "Anti-aimbot angles", "Yaw jitter") },
    body_yaw = { ui.reference("AA", "Anti-aimbot angles", "Body yaw") },
    fs_body_yaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw"),
    rollslider = ui.reference("AA", "Anti-aimbot angles", "Roll"),
    slow_motion = { ui.reference("AA", "Other", "Slow motion") },
    freestand,
    freestandkey = ui.reference("AA", "Anti-aimbot angles", "Freestanding"),
    fd = ui.reference("RAGE", "Other", "Duck peek assist"),
    edgeyaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw"),
    fakelaglimit = ui.multiReference("AA", "Fake lag", "Limit"),
    fakelagvariance = ui.multiReference("AA", "Fake lag", "Variance"),
    fakelagamount = ui.multiReference("AA", "Fake lag", "Amount"),
    fakelagenabled = ui.multiReference("AA", "Fake lag", "Enabled"),
    legmovement = ui.multiReference("AA", "Other", "Leg movement"),
    fakepeek = ui.multiReference("AA", "Other", "Fake peek"),
    onshotaa = ui.multiReference("AA", "Other", "On shot anti-aim"),
},
}
    uistate = 7
    UI_Label_Empty = ui.new_label("AA", "Anti-aimbot angles", " ")
    UI_Label_Empty2 = ui.new_label("AA", "Anti-aimbot angles", " ")
    UI_Button_Back = ui.new_button("AA", "Anti-aimbot angles", "\a96D6DBFFBack", function()
        ui.set_visible(UI_Button_Back, false)
        ui.set_visible(UI_Button_Visuals, true)
        ui.set_visible(UI_Button_AA, true)
        ui.set_visible(UI_Button_Configs, true)
        ui.set_visible(UI_Button_Keybinds, true)
        ui.set_visible(UI_Button_Ragebot, true)
        uistate = 7
    end)
    ui.set_visible(UI_Button_Back, false)
    UI_Button_Ragebot = ui.new_button("AA", "Anti-aimbot angles", "\a96D6DBFFRage", function()
        ui.set_visible(UI_Button_Back, true)
        ui.set_visible(UI_Button_Visuals, false)
        ui.set_visible(UI_Button_AA, false)
        ui.set_visible(UI_Button_Configs, false)
        ui.set_visible(UI_Button_Keybinds, false)
        ui.set_visible(UI_Button_Ragebot, false)
        uistate = 2
    end)
    UI_Button_AA = ui.new_button("AA", "Anti-aimbot angles", "\a96D6DBFFAnti-aim", function()
        ui.set_visible(UI_Button_Back, true)
        ui.set_visible(UI_Button_Visuals, false)
        ui.set_visible(UI_Button_AA, false)
        ui.set_visible(UI_Button_Configs, false)
        ui.set_visible(UI_Button_Keybinds, false)
        ui.set_visible(UI_Button_Ragebot, false)
        uistate = 1
    end)
    UI_Button_Keybinds = ui.new_button("AA", "Anti-aimbot angles", "\a96D6DBFFBinds", function()
        ui.set_visible(UI_Button_Back, true)
        ui.set_visible(UI_Button_Visuals, false)
        ui.set_visible(UI_Button_AA, false)
        ui.set_visible(UI_Button_Configs, false)
        ui.set_visible(UI_Button_Keybinds, false)
        ui.set_visible(UI_Button_Ragebot, false)
        uistate = 6
    end)
    UI_Button_Visuals = ui.new_button("AA", "Anti-aimbot angles", "\a96D6DBFFVisuals", function()
        ui.set_visible(UI_Button_Back, true)
        ui.set_visible(UI_Button_Visuals, false)
        ui.set_visible(UI_Button_AA, false)
        ui.set_visible(UI_Button_Configs, false)
        ui.set_visible(UI_Button_Keybinds, false)
        ui.set_visible(UI_Button_Ragebot, false)
        uistate = 3
    end)
    UI_Button_Configs = ui.new_button("AA", "Anti-aimbot angles", "\a96D6DBFFConfig", function()
        ui.set_visible(UI_Button_Back, true)
        ui.set_visible(UI_Button_Visuals, false)
        ui.set_visible(UI_Button_AA, false)
        ui.set_visible(UI_Button_Configs, false)
        ui.set_visible(UI_Button_Keybinds, false)
        ui.set_visible(UI_Button_Ragebot, false)
        uistate = 5
    end)
    labelhead = ui.new_label("AA", "Fake lag", "\a8AECF1FF•  \aFFFFFFFFbounty")
    label345 = ui.new_label("AA", "Fake lag", "\a292929FF━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    label34e5 = ui.new_label("AA", "Fake lag", "\nspace121")
    lableoth = ui.new_label("AA", "Fake lag", "\a8AECF1FF•  \aFFFFFFFFUser: \a8AECF1FFtester")
    lableoth = ui.new_label("AA", "Fake lag", "\a8AECF1FF•  \aFFFFFFFFLast update: \a8AECF1FF06.09.2024")
    Timezone = ui.new_label("AA", "Fake lag", "\a8AECF1FF•  \aFFFFFFFFTime session: \a8AECF1FFtime")
    label35435 = ui.new_label("AA", "Fake lag", "\nspace12432")
    label346 = ui.new_label("AA", "Fake lag", "\a292929FF━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    client.set_event_callback("paint_ui", function()
        if ui.is_menu_open() then
            ui.set(Timezone, ("\a8AECF1FF•  \aFFFFFFFFTime session: \a8AECF1FF" .. fn141()))
        end
    end)
    local ui_new_combobox = ui.new_combobox("AA", "Anti-aimbot angles", "Preset", { "Ai-based", "Meta", "Custom" })
    local ui_new_combobox_6 = ui.new_combobox("AA", "Anti-aimbot angles", "State", { "Crouching", "Crouchrunning", "Standing", "Slowmotion", "Running", "Jumping", "Aircrouching", "Fakelag" })
    local v248 = {
    Crouching = {
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[c] Pitch", { "Local view", "Custom", "Down", "Up", "Random" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[c] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[c] At targets"),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[c] Yaw ~ left", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[c] Yaw ~ right", -180, 180, 0, true, nil, 1, {}),
    jitter_mode = ui.new_combobox("AA", "Anti-aimbot angles", "[c] Jitter", { "Center", "Offset", "Random", "3 Way" }),
    jitter_amount = ui.new_slider("AA", "Anti-aimbot angles", "[c] Jitter ~ amount", -180, 180, 0, true, " ", 1, {}),
    lby = ui.new_combobox("AA", "Anti-aimbot angles", "[c] Body yaw", { "Off", "Tickcount", "Delayed", "Static", "Opposite" }),
    lbyside = ui.new_combobox("AA", "Anti-aimbot angles", "[c] side", { "Left", "Right", "Auto" }),
    lbyspeed = ui.new_slider("AA", "Anti-aimbot angles", "[c] Speed", 1, 10, 6, true, nil, 1, {}),
    fakelagmode = ui.new_combobox("AA", "Anti-aimbot angles", "[c] Fake lag mode", { "Maximum", "Dynamic", "Fluctuate" }),
    fakelagslider = ui.new_slider("AA", "Anti-aimbot angles", "[c] Fake lag amount", 1, 15, 1, true, nil, 1, {}),
    fakelagvariance = ui.new_slider("AA", "Anti-aimbot angles", "[c] Fake lag variance", 0, 100, 0, true, nil, 1, {}),
    defensive = {
    aa = ui.new_combobox("AA", "Anti-aimbot angles", "[cd] Defensive AA", { "Off", "On peek", "Force" }),
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[cd] Pitch", { "Local view", "Semi-up", "Semi-down", "Sway", "Sideways", "Jitter", "Down", "Up", "Random", "Custom" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[cd] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[cd] At targets"),
    yaw = ui.new_combobox("AA", "Anti-aimbot angles", "[cd] Yaw", { "Sideways", "Slow spin", "Medium spin", "Fast spin", "All the sides", "Custom" }),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[cd] First yaw", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[cd] Second yaw", -180, 180, 0, true, nil, 1, {}),
},
},
    Crouchrunning = {
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[cr] Pitch", { "Local view", "Custom", "Down", "Up", "Random" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[cr] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[cr] At targets"),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[cr] Yaw ~ left", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[cr] Yaw ~ right", -180, 180, 0, true, nil, 1, {}),
    jitter_mode = ui.new_combobox("AA", "Anti-aimbot angles", "[cr] Jitter", { "Center", "Offset", "Random", "3 Way" }),
    jitter_amount = ui.new_slider("AA", "Anti-aimbot angles", "[cr] Jitter ~ amount", -180, 180, 0, true, " ", 1, {}),
    lby = ui.new_combobox("AA", "Anti-aimbot angles", "[cr] Body yaw", { "Off", "Tickcount", "Delayed", "Static", "Opposite" }),
    lbyside = ui.new_combobox("AA", "Anti-aimbot angles", "[cr] side", { "Left", "Right", "Auto" }),
    lbyspeed = ui.new_slider("AA", "Anti-aimbot angles", "[cr] Speed", 1, 10, 6, true, nil, 1, {}),
    fakelagmode = ui.new_combobox("AA", "Anti-aimbot angles", "[cr] Fake lag mode", { "Maximum", "Dynamic", "Fluctuate" }),
    fakelagslider = ui.new_slider("AA", "Anti-aimbot angles", "[cr] Fake lag amount", 1, 15, 1, true, nil, 1, {}),
    fakelagvariance = ui.new_slider("AA", "Anti-aimbot angles", "[cr] Fake lag variance", 0, 100, 0, true, nil, 1, {}),
    defensive = {
    aa = ui.new_combobox("AA", "Anti-aimbot angles", "[crd] Defensive AA", { "Off", "On peek", "Force" }),
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[crd] Pitch", { "Local view", "Semi-up", "Semi-down", "Sway", "Sideways", "Jitter", "Down", "Up", "Random", "Custom" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[crd] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[crd] At targets"),
    yaw = ui.new_combobox("AA", "Anti-aimbot angles", "[crd] Yaw", { "Sideways", "Slow spin", "Medium spin", "Fast spin", "All the sides", "Custom" }),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[crd] First yaw", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[crd] Second yaw", -180, 180, 0, true, nil, 1, {}),
},
},
    Standing = {
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[s] Pitch", { "Local view", "Custom", "Down", "Up", "Random" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[s] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[s] At targets"),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[s] Yaw ~ left", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[s] Yaw ~ right", -180, 180, 0, true, nil, 1, {}),
    jitter_mode = ui.new_combobox("AA", "Anti-aimbot angles", "[s] Jitter", { "Center", "Offset", "Random", "3 Way" }),
    jitter_amount = ui.new_slider("AA", "Anti-aimbot angles", "[s] Jitter ~ amount", -180, 180, 0, true, " ", 1, {}),
    lby = ui.new_combobox("AA", "Anti-aimbot angles", "[s] Body yaw", { "Off", "Tickcount", "Delayed", "Static", "Opposite" }),
    lbyside = ui.new_combobox("AA", "Anti-aimbot angles", "[s] side", { "Left", "Right", "Auto" }),
    lbyspeed = ui.new_slider("AA", "Anti-aimbot angles", "[s] Speed", 1, 10, 6, true, nil, 1, {}),
    fakelagmode = ui.new_combobox("AA", "Anti-aimbot angles", "[s] Fake lag mode", { "Maximum", "Dynamic", "Fluctuate" }),
    fakelagslider = ui.new_slider("AA", "Anti-aimbot angles", "[s] Fake lag amount", 1, 15, 1, true, nil, 1, {}),
    fakelagvariance = ui.new_slider("AA", "Anti-aimbot angles", "[s] Fake lag variance", 0, 100, 0, true, nil, 1, {}),
    defensive = {
    aa = ui.new_combobox("AA", "Anti-aimbot angles", "[sd] Defensive AA", { "Off", "On peek", "Force" }),
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[sd] Pitch", { "Local view", "Semi-up", "Semi-down", "Sway", "Sideways", "Jitter", "Down", "Up", "Random", "Custom" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[sd] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[sd] At targets"),
    yaw = ui.new_combobox("AA", "Anti-aimbot angles", "[sd] Yaw", { "Sideways", "Slow spin", "Medium spin", "Fast spin", "All the sides", "Custom" }),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[sd] First yaw", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[sd] Second yaw", -180, 180, 0, true, nil, 1, {}),
},
},
    Slowmotion = {
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[sm] Pitch", { "Local view", "Custom", "Down", "Up", "Random" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[sm] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[sm] At targets"),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[sm] Yaw ~ left", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[sm] Yaw ~ right", -180, 180, 0, true, nil, 1, {}),
    jitter_mode = ui.new_combobox("AA", "Anti-aimbot angles", "[sm] Jitter", { "Center", "Offset", "Random", "3 Way" }),
    jitter_amount = ui.new_slider("AA", "Anti-aimbot angles", "[sm] Jitter ~ amount", -180, 180, 0, true, " ", 1, {}),
    lby = ui.new_combobox("AA", "Anti-aimbot angles", "[sm] Body yaw", { "Off", "Tickcount", "Delayed", "Static", "Opposite" }),
    lbyside = ui.new_combobox("AA", "Anti-aimbot angles", "[sm] side", { "Left", "Right", "Auto" }),
    lbyspeed = ui.new_slider("AA", "Anti-aimbot angles", "[sm] Speed", 1, 10, 6, true, nil, 1, {}),
    fakelagmode = ui.new_combobox("AA", "Anti-aimbot angles", "[sm] Fake lag mode", { "Maximum", "Dynamic", "Fluctuate" }),
    fakelagslider = ui.new_slider("AA", "Anti-aimbot angles", "[sm] Fake lag amount", 1, 15, 1, true, nil, 1, {}),
    fakelagvariance = ui.new_slider("AA", "Anti-aimbot angles", "[sm] Fake lag variance", 0, 100, 0, true, nil, 1, {}),
    defensive = {
    aa = ui.new_combobox("AA", "Anti-aimbot angles", "[smd] Defensive AA", { "Off", "On peek", "Force" }),
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[smd] Pitch", { "Local view", "Semi-up", "Semi-down", "Sway", "Sideways", "Jitter", "Down", "Up", "Random", "Custom" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[smd] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[smd] At targets"),
    yaw = ui.new_combobox("AA", "Anti-aimbot angles", "[smd] Yaw", { "Sideways", "Slow spin", "Medium spin", "Fast spin", "All the sides", "Custom" }),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[smd] First yaw", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[smd] Second yaw", -180, 180, 0, true, nil, 1, {}),
},
},
    Running = {
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[m] Pitch", { "Local view", "Custom", "Down", "Up", "Random" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[m] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[m] At targets"),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[m] Yaw ~ left", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[m] Yaw ~ right", -180, 180, 0, true, nil, 1, {}),
    jitter_mode = ui.new_combobox("AA", "Anti-aimbot angles", "[m] Jitter", { "Center", "Offset", "Random", "3 Way" }),
    jitter_amount = ui.new_slider("AA", "Anti-aimbot angles", "[m] Jitter ~ amount", -180, 180, 0, true, " ", 1, {}),
    lby = ui.new_combobox("AA", "Anti-aimbot angles", "[m] Body yaw", { "Off", "Tickcount", "Delayed", "Static", "Opposite" }),
    lbyside = ui.new_combobox("AA", "Anti-aimbot angles", "[m] side", { "Left", "Right", "Auto" }),
    lbyspeed = ui.new_slider("AA", "Anti-aimbot angles", "[m] Speed", 1, 10, 6, true, nil, 1, {}),
    fakelagmode = ui.new_combobox("AA", "Anti-aimbot angles", "[m] Fake lag mode", { "Maximum", "Dynamic", "Fluctuate" }),
    fakelagslider = ui.new_slider("AA", "Anti-aimbot angles", "[m] Fake lag amount", 1, 15, 1, true, nil, 1, {}),
    fakelagvariance = ui.new_slider("AA", "Anti-aimbot angles", "[m] Fake lag variance", 0, 100, 0, true, nil, 1, {}),
    defensive = {
    aa = ui.new_combobox("AA", "Anti-aimbot angles", "[md] Defensive AA", { "Off", "On peek", "Force" }),
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[md] Pitch", { "Local view", "Semi-up", "Semi-down", "Sway", "Sideways", "Jitter", "Down", "Up", "Random", "Custom" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[md] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[md] At targets"),
    yaw = ui.new_combobox("AA", "Anti-aimbot angles", "[md] Yaw", { "Sideways", "Slow spin", "Medium spin", "Fast spin", "All the sides", "Custom" }),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[md] First yaw", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[md] Second yaw", -180, 180, 0, true, nil, 1, {}),
},
},
    Jumping = {
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[j] Pitch", { "Local view", "Custom", "Down", "Up", "Random" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[j] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[j] At targets"),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[j] Yaw ~ left", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[j] Yaw ~ right", -180, 180, 0, true, nil, 1, {}),
    jitter_mode = ui.new_combobox("AA", "Anti-aimbot angles", "[j] Jitter", { "Center", "Offset", "Random", "3 Way" }),
    jitter_amount = ui.new_slider("AA", "Anti-aimbot angles", "[j] Jitter ~ amount", -180, 180, 0, true, " ", 1, {}),
    lby = ui.new_combobox("AA", "Anti-aimbot angles", "[j] Body yaw", { "Off", "Tickcount", "Delayed", "Static", "Opposite" }),
    lbyside = ui.new_combobox("AA", "Anti-aimbot angles", "[j] side", { "Left", "Right", "Auto" }),
    lbyspeed = ui.new_slider("AA", "Anti-aimbot angles", "[j] Speed", 1, 10, 6, true, nil, 1, {}),
    fakelagmode = ui.new_combobox("AA", "Anti-aimbot angles", "[j] Fake lag mode", { "Maximum", "Dynamic", "Fluctuate" }),
    fakelagslider = ui.new_slider("AA", "Anti-aimbot angles", "[j] Fake lag amount", 1, 15, 1, true, nil, 1, {}),
    fakelagvariance = ui.new_slider("AA", "Anti-aimbot angles", "[j] Fake lag variance", 0, 100, 0, true, nil, 1, {}),
    defensive = {
    aa = ui.new_combobox("AA", "Anti-aimbot angles", "[jd] Defensive AA", { "Off", "On peek", "Force" }),
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[jd] Pitch", { "Local view", "Semi-up", "Semi-down", "Sway", "Sideways", "Jitter", "Down", "Up", "Random", "Custom" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[jd] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[jd] At targets"),
    yaw = ui.new_combobox("AA", "Anti-aimbot angles", "[jd] Yaw", { "Sideways", "Slow spin", "Medium spin", "Fast spin", "All the sides", "Custom" }),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[jd] First yaw", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[jd] Second yaw", -180, 180, 0, true, nil, 1, {}),
},
},
    Aircrouching = {
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[ac] Pitch", { "Local view", "Custom", "Down", "Up", "Random" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[ac] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[ac] At targets"),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[ac] Yaw ~ left", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[ac] Yaw ~ right", -180, 180, 0, true, nil, 1, {}),
    jitter_mode = ui.new_combobox("AA", "Anti-aimbot angles", "[ac] Jitter", { "Center", "Offset", "Random", "3 Way" }),
    jitter_amount = ui.new_slider("AA", "Anti-aimbot angles", "[ac] Jitter ~ amount", -180, 180, 0, true, " ", 1, {}),
    lby = ui.new_combobox("AA", "Anti-aimbot angles", "[ac] Body yaw", { "Off", "Tickcount", "Delayed", "Static", "Opposite" }),
    lbyside = ui.new_combobox("AA", "Anti-aimbot angles", "[ac] side", { "Left", "Right", "Auto" }),
    lbyspeed = ui.new_slider("AA", "Anti-aimbot angles", "[ac] Speed", 1, 10, 6, true, nil, 1, {}),
    fakelagmode = ui.new_combobox("AA", "Anti-aimbot angles", "[ac] Fake lag mode", { "Maximum", "Dynamic", "Fluctuate" }),
    fakelagslider = ui.new_slider("AA", "Anti-aimbot angles", "[ac] Fake lag amount", 1, 15, 1, true, nil, 1, {}),
    fakelagvariance = ui.new_slider("AA", "Anti-aimbot angles", "[ac] Fake lag variance", 0, 100, 0, true, nil, 1, {}),
    defensive = {
    aa = ui.new_combobox("AA", "Anti-aimbot angles", "[acd] Defensive AA", { "Off", "On peek", "Force" }),
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[acd] Pitch", { "Local view", "Semi-up", "Semi-down", "Sway", "Sideways", "Jitter", "Down", "Up", "Random", "Custom" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[acd] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[acd] At targets"),
    yaw = ui.new_combobox("AA", "Anti-aimbot angles", "[acd] Yaw", { "Sideways", "Slow spin", "Medium spin", "Fast spin", "All the sides", "Custom" }),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[acd] First yaw", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[acd] Second yaw", -180, 180, 0, true, nil, 1, {}),
},
},
    Fakelag = {
    pitch = ui.new_combobox("AA", "Anti-aimbot angles", "[lag] Pitch", { "Local view", "Custom", "Down", "Up", "Random" }),
    pitch_slider = ui.new_slider("AA", "Anti-aimbot angles", "[lag] Custom pitch", -89, 89, 0, true, nil, 1, {}),
    at_targets = ui.new_checkbox("AA", "Anti-aimbot angles", "[lag] At targets"),
    left_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[lag] Yaw ~ left", -180, 180, 0, true, nil, 1, {}),
    right_yaw = ui.new_slider("AA", "Anti-aimbot angles", "[lag] Yaw ~ right", -180, 180, 0, true, nil, 1, {}),
    jitter_mode = ui.new_combobox("AA", "Anti-aimbot angles", "[lag] Jitter", { "Center", "Offset", "Random", "3 Way" }),
    jitter_amount = ui.new_slider("AA", "Anti-aimbot angles", "[lag] Jitter ~ amount", -180, 180, 0, true, " ", 1, {}),
    lby = ui.new_combobox("AA", "Anti-aimbot angles", "[lag] Body yaw", { "Off", "Tickcount", "Delayed", "Static", "Opposite" }),
    lbyside = ui.new_combobox("AA", "Anti-aimbot angles", "[lag] side", { "Left", "Right", "Auto" }),
    lbyspeed = ui.new_slider("AA", "Anti-aimbot angles", "[lag] Speed", 1, 10, 6, true, nil, 1, {}),
},
    other = {
    safe_knife = ui.new_checkbox("AA", "Other", "Safe knife"),
    safe_zeus = ui.new_checkbox("AA", "Other", "Safe taser"),
    safe_head = ui.new_checkbox("AA", "Other", "Safe head on height advantage"),
    avoid_backstab = ui.new_checkbox("AA", "Other", "Svoid backstab"),
    static_freestand = ui.new_checkbox("AA", "Other", "Static on fs"),
    flickonmanuls = ui.new_checkbox("AA", "Other", "Slick opposite e on manual & fs"),
    bombsiteefix = ui.new_checkbox("AA", "Other", "Bombsite e fix"),
    legitaa = ui.new_combobox("AA", "Other", "Legit aa", { "off", "2 way", "static", "3 way" }),
},
}
    keybinds_tab = {
    edgeyaw = ui.new_hotkey("AA", "Anti-aimbot angles", "\a8AECF1FF•  \aFFFFFFFF Edge yaw", false),
    freestand = ui.new_hotkey("AA", "Anti-aimbot angles", "\a8AECF1FF•  \aFFFFFFFF Freestand", false),
    manual_left = ui.new_hotkey("AA", "Anti-aimbot angles", "\a8AECF1FF•  \aFFFFFFFF Manual left", false),
    manual_right = ui.new_hotkey("AA", "Anti-aimbot angles", "\a8AECF1FF•  \aFFFFFFFF Manual right", false),
    manual_forward = ui.new_hotkey("AA", "Anti-aimbot angles", "\a8AECF1FF•  \aFFFFFFFF Manual forward", false),
    no_defensive = ui.new_hotkey("AA", "Anti-aimbot angles", "\a8AECF1FF•  \aFFFFFFFF Disable Defensive AA", false),
    hideshots = ui.new_hotkey("AA", "Anti-aimbot angles", "\a8AECF1FF•  \aFFFFFFFF Hideshots", false),
    airstop = ui.new_hotkey("AA", "Anti-aimbot angles", "\a8AECF1FF•  \aFFFFFFFF Scount quickstop in air", false),
}
    ragebot_tab = {
    custom_exploits = ui.new_checkbox("AA", "Anti-aimbot angles", "Improve exploits"),
    aipeek = ui.new_checkbox("AA", "Anti-aimbot angles", "Ai ~ peekbot"),
    resolver = ui.new_checkbox("AA", "Anti-aimbot angles", "Defensive ~ Currect"),
    resolver_lc = ui.new_checkbox("AA", "Anti-aimbot angles", "Resolver ~ lagcomp"),
}
    visuals_tab = {
    pitchzero = ui.new_checkbox("AA", "Anti-aimbot angles", "Pitch zero on land"),
    staticlegs = ui.new_checkbox("AA", "Anti-aimbot angles", "Static legs in air"),
    animfix = ui.new_combobox("AA", "Anti-aimbot angles", "Animfix", { "Off", "Moonwalk", "Nasawalk", "Shake player model" }),
    indicators = ui.new_checkbox("AA", "Anti-aimbot angles", "Replace skeet indicators"),
    watermark = ui.new_checkbox("AA", "Anti-aimbot angles", "Watermark"),
    eventlogs = ui.new_checkbox("AA", "Anti-aimbot angles", "Event logs"),
    center_indicators = ui.new_combobox("AA", "Anti-aimbot angles", "Crosshair inds", { "off", "Modern", "Bounty" }),
    onscope = ui.new_combobox("AA", "Anti-aimbot angles", "On scope animation", { "Off", "Right", "Alpha" }),
    accentlabel = ui.new_label("AA", "Anti-aimbot angles", "Accent color"),
    accent = ui.new_color_picker("AA", "Anti-aimbot angles", "Accent color"),
    arrows = ui.new_combobox("AA", "Anti-aimbot angles", "Arrows", { "Off", "TS4", "Bounty" }),
    clantag = ui.new_checkbox("AA", "Anti-aimbot angles", "Clantag"),
    trashtalk = ui.new_combobox("AA", "Anti-aimbot angles", "Trashtalk", { "Off", "English", "Russian", "Ukrainian", "Dutch" }),
}
    local v249 = "bounty_cfg"
    local v250 = (database.read(v249) or { configs = {} })
    local v251 = {}
    local v252 = {}
    function ui.multiReference(a0_742, a1_744, a2_746)
        local ui_reference_7, v253, v254 = ui.reference(a0_742, a1_744, a2_746)
        return { ui_reference_7, v253, v254 }
    end
    local v255 = {}
    local v256 = {}
    local v257 = {}
    do
        v257.update_list = function(a0_748)
        v251 = {}
        for i258, i259 in pairs(v250.configs) do
            table.insert(v251, i259.name)
        end
        if a0_748 then
            ui.update(v257.listbox, v251)
        end
        return v251
    end
        v257.listbox = ui.new_listbox("AA", "Anti-aimbot angles", "Anti-aim config list", v257.update_list(false))
        v257.textbox = ui.new_textbox("AA", "Anti-aimbot angles", "Anti-aim config name")
        ui.set_callback(v257.listbox, function()
        local ui_get = ui.get(v257.listbox)
        if (ui_get == nil) then
            return
        end
        local v260 = v251[(ui_get + 1)]
        for i261, i262 in pairs(v252) do
            ui.set_visible(i262.ref, false)
        end
        local v263 = v252[v260]
        if (v263 == nil) then
            v252[v260] = {
        ref = ui.new_hotkey("AA", "Fake lag", string.format("Load the config: \ac17f82ff%s", v260)),
        state = false,
        deleted = false,
    }
        else
            ui.set_visible(v263.ref, true)
        end
        ui.set(v257.textbox, v260)
    end)
        v256.Load = ui.new_button("AA", "Anti-aimbot angles", "\a8AECF1FFLoad", function()
        local ui_get_8 = ui.get(v257.listbox)
        if (ui_get_8 == nil) then
            client.error_log("Select a config from listbox before loading")
            return
        end
        local v264 = v250.configs[v251[(ui_get_8 + 1)]]
        if (type(v264) ~= "table") then
            client.error_log("Attempt to load a corrupted or non-existent config")
            return
        end
        for i265, i266 in pairs(v264.values) do
            local v267 = true
            local v268 = v255[i265]
            if (type(v268) == "table") then
                v267 = pcall(ui.set, v268[1], i266[1])
                if not v267 then
                    client.error_log("Attempt to load an outdated config")
                    return
                end
                v267 = pcall(ui.set, v268[2], i266[2])
                if not v267 then
                    client.error_log("Attempt to load an outdated config")
                    return
                end
            else
                v267 = pcall(ui.set, v268, i266)
                if not v267 then
                    client.error_log("Attempt to load an outdated config")
                    return
                end
            end
        end
        v257.update_list(true)
    end)
        v256.Save = ui.new_button("AA", "Anti-aimbot angles", "\a8AECF1FFSave", function()
        local ui_get_9 = ui.get(v257.textbox)
        if (ui_get_9 == "") then
            client.error_log("Fill in the config name textbox before saving")
            return
        end
        local l_274_ = { ["name"] = ui_get_9, ["values"] = {} }
        for i269, i270 in pairs(v255) do
            if (type(i270) == "table") then
                l_274_.values[i269] = { ui.get(i270[1]), ui.get(i270[2]) }
            else
                l_274_.values[i269] = ui.get(i270)
            end
        end
        v250.configs[ui_get_9] = l_274_
        database.write(v249, v250)
        v257.update_list(true)
    end)
        v256.Delete = ui.new_button("AA", "Anti-aimbot angles", "\a8AECF1FFDelete", function()
        local ui_get_10 = ui.get(v257.listbox)
        if (ui_get_10 == nil) then
            client.error_log("Select a config from listbox before deleting")
            return
        end
        local v271 = v251[(ui_get_10 + 1)]
        if (v271 == "nil") then
            client.error_log("Attempt to delete non-existent config")
            return
        end
        v252[v271].deleted = true
        v250.configs[v271] = nil
        database.write(v249, v250)
        v257.update_list(true)
    end)
        v256.Import = ui.new_button("AA", "Anti-aimbot angles", "\a8AECF1FFImport from clipboard", function()
        local v272, v273 = pcall(json.parse, clipboard.get())
        if not v272 then
            client.error_log("Attempt to load an invalid config")
            return
        end
        for i274, i275 in pairs(v273) do
            local v276 = true
            local v277 = v255[i274]
            if (type(v277) == "table") then
                v276 = pcall(ui.set, v277[1], i275[1])
                if not v276 then
                    client.error_log("Attempt to load an outdated config")
                    return
                end
                v276 = pcall(ui.set, v277[2], i275[2])
                if not v276 then
                    client.error_log("Attempt to load an outdated config")
                    return
                end
            else
                v276 = pcall(ui.set, v277, i275)
                if not v276 then
                    client.error_log("Attempt to load an outdated config")
                    return
                end
            end
        end
    end)
        v256.Export = ui.new_button("AA", "Anti-aimbot angles", "\a8AECF1FFExport to clipboard", function()
        local v278 = {}
        for i279, i280 in pairs(v255) do
            if (type(i280) == "table") then
                v278[i279] = { ui.get(i280[1]), ui.get(i280[2]) }
            else
                v278[i279] = ui.get(i280)
            end
        end
        clipboard.set(json.stringify(v278))
    end)
        local v281 = true
    end
    function flattenTable(a0_750, a1_752, a2_754)
        for i282, i283 in pairs(a0_750) do
            local v284 = ((a2_754 and (a2_754 .. ("." .. i282))) or i282)
            if (type(i283) == "table") then
                flattenTable(i283, a1_752, v284)
            else
                a1_752[v284] = i283
            end
        end
    end
    flattenTable(v248, v255)
    flattenTable(visuals_tab, v255)
    flattenTable(ragebot_tab, v255)
    function flattenTableValues(a0_756)
        local v285 = {}
        local function fn148(a0_758)
            for i286, i287 in pairs(a0_758) do
                if (type(i287) == "table") then
                    fn148(i287)
                else
                    table.insert(v285, i287)
                end
            end
        end
        fn148(a0_756)
        return v285
    end
    UI_Export_Condition = ui.new_button("AA", "Fake lag", "\a8AECF1FFExport current condition", function()
        local v288 = {}
        currentcondui = v248[ui.get(ui_new_combobox_6)]
        for i289, i290 in ipairs(flattenTableValues(currentcondui)) do
            table.insert(v288, ui.get(i290))
        end
        clipboard.set(base64.encode(base64.encode(json.stringify(v288), "base64"), "base64"))
    end)
    UI_Import_Condition = ui.new_button("AA", "Fake lag", "\a8AECF1FFImport to current condition", function()
        local json_parse = json.parse(base64.decode(base64.decode(clipboard.get(), "base64"), "base64"))
        currentcondui = v248[ui.get(ui_new_combobox_6)]
        for i291 = 1, #json_parse, 1 do
            ui.set(flattenTableValues(currentcondui)[i291], json_parse[i291])
        end
    end)
    client.set_event_callback("paint_ui", function()
        if (uistate == 1) then
            ui.set_visible(UI_Export_Condition, true)
            ui.set_visible(UI_Import_Condition, true)
        else
            ui.set_visible(UI_Export_Condition, false)
            ui.set_visible(UI_Import_Condition, false)
        end
        fn146(v247)
        if (uistate == 5) then
            ui.set_visible(v257.listbox, true)
            ui.set_visible(v257.textbox, true)
            fn147(v256)
        else
            ui.set_visible(v257.listbox, false)
            ui.set_visible(v257.textbox, false)
            fn146(v256)
            for i292, i293 in pairs(v252) do
                ui.set_visible(i293.ref, false)
            end
        end
        if (uistate ~= 1) then
            fn146(v248)
            ui.set_visible(ui_new_combobox_6, false)
            ui.set_visible(ui_new_combobox, false)
        else
            currentcondition = v248[ui.get(ui_new_combobox_6)]
            ui.set_visible(ui_new_combobox, true)
            fn146(v248)
            fn147(v248.other)
            if (ui.get(ui_new_combobox) == "Custom") then
                fn147(currentcondition)
                ui.set_visible(ui_new_combobox_6, true)
                if (ui.get(currentcondition.pitch) ~= "Custom") then
                    ui.set_visible(currentcondition.pitch_slider, false)
                else
                    ui.set_visible(currentcondition.pitch_slider, true)
                end
                if (ui.get(currentcondition.lby) == "Tickcount") then
                    ui.set_visible(currentcondition.lbyside, false)
                    ui.set_visible(currentcondition.lbyspeed, false)
                end
                if ((ui.get(currentcondition.lby) == "Static") or (ui.get(currentcondition.lby) == "Opposite")) then
                    ui.set_visible(currentcondition.lbyside, true)
                    ui.set_visible(currentcondition.lbyspeed, false)
                end
                if (ui.get(currentcondition.lby) == "Delayed") then
                    ui.set_visible(currentcondition.lbyside, false)
                    ui.set_visible(currentcondition.lbyspeed, true)
                end
                if (ui.get(currentcondition.lby) == "Off") then
                    ui.set_visible(currentcondition.lbyside, false)
                    ui.set_visible(currentcondition.lbyspeed, false)
                end
                if (ui.get(ui_new_combobox_6) ~= "Fakelag") then
                    if (ui.get(currentcondition.defensive.aa) == "Off") then
                        fn146(currentcondition.defensive)
                        ui.set_visible(currentcondition.defensive.aa, true)
                    else
                        fn147(currentcondition.defensive)
                        if (ui.get(currentcondition.defensive.pitch) ~= "Custom") then
                            ui.set_visible(currentcondition.defensive.pitch_slider, false)
                        else
                            ui.set_visible(currentcondition.defensive.pitch_slider, true)
                        end
                        if (ui.get(currentcondition.defensive.yaw) ~= "Custom") then
                            ui.set_visible(currentcondition.defensive.left_yaw, false)
                            ui.set_visible(currentcondition.defensive.right_yaw, false)
                        else
                            ui.set_visible(currentcondition.defensive.left_yaw, true)
                            ui.set_visible(currentcondition.defensive.right_yaw, true)
                        end
                    end
                end
            else
                fn146(currentcondition.defensive)
                fn146(currentcondition)
                ui.set_visible(ui_new_combobox_6, false)
            end
        end
        if (uistate == 6) then
            fn147(keybinds_tab)
        else
            fn146(keybinds_tab)
        end
        if (uistate == 2) then
            fn147(ragebot_tab)
        else
            fn146(ragebot_tab)
        end
        if (uistate == 3) then
            fn147(visuals_tab)
        else
            fn146(visuals_tab)
        end
    end)
    local v294 = function(a0_760, a1_762)
        local v295 = {}
        for i296 = 1, a1_762, 1 do
            v295[i296] = a0_760
        end
        return v295
    end
    local v297 = function(a0_764, a1_766, a2_768)
        local v298 = a0_764
        if (a2_768 or (v298[#v298] ~= a1_766)) then
            table.insert(v298, a1_766)
            table.remove(v298, 1)
        end
        a0_764 = v298
    end
    local v299 = function(a0_770)
        local v300, v301 = 0, 0
        for i302, i303 in pairs(a0_770) do
            v301 = (v301 + i303)
            v300 = (v300 + 1)
        end
        return (v301 / v300)
    end
    breaker = {
    defensive = 0,
    defensive_check = 0,
    cmd = 0,
    last_origin = nil,
    origin = nil,
    tp_dist = 0,
    tp_data = v294(0, 3),
    chokes = 0,
}
    function get_velocity(a0_772)
        local entity_get_prop, v304, v305 = entity.get_prop(a0_772, "m_vecVelocity")
        if (entity_get_prop == nil) then
            return
        end
        return math.sqrt((((entity_get_prop * entity_get_prop) + (v304 * v304)) + (v305 * v305)))
    end
    tickbase = nil
    forrealtime = 0
    function smoothJitter(a0_774, a1_776, a2_778)
        if (globals.curtime() > (forrealtime + (1 / (a2_778 * 2)))) then
            finalyawgg = a0_774
            if ((globals.curtime() - forrealtime) > (2 / (a2_778 * 2))) then
                forrealtime = globals.curtime(entity.get_local_player(), "m_flPoseParameter")
            end
        else
            finalyawgg = a1_776
        end
        return finalyawgg
    end
    client.set_event_callback("run_command", function(a0_780)
        breaker.cmd = a0_780.command_number
        me = entity.get_local_player()
        if (not me or not entity.is_alive(me)) then
            breaker.defensive_check = 0
            return
        end
        if (math.abs(((tickbase - breaker.defensive_check) - 1)) > 128) then
            breaker.defensive_check = 0
        end
    end)
    client.set_event_callback("predict_command", function(a0_782)
        me = entity.get_local_player()
        tickbase = entity.get_prop(entity.get_local_player(), "m_nTickBase")
        breaker.defensive_check = math.max(tickbase, breaker.defensive_check)
        if (not me or not entity.is_alive(me)) then
            breaker.defensive_check = 0
            return
        end
        if (math.abs(((tickbase - breaker.defensive_check) - 1)) > 128) then
            breaker.defensive_check = 0
            return
        end
        breaker.defensive = 0
        if (breaker.cmd == a0_782.command_number) then
            if (tickbase > breaker.defensive_check) then
                breaker.defensive_check = tickbase
            elseif (breaker.defensive_check > tickbase) then
                breaker.defensive = (tickbase - breaker.defensive_check)
            end
        end
        if (math.abs(((tickbase - breaker.defensive_check) - 2)) > 128) then
            breaker.defensive_check = 0
            return
        end
    end)
    client.set_event_callback("level_init", function()
        breaker.cmd = 0
        breaker.defensive_check = 0
        forrealtime = 0
    end)
    client.set_event_callback("round_start", function()
        breaker.cmd = 0
        breaker.defensive_check = 0
    end)
    function desyncside()
        if (not entity.get_local_player() or not entity.is_alive(entity.get_local_player())) then
            return
        end
        local v306 = ((entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * 120) - 60)
        local v307 = (((v306 > 0) and -1) or 1)
        return v307
    end
    condtotake = ""
    function calculate_body_fs()
        if (not entity.get_local_player() or not client.current_threat()) then
            return 1
        end
        local entity_hitbox_position, v308, v309 = entity.hitbox_position(entity.get_local_player(), 0)
        local entity_hitbox_position_11, v310, v311 = entity.hitbox_position(client.current_threat(), 0)
        local v312
        if ((entity_hitbox_position_11 - entity_hitbox_position) < 10) then
            v312 = -1
        else
            v312 = 1
        end
        return v312
    end
    local fn150 = { condition = "" }
    local lp_ground_ticks = { lp = entity.get_local_player(), ground_ticks = 0 }
    skeetfakelaglimit = ui.reference("AA", "Fake lag", "Limit")
    skeetfakelagamount = ui.reference("AA", "Fake lag", "Amount")
    local v313 = {
    multipoint = ui.multiReference("RAGE", "Aimbot", "Multi-point scale"),
    doubletap = ui.multiReference("RAGE", "Aimbot", "Double tap"),
    hideshots = ui.multiReference("AA", "Other", "On shot anti-aim"),
    freestand = ui.multiReference("AA", "Anti-aimbot angles", "Freestanding"),
    dmg = ui.multiReference("RAGE", "Aimbot", "Minimum damage override"),
}
    function lp_ground_ticks:is_on_ground()
        lp = entity.get_local_player()
        if not lp then
            return
        end
        local entity_get_prop_12 = entity.get_prop(lp, "m_fFlags")
        if (bit.band(entity_get_prop_12, 1) == 0) then
            lp_ground_ticks.ground_ticks = 0
        elseif (lp_ground_ticks.ground_ticks <= 45) then
            lp_ground_ticks.ground_ticks = (lp_ground_ticks.ground_ticks + 1)
        end
        return (lp_ground_ticks.ground_ticks >= 45)
    end
    function fn150:get_condition_type()
        lp = entity.get_local_player()
        if (not lp or not entity.is_alive(lp)) then
            return
        end
        if not entity.is_alive(lp) then
            return
        end
        local entity_get_prop_13 = entity.get_prop(lp, "m_flDuckAmount")
        local v314 = vector(entity.get_prop(lp, "m_vecVelocity")):length()
        if (((ui.get(v313.doubletap[1]) and ui.get(v313.doubletap[2])) and not ui.get(v247.antiaim.fd)) or ((ui.get(v313.hideshots[1]) and not ui.get(v247.antiaim.fd)) and ui.get(v313.hideshots[2]))) then
            if (not lp_ground_ticks:is_on_ground() and (entity_get_prop_13 == 0)) then
                return "Jumping"
            elseif ((entity_get_prop_13 > 0) and not lp_ground_ticks:is_on_ground()) then
                return "Aircrouching"
            elseif ((((entity_get_prop_13 > 0) and (v314 < 3)) and lp_ground_ticks:is_on_ground()) and not ui.get(v247.antiaim.fd)) then
                return "Crouching"
            elseif ((((entity_get_prop_13 > 0) and (v314 > 3)) and lp_ground_ticks:is_on_ground()) and not ui.get(v247.antiaim.fd)) then
                return "Crouchrunning"
            elseif ((v314 > 2) and not ui.get(v247.antiaim.slow_motion[2])) then
                return "Running"
            elseif ui.get(v247.antiaim.slow_motion[2]) then
                return "Slowmotion"
            else
                return "Standing"
            end
        else
            return "Fakelag"
        end
    end
    function fn150:get_fakelag_cond()
        lp = entity.get_local_player()
        if (not lp or not entity.is_alive(lp)) then
            return
        end
        if not entity.is_alive(lp) then
            return
        end
        local entity_get_prop_14 = entity.get_prop(lp, "m_flDuckAmount")
        local v315 = vector(entity.get_prop(lp, "m_vecVelocity")):length()
        if (not lp_ground_ticks:is_on_ground() and (entity_get_prop_14 == 0)) then
            return "Jumping"
        elseif ((entity_get_prop_14 > 0) and not lp_ground_ticks:is_on_ground()) then
            return "Aircrouching"
        elseif ((((entity_get_prop_14 > 0) and (v315 < 3)) and lp_ground_ticks:is_on_ground()) and not ui.get(v247.antiaim.fd)) then
            return "Crouching"
        elseif ((((entity_get_prop_14 > 0) and (v315 > 3)) and lp_ground_ticks:is_on_ground()) and not ui.get(v247.antiaim.fd)) then
            return "Crouchrunning"
        elseif ((v315 > 2) and not ui.get(v247.antiaim.slow_motion[2])) then
            return "Running"
        elseif ui.get(v247.antiaim.slow_motion[2]) then
            return "Slowmotion"
        else
            return "Standing"
        end
    end
    local v316 = true
    local v317 = 0
    function customsway()
        if (v316 == true) then
            v317 = (v317 + 0.11)
            if (v317 > 1) then
                v316 = false
            end
        else
            v317 = (v317 - 0.11)
            if (v317 < 0) then
                v317 = 0
                v316 = true
            end
        end
        return v317
    end
    local function fn151(a0_784, a1_786)
        local v318 = vector(entity.get_prop(a0_784, "m_vecOrigin"))
        local v319 = vector(entity.get_prop(a1_786, "m_vecOrigin"))
        local v320 = v318:dist(v319)
        return v320
    end
    local function fn152(a0_788)
        local entity_get_local_player_15 = entity.get_local_player()
        local entity_hitbox_position_16, v321, v322 = entity.hitbox_position(entity_get_local_player_15, 0)
        local entity_hitbox_position_17, v323, v324 = entity.hitbox_position(a0_788, 0)
        local client_trace_line, v325 = client.trace_line(entity_get_local_player_15, entity_hitbox_position_16, v321, v322, entity_hitbox_position_17, v323, v324)
        return (client_trace_line > 0.65)
    end
    client.set_event_callback("setup_command", function(a0_790)
        me = entity.get_local_player()
        if (not me or not entity.is_alive(me)) then
            return
        end
        breaker.tickbase_check = (globals.tickcount() > entity.get_prop(me, "m_nTickbase"))
    end)
    local function fn153()
        local client_current_threat = client.current_threat()
        local entity_get_local_player_18 = entity.get_local_player()
        if (not client_current_threat or not entity_get_local_player_18) then
            return false
        end
        if ((((entity.get_classname(entity.get_player_weapon(client_current_threat)) == "CKnife") and fn152(client_current_threat)) and (fn151(entity_get_local_player_18, client_current_threat) < 450)) and (client_current_threat ~= nil)) then
            return true
        else
            return false
        end
    end
    function safeheadtarget()
        local client_current_threat_19 = client.current_threat()
        if (client_current_threat_19 == nil) then
            return false
        end
        if ((entity.get_classname(entity.get_player_weapon(client_current_threat_19)) ~= "CKnife") and (fn151(lp, client_current_threat_19) > 25)) then
            local v326 = vector(entity.get_origin(entity.get_local_player()))
            local v327 = vector(entity.get_origin(client_current_threat_19))
            return ((v326.z - v327.z) > 70)
        else
            return false
        end
    end
    freestand, freestandkey = ui.reference("AA", "Anti-aimbot angles", "Freestanding")
    last_press_t = 0
    client.set_event_callback("paint_ui", function()
        if ui.get(keybinds_tab.hideshots) then
            ui.set(v313.hideshots[1], true)
            ui.set(v313.hideshots[2], "Always on")
        else
            ui.set(v313.hideshots[1], false)
            ui.set(v313.hideshots[2], "On hotkey")
        end
        if ui.get(keybinds_tab.edgeyaw) then
            ui.set(v247.antiaim.edgeyaw, true)
        else
            ui.set(v247.antiaim.edgeyaw, false)
        end
        ui.set(keybinds_tab.manual_right, "On hotkey")
        ui.set(keybinds_tab.manual_left, "On hotkey")
        ui.set(keybinds_tab.manual_forward, "On hotkey")
        if (ui.get(keybinds_tab.manual_right) and ((last_press_t + 0.2) < globals.curtime())) then
            manual_dir = (((manual_dir == 2) and 0) or 2)
            last_press_t = globals.curtime()
        elseif (ui.get(keybinds_tab.manual_left) and ((last_press_t + 0.2) < globals.curtime())) then
            manual_dir = (((manual_dir == 1) and 0) or 1)
            last_press_t = globals.curtime()
        elseif (ui.get(keybinds_tab.manual_forward) and ((last_press_t + 0.2) < globals.curtime())) then
            manual_dir = (((manual_dir == 3) and 0) or 3)
            last_press_t = globals.curtime()
        elseif (last_press_t > globals.curtime()) then
            last_press_t = globals.curtime()
        end
        if (ui.get(keybinds_tab.freestand) and (manual_dir == 0)) then
            ui.set(freestand, true)
            ui.set(freestandkey, "Always on")
        else
            ui.set(freestand, false)
            ui.set(freestandkey, "On hotkey")
        end
    end)
    abstoflick = 0
    clamper = function(a0_792)
        if (a0_792 > 180) then
            return ((-180 + a0_792) - 180)
        elseif (a0_792 < -180) then
            return (180 - (-180 - a0_792))
        end
    end
    manual_dir = 0
    client.set_event_callback("setup_command", function(a0_794)
        local v328 = ((v299(breaker.tp_data) / get_velocity(entity.get_local_player())) * 100)
        exploiting = (((ui.get(v313.doubletap[1]) and ui.get(v313.doubletap[2])) and not ui.get(v247.antiaim.fd)) or ((ui.get(v313.hideshots[1]) and not ui.get(v247.antiaim.fd)) and ui.get(v313.hideshots[2])))
        is_defensive = ((((not ui.get(keybinds_tab.no_defensive) and breaker.tickbase_check) and (breaker.defensive < -2)) and (not breaker.defensive ~= -15)) and exploiting)
        handle_aa = function(a0_796, a1_798, a2_800, a3_802, a4_804, a5_806, a6_808, a7_810, a8_812, a9_814, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19)
            if (ui.get(ui_new_combobox) == "Custom") then
                if (a13 == "Force") then
                    a0_794.force_defensive = 1
                end
                if (a0_796 == "Local view") then
                    ui.set(v247.antiaim.pitch[1], "Off")
                elseif (a0_796 == "Custom") then
                    ui.set(v247.antiaim.pitch[1], "Custom")
                    ui.set(v247.antiaim.pitch[2], a1_798)
                elseif (a0_796 == "Down") then
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                else
                    ui.set(v247.antiaim.pitch[1], a0_796)
                end
                if a2_800 then
                    ui.set(v247.antiaim.yaw_base, "At targets")
                else
                    ui.set(v247.antiaim.yaw_base, "Local view")
                end
                ui.set(v247.antiaim.yaw[1], "180")
                if (desyncside() == -1) then
                    ui.set(v247.antiaim.yaw[2], a3_802)
                else
                    ui.set(v247.antiaim.yaw[2], a4_804)
                end
                if (a5_806 == "3 Way") then
                    ui.set(v247.antiaim.jitter[1], "Skitter")
                    ui.set(v247.antiaim.jitter[2], a6_808)
                else
                    ui.set(v247.antiaim.jitter[1], a5_806)
                    ui.set(v247.antiaim.jitter[2], a6_808)
                end
                ui.set(v247.antiaim.fs_body_yaw, false)
                if (a7_810 == "Opposite") then
                    ui.set(v247.antiaim.body_yaw[1], "Opposite")
                    ui.set(v247.antiaim.fs_body_yaw, true)
                elseif (a7_810 == "Static") then
                    ui.set(v247.antiaim.body_yaw[1], "Static")
                    if (a8_812 == "Left") then
                        ui.set(v247.antiaim.body_yaw[2], -58)
                    elseif (a8_812 == "Right") then
                        ui.set(v247.antiaim.body_yaw[2], 58)
                    elseif (a8_812 == "Auto") then
                        ui.set(v247.antiaim.body_yaw[2], (58 * calculate_body_fs()))
                    end
                elseif (a7_810 == "Tickcount") then
                    ui.set(v247.antiaim.body_yaw[1], "Jitter")
                    ui.set(v247.antiaim.body_yaw[2], -1)
                elseif (a7_810 == "Delayed") then
                    ui.set(v247.antiaim.body_yaw[1], "Static")
                    ui.set(v247.antiaim.body_yaw[2], smoothJitter(1, -1, a9_814))
                elseif (a7_810 == "Off") then
                    ui.set(v247.antiaim.body_yaw[1], "Off")
                end
                ui.set(v247.antiaim.fakelagenabled[1], true)
                ui.set(v247.antiaim.fakelagamount[1], a10)
                ui.set(skeetfakelaglimit, a12)
                ui.set(v247.antiaim.fakelagvariance[1], a11)
            elseif (ui.get(ui_new_combobox) == "Ai-based") then
                ui.set(v247.antiaim.fakelagenabled[1], true)
                ui.set(v247.antiaim.fakelagamount[1], "Maximum")
                ui.set(skeetfakelaglimit, 14)
                ui.set(v247.antiaim.fakelagvariance[1], 1)
                if (fn150:get_condition_type() == "Crouching") then
                    a0_794.force_defensive = 1
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "At targets")
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Jitter")
                    ui.set(v247.antiaim.body_yaw[2], -1)
                    ui.set(v247.antiaim.yaw[1], "180")
                    if (desyncside() == -1) then
                        ui.set(v247.antiaim.yaw[2], -25)
                    else
                        ui.set(v247.antiaim.yaw[2], 44)
                    end
                elseif (fn150:get_condition_type() == "Crouchrunning") then
                    a0_794.force_defensive = 1
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "At targets")
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Static")
                    ui.set(v247.antiaim.body_yaw[2], smoothJitter(-60, 60, 3))
                    ui.set(v247.antiaim.yaw[1], "180")
                    if (desyncside() == -1) then
                        ui.set(v247.antiaim.yaw[2], -31)
                    else
                        ui.set(v247.antiaim.yaw[2], 56)
                    end
                elseif (fn150:get_condition_type() == "Standing") then
                    a0_794.force_defensive = 1
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "At targets")
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Jitter")
                    ui.set(v247.antiaim.body_yaw[2], -1)
                    ui.set(v247.antiaim.yaw[1], "180")
                    if (desyncside() == -1) then
                        ui.set(v247.antiaim.yaw[2], -1)
                    else
                        ui.set(v247.antiaim.yaw[2], 24)
                    end
                elseif (fn150:get_condition_type() == "Slowmotion") then
                    a0_794.force_defensive = 1
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "At targets")
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Static")
                    ui.set(v247.antiaim.body_yaw[2], -1)
                    ui.set(v247.antiaim.yaw[1], "180")
                    ui.set(v247.antiaim.yaw[2], 0)
                elseif (fn150:get_condition_type() == "Running") then
                    a0_794.force_defensive = 0
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "At targets")
                    ui.set(v247.antiaim.jitter[1], "Random")
                    ui.set(v247.antiaim.jitter[2], -3)
                    ui.set(v247.antiaim.body_yaw[1], "Static")
                    ui.set(v247.antiaim.body_yaw[2], smoothJitter(-60, 60, 3))
                    ui.set(v247.antiaim.yaw[1], "180")
                    if (desyncside() == -1) then
                        ui.set(v247.antiaim.yaw[2], -30)
                    else
                        ui.set(v247.antiaim.yaw[2], 48)
                    end
                elseif (fn150:get_condition_type() == "Jumping") then
                    a0_794.force_defensive = 1
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "At targets")
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Jitter")
                    ui.set(v247.antiaim.body_yaw[2], -1)
                    ui.set(v247.antiaim.yaw[1], "180")
                    if (desyncside() == -1) then
                        ui.set(v247.antiaim.yaw[2], -6)
                    else
                        ui.set(v247.antiaim.yaw[2], 27)
                    end
                elseif (fn150:get_condition_type() == "Aircrouching") then
                    a0_794.force_defensive = 1
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "At targets")
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Static")
                    ui.set(v247.antiaim.body_yaw[2], smoothJitter(-60, 60, 10))
                    ui.set(v247.antiaim.yaw[1], "180")
                    if (desyncside() == -1) then
                        ui.set(v247.antiaim.yaw[2], -31)
                    else
                        ui.set(v247.antiaim.yaw[2], 57)
                    end
                elseif (fn150:get_condition_type() == "Fakelag") then
                    a0_794.force_defensive = 0
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "At targets")
                    ui.set(v247.antiaim.jitter[1], "Center")
                    ui.set(v247.antiaim.jitter[2], 66)
                    ui.set(v247.antiaim.body_yaw[1], "Off")
                    ui.set(v247.antiaim.yaw[1], "180")
                    ui.set(v247.antiaim.yaw[2], 7)
                end
            end
            if ((ui.get(v248.other.safe_knife) and (fn150:get_condition_type() == "Aircrouching")) and (entity.get_classname(entity.get_player_weapon(entity.get_local_player())) == "CKnife")) then
                ui.set(v247.antiaim.pitch[1], "Minimal")
                ui.set(v247.antiaim.yaw_base, "At targets")
                ui.set(v247.antiaim.yaw[1], "180")
                ui.set(v247.antiaim.yaw[2], 0)
                ui.set(v247.antiaim.jitter[1], "Offset")
                ui.set(v247.antiaim.jitter[2], 0)
                ui.set(v247.antiaim.body_yaw[1], "Static")
                ui.set(v247.antiaim.body_yaw[2], 0)
                ui.set(v247.antiaim.fs_body_yaw, false)
            end
            if ((ui.get(v248.other.safe_zeus) and (fn150:get_condition_type() == "Aircrouching")) and (entity.get_classname(entity.get_player_weapon(entity.get_local_player())) == "CWeaponTaser")) then
                ui.set(v247.antiaim.pitch[1], "Custom")
                ui.set(v247.antiaim.pitch[2], 89)
                ui.set(v247.antiaim.yaw_base, "At targets")
                ui.set(v247.antiaim.yaw[1], "180")
                ui.set(v247.antiaim.yaw[2], 0)
                ui.set(v247.antiaim.jitter[1], "Random")
                ui.set(v247.antiaim.jitter[2], 0)
                ui.set(v247.antiaim.body_yaw[1], "Static")
                ui.set(v247.antiaim.body_yaw[2], 0)
                ui.set(v247.antiaim.fs_body_yaw, false)
            end
            if ((ui.get(v248.other.safe_head) and safeheadtarget()) and (((((fn150:get_condition_type() == "Aircrouching") or (fn150:get_condition_type() == "Crouching")) or (fn150:get_condition_type() == "Crouchrunning")) or (fn150:get_condition_type() == "Standing")) or (fn150:get_condition_type() == "Fakelag"))) then
                ui.set(v247.antiaim.pitch[1], "Minimal")
                ui.set(v247.antiaim.yaw_base, "At targets")
                ui.set(v247.antiaim.yaw[1], "180")
                ui.set(v247.antiaim.yaw[2], 0)
                ui.set(v247.antiaim.jitter[1], "Offset")
                ui.set(v247.antiaim.jitter[2], 0)
                ui.set(v247.antiaim.body_yaw[1], "Static")
                ui.set(v247.antiaim.body_yaw[2], 0)
                ui.set(v247.antiaim.fs_body_yaw, false)
            end
            if (ui.get(v248.other.static_freestand) and ui.get(keybinds_tab.freestand)) then
                if ui.get(v248.other.flickonmanuls) then
                    a0_794.force_defensive = 1
                end
                if (ui.get(v248.other.flickonmanuls) and is_defensive) then
                    a0_794.yaw = ((abstoflick + 180) + math.random(-10, 10))
                    a0_794.pitch = (1080 + math.random(-25, 10))
                    a0_794.force_defensive = 1
                    ui.set(v247.antiaim.pitch[1], "Custom")
                    ui.set(v247.antiaim.pitch[2], 0)
                    ui.set(v247.antiaim.yaw_base, "Local view")
                    ui.set(v247.antiaim.yaw[1], "180")
                    ui.set(v247.antiaim.yaw[2], clamper(abstoflick))
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Static")
                    ui.set(v247.antiaim.body_yaw[2], 0)
                    ui.set(v247.antiaim.fs_body_yaw, false)
                else
                    abstoflick = antiaim.get_abs_yaw()
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "At targets")
                    ui.set(v247.antiaim.yaw[1], "180")
                    ui.set(v247.antiaim.yaw[2], 0)
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Static")
                    ui.set(v247.antiaim.body_yaw[2], 0)
                    ui.set(v247.antiaim.fs_body_yaw, true)
                end
            end
            if (ui.get(ui_new_combobox) == "Custom") then
                if (is_defensive and (a13 ~= "Off")) then
                    ui.set(v247.antiaim.body_yaw[1], "Off")
                    if (a14 == "Local view") then
                        ui.set(v247.antiaim.pitch[1], "Off")
                    elseif (a14 == "Sideways") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], (-69 - (19 * customsway())))
                    elseif (a14 == "Jitter") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], smoothJitter(45, -45, 7.5))
                    elseif (a14 == "Sway") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], (-80 * customsway()))
                    elseif (a14 == "Custom") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], a15)
                    elseif (a14 == "Semi-up") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], -45)
                    elseif (a14 == "Semi-down") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], 45)
                    elseif (a14 == "Up") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], -89)
                    elseif (a14 == "Down") then
                        ui.set(v247.antiaim.pitch[1], "Minimal")
                    elseif (a14 == "Random") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], math.random(-80, 80))
                    end
                    if a16 then
                        ui.set(v247.antiaim.yaw_base, "At targets")
                    else
                        ui.set(v247.antiaim.yaw_base, "Local view")
                    end
                    if (a17 ~= "All the sides") then
                        ui.set(v247.antiaim.jitter[1], "Random")
                        ui.set(v247.antiaim.jitter[2], 0)
                        if (a17 == "Slow spin") then
                            ui.set(v247.antiaim.yaw[1], "Spin")
                            ui.set(v247.antiaim.yaw[2], math.random(5, 8))
                        elseif (a17 == "Medium spin") then
                            ui.set(v247.antiaim.yaw[1], "Spin")
                            ui.set(v247.antiaim.yaw[2], 38)
                        elseif (a17 == "Fast spin") then
                            ui.set(v247.antiaim.yaw[1], "Spin")
                            ui.set(v247.antiaim.yaw[2], math.random(119, 121))
                        elseif (a17 == "Sideways") then
                            ui.set(v247.antiaim.yaw[1], "180")
                            ui.set(v247.antiaim.yaw[2], smoothJitter(math.random(-81, -109), math.random(81, 109), 10))
                        elseif (a17 == "Custom") then
                            ui.set(v247.antiaim.yaw[1], "180")
                            ui.set(v247.antiaim.yaw[2], smoothJitter(a18, a19, 10))
                        end
                    else
                        ui.set(v247.antiaim.yaw[1], "180")
                        ui.set(v247.antiaim.yaw[2], smoothJitter(math.random(20, 160), math.random(-160, -20), 10))
                    end
                end
            elseif (ui.get(ui_new_combobox) == "Ai-based") then
                if is_defensive then
                    if (fn150:get_condition_type() == "Crouching") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], 0)
                        ui.set(v247.antiaim.yaw_base, "At targets")
                        ui.set(v247.antiaim.jitter[1], "Offset")
                        ui.set(v247.antiaim.jitter[2], 0)
                        ui.set(v247.antiaim.body_yaw[1], "Off")
                        ui.set(v247.antiaim.yaw[1], "Spin")
                        ui.set(v247.antiaim.yaw[2], math.random(5, 8))
                    elseif (fn150:get_condition_type() == "Crouchrunning") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], ui.set(v247.antiaim.pitch[2], (-80 * customsway())))
                        ui.set(v247.antiaim.yaw_base, "At targets")
                        ui.set(v247.antiaim.jitter[1], "Offset")
                        ui.set(v247.antiaim.jitter[2], 0)
                        ui.set(v247.antiaim.body_yaw[1], "Off")
                        ui.set(v247.antiaim.yaw[1], "180")
                        ui.set(v247.antiaim.yaw[2], smoothJitter(math.random(-70, -92), math.random(90, 112), 12))
                    elseif (fn150:get_condition_type() == "Standing") then
                        ui.set(v247.antiaim.pitch[1], "Up")
                        ui.set(v247.antiaim.yaw_base, "At targets")
                        ui.set(v247.antiaim.jitter[1], "Offset")
                        ui.set(v247.antiaim.jitter[2], 0)
                        ui.set(v247.antiaim.body_yaw[1], "Off")
                        ui.set(v247.antiaim.yaw[1], "Spin")
                        ui.set(v247.antiaim.yaw[2], math.random(5, 8))
                    elseif (fn150:get_condition_type() == "Slowmotion") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], -45)
                        ui.set(v247.antiaim.yaw_base, "At targets")
                        ui.set(v247.antiaim.jitter[1], "Offset")
                        ui.set(v247.antiaim.jitter[2], 0)
                        ui.set(v247.antiaim.body_yaw[1], "Off")
                        ui.set(v247.antiaim.yaw[1], "Spin")
                        ui.set(v247.antiaim.yaw[2], math.random(5, 8))
                    elseif (fn150:get_condition_type() == "Running") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], 0)
                        ui.set(v247.antiaim.yaw_base, "At targets")
                        ui.set(v247.antiaim.jitter[1], "Offset")
                        ui.set(v247.antiaim.jitter[2], 0)
                        ui.set(v247.antiaim.body_yaw[1], "Off")
                        ui.set(v247.antiaim.yaw[1], "Spin")
                        ui.set(v247.antiaim.yaw[2], math.random(119, 121))
                    elseif (fn150:get_condition_type() == "Jumping") then
                        ui.set(v247.antiaim.pitch[1], "Custom")
                        ui.set(v247.antiaim.pitch[2], smoothJitter(45, -45, smoothJitter(15, 8, 9)))
                        ui.set(v247.antiaim.yaw_base, "At targets")
                        ui.set(v247.antiaim.jitter[1], "Offset")
                        ui.set(v247.antiaim.jitter[2], 0)
                        ui.set(v247.antiaim.body_yaw[1], "Off")
                        ui.set(v247.antiaim.yaw[1], "180")
                        ui.set(v247.antiaim.yaw[2], smoothJitter(math.random(-70, -92), math.random(90, 112), 12))
                    elseif (fn150:get_condition_type() == "Aircrouching") then
                        ui.set(v247.antiaim.pitch[1], "Minimal")
                        ui.set(v247.antiaim.yaw_base, "At targets")
                        ui.set(v247.antiaim.jitter[1], "Offset")
                        ui.set(v247.antiaim.jitter[2], 0)
                        ui.set(v247.antiaim.body_yaw[1], "Off")
                        ui.set(v247.antiaim.yaw[1], "180")
                        ui.set(v247.antiaim.yaw[2], smoothJitter(-130, 142, 10))
                    end
                end
            end
            local entity_get_local_player_20 = entity.get_local_player()
            local entity_get_prop_21 = entity.get_prop(entity_get_local_player_20, "m_flNextAttack")
            local entity_get_prop_22 = entity.get_prop(entity.get_player_weapon(entity_get_local_player_20), "m_flNextPrimaryAttack")
            local v329 = false
            local v330 = (ui.get(v313.doubletap[1]) and ui.get(v313.doubletap[2]))
            if (entity_get_prop_22 ~= nil) then
                v329 = not (math.max(entity_get_prop_22, entity_get_prop_21) > globals.curtime())
            end
            if (((((not is_defensive and (a13 == "Force")) and ui.get(ragebot_tab.custom_exploits)) and v330) and v329) and (fn150:get_condition_type() ~= "Fakelag")) then
                ui.set(v247.antiaim.yaw[1], "180")
                ui.set(v247.antiaim.yaw[2], 0)
                ui.set(v247.antiaim.jitter[1], "Off")
                ui.set(v247.antiaim.body_yaw[1], "Off")
            end
            if (manual_dir == 2) then
                a0_794.force_defensive = 1
                if (not is_defensive or not ui.get(v248.other.flickonmanuls)) then
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "Local view")
                    ui.set(v247.antiaim.yaw[1], "180")
                    ui.set(v247.antiaim.yaw[2], 90)
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Off")
                    ui.set(v247.antiaim.body_yaw[2], 0)
                    ui.set(v247.antiaim.fs_body_yaw, false)
                else
                    ui.set(v247.antiaim.pitch[1], "Custom")
                    ui.set(v247.antiaim.pitch[2], 0)
                    ui.set(v247.antiaim.yaw_base, "Local view")
                    ui.set(v247.antiaim.yaw[1], "180")
                    ui.set(v247.antiaim.yaw[2], -90)
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Off")
                    ui.set(v247.antiaim.body_yaw[2], 0)
                    ui.set(v247.antiaim.fs_body_yaw, false)
                end
            elseif (manual_dir == 1) then
                a0_794.force_defensive = 1
                if (not is_defensive or not ui.get(v248.other.flickonmanuls)) then
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "Local view")
                    ui.set(v247.antiaim.yaw[1], "180")
                    ui.set(v247.antiaim.yaw[2], -90)
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Off")
                    ui.set(v247.antiaim.body_yaw[2], 0)
                    ui.set(v247.antiaim.fs_body_yaw, false)
                else
                    ui.set(v247.antiaim.pitch[1], "Custom")
                    ui.set(v247.antiaim.pitch[2], 0)
                    ui.set(v247.antiaim.yaw_base, "Local view")
                    ui.set(v247.antiaim.yaw[1], "180")
                    ui.set(v247.antiaim.yaw[2], 90)
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Off")
                    ui.set(v247.antiaim.body_yaw[2], 0)
                    ui.set(v247.antiaim.fs_body_yaw, false)
                end
            elseif (manual_dir == 3) then
                a0_794.force_defensive = 1
                if (not is_defensive or not ui.get(v248.other.flickonmanuls)) then
                    ui.set(v247.antiaim.pitch[1], "Minimal")
                    ui.set(v247.antiaim.yaw_base, "Local view")
                    ui.set(v247.antiaim.yaw[1], "180")
                    ui.set(v247.antiaim.yaw[2], 180)
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Off")
                    ui.set(v247.antiaim.body_yaw[2], 0)
                    ui.set(v247.antiaim.fs_body_yaw, false)
                else
                    ui.set(v247.antiaim.pitch[1], "Custom")
                    ui.set(v247.antiaim.pitch[2], 0)
                    ui.set(v247.antiaim.yaw_base, "Local view")
                    ui.set(v247.antiaim.yaw[1], "180")
                    ui.set(v247.antiaim.yaw[2], 0)
                    ui.set(v247.antiaim.jitter[1], "Offset")
                    ui.set(v247.antiaim.jitter[2], 0)
                    ui.set(v247.antiaim.body_yaw[1], "Off")
                    ui.set(v247.antiaim.body_yaw[2], 0)
                    ui.set(v247.antiaim.fs_body_yaw, false)
                end
            end
        end
        condtotake = v248[fn150:get_condition_type()]
        condtotakeflags = v248[fn150:get_fakelag_cond()]
        local ui_get_23 = ui.get(condtotake.pitch)
        local ui_get_24 = ui.get(condtotake.pitch_slider)
        local ui_get_25 = ui.get(condtotake.at_targets)
        local ui_get_26 = ui.get(condtotake.left_yaw)
        local ui_get_27 = ui.get(condtotake.right_yaw)
        local ui_get_28 = ui.get(condtotake.jitter_mode)
        local ui_get_29 = ui.get(condtotake.jitter_amount)
        local ui_get_30 = ui.get(condtotake.lby)
        local ui_get_31 = ui.get(condtotake.lbyside)
        local ui_get_32 = ui.get(condtotake.lbyspeed)
        if (fn150:get_condition_type() ~= "Fakelag") then
            fakelagmode = ui.get(condtotake.fakelagmode)
            fakelagvariance = ui.get(condtotake.fakelagvariance)
            fakelagslider = ui.get(condtotake.fakelagslider)
            defensivemode = ui.get(condtotake.defensive.aa)
            defensivepitch = ui.get(condtotake.defensive.pitch)
            defensiveslider = ui.get(condtotake.defensive.pitch_slider)
            defensiveattargets = ui.get(condtotake.defensive.at_targets)
            defensiveyaw = ui.get(condtotake.defensive.yaw)
            defensiveleft = ui.get(condtotake.defensive.left_yaw)
            defensiveright = ui.get(condtotake.defensive.right_yaw)
        else
            fakelagmode = ui.get(condtotakeflags.fakelagmode)
            fakelagvariance = ui.get(condtotakeflags.fakelagvariance)
            fakelagslider = ui.get(condtotakeflags.fakelagslider)
            defensivemode = ui.get(condtotakeflags.defensive.aa)
            defensivepitch = ui.get(condtotakeflags.defensive.pitch)
            defensiveslider = ui.get(condtotakeflags.defensive.pitch_slider)
            defensiveattargets = ui.get(condtotakeflags.defensive.at_targets)
            defensiveyaw = ui.get(condtotakeflags.defensive.yaw)
            defensiveleft = ui.get(condtotakeflags.defensive.left_yaw)
            defensiveright = ui.get(condtotakeflags.defensive.right_yaw)
        end
        if (exploiting and ui.get(ragebot_tab.custom_exploits)) then
            ui.set(v247.antiaim.fakelagenabled[1], false)
        end
        handle_aa(ui_get_23, ui_get_24, ui_get_25, ui_get_26, ui_get_27, ui_get_28, ui_get_29, ui_get_30, ui_get_31, ui_get_32, fakelagmode, fakelagvariance, fakelagslider, defensivemode, defensivepitch, defensiveslider, defensiveattargets, defensiveyaw, defensiveleft, defensiveright)
    end)
    client.set_event_callback("setup_command", function()
        if (ui.get(v248.other.avoid_backstab) and fn153()) then
            ui.set(v247.antiaim.pitch[1], "Down")
            ui.set(v247.antiaim.yaw_base, "At targets")
            ui.set(v247.antiaim.yaw[1], "180")
            ui.set(v247.antiaim.yaw[2], 180)
            ui.set(v247.antiaim.jitter[1], "Offset")
            ui.set(v247.antiaim.jitter[2], 0)
            ui.set(v247.antiaim.body_yaw[1], "Static")
            ui.set(v247.antiaim.body_yaw[2], 0)
            ui.set(v247.antiaim.fs_body_yaw, false)
        end
    end)
    function distance3d(a0_826, a1_828, a2_830, a3_832, a4_834, a5_836)
        return math.sqrt(((((a3_832 - a0_826) * (a3_832 - a0_826)) + ((a4_834 - a1_828) * (a4_834 - a1_828))) + ((a5_836 - a2_830) * (a5_836 - a2_830))))
    end
    function entity_has_c4(a0_838)
        local v331 = entity.get_all("CC4")[1]
        return ((v331 ~= nil) and (entity.get_prop(v331, "m_hOwnerEntity") == a0_838))
    end
    classnames = { "CWorld", "CCSPlayer", "CFuncBrush" }
    trynna_plant = false
    using = false
    client.set_event_callback("setup_command", function(a0_840)
        local entity_get_local_player_33 = entity.get_local_player()
        if (a0_840.in_use == 1) then
            if (ui.get(v248.other.legitaa) == "off") then
                ui.set(v247.antiaim.pitch[1], "Off")
                ui.set(v247.antiaim.yaw_base, "Local view")
                ui.set(v247.antiaim.yaw[1], "180")
                ui.set(v247.antiaim.yaw[2], 180)
                ui.set(v247.antiaim.jitter[1], "Offset")
                ui.set(v247.antiaim.jitter[2], 0)
                ui.set(v247.antiaim.body_yaw[1], "Off")
                ui.set(v247.antiaim.body_yaw[2], 0)
                ui.set(v247.antiaim.fs_body_yaw, false)
            elseif (ui.get(v248.other.legitaa) == "2 way") then
                ui.set(v247.antiaim.pitch[1], "Off")
                ui.set(v247.antiaim.yaw_base, "Local view")
                ui.set(v247.antiaim.yaw[1], "180")
                ui.set(v247.antiaim.yaw[2], 180)
                ui.set(v247.antiaim.jitter[1], "Center")
                ui.set(v247.antiaim.jitter[2], 90)
                ui.set(v247.antiaim.body_yaw[1], "Jitter")
                ui.set(v247.antiaim.body_yaw[2], -1)
                ui.set(v247.antiaim.fs_body_yaw, false)
            elseif (ui.get(v248.other.legitaa) == "3 way") then
                ui.set(v247.antiaim.pitch[1], "Off")
                ui.set(v247.antiaim.yaw_base, "Local view")
                ui.set(v247.antiaim.yaw[1], "180")
                ui.set(v247.antiaim.yaw[2], 180)
                ui.set(v247.antiaim.jitter[1], "Skitter")
                ui.set(v247.antiaim.jitter[2], 77)
                ui.set(v247.antiaim.body_yaw[1], "Jitter")
                ui.set(v247.antiaim.body_yaw[2], -1)
                ui.set(v247.antiaim.fs_body_yaw, false)
            elseif (ui.get(v248.other.legitaa) == "static") then
                ui.set(v247.antiaim.pitch[1], "Off")
                ui.set(v247.antiaim.yaw_base, "Local view")
                ui.set(v247.antiaim.yaw[1], "180")
                ui.set(v247.antiaim.yaw[2], 180)
                ui.set(v247.antiaim.jitter[1], "Offset")
                ui.set(v247.antiaim.jitter[2], 0)
                ui.set(v247.antiaim.body_yaw[1], "Opposite")
                ui.set(v247.antiaim.fs_body_yaw, true)
            end
        end
        if (not entity_get_local_player_33 or not entity.is_alive(entity_get_local_player_33)) then
            return
        end
        local v332 = 100
        local v333 = entity.get_all("CPlantedC4")[1]
        local entity_get_prop_34, v334, v335 = entity.get_prop(v333, "m_vecOrigin")
        if (entity_get_prop_34 ~= nil) then
            local entity_get_prop_35, v336, v337 = entity.get_prop(entity_get_local_player_33, "m_vecOrigin")
            v332 = distance3d(entity_get_prop_34, v334, v335, entity_get_prop_35, v336, v337)
        end
        local entity_get_prop_36 = entity.get_prop(entity_get_local_player_33, "m_iTeamNum")
        local v338 = ((entity_get_prop_36 == 3) and (v332 < 62))
        local entity_get_prop_37 = entity.get_prop(entity_get_local_player_33, "m_bInBombZone")
        local v339 = entity_has_c4(entity_get_local_player_33)
        local v340 = ((((entity_get_prop_37 ~= 0) and (entity_get_prop_36 == 2)) and v339) and not ui.get(v248.other.bombsiteefix))
        local client_eye_position, v341, v342 = client.eye_position()
        local client_camera_angles, v343 = client.camera_angles()
        local math_sin_38 = math.sin(math.rad(client_camera_angles))
        local math_cos_39 = math.cos(math.rad(client_camera_angles))
        local math_sin_40 = math.sin(math.rad(v343))
        local math_cos_41 = math.cos(math.rad(v343))
        local v344 = { (math_cos_39 * math_cos_41), (math_cos_39 * math_sin_40), -math_sin_38 }
        local client_trace_line_42, v345 = client.trace_line(entity_get_local_player_33, client_eye_position, v341, v342, (client_eye_position + (v344[1] * 8192)), (v341 + (v344[2] * 8192)), (v342 + (v344[3] * 8192)))
        local v346 = true
        if (v345 ~= nil) then
            for i347 = 0, #classnames, 1 do
                if (entity.get_classname(v345) == classnames[i347]) then
                    v346 = false
                end
            end
        end
        if ((not v346 and not v340) and not v338) then
            a0_840.in_use = 0
        end
    end)
    local v348 = vtable_bind("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
    local v349 = {}
    local v350 = {
            records = {
            },
            get_max_desync = (function(a0_842)
    local v351 = text_clamp(a0_842.feet_speed_forwards_or_sideways, 0, 1)
    local v352 = ((((a0_842.stop_to_full_running_fraction * -0.3) - 0.2) * v351) + 1)
    local v353 = a0_842.duck_amount
    if (v353 > 0) then
        local v354 = (v353 * v351)
        v352 = (v352 + (v354 * (0.5 - v352)))
    end
    return text_clamp(v352, 0.5, 1)
end),
            normalize_pitch = (function(a0_844)
    if (x == nil) then
        return math.clamp(-89, 89)
    end
end),
            get_simtime = (function(a0_846)
    local v355 = v348(a0_846)
    if v355 then
        return entity_get_prop(a0_846, "m_flSimulationTime"), ffi.cast("float*", (ffi.cast("uintptr_t", v355) + 620))[0]
    else
        return 0
    end
end),
            get_animstate = (function(a0_848)
    local v356 = v348(a0_848)
    if v356 then
        return ffi.cast(ffi.typeof("struct { char pad0[0x18]; float anim_update_timer; char pad1[0xC]; float started_moving_time; float last_move_time; char pad2[0x10]; float last_lby_time; char pad3[0x8]; float run_amount; char pad4[0x10]; void* entity; void* active_weapon; void* last_active_weapon; float last_client_side_animation_update_time; int	 last_client_side_animation_update_framecount; float eye_timer; float eye_angles_y; float eye_angles_x; float goal_feet_yaw; float current_feet_yaw; float torso_yaw; float last_move_yaw; float lean_amount; char pad5[0x4]; float feet_cycle; float feet_yaw_rate; char pad6[0x4]; float duck_amount; float landing_duck_amount; char pad7[0x4]; float current_origin[3]; float last_origin[3]; float velocity_x; float velocity_y; char pad8[0x4]; float unknown_float1; char pad9[0x8]; float unknown_float2; float unknown_float3; float unknown; float m_velocity; float jump_fall_velocity; float clamped_velocity; float feet_speed_forwards_or_sideways; float feet_speed_unknown_forwards_or_sideways; float last_time_started_moving; float last_time_stopped_moving; bool on_ground; bool hit_in_ground_animation; char pad10[0x4]; float time_since_in_air; float last_origin_z; float head_from_ground_distance_standing; float stop_to_full_running_fraction; char pad11[0x4]; float magic_fraction; char pad12[0x3C]; float world_force; char pad13[0x1CA]; float min_yaw; float max_yaw; } **"), (ffi.cast("char*", ffi.cast("void***", v356)) + 39264))[0]
    end
end)
        }
    local v357 = function()
        if ui.get(ragebot_tab.resolver) then
            if not entity.is_alive(local_player) then
                return
            end
            client.update_player_list()
            for i358 = 1, #v349, 1 do
                local v359 = v349[i358]
                if entity.is_enemy(v359) then
                    local v360, v361 = v350.get_simtime(v359)
                    v360, v361 = toticks(v360), toticks(v361)
                    if not v350.records[v359] then
                        v350.records[v359] = {}
                    end
                    local v362 = v350.records[v359]
                    v362[v360] = {
        pose = ((entity.get_prop(v359, "m_flPoseParameter", 1) * 120) - 60),
        eye = select(2, entity.get_prop(v359, "m_angEyeAngles")),
    }
                    local v363
                    local v364 = ((v362[v361] and v362[v360]) ~= nil)
                    if v364 then
                        local v365 = v350.get_animstate(v359)
                        local v366 = v350.get_max_desync(v365)
                        if (((v362[v361] and v362[v360]) and (normalize_pitch < 0.85)) and ((v360 - v361) < 2)) then
                            local v367 = text_clamp(normalize_pitch((v365.last_origin - v362[v360].eye)), -89, 89)
                            v363 = ((v362[v361] and (v362[v361].pose * v367)) or nil)
                        end
                        if v363 then
                            plist.set(v359, "Force pitch value", v363)
                        end
                    end
                    plist.set(v359, "Force pitch", (v363 ~= nil))
                    plist.set(v359, "Correction active", true)
                else
                    plist.set(i358, "Force pitch", false)
                    v350.records = {}
                end
            end
        end
    end
    client.set_event_callback("net_update_end", function()
        if ui.get(ragebot_tab.resolver) then
            v357()
        end
    end)
    local function fn154(a0_850)
        local entity_get_prop_43, v368 = entity.get_prop(a0_850, "m_vecVelocity")
        return math.sqrt(((entity_get_prop_43 ^ 2) + (v368 ^ 2)))
    end
    local v369 = {}
    local v370 = {}
    local function fn155(a0_852)
        local v371 = v190(a0_852)
        local v372 = ffi.cast("float*", (ffi.cast("uintptr_t", v371) + 620))[0]
        local entity_get_prop_44 = entity.get_prop(a0_852, "m_flSimulationTime")
        if ((entity_get_prop_44 - v372) == 0) then
            return v370[a0_852]
        end
        local v373 = vector(entity.get_origin(a0_852))
        v369[a0_852] = (v369[a0_852] or v373)
        if (entity.is_dormant(a0_852) or not entity.is_alive(a0_852)) then
            return false
        end
        if (entity_get_prop_44 < v372) then
            return true
        end
        if (((v373 - v369[a0_852])):lengthsqr() > 4096) then
            v369[a0_852] = v373
            return true
        end
        v369[a0_852] = v373
        return false
    end
    local function fn156(a0_854, a1_856, a2_858, a3_860, a4_862)
        local entity_get_prop_45, v374, v375 = entity.get_prop(a0_854, "m_vecVelocity")
        local v376 = (a2_858 + ((globals.tickinterval() * entity_get_prop_45) * a1_856))
        local v377 = (a3_860 + ((globals.tickinterval() * v374) * a1_856))
        local v378 = (a4_862 + ((globals.tickinterval() * v375) * a1_856))
        return v376, v377, v378
    end
    local function fn157(a0_864, a1_866, a2_868)
        local entity_get_local_player_46 = entity.get_local_player()
        if not entity.is_alive(entity_get_local_player_46) then
            return false
        end
        local entity_get_prop_47, v379, v380 = entity.get_prop(entity_get_local_player_46, "m_vecOrigin")
        if ((not entity_get_prop_47 or not v379) or not v380) then
            print("Failed to get local player position")
            return false
        end
        local entity_get_prop_48 = entity.get_prop(entity_get_local_player_46, "m_vecViewOffset[2]")
        if not entity_get_prop_48 then
            print("Failed to get local player view offset")
            return false
        end
        v380 = (v380 + entity_get_prop_48)
        local client_trace_line_49, v381 = client.trace_line(entity_get_local_player_46, entity_get_prop_47, v379, v380, a0_864, a1_866, a2_868)
        if (client_trace_line_49 == nil) then
            print("Trace line failed")
            return false
        end
        return (client_trace_line_49 == 1)
    end
    local function fn158(a0_870, a1_872, a2_874, a3_876, a4_878, a5_880, a6_882, a7_884, a8_886)
        local v382 = vector(a0_870, a1_872, 0)
        local v383 = vector(a2_874, a3_876, 0)
        local v384 = ({ v382:to(v383):angles() })[2]
        for i385 = 1, a8_886, 1 do
            renderer.circle_outline(a0_870, a1_872, a4_878, a5_880, a6_882, (a8_886 - i385), i385, (v384 + 90), 0.5, 1)
            renderer.circle_outline(a2_874, a3_876, a4_878, a5_880, a6_882, (a8_886 - i385), i385, (v384 - 90), 0.5, 1)
            local v386 = vector(math.cos(math.rad((v384 + 90))), math.sin(math.rad((v384 + 90))), 0):scaled((i385 * 0.95))
            local v387 = vector(math.cos(math.rad((v384 - 90))), math.sin(math.rad((v384 - 90))), 0):scaled((i385 * 0.95))
            local v388 = (v386 + v382)
            local v389 = (v386 + v383)
            local v390 = (v387 + v382)
            local v391 = (v387 + v383)
            v192(v388.x, v388.y, v389.x, v389.y, a4_878, a5_880, a6_882, (a8_886 - i385))
            v192(v390.x, v390.y, v391.x, v391.y, a4_878, a5_880, a6_882, (a8_886 - i385))
        end
        v192(a0_870, a1_872, a2_874, a3_876, a4_878, a5_880, a6_882, a7_884)
    end
    local function fn159(a0_888, a1_890, a2_892, a3_894, a4_896, a5_898, a6_900, a7_902, a8_904)
        local v392 = {
    { (a0_888 - (a3_894 / 2)), (a1_890 - (a3_894 / 2)), a2_892 },
    { (a0_888 + (a3_894 / 2)), (a1_890 - (a3_894 / 2)), a2_892 },
    { (a0_888 + (a3_894 / 2)), (a1_890 + (a3_894 / 2)), a2_892 },
    { (a0_888 - (a3_894 / 2)), (a1_890 + (a3_894 / 2)), a2_892 },
    { (a0_888 - (a3_894 / 2)), (a1_890 - (a3_894 / 2)), (a2_892 + a4_896) },
    { (a0_888 + (a3_894 / 2)), (a1_890 - (a3_894 / 2)), (a2_892 + a4_896) },
    { (a0_888 + (a3_894 / 2)), (a1_890 + (a3_894 / 2)), (a2_892 + a4_896) },
    { (a0_888 - (a3_894 / 2)), (a1_890 + (a3_894 / 2)), (a2_892 + a4_896) },
}
        local v393 = {
    { 1, 2 },
    { 2, 3 },
    { 3, 4 },
    { 4, 1 },
    { 5, 6 },
    { 6, 7 },
    { 7, 8 },
    { 8, 5 },
    { 1, 5 },
    { 2, 6 },
    { 3, 7 },
    { 4, 8 },
}
        for i394, i395 in ipairs(v393) do
            local renderer_world_to_screen, v396 = renderer.world_to_screen(v392[i395[1]][1], v392[i395[1]][2], v392[i395[1]][3])
            local renderer_world_to_screen_50, v397 = renderer.world_to_screen(v392[i395[2]][1], v392[i395[2]][2], v392[i395[2]][3])
            if (((renderer_world_to_screen and v396) and renderer_world_to_screen_50) and v397) then
                fn158(renderer_world_to_screen, v396, renderer_world_to_screen_50, v397, a5_898, a6_900, a7_902, a8_904, 0)
            end
        end
    end
    local x_y = { x = 0, y = 0, z = 0 }
    local function fn160()
        if ui.get(ragebot_tab.resolver_lc) then
            local v398 = 10
            local entity_get_local_player_51 = entity.get_local_player()
            if ((entity_get_local_player_51 == nil) or not entity.is_alive(entity_get_local_player_51)) then
                return
            end
            local client_current_threat_52 = client.current_threat()
            if ((not client_current_threat_52 or not entity.is_alive(client_current_threat_52)) or entity.is_dormant(client_current_threat_52)) then
                return
            end
            local entity_get_prop_53, v399, v400 = entity.get_prop(client_current_threat_52, "m_vecOrigin")
            if (((entity_get_prop_53 == nil) or (v399 == nil)) or (v400 == nil)) then
                return
            end
            if (fn154(client_current_threat_52) < 20) then
                return
            end
            if fn155(client_current_threat_52) then
                return
            end
            local v401, v402, v403 = fn156(client_current_threat_52, v398, entity_get_prop_53, v399, v400)
            local globals_framecount = globals.framecount()
            smoothing_factor = (1 / globals_framecount)
            x_y.x = lerp(v401, x_y.x, smoothing_factor)
            x_y.y = lerp(v402, x_y.y, smoothing_factor)
            x_y.z = lerp(v403, x_y.z, smoothing_factor)
            local v404 = 20
            local v405 = 72
            if fn157(x_y.x, x_y.y, x_y.z) then
                r, g, b, a = 255, 255, 255, 200
            else
                r, g, b, a = 255, 255, 255, 200
            end
            fn159(x_y.x, x_y.y, x_y.z, v404, v405, r, g, b, a)
            local renderer_world_to_screen_54, v406 = renderer.world_to_screen(entity_get_prop_53, v399, v400)
            local renderer_world_to_screen_55, v407 = renderer.world_to_screen(x_y.x, x_y.y, x_y.z)
            if (((renderer_world_to_screen_54 and v406) and renderer_world_to_screen_55) and v407) then
                fn158(renderer_world_to_screen_54, v406, renderer_world_to_screen_55, v407, r, g, b, a, 0)
            end
        end
    end
    client.set_event_callback("net_update_end", function()
        if ui.get(ragebot_tab.resolver_lc) then
            for i408, i409 in pairs(entity.get_players()) do
                v370[i409] = fn155(i409)
            end
        end
    end)
    client.set_event_callback("paint", function()
        if ui.get(ragebot_tab.resolver_lc) then
            fn160()
        end
    end)
    local v410 = function(a0_906, a1_908)
        for i411 = 1, #a0_906, 1 do
            if (a0_906[i411] == a1_908) then
                return true
            end
        end
        return false
    end
    local function fn161(a0_910, a1_912, a2_914, a3_916, a4_918)
        local entity_get_prop_56, v412, v413 = entity.get_prop(a0_910, "m_vecVelocity")
        local v414 = (a2_914 + ((globals.tickinterval() * entity_get_prop_56) * a1_912))
        local v415 = (a3_916 + ((globals.tickinterval() * v412) * a1_912))
        local v416 = (a4_918 + ((globals.tickinterval() * v413) * a1_912))
        return v414, v415, v416
    end
    local v417 = function(a0_920)
        return (bit.band(entity.get_prop(a0_920, "m_fFlags"), 1) == 0)
    end
    local v418, v419, v420, v421 = 255, 255, 255, 255
    local v422 = vector(0, 0, 0)
    local v423 = vector(0, 0, 0)
    local ui_reference_57 = ui.reference("rage", "aimbot", "Minimum damage")
    local ui_reference_58, v424, v425 = ui.reference("rage", "aimbot", "Minimum damage override")
    local v426 = { ui.reference("RAGE", "Other", "Quick peek assist") }
    local v427 = { ui.reference("RAGE", "Other", "Quick peek assist mode") }
    local v428 = 0
    local function fn162()
        if (ui.get(ui_reference_58) and ui.get(v424)) then
            v428 = ui.get(v425)
        else
            v428 = ui.get(ui_reference_57)
        end
    end
    local function fn163()
        local entity_get_local_player_59 = entity.get_local_player()
        if (entity_get_local_player_59 == nil) then
            return
        end
        local client_camera_angles_60, v429 = client.camera_angles()
        v422 = vector(client_camera_angles_60, v429, 0)
        local entity_hitbox_position_61, v430, v431 = entity.hitbox_position(entity_get_local_player_59, 3)
        v423 = vector(entity_hitbox_position_61, v430, v431)
    end
    local v432 = false
    local v433 = v423
    local function fn164(a0_922, a1_924, a2_926, a3_928, a4_930, a5_932)
        local v434, v435, v436
        local v437, v438, v439
        if (a3_928 == nil) then
            v437, v438, v439 = a0_922, a1_924, a2_926
            v434, v435, v436 = client.eye_position()
            if (v434 == nil) then
                return
            end
        else
            v434, v435, v436 = a0_922, a1_924, a2_926
            v437, v438, v439 = a3_928, a4_930, a5_932
        end
        local v440, v441, v442 = (v437 - v434), (v438 - v435), (v439 - v436)
        if ((v440 == 0) and (v441 == 0)) then
            return (((v442 > 0) and 270) or 90), 0
        else
            local math_deg = math.deg(math.atan2(v441, v440))
            local math_sqrt = math.sqrt(((v440 * v440) + (v441 * v441)))
            local math_deg_62 = math.deg(math.atan2(-v442, math_sqrt))
            return math_deg_62, math_deg
        end
    end
    local function fn165(a0_934, a1_936, a2_938)
        local entity_get_local_player_63 = entity.get_local_player()
        local v443 = a2_938
        local v444 = v422
        local v445 = (v443 + (vector(0, 0, 0):init_from_angles(0, ((90 + v444.y) + a0_934), 0) * a1_936))
        return v445
    end
    local function fn166(a0_940, a1_942, a2_944)
        local v446 = {}
        local entity_get_local_player_64 = entity.get_local_player()
        local v447 = a2_944
        a1_942 = math.max(2, math.floor(a1_942))
        local v448 = (360 / a1_942)
        for i449 = 0, 360, v448 do
            local v450 = fn165(i449, a0_940, v447)
            table.insert(v446, v450)
        end
        return v446
    end
    local function fn167(a0_946, a1_948, a2_950, a3_952)
        local v451 = vector(a0_946.x, a0_946.y, 0)
        local v452 = vector(a1_948.x, a1_948.y, 0)
        local v453 = vector(a3_952.x, a3_952.y, 0)
        local v454 = ((v451 - v452) / a2_950)
        local v455 = ((v453 - v452)):length()
        local v456 = {}
        for i457 = 1, a2_950, 1 do
            local v458 = (v454 * i457)
            if (v458:length() < v455) then
                table.insert(v456, (a1_948 + v458))
            end
        end
        return v456
    end
    local function fn168(a0_954, a1_956)
        local v459 = {}
        local entity_get_players = entity.get_players()
        for i460, i461 in ipairs(entity_get_players) do
            if not entity.is_enemy(i461) then
                table.insert(v459, i461)
            end
        end
        local entity_get_local_player_65 = entity.get_local_player()
        local v462 = trace.line(a0_954, a1_956, { skip = v459 })
        local v463 = v462.end_pos
        return v463, v462.fraction
    end
    local function fn169(a0_958, a1_960, a2_962, a3_964, a4_966, a5_968, a6_970, a7_972, a8_974, a9_976, a10_978, a11_980, a12_982, a13_984, a14_986, a15_988, a16_990)
        local v464 = (((a8_974 ~= nil) and a8_974) or 3)
        local v465 = (((a9_976 ~= nil) and a9_976) or 1)
        local v466 = (((a10_978 ~= nil) and a10_978) or false)
        local v467 = (((a11_980 ~= nil) and a11_980) or 0)
        local v468 = (((a12_982 ~= nil) and a12_982) or 1)
        local v469, v470
        if a16_990 then
            v469, v470 = renderer.world_to_screen(a0_958, a1_960, a2_962)
        end
        local v471, v472
        for i473 = v467, (v468 * 360), v464 do
            local math_rad = math.rad(i473)
            local v474, v475, v476 = ((a3_964 * math.cos(math_rad)) + a0_958), ((a3_964 * math.sin(math_rad)) + a1_960), a2_962
            local renderer_world_to_screen_66, v477 = renderer.world_to_screen(v474, v475, v476)
            if ((renderer_world_to_screen_66 ~= nil) and (v471 ~= nil)) then
                if (a16_990 and (v469 ~= nil)) then
                    renderer.triangle(renderer_world_to_screen_66, v477, v471, v472, v469, v470, a13_984, a14_986, a15_988, a16_990)
                end
                for i478 = 1, v465, 1 do
                    local v479 = (i478 - 1)
                    renderer.line(renderer_world_to_screen_66, (v477 - v479), v471, (v472 - v479), a4_966, a5_968, a6_970, a7_972)
                    renderer.line((renderer_world_to_screen_66 - 1), v477, (v471 - v479), v472, a4_966, a5_968, a6_970, a7_972)
                end
                if v466 then
                    local v480 = ((a7_972 / 255) * 160)
                    renderer.line(renderer_world_to_screen_66, (v477 - v465), v471, (v472 - v465), 16, 16, 16, v480)
                    renderer.line(renderer_world_to_screen_66, (v477 + 1), v471, (v472 + 1), 16, 16, 16, v480)
                end
            end
            v471, v472 = renderer_world_to_screen_66, v477
        end
    end
    local function fn170(a0_992, a1_994, a2_996, a3_998, a4_1000)
        local entity_get_local_player_67 = entity.get_local_player()
        local entity_get_origin, v481, v482 = entity.get_origin(entity_get_local_player_67)
        local v483 = vector(a4_1000.x, a4_1000.y, (v482 + 60))
        local v484 = vector(a3_998.x, a3_998.y, (v482 + 60))
        local v485, v486 = fn168(a4_1000, a3_998)
        local v487, v488 = fn168(v483, v484)
        local v489 = vector(v487.x, v487.y, a3_998.z)
        if a0_992 then
            local renderer_world_to_screen_68, v490 = renderer.world_to_screen((v487.x + 10), (v487.y + 10), (v487.z - 59))
            local renderer_world_to_screen_69, v491 = renderer.world_to_screen((v483.x + 10), (v483.y + 10), (v483.z - 59))
            renderer.line(renderer_world_to_screen_68, v490, renderer_world_to_screen_69, v491, v418, v419, v420, 100)
        end
        if a2_996 then
            local v492 = tostring((math.floor(v486) * 100))
            local renderer_world_to_screen_70, v493 = renderer.world_to_screen(v484.x, v484.y, v484.z)
            renderer.text(renderer_world_to_screen_70, v493, v418, v419, v420, v421, "c", 0, v492)
        end
        return v489
    end
    local function fn171(a0_1002, a1_1004, a2_1006, a3_1008)
        local v494 = {}
        local entity_get_local_player_71 = entity.get_local_player()
        local v495 = a3_1008
        local v496 = fn166(30, 2, v495)
        for i497, i498 in pairs(v496) do
            local v499 = v496[(i497 + 1)]
            v499 = (((v499 == nil) and v496[1]) or v499)
            local v500 = vector(((v499.x + i498.x) / 2), ((v499.y + i498.y) / 2), i498.z)
            local v501 = fn170(a0_1002, a1_1004, a2_1006, v500, v495)
            table.insert(v494, { endpos = v501, ideal = v500 })
            local v502 = fn170(a0_1002, a1_1004, a2_1006, i498, v495)
            table.insert(v494, { endpos = v502, ideal = i498 })
        end
        return v494
    end
    local function fn172(a0_1010, a1_1012, a2_1014, a3_1016)
        local entity_get_local_player_72 = entity.get_local_player()
        local v503 = fn171(a0_1010, a1_1012, debug_fraction, a3_1016)
        local entity_get_origin_73, v504, v505 = entity.get_origin(entity_get_local_player_72)
        local v506 = {}
        for i507, i508 in pairs(v503) do
            local v509 = i508.ideal
            local v510 = i508.endpos
            table.insert(v506, v510)
            if a1_1012 then
                fn159(v510.x, v510.y, (v510.z - 40), 23, 50, 255, 255, 255, sway())
            end
            if (a2_1014 ~= 1) then
                for i511, i512 in pairs(fn167(v509, a3_1016, a2_1014, v510)) do
                    table.insert(v506, i512)
                    if a1_1012 then
                        fn159(i512.x, i512.y, (v510.z - 40), 23, 50, 255, 255, 255, sway())
                    end
                end
            end
        end
        return v506
    end
    local function fn173()
        local v513 = {}
        table.insert(v513, 0)
        table.insert(v513, 1)
        table.insert(v513, 4)
        table.insert(v513, 5)
        table.insert(v513, 6)
        table.insert(v513, 2)
        table.insert(v513, 3)
        table.insert(v513, 13)
        table.insert(v513, 14)
        table.insert(v513, 15)
        table.insert(v513, 16)
        table.insert(v513, 17)
        table.insert(v513, 18)
        table.insert(v513, 7)
        table.insert(v513, 8)
        table.insert(v513, 9)
        table.insert(v513, 10)
        table.insert(v513, 11)
        table.insert(v513, 12)
        return v513
    end
    local function fn174()
        return (ui.get(v426[1]) and ui.get(v426[2]))
    end
    local function fn175()
        local v514 = 0
        local entity_get_local_player_74 = entity.get_local_player()
        if (entity_get_local_player_74 == nil) then
            return
        end
        if (entity.is_alive(entity_get_local_player_74) == false) then
            return
        end
        if not ui.get(v426[2]) then
            return
        end
        local entity_hitbox_position_75, v515, v516 = entity.hitbox_position(entity_get_local_player_74, 3)
        local v517 = vector(entity_hitbox_position_75, v515, v516)
        local client_camera_angles_76, v518 = client.camera_angles()
        if not ui.get(ragebot_tab.aipeek) then
            return
        end
        local v519 = fn172(1, 1, 1, v423)
        local v520 = fn173()
        local v521 = {}
        local client_current_threat_77 = client.current_threat()
        if ((client_current_threat_77 == nil) or entity.is_dormant(client_current_threat_77)) then
            v433 = nil
            v432 = false
            return
        end
        for i522, i523 in pairs(v519) do
            for i524, i525 in pairs(v520) do
                local entity_hitbox_position_78, v526, v527 = entity.hitbox_position(client_current_threat_77, i525)
                local v528, v529, v530 = fn161(client_current_threat_77, v514, entity_hitbox_position_78, v526, v527)
                local v531 = vector(v528, v529, v530)
                local client_trace_bullet, v532 = client.trace_bullet(entity_get_local_player_74, i523.x, i523.y, (i523.z + 60), v531.x, v531.y, v531.z)
                if (v532 > math.min(v428, entity.get_prop(client_current_threat_77, "m_iHealth"))) then
                    table.insert(v521, { TARGET = client_current_threat_77, damage = v532, vec = i523, enemy_vec = v531 })
                end
            end
            if (#v521 >= 5) then
                break
            end
        end
        table.sort(v521, function(a0_1018, a1_1020)
        return (a0_1018.damage > a1_1020.damage)
    end)
        for i533, i534 in pairs(v521) do
            if (entity.is_alive(i534.TARGET) == false) then
                table.remove(v521, i533)
            end
        end
        local entity_get_origin_79, v535, v536 = entity.get_origin(entity_get_local_player_74)
        if (#v521 >= 1) then
            local v537 = v521[1]
            local v538 = v537.vec
            local v539 = v537.damage
            local v540 = v537.enemy_vec
            local v541 = vector(v538.x, v538.y, (v536 + 60))
            local renderer_world_to_screen_80, v542 = renderer.world_to_screen(v541.x, v541.y, v541.z)
            if (v542 ~= nil) then
                v542 = (v542 - 12)
            end
            local v543 = tostring(math.floor(v539))
            renderer.text(renderer_world_to_screen_80, v542, v418, v419, v420, v421, 0, v543)
            v432 = true
            v433 = v538
        else
            v433 = nil
            v432 = false
        end
    end
    local v544 = false
    local function fn176()
        if not ui.get(ragebot_tab.aipeek) then
            return
        end
        v544 = false
    end
    local function fn177(a0_1022, a1_1024)
        local entity_get_local_player_81 = entity.get_local_player()
        local entity_get_prop_82, v545, v546 = entity.get_prop(entity_get_local_player_81, "m_vecAbsOrigin")
        local v547, v548 = fn164(entity_get_prop_82, v545, v546, a1_1024.x, a1_1024.y, a1_1024.z)
        a0_1022.in_forward = 1
        a0_1022.in_back = 0
        a0_1022.in_moveleft = 0
        a0_1022.in_moveright = 0
        a0_1022.in_speed = 0
        a0_1022.forwardmove = 800
        a0_1022.sidemove = 0
        a0_1022.move_yaw = v548
    end
    local v549, v550, v551, v552 = 255, 255, 255, 255
    local function fn178(a0_1026)
        local entity_get_local_player_83 = entity.get_local_player()
        if (entity_get_local_player_83 == nil) then
            return
        end
        if not ui.get(ragebot_tab.aipeek) then
            return
        end
        if not entity.is_alive(entity_get_local_player_83) then
            return
        end
        local v553 = (a0_1026.in_forward == 1)
        local v554 = (a0_1026.in_back == 1)
        local v555 = (a0_1026.in_moveleft == 1)
        local v556 = (a0_1026.in_moveright == 1)
        if ui.get(v426[2]) then
            local entity_get_player_weapon = entity.get_player_weapon(entity_get_local_player_83)
            if (entity_get_player_weapon == nil) then
                return
            end
            local v557 = v417(entity_get_local_player_83)
            local globals_curtime = globals.curtime()
            local v558 = ((entity.get_prop(entity_get_local_player_83, "m_flNextAttack") <= globals_curtime) and (entity.get_prop(entity_get_player_weapon, "m_flNextPrimaryAttack") <= globals_curtime))
            local entity_get_origin_84, v559, v560 = entity.get_origin(entity_get_local_player_83)
            if (math.abs((entity_get_origin_84 - v423.x)) <= 10) then
                v544 = true
            end
            if (v558 == false) then
                v544 = false
            end
            v549, v550, v551, v552 = 255, 255, 0, 255
            if (((v432 and v544) and (v557 == false)) and (v433 ~= nil)) then
                fn177(a0_1026, v433)
                v549, v550, v551, v552 = 0, 255, 0, 255
            elseif ((((((v544 == false) and (v557 == false)) and (v553 == false)) and (v554 == false)) and (v555 == false)) and (v556 == false)) then
                fn177(a0_1026, v423)
            end
        else
            v549, v550, v551, v552 = 0, 255, 0, 255
        end
    end
    fn163()
    client.set_event_callback("paint", function()
        if not ui.get(ragebot_tab.aipeek) then
            return
        end
        fn162()
        fn175()
    end)
    client.set_event_callback("setup_command", fn178)
    client.set_event_callback("run_command", function()
        local entity_get_local_player_85 = entity.get_local_player()
        if (entity_get_local_player_85 == nil) then
            return
        end
        if (entity.is_alive(entity_get_local_player_85) == false) then
            return
        end
        local entity_hitbox_position_86, v561, v562 = entity.hitbox_position(entity_get_local_player_85, 3)
        local v563 = vector(entity_hitbox_position_86, v561, v562)
        local client_camera_angles_87, v564 = client.camera_angles()
        if not ui.get(v426[2]) then
            v422 = vector(client_camera_angles_87, v564, 0)
        end
        if not ui.get(v426[2]) then
            v423 = v563
        end
    end)
    client.set_event_callback("aim_fire", fn176)
    client.set_event_callback("predict_command", function(a0_1028)
        local entity_get_local_player_88 = entity.get_local_player()
        if (entity_get_local_player_88 == nil) then
            return
        end
        local entity_get_prop_89 = entity.get_prop(entity_get_local_player_88, "m_fFlags")
        local v565 = vector(entity.get_prop(entity_get_local_player_88, "m_vecVelocity"))
    end)
    client.set_event_callback("setup_command", function(a0_1030)
        if not ui.get(keybinds_tab.airstop) then
            return
        end
        local entity_get_local_player_90 = entity.get_local_player()
        local client_current_threat_91 = client.current_threat()
        if ((entity_get_local_player_90 == nil) or (client_current_threat_91 == nil)) then
            return
        end
        airstop = false
        local entity_get_player_weapon_92 = entity.get_player_weapon(entity_get_local_player_90)
        if (entity_get_player_weapon_92 == nil) then
            return
        end
        local entity_get_classname = entity.get_classname(entity_get_player_weapon_92)
        if (entity_get_classname ~= "CWeaponSSG08") then
            return
        end
        if (not fn142(entity_get_local_player_90) or not fn143(entity_get_player_weapon_92)) then
            return
        end
        local v566 = weapons(entity_get_player_weapon_92)
        local v567 = vector(entity.get_origin(entity_get_local_player_90))
        local v568 = vector(entity.get_origin(client_current_threat_91))
        local v569 = 1
        local client_trace_bullet_93, v570 = client.trace_bullet(entity_get_local_player_90, v567.x, v567.y, 0, v568.x, v568.y, 0)
        local entity_get_prop_94 = entity.get_prop(client_current_threat_91, "m_iHealth")
        if (v570 < v569) then
            return
        end
        if not fn152(client_current_threat_91) then
            return
        end
        if lp_ground_ticks:is_on_ground() then
            return
        end
        airstop = true
        ui.set(v247.antiaim.slow_motion[1], true)
        fn145(a0_1030, 0)
    end)
    local v571 = {
    " ~ bounty ",
    " ~ bounty ",
    " ~ y bount",
    " ~ ty boun",
    " ~ nty bou",
    " ~ unty bo",
    " ~ ounty b",
    " ~ bounty ",
    " ~ bounty ",
}
    local v572 = 1
    local v573 = 0
    local function fn179()
        local v574 = v571[v572]
        if (v572 < 9) then
            v572 = (v572 + 1)
        else
            v572 = 1
        end
        return v574
    end
    client.set_event_callback("paint", function()
        if not ui.get(visuals_tab.clantag) then
            return
        end
        if ui.get(ui.reference("Misc", "Miscellaneous", "Clan tag spammer")) then
            return
        end
        if ((v573 + 0.3) < globals.curtime()) then
            client.set_clan_tag(fn179())
            v573 = globals.curtime()
        elseif (v573 > globals.curtime()) then
            v573 = globals.curtime()
        end
    end)
    local v575 = {}
    v575.phrases = {
    english = {
    { "𝙹𝚄𝚂𝚃 𝙶𝙴𝚃 🄱🄾🅄🄽🅃🅈 𝚈𝙾𝚄 𝚂𝚃𝚄𝙿𝙸𝙳 𝙵𝙰𝙶" },
    { "𝚃𝙷𝙰𝙽𝙺 𝚈𝙾𝚄 𝙳𝙰𝙳𝙳𝚈 𝕄𝕆ℝℕ𝕀ℕ𝔾𝕊𝕋𝔸ℝ ℂℕ 𝙵𝙾𝚁 𝙼𝙰𝙺𝙸𝙽𝙶 🄱🄾🅄🄽🅃🅈" },
    { "𝚈𝙾𝚄𝚁 𝙲𝙷𝙴𝙰𝚃 𝙸𝚂 𝙾𝙺, 𝙸𝚃 𝙹𝚄𝚂𝚃 𝙼𝚈 𝙰𝙰 𝙸𝚂 𝚄𝙽𝙷𝙸𝚃𝚃𝙰𝙱𝙻𝙴" },
    { "𝙸𝙼 𝚂𝙾𝚁𝚁𝚈" },
    { "(◣_◢)(◣_◢)(◣_◢)🄱🄾🅄🄽🅃🅈(◣_◢)(◣_◢)(◣_◢)" },
},
    russian = {
    { "костыль сьебал в страхе" },
    { "танки онлайн тестовый сервер" },
    { "на банане подскользнулся пидарас" },
    { "я твоему деду армяшке монобровь выгрыз" },
    { "пробежка не удалась, пятки не засверкали" },
    { "удачи на банановых островах!" },
    { "а правда, что твой отец космонавт?" },
    { "это ты называешь анти аимы ублюдок" },
    { "проиграл мать 1в1, возможно навсегда..." },
    { "Ебень ебанная потренеруйся что ли нахуй уже" },
    { "танки онлайн тестовый сервер" },
    { "ты убивал меня, смеялся, но.. был поставлен на колени" },
},
    ukrainian = {
    { "милиця в страху" },
    { "Сервер онлайн-тестування Tanki" },
    { "послизнувся на банані" },
    { "Я вигриз твій дідусь армійську унірландську" },
    { "Біг не вдався, п'яти не виблискували" },
    { "Удачі на бананових островах!" },
    { "Чи правда, що твій батько - космонавт?" },
    { "Це те, що ви називаєте анти аймі покидьком" },
    { "Втратила матір 1 на 1, можливо, назавжди..." },
    { "До біса тебе, тренуй вже до біса" },
    { "Сервер онлайн-тестування Tanki" },
    { "Ти мене вбив, сміявся, але... був поставлений на коліна" },
},
    dutch = {
    { "De kruk in angst" },
    { "Tanki Online Test Server" },
    { "een gleed uit op een banaan" },
    { "Ik knaagde de unibrow van je grootvader uit het leger" },
    { "De run mislukte, de hakken schitterden niet" },
    { "Veel succes op de bananeneilanden!" },
    { "Is het waar dat je vader een astronaut is?" },
    { "Dat is wat je anti aimy noemt" },
    { "De moeder 1v1 verloren, mogelijk voor altijd..." },
    { "Fuck you, train de fuck al" },
    { "Tanki Online Test Server" },
    { "Je hebt me vermoord, gelachen, maar... werd op zijn knieën gebracht" },
},
}
    v575.phrase_count = { english = 0, russian = 0, ukrainian = 0, dutch = 0 }
    v575.handle = function(a0_1032)
        local entity_get_local_player_95 = entity.get_local_player()
        if (entity_get_local_player_95 == nil) then
            return
        end
        local client_userid_to_entindex = client.userid_to_entindex(a0_1032.userid)
        if (client_userid_to_entindex == nil) then
            return
        end
        local client_userid_to_entindex_96 = client.userid_to_entindex(a0_1032.attacker)
        if (client_userid_to_entindex_96 == nil) then
            return
        end
        if (ui.get(visuals_tab.trashtalk) == "English") then
            v575.phrase_count.english = (v575.phrase_count.english + 1)
            if (v575.phrase_count.english > #v575.phrases.english) then
                v575.phrase_count.english = 1
            end
            local v576 = { english = v575.phrases.english[v575.phrase_count.english] }
            if (ui.get(visuals_tab.trashtalk) ~= "Off") then
                if ((client_userid_to_entindex_96 == entity_get_local_player_95) and (client_userid_to_entindex ~= entity_get_local_player_95)) then
                    for i577 = 1, #v576.english, 1 do
                        client.exec(("say %s"):format(v576.english[i577]))
                    end
                end
            end
        elseif (ui.get(visuals_tab.trashtalk) == "Russian") then
            v575.phrase_count.russian = (v575.phrase_count.russian + 1)
            if (v575.phrase_count.russian > #v575.phrases.russian) then
                v575.phrase_count.russian = 1
            end
            local v578 = { russian = v575.phrases.russian[v575.phrase_count.russian] }
            if (ui.get(visuals_tab.trashtalk) ~= "Off") then
                if ((client_userid_to_entindex_96 == entity_get_local_player_95) and (client_userid_to_entindex ~= entity_get_local_player_95)) then
                    for i579 = 1, #v578.russian, 1 do
                        client.exec(("say %s"):format(v578.russian[i579]))
                    end
                end
            end
        elseif (ui.get(visuals_tab.trashtalk) == "Dutch") then
            v575.phrase_count.dutch = (v575.phrase_count.dutch + 1)
            if (v575.phrase_count.dutch > #v575.phrases.dutch) then
                v575.phrase_count.dutch = 1
            end
            local v580 = { dutch = v575.phrases.dutch[v575.phrase_count.dutch] }
            if (ui.get(visuals_tab.trashtalk) ~= "Off") then
                if ((client_userid_to_entindex_96 == entity_get_local_player_95) and (client_userid_to_entindex ~= entity_get_local_player_95)) then
                    for i581 = 1, #v580.dutch, 1 do
                        client.exec(("say %s"):format(v580.dutch[i581]))
                    end
                end
            end
        elseif (ui.get(visuals_tab.trashtalk) == "Ukrainian") then
            v575.phrase_count.ukrainian = (v575.phrase_count.ukrainian + 1)
            if (v575.phrase_count.ukrainian > #v575.phrases.ukrainian) then
                v575.phrase_count.ukrainian = 1
            end
            local v582 = { ukrainian = v575.phrases.ukrainian[v575.phrase_count.ukrainian] }
            if (ui.get(visuals_tab.trashtalk) ~= "Off") then
                if ((client_userid_to_entindex_96 == entity_get_local_player_95) and (client_userid_to_entindex ~= entity_get_local_player_95)) then
                    for i583 = 1, #v582.ukrainian, 1 do
                        client.exec(("say %s"):format(v582.ukrainian[i583]))
                    end
                end
            end
        end
    end
    client.set_event_callback("player_death", v575.handle)
    local v584 = false
    local v585 = { [1] = "Off", [2] = "Always slide", [3] = "Never slide" }
    local v586 = 0
    legMovement = ui.reference("AA", "Other", "Leg movement"), client.set_event_callback("pre_render", function()
        if not entity.get_local_player() then
            return
        end
        local entity_get_prop_97 = entity.get_prop(entity.get_local_player(), "m_fFlags")
        v586 = (((bit.band(entity_get_prop_97, 1) == 0) and 0) or (((v586 < 5) and (v586 + 1)) or v586))
        if ui.get(visuals_tab.staticlegs) then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 6)
        end
        if (ui.get(visuals_tab.animfix) == "Shake player model") then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", (math.random(0, 10) / 10), 3)
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", (math.random(0, 10) / 10), 7)
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", (math.random(0, 10) / 10), 6)
        end
        if (ui.get(visuals_tab.animfix) == "Nasawalk") then
            if not v584 then
                v584 = ui.get(legMovement)
            end
            ui.set_visible(legMovement, false)
            if (ui.get(visuals_tab.animfix) == "nasawalk") then
                ui.set(legMovement, v585[math.random(1, 3)])
                entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 9, 0)
            end
        elseif (((v584 == "Off") or (v584 == "Always slide")) or (v584 == "Never slide")) then
            ui.set_visible(legMovement, true)
            ui.set(legMovement, v584)
            v584 = false
        end
        if ui.get(visuals_tab.pitchzero) then
            v586 = (((bit.band(entity_get_prop_97, 1) == 1) and (v586 + 1)) or 0)
            if ((v586 > 20) and (v586 < 150)) then
                entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0.5, 12)
            end
        end
        if (ui.get(visuals_tab.animfix) == "Moonwalk") then
            if not v584 then
                v584 = ui.get(legMovement)
            end
            ui.set_visible(legMovement, false)
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0, 7)
            local v587 = entity.get_local_player()
            local v588 = v587:get_prop("m_fFlags")
            local v589 = (bit.band(v588, 1) ~= 0)
            if not v589 then
                local v590 = v587:get_anim_overlay(6)
                v590.weight = 1
            end
            ui.set(legMovement, "Off")
        elseif (((v584 == "Off") or (v584 == "Always slide")) or (v584 == "Never slide")) then
            ui.set_visible(legMovement, true)
            ui.set(legMovement, v584)
            v584 = false
        end
    end)
    local globals_curtime_98 = globals.curtime
    local client_unset_event_callback = client.unset_event_callback
    local renderer_circle_outline, renderer_measure_text, renderer_text = renderer.circle_outline, renderer.measure_text, renderer.text
    local table_insert = table.insert
    local ui_get_99 = ui.get
    local client_screen_size, v591 = client.screen_size()
    local v592 = 6
    local v593 = ((v591 / 2) + (v591 / 12))
    function lerp(a0_1034, a1_1036, a2_1038)
        if ((not a1_1036 or not a0_1034) or not a2_1038) then
            return
        end
        return (a0_1034 + ((a1_1036 - a0_1034) * a2_1038))
    end
    local v594 = {}
    local v595 = 3
    local v596
    local function fn180()
        local v597 = ((globals_curtime_98() + v595) - v596)
        local v598 = (((v597 / v595) * 100) + 0.5)
        return (v598 * 0.01)
    end
    local v599 = 40
    local v600 = 6
    local v601 = (v600 / 2)
    local v602 = (v600 - 1)
    local v603 = ((v600 - 1) / 3)
    dtcircle = 0
    lcbar = 0
    client.set_event_callback("paint", function()
        if ((safeheadtarget() and ui.get(v248.other.safe_head)) and (((((fn150:get_condition_type() == "Aircrouching") or (fn150:get_condition_type() == "Crouching")) or (fn150:get_condition_type() == "Crouchrunning")) or (fn150:get_condition_type() == "Standing")) or (fn150:get_condition_type() == "Fakelag"))) then
            renderer.indicator(255, 255, 255, 200, "SAFEHEAD")
        end
        if (ui.get(v248.other.avoid_backstab) and fn153()) then
            renderer.indicator(255, 255, 255, 200, "ANTI BACKSTAB")
        end
        if ui.get(keybinds_tab.airstop) then
            renderer.indicator(255, 255, 255, 200, "AIR QUICKSTOP")
        end
        renderer.indicator(255, 255, 255, 200, "LC")
        if not ui.get(visuals_tab.indicators) then
            return
        end
        for i604 = 1, #v594, 1 do
            local v605 = v594[i604]
            local v606 = v605.text
            local v607, v608, v609, v610 = v605.r, v605.g, v605.b, v605.a
            local v611 = ((is_defensive and 1) or 0)
            local v612 = ((v593 + (i604 * -v599)) + (#v594 * v599))
            m_textW, m_textH = renderer_measure_text("+b", v606)
            renderer.gradient(v592, v612, (m_textW + 20), (m_textH + 6), 0, 0, 0, 255, 0, 0, 0, 100, true)
            renderer.blur(v592, v612, (m_textW + 20), (m_textH + 6))
            renderer.gradient(v592, v612, 1, 16, v607, v608, v609, 200, v607, v608, v609, 30, false)
            renderer.gradient(v592, v612, 16, 1, v607, v608, v609, 200, v607, v608, v609, 30, true)
            renderer.gradient(((v592 + m_textW) + 19), v612, 1, 16, v607, v608, v609, 200, v607, v608, v609, 30, false)
            renderer.gradient(((v592 + m_textW) + 4), v612, 16, 1, v607, v608, v609, 30, v607, v608, v609, 200, true)
            renderer_text((v592 + 10), (v612 + 2), v607, v608, v609, v610, "+b", 0, v606)
            if ((((v605.r == 255) and (v605.g == 0)) and (v605.b == 50)) and v606:find("DT")) then
                dtcircle = lerp(dtcircle, 0, (globals.frametime() * 15))
            elseif v606:find("DT") then
                dtcircle = lerp(dtcircle, 24, (globals.frametime() * 15))
            end
            if (v611 == 1) then
                lcbar = lerp(lcbar, 22, (globals.frametime() * 5))
            else
                lcbar = lerp(lcbar, 0, (globals.frametime() * 5))
            end
            if v606:find("DT") then
                renderer.gradient((v592 + 23), (v612 + 32), dtcircle, 3, v607, v608, v609, 130, v607, v608, v609, 100, true)
                renderer.gradient((v592 + 23), (v612 + 32), (-dtcircle + 1), 3, v607, v608, v609, 130, v607, v608, v609, 100, true)
            end
            if v606:find("LC") then
                renderer.gradient((v592 + 22), (v612 + 32), lcbar, 3, v607, v608, v609, 130, v607, v608, v609, 80, true)
                renderer.gradient((v592 + 22), (v612 + 32), -lcbar, 3, v607, v608, v609, 130, v607, v608, v609, 80, true)
            end
            if (isBombBeingPlanted and v606:find("Bombsite")) then
                local v613, v614 = renderer_measure_text("+b", v606)
                local v615 = (((v592 + v613) + v600) + 4)
                local v616 = (v612 + (v614 / 1.71))
                renderer_circle_outline(v615, v616, 0, 0, 0, 200, v600, 0, 1.0, v601)
                renderer_circle_outline(v615, v616, 255, 255, 255, 200, v602, 0, fn180(), v603)
            end
        end
        v594 = {}
    end)
    client.set_event_callback("bomb_beginplant", function()
        v596 = (globals_curtime_98() + v595)
        isBombBeingPlanted = true
    end)
    client.set_event_callback("bomb_abortplant", function()
        isBombBeingPlanted = false
    end)
    client.set_event_callback("bomb_planted", function()
        isBombBeingPlanted = false
    end)
    local function fn181(a0_1040)
        if not ui.get(visuals_tab.indicators) then
            return
        end
        table_insert(v594, a0_1040)
    end
    client.set_event_callback("shutdown", function()
        client_unset_event_callback("indicator", fn181)
    end)
    client.set_event_callback("paint", function()
        if not ui.get(visuals_tab.indicators) then
            client_unset_event_callback("indicator", fn181)
        else
            client.set_event_callback("indicator", fn181)
        end
    end)
    local v617 = {}
    function notify_render()
        if ui.get(visuals_tab.eventlogs) then
            local client_screen_size_100, v618 = client.screen_size()
            for i619, i620 in ipairs(v617) do
                if (i619 > 8) then
                    table.remove(v617, i619)
                end
                if ((i620.text ~= nil) and (i620.text ~= "")) then
                    local v621 = i620.color
                    local v622 = vector(renderer.measure_text("c", i620.text))
                    if ((i620.timer + 7) < globals.realtime()) then
                        i620.length = lerp(i620.length, 0, (globals.frametime() * 4.5))
                        i620.alpha_text = lerp(i620.alpha_text, 0, (globals.frametime() * 6))
                        i620.alpha = lerp(i620.alpha, 0, (globals.frametime() * 10))
                        i620.alpha2 = lerp(i620.alpha2, 0, (globals.frametime() * 2))
                    else
                        i620.length = lerp(i620.length, (((v622.x + 22) / 2) + 1), (globals.frametime() * 3))
                        i620.alpha_text = lerp(i620.alpha_text, 200, (globals.frametime() * 8))
                        i620.alpha = lerp(i620.alpha, 150, (globals.frametime() * 6))
                        i620.alpha2 = lerp(i620.alpha2, 25, (globals.frametime() * 4))
                    end
                end
                local_player = entity.get_local_player()
                if (local_player == nil) then
                    return
                end
                local v623 = vector(renderer.measure_text("c", i620.text))
                local ui_get_101, v624, v625, v626 = ui.get(visuals_tab.accent)
                renderer.rectangle((((client_screen_size_100 / 2) - (v623.x / 2)) - 10), ((v618 + (i619 * 28.5)) - 300), (v623.x + 22), (v623.y + 5), 0, 0, 0, i620.alpha)
                renderer.rectangle(((((client_screen_size_100 / 2) - (v623.x / 2)) - 25) + ((v623.x + 52) / 2)), ((v618 + (i619 * 28.5)) - 284), i620.length, (v623.y - 11), ui_get_101, v624, v625, i620.alpha)
                renderer.rectangle(((((client_screen_size_100 / 2) - (v623.x / 2)) - 25) + ((v623.x + 52) / 2)), ((v618 + (i619 * 28.5)) - 284), -i620.length, (v623.y - 11), ui_get_101, v624, v625, i620.alpha)
                renderer.gradient((((client_screen_size_100 / 2) - (v623.x / 2)) - 10), ((v618 + (i619 * 28.5)) - 300), 12, 1, ui_get_101, v624, v625, i620.alpha_text, ui_get_101, v624, v625, i620.alpha2, true)
                renderer.gradient((((client_screen_size_100 / 2) - (v623.x / 2)) - 10), ((v618 + (i619 * 28.5)) - 300), 1, 12, ui_get_101, v624, v625, i620.alpha_text, ui_get_101, v624, v625, i620.alpha2, false)
                renderer.gradient(((client_screen_size_100 / 2) + (v623.x / 2)), ((v618 + (i619 * 28.5)) - 300), 12, 1, ui_get_101, v624, v625, i620.alpha2, ui_get_101, v624, v625, i620.alpha_text, true)
                renderer.gradient((((client_screen_size_100 / 2) + (v623.x / 2)) + 11), ((v618 + (i619 * 28.5)) - 300), 1, 12, ui_get_101, v624, v625, i620.alpha_text, ui_get_101, v624, v625, i620.alpha2, false)
                renderer.text(((client_screen_size_100 / 2) - (v623.x / 2)), ((v618 + (i619 * 28.5)) - 300), ui_get_101, v624, v625, i620.alpha_text, "", nil, i620.text)
                if ((i620.timer + 9.15) < globals.realtime()) then
                    table.remove(v617, i619)
                end
            end
        end
    end
    function new_notify(a0_1042, a1_1044, a2_1046, a3_1048, a4_1050)
        local l_841_arg0 = {
    text = a0_1042,
    timer = globals.realtime(),
    color = { a1_1044, a2_1046, a3_1048, a4_1050 },
    alpha = 0,
    alpha_text = 0,
    length = 0,
    alpha2 = 0,
}
        local v627 = select(1.25, client.screen_size())
        if (#v617 == 0) then
            l_841_arg0.y = (v627 + 30)
        else
            local v628 = v617[#v617]
            l_841_arg0.y = (v628.y + 30)
        end
        table.insert(v617, l_841_arg0)
    end
    local v629 = {
    "generic",
    "head",
    "chest",
    "stomach",
    "left arm",
    "right arm",
    "left leg",
    "right leg",
    "neck",
    "?",
    "gear",
}
    client.set_event_callback("aim_fire", function(a0_1052)
        if not ui.get(visuals_tab.eventlogs) then
            return
        end
        stored_shot = {
        damage = a0_1052.damage,
        hitbox = v629[(a0_1052.hitgroup + 1)],
        lagcomp = a0_1052.teleported,
        backtrack = (globals.tickcount() - a0_1052.tick),
    }
    end)
    local function fn182(a0_1054)
        local v630 = (v629[(a0_1054.hitgroup + 1)] or "?")
        local math_floor_102 = math.floor(a0_1054.hit_chance)
        if ui.get(visuals_tab.eventlogs) then
            new_notify(string.format("Hit %s in the %s for %s (%s) (%s health remaining) | bt=%s | hc=%s", entity.get_player_name(a0_1054.target), v630, a0_1054.damage, stored_shot.damage, entity.get_prop(a0_1054.target, "m_iHealth"), (globals.tickcount() - a0_1054.tick), math_floor_102), 255, 255, 255, 255)
            local string_format = string.format("Hit %s in the %s for %s (%s) (%s health remaining) | bt=%s | hc=%s", entity.get_player_name(a0_1054.target), v630, a0_1054.damage, stored_shot.damage, entity.get_prop(a0_1054.target, "m_iHealth"), (globals.tickcount() - a0_1054.tick), math_floor_102)
            print(string_format)
        end
    end
    client.set_event_callback("aim_hit", fn182)
    local function fn183(a0_1056)
        local v631 = (v629[(a0_1056.hitgroup + 1)] or "?")
        local math_floor_103 = math.floor(a0_1056.hit_chance)
        if ui.get(visuals_tab.eventlogs) then
            new_notify(string.format("missed %s in the %s(%s) for %s (%s health remaining) due to %s | bt=%s | hc=%s", entity.get_player_name(a0_1056.target), v631, v631, stored_shot.damage, entity.get_prop(a0_1056.target, "m_iHealth"), a0_1056.reason, (globals.tickcount() - a0_1056.tick), math_floor_103), 255, 255, 255, 255)
            local string_format_104 = string.format("missed %s in the %s(%s) for %s (%s health remaining) due to %s | bt=%s | hc=%s", entity.get_player_name(a0_1056.target), v631, v631, stored_shot.damage, entity.get_prop(a0_1056.target, "m_iHealth"), a0_1056.reason, (globals.tickcount() - a0_1056.tick), math_floor_103)
            print(string_format_104)
        end
    end
    client.set_event_callback("aim_miss", fn183)
    local function fn184(a0_1058)
        local client_userid_to_entindex_105 = client.userid_to_entindex(a0_1058.attacker)
        local client_userid_to_entindex_106 = client.userid_to_entindex(a0_1058.userid)
        local entity_get_local_player_107 = entity.get_local_player()
        local entity_get_local_player_108 = entity.get_local_player()
        local entity_get_prop_109, v632, v633 = entity.get_prop(entity_get_local_player_108, "m_vecOrigin")
        local math_floor_110 = math.floor(fn156(entity_get_local_player_108, 10, entity_get_prop_109, v632, v633))
        if (math_floor_110 < 0) then
            math_floor_110 = 0
        end
        if ((client_userid_to_entindex_106 == entity_get_local_player_107) and ui.get(visuals_tab.eventlogs)) then
            new_notify(string.format("you've got killed by %s | safehead: %s | broken lc: %s | teleport: %s", entity.get_player_name(client_userid_to_entindex_105), ((safeheadtarget() and ui.get(v248.other.safe_head)) and (((((fn150:get_condition_type() == "Aircrouching") or (fn150:get_condition_type() == "Crouching")) or (fn150:get_condition_type() == "Crouchrunning")) or (fn150:get_condition_type() == "Standing")) or (fn150:get_condition_type() == "Fakelag"))), is_defensive, math_floor_110, 255, 255, 255, 255))
            local string_format_111 = string.format("you've got killed by %s | safehead: %s | broken lc: %s | teleport: %s", entity.get_player_name(client_userid_to_entindex_105), ((safeheadtarget() and ui.get(v248.other.safe_head)) and (((((fn150:get_condition_type() == "Aircrouching") or (fn150:get_condition_type() == "Crouching")) or (fn150:get_condition_type() == "Crouchrunning")) or (fn150:get_condition_type() == "Standing")) or (fn150:get_condition_type() == "Fakelag"))), is_defensive, math_floor_110)
            print(string_format_111)
        end
    end
    client.set_event_callback("player_death", fn184)
    local function fn185(a0_1060)
        local client_userid_to_entindex_112 = client.userid_to_entindex(a0_1060.userid)
        if ((client_userid_to_entindex_112 ~= local_player) and ui.get(visuals_tab.eventlogs)) then
            new_notify(string.format("%s bought %s", entity.get_player_name(client_userid_to_entindex_112), a0_1060.weapon), 255, 255, 255, 255)
        end
    end
    client.set_event_callback("item_purchase", fn185)
    client.set_event_callback("paint_ui", function()
        notify_render()
    end)
    local v634 = {
    desyncsize = 0,
    newsway = 0,
    dtalpha = 75,
    hsalpha = 75,
    fsalpha = 75,
    dmgalpha = 75,
    lcbar = 0,
    addiction = 0,
    baralpha = 1,
    scopedalpha = 1,
    scopedalign = 0,
    arrow_left = 0,
    arrow_right = 0,
    forarrows = 0,
    inactive_fraction = 0,
    active_fraction = 0,
    fraction = 0,
    hide_fraction = 0,
    dmg_fraction = 0,
    scoped_fraction = 0,
    lby_r = 0,
    lby_l = 0,
}
    ctx_clamp = function(a0_1062, a1_1064, a2_1066)
        assert(((a0_1062 and a1_1064) and a2_1066), "not very useful error message here")
        if (a1_1064 > a2_1066) then
            a1_1064, a2_1066 = a2_1066, a1_1064
        end
        return math.max(a1_1064, math.min(a2_1066, a0_1062))
    end
    easeInOut = function(a0_1068)
        return (((a0_1068 > 0.5) and ((4 * ((a0_1068 - 1) ^ 3)) + 1)) or (4 * (a0_1068 ^ 3)))
    end
    function round(a0_1070)
        return math.floor((a0_1070 + 0.5))
    end
    client.set_event_callback("paint", function()
        local entity_get_local_player_113 = entity.get_local_player()
        if (not entity_get_local_player_113 or not entity.is_alive(entity_get_local_player_113)) then
            return
        end
        cvet1, cvet2, cvet3, cvet4 = ui.get(visuals_tab.accent)
        local client_screen_size_114, v635 = client.screen_size()
        if ui.get(visuals_tab.watermark) then
            renderer.rectangle(((client_screen_size_114 / 2) - 52), (v635 - 13), 104, 13, 0, 0, 0, 100)
            renderer.gradient(((client_screen_size_114 / 2) - 52), (v635 - 13), 10, 1, cvet1, cvet2, cvet3, 255, cvet1, cvet2, cvet3, 30, true)
            renderer.gradient(((client_screen_size_114 / 2) - 52), (v635 - 13), 1, 10, cvet1, cvet2, cvet3, 255, cvet1, cvet2, cvet3, 30, false)
            renderer.gradient(((client_screen_size_114 / 2) + 42), (v635 - 13), 10, 1, cvet1, cvet2, cvet3, 40, cvet1, cvet2, cvet3, 255, true)
            renderer.gradient(((client_screen_size_114 / 2) + 52), (v635 - 13), 1, 10, cvet1, cvet2, cvet3, 255, cvet1, cvet2, cvet3, 30, false)
            renderer.text(((client_screen_size_114 / 2) - (renderer.measure_text("", ("bounty ~ " .. (math.floor((client.latency() * 1000)) .. "ms"))) / 2)), (v635 - 12), 255, 255, 255, 50, "", nil, animate_text((globals.curtime() * 1), ("bounty ~ " .. (math.floor((client.latency() * 1000)) .. "ms")), 0, 0, 0, 255, cvet1, cvet2, cvet3, 255))
        end
        local v636 = { client.screen_size() }
        local entity_get_prop_115 = entity.get_prop(entity.get_local_player(), "m_bIsScoped")
        local entity_get_local_player_116 = entity.get_local_player()
        if (not entity_get_local_player_116 or not entity.is_alive(entity_get_local_player_116)) then
            return
        end
        if (ui.get(visuals_tab.arrows) ~= "Off") then
            if (entity_get_prop_115 ~= 0) then
                v634.forarrows = lerp(v634.forarrows, 0, (globals.frametime() * 24))
            else
                v634.forarrows = lerp(v634.forarrows, 1, (globals.frametime() * 24))
            end
            if (ui.get(visuals_tab.arrows) == "TS4") then
                if (manual_dir == 2) then
                    v634.arrow_right = lerp(v634.arrow_right, 255, (globals.frametime() * 24))
                else
                    v634.arrow_right = lerp(v634.arrow_right, 0, (globals.frametime() * 24))
                end
                if (manual_dir == 1) then
                    v634.arrow_left = lerp(v634.arrow_left, 255, (globals.frametime() * 24))
                else
                    v634.arrow_left = lerp(v634.arrow_left, 0, (globals.frametime() * 24))
                end
                client_screen_size = v636[1]
                v591 = v636[2]
                local v637 = ((entity.get_prop(entity.get_local_player(), "m_flPoseParameter", "m_nTickbase", 11) * 120) - 60)
                renderer.triangle(((client_screen_size / 2) + 55), ((v591 / 2) + 2), ((client_screen_size / 2) + 42), ((v591 / 2) - 7), ((client_screen_size / 2) + 42), ((v591 / 2) + 11), (((manual_dir == 2) and cvet1) or 25), (((manual_dir == 2) and cvet2) or 25), (((manual_dir == 2) and cvet3) or 25), (((manual_dir == 2) and (255 * v634.forarrows)) or (160 * v634.forarrows)))
                renderer.triangle(((client_screen_size / 2) - 55), ((v591 / 2) + 2), ((client_screen_size / 2) - 42), ((v591 / 2) - 7), ((client_screen_size / 2) - 42), ((v591 / 2) + 11), (((manual_dir == 1) and cvet1) or 25), (((manual_dir == 1) and cvet2) or 25), (((manual_dir == 1) and cvet3) or 25), (((manual_dir == 1) and (255 * v634.forarrows)) or (160 * v634.forarrows)))
                renderer.rectangle(((client_screen_size / 2) + 38), ((v591 / 2) - 7), 2, 18, (((v637 < -10) and cvet1) or 25), (((v637 < -10) and cvet2) or 25), (((v637 < -10) and cvet3) or 25), (((v637 < -10) and (255 * v634.forarrows)) or (160 * v634.forarrows)))
                renderer.rectangle(((client_screen_size / 2) - 40), ((v591 / 2) - 7), 2, 18, (((v637 > 10) and cvet1) or 25), (((v637 > 10) and cvet2) or 25), (((v637 > 10) and cvet3) or 25), (((v637 > 10) and (255 * v634.forarrows)) or (160 * v634.forarrows)))
            elseif (ui.get(visuals_tab.arrows) == "Bounty") then
                if (manual_dir == 2) then
                    v634.arrow_right = lerp(v634.arrow_right, 255, (globals.frametime() * 14))
                else
                    v634.arrow_right = lerp(v634.arrow_right, 0, (globals.frametime() * 14))
                end
                if (manual_dir == 1) then
                    v634.arrow_left = lerp(v634.arrow_left, 255, (globals.frametime() * 14))
                else
                    v634.arrow_left = lerp(v634.arrow_left, 0, (globals.frametime() * 24))
                end
                local v638 = antiaim.get_desync(1)
                if (v638 <= -1) then
                    v634.lby_l = lerp(v634.lby_l, 255, (globals.frametime() * 14))
                else
                    v634.lby_l = lerp(v634.lby_l, 0, (globals.frametime() * 14))
                end
                if (v638 >= -1) then
                    v634.lby_r = lerp(v634.lby_r, 255, (globals.frametime() * 14))
                else
                    v634.lby_r = lerp(v634.lby_r, 0, (globals.frametime() * 14))
                end
                renderer.text(((v636[1] / 2) - 50), (v636[2] / 2), 255, 255, 255, (255 * v634.forarrows), "+c", nil, "<")
                renderer.text(((v636[1] / 2) + 50), (v636[2] / 2), 255, 255, 255, (255 * v634.forarrows), "+c", nil, ">")
                renderer.text(((v636[1] / 2) - 50), (v636[2] / 2), cvet1, cvet2, cvet3, v634.arrow_left, "+c", nil, "<")
                renderer.text(((v636[1] / 2) + 50), (v636[2] / 2), cvet1, cvet2, cvet3, v634.arrow_right, "+c", nil, ">")
                renderer.text(((v636[1] / 2) - 65), (v636[2] / 2), cvet1, cvet2, cvet3, (v634.lby_l * v634.forarrows), "+c", nil, "<")
                renderer.text(((v636[1] / 2) + 65), (v636[2] / 2), cvet1, cvet2, cvet3, (v634.lby_r * v634.forarrows), "+c", nil, ">")
            end
        end
        if (ui.get(visuals_tab.center_indicators) == "Modern") then
            local client_screen_size_117, v639 = client.screen_size()
            local renderer_measure_text_118, v640 = renderer.measure_text("b", "bounty°")
            local v641, v642, v643, v644 = cvet1, cvet2, cvet3, cvet4
            state = fn150:get_condition_type()
            if (ui.get(visuals_tab.onscope) == "Right") then
                if (entity_get_prop_115 ~= 0) then
                    v634.scoped_fraction = 1
                    v634.scopedalpha = lerp(v634.scopedalpha, 1, (globals.frametime() * 14))
                    alphaforlogo = "\affffffff"
                else
                    v634.scoped_fraction = lerp(v634.scoped_fraction, 0, (globals.frametime() * 24), 0, 1)
                    v634.scopedalpha = lerp(v634.scopedalpha, 1, (globals.frametime() * 24))
                    alphaforlogo = "\affffffff"
                end
            elseif (ui.get(visuals_tab.onscope) == "Alpha") then
                v634.scoped_fraction = lerp(v634.scoped_fraction, 0, (globals.frametime() * 24), 0, 1)
                if (entity_get_prop_115 ~= 0) then
                    alphaforlogo = "\affffff00"
                    v634.scopedalpha = lerp(v634.scopedalpha, 0, (globals.frametime() * 24))
                else
                    alphaforlogo = "\affffffff"
                    v634.scopedalpha = lerp(v634.scopedalpha, 1, (globals.frametime() * 24))
                end
            elseif (ui.get(visuals_tab.onscope) == "Off") then
                alphaforlogo = "\affffffff"
                v634.scopedalpha = lerp(v634.scopedalpha, 1, (globals.frametime() * 24))
                v634.scoped_fraction = lerp(v634.scoped_fraction, 0, (globals.frametime() * 24), 0, 1)
            end
            angle = math.min(57, math.abs(((entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * 120) - 60)))
            if (angle > 35) then
                v634.desyncsize = lerp(v634.desyncsize, (math.random(25, 36) + math.random(0, -20)), (globals.frametime() * 24))
            elseif (angle > 10) then
                v634.desyncsize = lerp(v634.desyncsize, angle, (globals.frametime() * 24))
            elseif ((angle < 10) or is_freezetime()) then
                v634.desyncsize = lerp(v634.desyncsize, 0, (globals.frametime() * 24))
            end
            if (shouldonfreezetime and is_freezetime()) then
                v634.desyncsize = lerp(v634.desyncsize, 0, (globals.frametime() * 24))
            end
            if ((v634.desyncsize < 2) or (entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 1)) then
                v634.addiction = lerp(v634.addiction, 8, (globals.frametime() * 24))
                v634.baralpha = lerp(v634.baralpha, 0, (globals.frametime() * 24))
            else
                v634.addiction = lerp(v634.addiction, 0, (globals.frametime() * 24))
                v634.baralpha = lerp(v634.baralpha, 1, (globals.frametime() * 24))
            end
            local v645 = v634.scoped_fraction
            renderer.rectangle((((client_screen_size_117 / 2) - 18) + (((renderer_measure_text_118 + 2) / 2.1) * v645)), ((v639 / 2) + 28), 36, 5, 0, 0, 0, ((255 * v634.baralpha) * v634.scopedalpha))
            renderer.rectangle((((client_screen_size_117 / 2) - 17) + (((renderer_measure_text_118 + 2) / 2.1) * v645)), ((v639 / 2) + 29), (v634.desyncsize * v634.scopedalpha), 3, cvet1, cvet2, cvet3, ((255 * v634.baralpha) * v634.scopedalpha))
            renderer.gradient((((client_screen_size_117 / 2) - 17) + (((renderer_measure_text_118 + 2) / 2.1) * v645)), ((v639 / 2) + 29), (v634.desyncsize * v634.scopedalpha), 3, 0, 0, 0, 0, 0, 0, 0, ((200 * v634.baralpha) * v634.scopedalpha), true)
            dangerouscolor = string.format("\a%s", rgba_to_hex(255, 255, 255, v634.scopedalpha))
            renderer.text(((client_screen_size_117 / 2) + (((renderer_measure_text_118 + 2) / 2.2) * v645)), ((v639 / 2) + 20), 255, 255, 255, (255 * v634.scopedalpha), "cb", 0, animate_text((globals.curtime() * 2.5), "bounty", 255, 255, 255, (255 * v634.scopedalpha), cvet1, cvet2, cvet3, (255 * v634.scopedalpha)))
            local entity_get_prop_119 = entity.get_prop(entity.get_local_player(), "m_flNextAttack")
            local entity_get_prop_120 = entity.get_prop(entity.get_player_weapon(entity.get_local_player()), "m_flNextPrimaryAttack")
            local v646 = (ui.get(v313.doubletap[1]) and ui.get(v313.doubletap[2]))
            local entity_get_local_player_121 = entity.get_local_player()
            local entity_get_prop_122 = entity.get_prop(entity_get_local_player_121, "m_flNextAttack")
            local entity_get_prop_123 = entity.get_prop(entity.get_player_weapon(entity_get_local_player_121), "m_flNextPrimaryAttack")
            local v647 = false
            if (entity_get_prop_123 ~= nil) then
                v647 = not (math.max(entity_get_prop_123, entity_get_prop_122) > globals.curtime())
            end
            if (v646 and v647) then
                v634.active_fraction = ctx_clamp((v634.active_fraction + (globals.frametime() / 0.15)), 0, 1)
            else
                v634.active_fraction = ctx_clamp((v634.active_fraction - (globals.frametime() / 0.15)), 0, 1)
            end
            if (v646 and not v647) then
                v634.inactive_fraction = ctx_clamp((v634.inactive_fraction + (globals.frametime() / 0.15)), 0, 1)
            else
                v634.inactive_fraction = ctx_clamp((v634.inactive_fraction - (globals.frametime() / 0.15)), 0, 1)
            end
            if ((ui.get(v313.hideshots[1]) and ui.get(v313.hideshots[2])) and not v646) then
                v634.hide_fraction = ctx_clamp((v634.hide_fraction + (globals.frametime() / 0.15)), 0, 1)
            else
                v634.hide_fraction = ctx_clamp((v634.hide_fraction - (globals.frametime() / 0.15)), 0, 1)
            end
            if (math.max(v634.hide_fraction, v634.inactive_fraction, v634.active_fraction) > 0) then
                v634.fraction = ctx_clamp((v634.fraction + (globals.frametime() / 0.2)), 0, 1)
            else
                v634.fraction = ctx_clamp((v634.fraction - (globals.frametime() / 0.2)), 0, 1)
            end
            local renderer_measure_text_124 = renderer.measure_text("-", "")
            local renderer_measure_text_125 = renderer.measure_text("-", "DT")
            renderer.text(((client_screen_size_117 / 2) + ((((renderer_measure_text_124 + renderer_measure_text_125) + 2) / 2) * v645)), (((v639 / 2) + 37) - v634.addiction), 255, 255, 255, ((v634.active_fraction * 255) * v634.scopedalpha), "-c", ((renderer_measure_text_124 + (v634.active_fraction * renderer_measure_text_125)) + 1), animate_text((globals.curtime() * 1.5), "", 50, 50, 50, (255 * v634.scopedalpha), cvet1, cvet2, cvet3, (255 * v634.scopedalpha)), ("\a" .. (rgba_to_hex(155, 255, 155, ((255 * v634.active_fraction) * v634.scopedalpha)) .. animate_text((globals.curtime() * 1.5), "DT", 200, 200, 200, (255 * v634.scopedalpha), 200, 200, 200, (255 * v634.scopedalpha)))))
            local renderer_measure_text_126 = renderer.measure_text("-", "DT")
            local v648 = animate_text((globals.curtime() * 1.5), "DT", 100, 0, 0, (255 * v634.scopedalpha), 100, 0, 0, (255 * v634.scopedalpha))
            renderer.text(((client_screen_size_117 / 2) + ((((renderer_measure_text_124 + renderer_measure_text_126) + 2) / 2) * v645)), (((v639 / 2) + 37) - v634.addiction), 255, 255, 255, ((v634.inactive_fraction * 255) * v634.scopedalpha), "-c", ((renderer_measure_text_124 + (v634.inactive_fraction * renderer_measure_text_126)) + 1), "", v648)
            local renderer_measure_text_127 = renderer.measure_text("-", "")
            local renderer_measure_text_128 = renderer.measure_text("-", "HS")
            renderer.text(((client_screen_size_117 / 2) + ((((renderer_measure_text_127 + renderer_measure_text_128) + 2) / 2) * v645)), (((v639 / 2) + 37) - v634.addiction), 255, 255, 255, ((v634.hide_fraction * 255) * v634.scopedalpha), "-c", ((renderer_measure_text_127 + (v634.hide_fraction * renderer_measure_text_128)) + 1), animate_text((globals.curtime() * 1.5), "HS", 200, 200, 200, (255 * v634.scopedalpha), 200, 200, 200, (255 * v634.scopedalpha)), ("\a" .. (rgba_to_hex(155, 155, 200, ((255 * v634.hide_fraction) * v634.scopedalpha)) .. "")))
            local renderer_measure_text_129 = renderer.measure_text("-", ("> " .. (string.upper(state) .. " <")))
            renderer.text(((client_screen_size_117 / 2) + (((renderer_measure_text_129 + 2) / 2) * v645)), ((((v639 / 2) + 37) + (8 * easeInOut(v634.fraction))) - v634.addiction), 255, 255, 255, (255 * v634.scopedalpha), "-c", 0, animate_text((globals.curtime() * 1.5), string.format("> %s <", string.upper(state)), 200, 200, 200, (255 * v634.scopedalpha), 200, 200, 200, (255 * v634.scopedalpha)))
        elseif (ui.get(visuals_tab.center_indicators) == "Bounty") then
            local client_screen_size_130, v649 = client.screen_size()
            local renderer_measure_text_131, v650 = renderer.measure_text("c", "bounty°")
            local v651, v652, v653, v654 = cvet1, cvet2, cvet3, cvet4
            state = fn150:get_condition_type()
            angle = math.min(57, math.abs(((entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * 120) - 60)))
            if (angle > 35) then
                v634.desyncsize = lerp(v634.desyncsize, (math.random(25, 36) + math.random(0, -20)), (globals.frametime() * 24))
            elseif (angle > 10) then
                v634.desyncsize = lerp(v634.desyncsize, angle, (globals.frametime() * 24))
            elseif ((angle < 10) or is_freezetime()) then
                v634.desyncsize = lerp(v634.desyncsize, 0, (globals.frametime() * 24))
            end
            if (shouldonfreezetime and is_freezetime()) then
                v634.desyncsize = lerp(v634.desyncsize, 0, (globals.frametime() * 24))
            end
            if ((v634.desyncsize < 2) or (entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 1)) then
                v634.addiction = lerp(v634.addiction, 8, (globals.frametime() * 24))
                v634.baralpha = lerp(v634.baralpha, 0, (globals.frametime() * 24))
            else
                v634.addiction = lerp(v634.addiction, 0, (globals.frametime() * 24))
                v634.baralpha = lerp(v634.baralpha, 1, (globals.frametime() * 24))
            end
            if (ui.get(visuals_tab.onscope) == "Right") then
                if (entity_get_prop_115 ~= 0) then
                    v634.scoped_fraction = 1
                    v634.scopedalpha = lerp(v634.scopedalpha, 1, (globals.frametime() * 14))
                    alphaforlogo = "\affffffff"
                else
                    v634.scoped_fraction = lerp(v634.scoped_fraction, 0, (globals.frametime() * 24), 0, 1)
                    v634.scopedalpha = lerp(v634.scopedalpha, 1, (globals.frametime() * 24))
                    alphaforlogo = "\affffffff"
                end
            elseif (ui.get(visuals_tab.onscope) == "Alpha") then
                v634.scoped_fraction = lerp(v634.scoped_fraction, 0, (globals.frametime() * 24), 0, 1)
                if (entity_get_prop_115 ~= 0) then
                    alphaforlogo = "\affffff00"
                    v634.scopedalpha = lerp(v634.scopedalpha, 0, (globals.frametime() * 24))
                else
                    alphaforlogo = "\affffffff"
                    v634.scopedalpha = lerp(v634.scopedalpha, 1, (globals.frametime() * 24))
                end
            elseif (ui.get(visuals_tab.onscope) == "Off") then
                alphaforlogo = "\affffffff"
                v634.scopedalpha = lerp(v634.scopedalpha, 1, (globals.frametime() * 24))
                v634.scoped_fraction = lerp(v634.scoped_fraction, 0, (globals.frametime() * 24), 0, 1)
            end
            if (entity_get_prop_115 ~= 0) then
                v634.forarrows = lerp(v634.forarrows, 0, (globals.frametime() * 24))
            else
                v634.forarrows = lerp(v634.forarrows, 1, (globals.frametime() * 24))
            end
            local v655 = v634.scoped_fraction
            dangerouscolor = string.format("\a%s", rgba_to_hex(255, 255, 255, v634.scopedalpha))
            renderer.gradient((((client_screen_size_130 / 2) - 38) + (((renderer_measure_text_131 + 2) / 2) * v655)), ((v649 / 2) + 12), 76, 14, cvet1, cvet2, cvet3, (75 * v634.forarrows), 0, 0, 0, (25 * v634.forarrows), false)
            renderer.gradient((((client_screen_size_130 / 2) - 38) + (((renderer_measure_text_131 + 2) / 2) * v655)), ((v649 / 2) + 12), 10, 1, cvet1, cvet2, cvet3, (255 * v634.forarrows), cvet1, cvet2, cvet3, (0 * v634.forarrows), true)
            renderer.gradient((((client_screen_size_130 / 2) - 38) + (((renderer_measure_text_131 + 2) / 2) * v655)), ((v649 / 2) + 12), 1, 10, cvet1, cvet2, cvet3, (255 * v634.forarrows), cvet1, cvet2, cvet3, (0 * v634.forarrows), false)
            renderer.gradient((((client_screen_size_130 / 2) + 28) + (((renderer_measure_text_131 + 2) / 2) * v655)), ((v649 / 2) + 12), 10, 1, cvet1, cvet2, cvet3, (0 * v634.forarrows), cvet1, cvet2, cvet3, (255 * v634.forarrows), true)
            renderer.gradient((((client_screen_size_130 / 2) + 38) + (((renderer_measure_text_131 + 2) / 2) * v655)), ((v649 / 2) + 12), 1, 10, cvet1, cvet2, cvet3, (255 * v634.forarrows), cvet1, cvet2, cvet3, (0 * v634.forarrows), false)
            renderer.gradient((client_screen_size_130 / 2), ((v649 / 2) + 25), v634.desyncsize, 1, cvet1, cvet2, cvet3, (255 * v634.scopedalpha), cvet1, cvet2, cvet3, (0 * v634.scopedalpha), true)
            renderer.gradient(((client_screen_size_130 / 2) + (((renderer_measure_text_131 + 2) / 2) * v655)), ((v649 / 2) + 25), -v634.desyncsize, 1, cvet1, cvet2, cvet3, (255 * v634.forarrows), cvet1, cvet2, cvet3, (0 * v634.forarrows), true)
            renderer.text(((client_screen_size_130 / 2) + (((renderer_measure_text_131 + 2) / 2) * v655)), ((v649 / 2) + 18), cvet1, cvet2, cvet3, (255 * v634.scopedalpha), "c", 0, "bounty°")
            local entity_get_local_player_132 = entity.get_local_player()
            local entity_get_prop_133 = entity.get_prop(entity_get_local_player_132, "m_flNextAttack")
            local entity_get_prop_134 = entity.get_prop(entity.get_player_weapon(entity_get_local_player_132), "m_flNextPrimaryAttack")
            local v656 = false
            if (entity_get_prop_134 ~= nil) then
                v656 = not (math.max(entity_get_prop_134, entity_get_prop_133) > globals.curtime())
            end
            local v657 = v656
            local v658 = (ui.get(v313.doubletap[1]) and ui.get(v313.doubletap[2]))
            if v658 then
                v634.active_fraction = ctx_clamp((v634.active_fraction + (globals.frametime() / 0)), 0, 1)
            else
                v634.active_fraction = ctx_clamp((v634.active_fraction - (globals.frametime() / 0)), 0, 1)
            end
            if ((ui.get(v313.hideshots[1]) and ui.get(v313.hideshots[2])) and not v658) then
                v634.hide_fraction = ctx_clamp((v634.hide_fraction + (globals.frametime() / 0)), 0, 1)
            else
                v634.hide_fraction = ctx_clamp((v634.hide_fraction - (globals.frametime() / 0)), 0, 1)
            end
            if ui.get(v313.dmg[2]) then
                v634.dmg_fraction = ctx_clamp((v634.dmg_fraction + (globals.frametime() / 0)), 0, 1)
            else
                v634.dmg_fraction = ctx_clamp((v634.dmg_fraction - (globals.frametime() / 0)), 0, 1)
            end
            if (math.max(v634.hide_fraction, v634.active_fraction) > 0) then
                v634.fraction = ctx_clamp((v634.fraction + (globals.frametime() / 0.2)), 0, 1)
            else
                v634.fraction = ctx_clamp((v634.fraction - (globals.frametime() / 0.2)), 0, 1)
            end
            local renderer_measure_text_135 = renderer.measure_text("c", "")
            local renderer_measure_text_136 = renderer.measure_text("c", "dt")
            renderer.text(((client_screen_size_130 / 2) + ((((renderer_measure_text_135 + renderer_measure_text_136) + 2) / 2) * v655)), ((v649 / 2) + 40), 255, 255, 255, ((v634.active_fraction * 250) * v634.scopedalpha), "c", (renderer_measure_text_136 + 1), "dt")
            local renderer_measure_text_137 = renderer.measure_text("c", "")
            local renderer_measure_text_138 = renderer.measure_text("c", "hs")
            renderer.text(((client_screen_size_130 / 2) + ((((renderer_measure_text_137 + renderer_measure_text_138) + 2) / 2) * v655)), ((v649 / 2) + 40), 255, 255, 255, ((v634.hide_fraction * 255) * v634.scopedalpha), "c", ((renderer_measure_text_137 + (v634.hide_fraction * renderer_measure_text_138)) + 1), animate_text((globals.curtime() * 1.5), "hs", 255, 255, 255, (250 * v634.scopedalpha), 255, 255, 255, (250 * v634.scopedalpha)), ("\a" .. (rgba_to_hex(155, 155, 200, ((255 * v634.hide_fraction) * v634.scopedalpha)) .. "")))
            local renderer_measure_text_139 = renderer.measure_text("c", "dmg")
            renderer.text(((client_screen_size_130 / 2) + (((renderer_measure_text_139 + 2) / 2) * v655)), (((v649 / 2) + 40) + (8 * easeInOut(v634.fraction))), 255, 255, 255, ((v634.dmg_fraction * 255) * v634.scopedalpha), "c", ((v634.dmg_fraction * renderer_measure_text_139) + 1), animate_text((globals.curtime() * 1.5), "dmg", 255, 255, 255, (250 * v634.scopedalpha), 255, 255, 255, (250 * v634.scopedalpha)), ("\a" .. (rgba_to_hex(155, 155, 200, ((255 * v634.dmg_fraction) * v634.scopedalpha)) .. "")))
            local renderer_measure_text_140 = renderer.measure_text("c", ("~ " .. (string.lower(state) .. " ~")))
            renderer.text(((client_screen_size_130 / 2) + (((renderer_measure_text_140 + 2) / 2) * v655)), ((v649 / 2) + 30), 255, 255, 255, (250 * v634.scopedalpha), "c", 0, animate_text((globals.curtime() * 2), string.format("~%s~", string.lower(state)), 0, 0, 0, (180 * v634.scopedalpha), cvet1, cvet2, cvet3, (250 * v634.scopedalpha)))
        end
    end)
