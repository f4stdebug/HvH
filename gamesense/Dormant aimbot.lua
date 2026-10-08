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

    local client_visible, client_eye_position, client_log, client_trace_bullet, entity_get_bounding_box, entity_get_local_player, entity_get_origin, entity_get_player_name, entity_get_player_resource, entity_get_player_weapon, entity_get_prop, entity_is_dormant, entity_is_enemy, globals_curtime, globals_maxplayers, globals_tickcount, math_max, renderer_indicator, string_format, ui_get, ui_new_checkbox, ui_new_hotkey, ui_reference, ui_set_callback, sqrt, unpack, entity_is_alive, plist_get = client.visible, client.eye_position, client.log, client.trace_bullet, entity.get_bounding_box, entity.get_local_player, entity.get_origin, entity.get_player_name, entity.get_player_resource, entity.get_player_weapon, entity.get_prop, entity.is_dormant, entity.is_enemy, globals.curtime, globals.maxplayers, globals.tickcount, math.max, renderer.indicator, string.format, ui.get, ui.new_checkbox, ui.new_hotkey, ui.reference, ui.set_callback, sqrt, unpack, entity.is_alive, plist.get
    local ffi = require("ffi")
    local vector = require("vector")
    local weapons = require("gamesense/csgo_weapons")
    local native_GetClientEntity = vtable_bind("client_panorama.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*,int)")
    local native_IsWeapon = vtable_thunk(165, "bool(__thiscall*)(void*)")
    local native_GetInaccuracy = vtable_thunk(482, "float(__thiscall*)(void*)")
    local ref = {
    mindmg = ui_reference("RAGE", "Aimbot", "Minimum damage"),
    dormantEsp = ui_reference("VISUALS", "Player ESP", "Dormant"),
}
    local menu = {
    dormant_switch = ui_new_checkbox("RAGE", "Aimbot", "Dormant aimbot"),
    dormant_key = ui_new_hotkey("RAGE", "Aimbot", "Dormant aimbot", true),
    dormant_mindmg = ui.new_slider("RAGE", "Aimbot", "Dormant minimum damage", 0, 100, 10, true),
    dormant_indicator = ui_new_checkbox("RAGE", "Aimbot", "Dormant indicator"),
}
    local player_info_prev = {}
    local roundStarted = 0
    local function modify_velocity(e, goalspeed)
        local minspeed = math.sqrt(((e.forwardmove * e.forwardmove) + (e.sidemove * e.sidemove)))
        if ((goalspeed <= 0) or (minspeed <= 0)) then
            return
        end
        if (e.in_duck == 1) then
            goalspeed = (goalspeed * 2.94117647)
        end
        if (minspeed <= goalspeed) then
            return
        end
        local speedfactor = (goalspeed / minspeed)
        e.forwardmove = (e.forwardmove * speedfactor)
        e.sidemove = (e.sidemove * speedfactor)
    end
    local function on_setup_command(cmd)
        if not ui_get(menu.dormant_switch) then
            return
        end
        local local_player = entity_get_local_player()
        local my_weapon = entity_get_player_weapon(local_player)
        if not my_weapon then
            return
        end
        local ent = native_GetClientEntity(my_weapon)
        if ((ent == nil) or not native_IsWeapon(ent)) then
            return
        end
        local inaccuracy = native_GetInaccuracy(ent)
        if (inaccuracy == nil) then
            return
        end
        local tickcount = globals_tickcount()
        local player_resource = entity_get_player_resource()
        local eyepos = vector(client_eye_position())
        local simtime = entity_get_prop(local_player, "m_flSimulationTime")
        local weapon = weapons(my_weapon)
        local scoped = (entity_get_prop(local_player, "m_bIsScoped") == 1)
        local onground = bit.band(entity_get_prop(local_player, 'm_fFlags'), bit.lshift(1, 0))
        if (tickcount < roundStarted) then
            return
        end
        local can_shoot
        if weapon.is_revolver then
            can_shoot = (simtime > entity_get_prop(my_weapon, "m_flNextPrimaryAttack"))
        elseif weapon.is_melee_weapon then
            can_shoot = false
        else
            can_shoot = (simtime > math_max(entity_get_prop(local_player, "m_flNextAttack"), entity_get_prop(my_weapon, "m_flNextPrimaryAttack"), entity_get_prop(my_weapon, "m_flNextSecondaryAttack")))
        end
        local player_info = {}
        for player = 1, globals_maxplayers(), 1 do
            if (entity_get_prop(player_resource, "m_bConnected", player) == 1) then
                if plist_get(player, "Add to whitelist") then
                    goto skip
                end
                if (entity_is_dormant(player) and entity_is_enemy(player)) then
                    local can_hit
                    local origin = vector(entity_get_origin(player))
                    local x1, y1, x2, y2, alpha_multiplier = entity_get_bounding_box(player)
                    if (((player_info_prev[player] ~= nil) and (origin.x ~= 0)) and (alpha_multiplier > 0)) then
                        local old_origin, old_alpha, old_hittable = unpack(player_info_prev[player])
                        local dormant_accurate = (alpha_multiplier > 0.795)
                        if dormant_accurate then
                            local target = (origin + vector(0, 0, 40))
                            local pitch, yaw = angles()
                            local ent, dmg = client_trace_bullet(local_player, eyepos.x, eyepos.y, eyepos.z, target.x, target.y, target.z, true)
                            can_hit = ((dmg > ui_get(menu.dormant_mindmg)) and not client_visible(target.x, target.y, target.z))
                            if ((can_shoot and can_hit) and ui_get(menu.dormant_key)) then
                                modify_velocity(cmd, (((scoped and weapon.max_player_speed_alt) or weapon.max_player_speed) * 0.33))
                                if (((not scoped and (weapon.type == "sniperrifle")) and (cmd.in_jump == 0)) and (onground == 1)) then
                                    cmd.in_attack2 = 1
                                end
                                if ((inaccuracy < 0.009) and (cmd.chokedcommands == 0)) then
                                    cmd.pitch = pitch
                                    cmd.yaw = yaw
                                    cmd.in_attack = 1
                                    can_shoot = false
                                end
                            end
                        end
                    end
                    player_info[player] = { origin, alpha_multiplier, can_hit }
                end
            end
            ::None::
        end
        player_info_prev = player_info
    end
    client.register_esp_flag("DA", 255, 255, 255, function(player)
        if (((ui.get(menu.dormant_switch) and entity.is_enemy(player)) and (player_info_prev[player] ~= nil)) and entity.is_alive(entity_get_local_player())) then
            local _, _, can_hit = unpack(player_info_prev[player])
            return can_hit
        end
    end)
    local function painter()
        if not entity_is_alive(entity_get_local_player()) then
            return
        end
        if ((ui_get(menu.dormant_switch) and ui_get(menu.dormant_key)) and ui_get(menu.dormant_indicator)) then
            local colors = { 132, 196, 20, 245 }
            for k, v in pairs(player_info_prev) do
                if (k ~= nil) then
                    if (v[3] == true) then
                        colors = { 252, 222, 30, 245 }
                        break
                    end
                end
            end
            renderer_indicator(colors[1], colors[2], colors[3], colors[4], "DA")
        end
    end
    local function resetter()
        local freezetime = ((get_float() + 1) / globals.tickinterval())
        roundStarted = (globals_tickcount() + freezetime)
    end
    ui_set_callback(menu.dormant_switch, function()
        local czechbox = ui_get(menu.dormant_switch)
        local update_callback = ((czechbox and client.set_event_callback) or client.unset_event_callback)
        if czechbox then
            ui.set(ref.dormantEsp, czechbox)
        end
        update_callback("setup_command", on_setup_command)
        update_callback("paint", painter)
        update_callback("round_prestart", resetter)
        ui.set_visible(menu.dormant_indicator, ui_get(menu.dormant_switch))
        ui.set_visible(menu.dormant_mindmg, ui_get(menu.dormant_switch))
    end)
    ui.set(menu.dormant_indicator, true)
    ui.set_visible(menu.dormant_indicator, ui_get(menu.dormant_switch))
    ui.set_visible(menu.dormant_mindmg, ui_get(menu.dormant_switch))
