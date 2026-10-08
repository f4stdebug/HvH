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

    local lua = {}
    lua.configs = {}
    local pui = require('gamesense/pui')
    local base64 = require('gamesense/base64')
    local clipboard = require('gamesense/clipboard')
    local antiaim = require('gamesense/antiaim_funcs')
    local vector = require('vector')
    local ffi = require('ffi')
    local weapons = require('gamesense/csgo_weapons')
    lua.entity = require('gamesense/entity')
    local surface = require('gamesense/surface')
    local function require_lib(a0, a1)
        local v67, v68 = pcall(require, a0)
        if v67 then
            return v68
        else
            return error(a1)
        end
    end
    local images = require_lib("gamesense/images", "Download images library: https://gamesense.pub/forums/viewtopic.php?id=22917")
    local bit = require_lib("bit")
    local base64_1 = require_lib("gamesense/base64", "Download base64 encode/decode library: https://gamesense.pub/forums/viewtopic.php?id=21619")
    local antiaim_2 = require_lib("gamesense/antiaim_funcs", "Download anti-aim functions library: https://gamesense.pub/forums/viewtopic.php?id=29665")
    local ffi_3 = require_lib("ffi", "Failed to require FFI, please make sure Allow unsafe scripts is enabled!")
    local vector_4 = require_lib("vector", "Missing vector")
    local http = require_lib("gamesense/http", "Download HTTP library: https://gamesense.pub/forums/viewtopic.php?id=21619")
    local clipboard_5 = require_lib("gamesense/clipboard", "Download Clipboard library: https://gamesense.pub/forums/viewtopic.php?id=28678")
    local entity = require_lib("gamesense/entity", "Download Entity Object library: https://gamesense.pub/forums/viewtopic.php?id=27529")
    local weapons_6 = require_lib("gamesense/csgo_weapons", "Download CS:GO weapon data library: https://gamesense.pub/forums/viewtopic.php?id=18807")
    local v69 = vtable_bind("client_panorama.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
    local v70 = (require_lib("gamesense/steamworks") or error("Missing https://gamesense.pub/forums/viewtopic.php?id=26526"))
    local trace = require_lib("gamesense/trace", "https://gamesense.pub/forums/viewtopic.php?id=32949")
    local surface_7 = require("gamesense/surface")
    local v71 = "BOUNTY"
    local v72 = true
    local v73 = 0
    ragebot_tab = {}
    local angle_fake = {
    angle = pui.group('aa', 'anti-aimbot angles'),
    fake = pui.group('aa', 'fake lag'),
    other = pui.group('aa', 'other'),
}
    exploits_tab = { aipeek = ui.new_checkbox("AA", "other", "\v⮂ AI Peek \aA1A1A190(Pls on Retreat on key release)") }
    function sway()
        if (v72 == true) then
            v73 = (v73 + 1)
            if (v73 > 255) then
                v72 = false
            end
        else
            v73 = (v73 - 1)
            if (v73 == 0) then
                v72 = true
            end
        end
        return v73
    end
    function lerp(a0_274, a1_276, a2)
        if ((not a1_276 or not a0_274) or not a2) then
            return
        end
        return (a0_274 + ((a1_276 - a0_274) * a2))
    end
    function text_clamp(a0_279, a1_281, a2_283)
        if (a0_279 < a1_281) then
            return a1_281
        elseif (a0_279 > a2_283) then
            return a2_283
        else
            return a0_279
        end
    end
    local v74 = function()
        if ui.get(ragebot_tab.resolver) then
            if not entity.is_alive(local_player) then
                return
            end
            client.update_player_list()
            for i75 = 1, #L_60_, 1 do
                local v76 = L_60_[i75]
                if entity.is_enemy(v76) then
                    local v77, v78 = L_61_.get_simtime(v76)
                    v77, v78 = toticks(v77), toticks(v78)
                    if not L_61_.records[v76] then
                        L_61_.records[v76] = {}
                    end
                    local v79 = L_61_.records[v76]
                    v79[v77] = {
        pose = ((entity.get_prop(v76, "m_flPoseParameter", 1) * 120) - 60),
        eye = select(2, entity.get_prop(v76, "m_angEyeAngles")),
    }
                    local v80
                    local v81 = ((v79[v78] and v79[v77]) ~= nil)
                    if v81 then
                        local v82 = L_61_.get_animstate(v76)
                        local v83 = L_61_.get_max_desync(v82)
                        if (((v79[v78] and v79[v77]) and (normalize_pitch < 0.85)) and ((v77 - v78) < 2)) then
                            local v84 = text_clamp(normalize_pitch((v82.last_origin - v79[v77].eye)), -89, 89)
                            v80 = ((v79[v78] and (v79[v78].pose * v84)) or nil)
                        end
                        if v80 then
                            plist.set(v76, "Force pitch value", v80)
                        end
                    end
                    plist.set(v76, "Force pitch", (v80 ~= nil))
                    plist.set(v76, "Correction active", true)
                else
                    plist.set(i75, "Force pitch", false)
                    L_61_.records = {}
                end
            end
        end
    end
    local function fn43(a0_285)
        local entity_get_prop, v85 = entity.get_prop(a0_285, "m_vecVelocity")
        return math.sqrt(((entity_get_prop ^ 2) + (v85 ^ 2)))
    end
    local v86 = {}
    local v87 = {}
    local function fn44(a0_287)
        local v88 = v69(a0_287)
        local v89 = ffi_3.cast("float*", (ffi_3.cast("uintptr_t", v88) + 620))[0]
        local entity_get_prop_8 = entity.get_prop(a0_287, "m_flSimulationTime")
        if ((entity_get_prop_8 - v89) == 0) then
            return v87[a0_287]
        end
        local v90 = vector_4(entity.get_origin(a0_287))
        v86[a0_287] = (v86[a0_287] or v90)
        if (entity.is_dormant(a0_287) or not entity.is_alive(a0_287)) then
            return false
        end
        if (entity_get_prop_8 < v89) then
            return true
        end
        if (((v90 - v86[a0_287])):lengthsqr() > 4096) then
            v86[a0_287] = v90
            return true
        end
        v86[a0_287] = v90
        return false
    end
    local function fn45(a0_289, a1_291, a2_293, a3, a4)
        local entity_get_prop_9, v91, v92 = entity.get_prop(a0_289, "m_vecVelocity")
        local v93 = (a2_293 + ((globals.tickinterval() * entity_get_prop_9) * a1_291))
        local v94 = (a3 + ((globals.tickinterval() * v91) * a1_291))
        local v95 = (a4 + ((globals.tickinterval() * v92) * a1_291))
        return v93, v94, v95
    end
    local function fn46(a0_297, a1_299, a2_301)
        local entity_get_local_player = entity.get_local_player()
        if not entity.is_alive(entity_get_local_player) then
            return false
        end
        local entity_get_prop_10, v96, v97 = entity.get_prop(entity_get_local_player, "m_vecOrigin")
        if ((not entity_get_prop_10 or not v96) or not v97) then
            print("Failed to get local player position")
            return false
        end
        local entity_get_prop_11 = entity.get_prop(entity_get_local_player, "m_vecViewOffset[2]")
        if not entity_get_prop_11 then
            print("Failed to get local player view offset")
            return false
        end
        v97 = (v97 + entity_get_prop_11)
        local client_trace_line, v98 = client.trace_line(entity_get_local_player, entity_get_prop_10, v96, v97, a0_297, a1_299, a2_301)
        if (client_trace_line == nil) then
            print("Trace line failed")
            return false
        end
        return (client_trace_line == 1)
    end
    local function fn47(a0_303, a1_305, a2_307, a3_309, a4_311, a5, a6, a7, a8)
        local v99 = vector_4(a0_303, a1_305, 0)
        local v100 = vector_4(a2_307, a3_309, 0)
        local v101 = ({ v99:to(v100):angles() })[2]
        for i102 = 1, a8, 1 do
            local v103 = vector_4(math.cos(math.rad((v101 + 90))), math.sin(math.rad((v101 + 90))), 0):scaled((i102 * 0.95))
            local v104 = vector_4(math.cos(math.rad((v101 - 90))), math.sin(math.rad((v101 - 90))), 0):scaled((i102 * 0.95))
            local v105 = (v103 + v99)
            local v106 = (v103 + v100)
            local v107 = (v104 + v99)
            local v108 = (v104 + v100)
        end
    end
    local function fn48(a0_317, a1_319, a2_321, a3_323, a4_325, a5_327, a6_329, a7_331, a8_333)
        local v109 = {
    { (a0_317 - (a3_323 / 2)), (a1_319 - (a3_323 / 2)), a2_321 },
    { (a0_317 + (a3_323 / 2)), (a1_319 - (a3_323 / 2)), a2_321 },
    { (a0_317 + (a3_323 / 2)), (a1_319 + (a3_323 / 2)), a2_321 },
    { (a0_317 - (a3_323 / 2)), (a1_319 + (a3_323 / 2)), a2_321 },
    { (a0_317 - (a3_323 / 2)), (a1_319 - (a3_323 / 2)), (a2_321 + a4_325) },
    { (a0_317 + (a3_323 / 2)), (a1_319 - (a3_323 / 2)), (a2_321 + a4_325) },
    { (a0_317 + (a3_323 / 2)), (a1_319 + (a3_323 / 2)), (a2_321 + a4_325) },
    { (a0_317 - (a3_323 / 2)), (a1_319 + (a3_323 / 2)), (a2_321 + a4_325) },
}
        local v110 = {
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
        for i111, i112 in ipairs(v110) do
            local renderer_world_to_screen, v113 = renderer.world_to_screen(v109[i112[1]][1], v109[i112[1]][2], v109[i112[1]][3])
            local renderer_world_to_screen_12, v114 = renderer.world_to_screen(v109[i112[2]][1], v109[i112[2]][2], v109[i112[2]][3])
            if (((renderer_world_to_screen and v113) and renderer_world_to_screen_12) and v114) then
                fn47(renderer_world_to_screen, v113, renderer_world_to_screen_12, v114, a5_327, a6_329, a7_331, a8_333, 0)
            end
        end
    end
    local x_y = { x = 0, y = 0, z = 0 }
    local v115 = function(a0_335, a1_337)
        for i116 = 1, #a0_335, 1 do
            if (a0_335[i116] == a1_337) then
                return true
            end
        end
        return false
    end
    local function fn49(a0_339, a1_341, a2_343, a3_345, a4_347)
        local entity_get_prop_13, v117, v118 = entity.get_prop(a0_339, "m_vecVelocity")
        local v119 = (a2_343 + ((globals.tickinterval() * entity_get_prop_13) * a1_341))
        local v120 = (a3_345 + ((globals.tickinterval() * v117) * a1_341))
        local v121 = (a4_347 + ((globals.tickinterval() * v118) * a1_341))
        return v119, v120, v121
    end
    local v122 = function(a0_349)
        return (bit.band(entity.get_prop(a0_349, "m_fFlags"), 1) == 0)
    end
    local v123, v124, v125, v126 = 255, 255, 255, 255
    local v127 = vector_4(0, 0, 0)
    local v128 = vector_4(0, 0, 0)
    local ui_reference = ui.reference("rage", "aimbot", "Minimum damage")
    local ui_reference_14, v129, v130 = ui.reference("rage", "aimbot", "Minimum damage override")
    local v131 = { ui.reference("RAGE", "Other", "Quick peek assist") }
    local v132 = { ui.reference("RAGE", "Other", "Quick peek assist mode") }
    local v133 = 0
    local function fn50()
        if (ui.get(ui_reference_14) and ui.get(v129)) then
            v133 = ui.get(v130)
        else
            v133 = ui.get(ui_reference)
        end
    end
    local function fn51()
        local entity_get_local_player_15 = entity.get_local_player()
        if (entity_get_local_player_15 == nil) then
            return
        end
        local client_camera_angles, v134 = client.camera_angles()
        v127 = vector_4(client_camera_angles, v134, 0)
        local entity_hitbox_position, v135, v136 = entity.hitbox_position(entity_get_local_player_15, 3)
        v128 = vector_4(entity_hitbox_position, v135, v136)
    end
    local v137 = false
    local v138 = v128
    local function fn52(a0_351, a1_353, a2_355, a3_357, a4_359, a5_361)
        local v139, v140, v141
        local v142, v143, v144
        if (a3_357 == nil) then
            v142, v143, v144 = a0_351, a1_353, a2_355
            v139, v140, v141 = client.eye_position()
            if (v139 == nil) then
                return
            end
        else
            v139, v140, v141 = a0_351, a1_353, a2_355
            v142, v143, v144 = a3_357, a4_359, a5_361
        end
        local v145, v146, v147 = (v142 - v139), (v143 - v140), (v144 - v141)
        if ((v145 == 0) and (v146 == 0)) then
            return (((v147 > 0) and 270) or 90), 0
        else
            local math_deg = math.deg(math.atan2(v146, v145))
            local math_sqrt = math.sqrt(((v145 * v145) + (v146 * v146)))
            local math_deg_16 = math.deg(math.atan2(-v147, math_sqrt))
            return math_deg_16, math_deg
        end
    end
    local function fn53(a0_363, a1_365, a2_367)
        local entity_get_local_player_17 = entity.get_local_player()
        local v148 = a2_367
        local v149 = v127
        local v150 = (v148 + (vector_4(0, 0, 0):init_from_angles(0, ((90 + v149.y) + a0_363), 0) * a1_365))
        return v150
    end
    local function fn54(a0_369, a1_371, a2_373)
        local v151 = {}
        local entity_get_local_player_18 = entity.get_local_player()
        local v152 = a2_373
        a1_371 = math.max(2, math.floor(a1_371))
        local v153 = (360 / a1_371)
        for i154 = 0, 360, v153 do
            local v155 = fn53(i154, a0_369, v152)
            table.insert(v151, v155)
        end
        return v151
    end
    local function fn55(a0_375, a1_377, a2_379, a3_381)
        local v156 = vector_4(a0_375.x, a0_375.y, 0)
        local v157 = vector_4(a1_377.x, a1_377.y, 0)
        local v158 = vector_4(a3_381.x, a3_381.y, 0)
        local v159 = ((v156 - v157) / a2_379)
        local v160 = ((v158 - v157)):length()
        local v161 = {}
        for i162 = 1, a2_379, 1 do
            local v163 = (v159 * i162)
            if (v163:length() < v160) then
                table.insert(v161, (a1_377 + v163))
            end
        end
        return v161
    end
    local function fn56(a0_383, a1_385)
        local v164 = {}
        local entity_get_players = entity.get_players()
        for i165, i166 in ipairs(entity_get_players) do
            if not entity.is_enemy(i166) then
                table.insert(v164, i166)
            end
        end
        local entity_get_local_player_19 = entity.get_local_player()
        local v167 = trace.line(a0_383, a1_385, { skip = v164 })
        local v168 = v167.end_pos
        return v168, v167.fraction
    end
    local function fn57(a0_387, a1_389, a2_391, a3_393, a4_395, a5_397, a6_399, a7_401, a8_403, a9, a10, a11, a12, a13, a14, a15, a16)
        local v169 = (((a8_403 ~= nil) and a8_403) or 3)
        local v170 = (((a9 ~= nil) and a9) or 1)
        local v171 = (((a10 ~= nil) and a10) or false)
        local v172 = (((a11 ~= nil) and a11) or 0)
        local v173 = (((a12 ~= nil) and a12) or 1)
        local v174, v175
        if a16 then
            v174, v175 = renderer.world_to_screen(a0_387, a1_389, a2_391)
        end
        local v176, v177
        for i178 = v172, (v173 * 360), v169 do
            local math_rad = math.rad(i178)
            local v179, v180, v181 = ((a3_393 * math.cos(math_rad)) + a0_387), ((a3_393 * math.sin(math_rad)) + a1_389), a2_391
            local renderer_world_to_screen_20, v182 = renderer.world_to_screen(v179, v180, v181)
            if ((renderer_world_to_screen_20 ~= nil) and (v176 ~= nil)) then
                if (a16 and (v174 ~= nil)) then
                    renderer.triangle(renderer_world_to_screen_20, v182, v176, v177, v174, v175, a13, a14, a15, a16)
                end
                for i183 = 1, v170, 1 do
                    local v184 = (i183 - 1)
                    renderer.line(renderer_world_to_screen_20, (v182 - v184), v176, (v177 - v184), a4_395, a5_397, a6_399, a7_401)
                    renderer.line((renderer_world_to_screen_20 - 1), v182, (v176 - v184), v177, a4_395, a5_397, a6_399, a7_401)
                end
                if v171 then
                    local v185 = ((a7_401 / 255) * 160)
                    renderer.line(renderer_world_to_screen_20, (v182 - v170), v176, (v177 - v170), 16, 16, 16, v185)
                    renderer.line(renderer_world_to_screen_20, (v182 + 1), v176, (v177 + 1), 16, 16, 16, v185)
                end
            end
            v176, v177 = renderer_world_to_screen_20, v182
        end
    end
    local function fn58(a0_413, a1_415, a2_417, a3_419, a4_421)
        local entity_get_local_player_21 = entity.get_local_player()
        local entity_get_origin, v186, v187 = entity.get_origin(entity_get_local_player_21)
        local v188 = vector_4(a4_421.x, a4_421.y, (v187 + 60))
        local v189 = vector_4(a3_419.x, a3_419.y, (v187 + 60))
        local v190, v191 = fn56(a4_421, a3_419)
        local v192, v193 = fn56(v188, v189)
        local v194 = vector_4(v192.x, v192.y, a3_419.z)
        if a0_413 then
            local renderer_world_to_screen_22, v195 = renderer.world_to_screen((v192.x + 10), (v192.y + 10), (v192.z - 59))
            local renderer_world_to_screen_23, v196 = renderer.world_to_screen((v188.x + 10), (v188.y + 10), (v188.z - 59))
            renderer.line(renderer_world_to_screen_22, v195, renderer_world_to_screen_23, v196, v123, v124, v125, 100)
        end
        if a2_417 then
            local v197 = tostring((math.floor(v191) * 100))
            local renderer_world_to_screen_24, v198 = renderer.world_to_screen(v189.x, v189.y, v189.z)
            renderer.text(renderer_world_to_screen_24, v198, v123, v124, v125, v126, "c", 0, v197)
        end
        return v194
    end
    local function fn59(a0_423, a1_425, a2_427, a3_429)
        local v199 = {}
        local entity_get_local_player_25 = entity.get_local_player()
        local v200 = a3_429
        local v201 = fn54(30, 2, v200)
        for i202, i203 in pairs(v201) do
            local v204 = v201[(i202 + 1)]
            v204 = (((v204 == nil) and v201[1]) or v204)
            local v205 = vector_4(((v204.x + i203.x) / 2), ((v204.y + i203.y) / 2), i203.z)
            local v206 = fn58(a0_423, a1_425, a2_427, v205, v200)
            table.insert(v199, { endpos = v206, ideal = v205 })
            local v207 = fn58(a0_423, a1_425, a2_427, i203, v200)
            table.insert(v199, { endpos = v207, ideal = i203 })
        end
        return v199
    end
    local function fn60(a0_431, a1_433, a2_435, a3_437)
        local entity_get_local_player_26 = entity.get_local_player()
        local v208 = fn59(a0_431, a1_433, debug_fraction, a3_437)
        local entity_get_origin_27, v209, v210 = entity.get_origin(entity_get_local_player_26)
        local v211 = {}
        for i212, i213 in pairs(v208) do
            local v214 = i213.ideal
            local v215 = i213.endpos
            table.insert(v211, v215)
            if a1_433 then
                fn48(v215.x, v215.y, (v215.z - 40), 23, 50, 255, 255, 255, sway())
            end
            if (a2_435 ~= 1) then
                for i216, i217 in pairs(fn55(v214, a3_437, a2_435, v215)) do
                    table.insert(v211, i217)
                    if a1_433 then
                        fn48(i217.x, i217.y, (v215.z - 40), 23, 50, 255, 255, 255, sway())
                    end
                end
            end
        end
        return v211
    end
    local function fn61()
        local v218 = {}
        table.insert(v218, 0)
        table.insert(v218, 1)
        table.insert(v218, 4)
        table.insert(v218, 5)
        table.insert(v218, 6)
        table.insert(v218, 2)
        table.insert(v218, 3)
        table.insert(v218, 13)
        table.insert(v218, 14)
        table.insert(v218, 15)
        table.insert(v218, 16)
        table.insert(v218, 17)
        table.insert(v218, 18)
        table.insert(v218, 7)
        table.insert(v218, 8)
        table.insert(v218, 9)
        table.insert(v218, 10)
        table.insert(v218, 11)
        table.insert(v218, 12)
        return v218
    end
    local function fn62()
        return (ui.get(v131[1]) and ui.get(v131[2]))
    end
    local function fn63()
        local v219 = 0
        local entity_get_local_player_28 = entity.get_local_player()
        if (entity_get_local_player_28 == nil) then
            return
        end
        if (entity.is_alive(entity_get_local_player_28) == false) then
            return
        end
        if not ui.get(v131[2]) then
            return
        end
        local entity_hitbox_position_29, v220, v221 = entity.hitbox_position(entity_get_local_player_28, 3)
        local v222 = vector_4(entity_hitbox_position_29, v220, v221)
        local client_camera_angles_30, v223 = client.camera_angles()
        if not ui.get(exploits_tab.aipeek) then
            return
        end
        local v224 = fn60(1, 1, 1, v128)
        local v225 = fn61()
        local v226 = {}
        local client_current_threat = client.current_threat()
        if ((client_current_threat == nil) or entity.is_dormant(client_current_threat)) then
            v138 = nil
            v137 = false
            return
        end
        for i227, i228 in pairs(v224) do
            for i229, i230 in pairs(v225) do
                local entity_hitbox_position_31, v231, v232 = entity.hitbox_position(client_current_threat, i230)
                local v233, v234, v235 = fn49(client_current_threat, v219, entity_hitbox_position_31, v231, v232)
                local v236 = vector_4(v233, v234, v235)
                local client_trace_bullet, v237 = client.trace_bullet(entity_get_local_player_28, i228.x, i228.y, (i228.z + 60), v236.x, v236.y, v236.z)
                if (v237 > math.min(v133, entity.get_prop(client_current_threat, "m_iHealth"))) then
                    table.insert(v226, { TARGET = client_current_threat, damage = v237, vec = i228, enemy_vec = v236 })
                end
            end
            if (#v226 >= 5) then
                break
            end
        end
        table.sort(v226, function(a0_439, a1_441)
        return (a0_439.damage > a1_441.damage)
    end)
        for i238, i239 in pairs(v226) do
            if (entity.is_alive(i239.TARGET) == false) then
                table.remove(v226, i238)
            end
        end
        local entity_get_origin_32, v240, v241 = entity.get_origin(entity_get_local_player_28)
        if (#v226 >= 1) then
            local v242 = v226[1]
            local v243 = v242.vec
            local v244 = v242.damage
            local v245 = v242.enemy_vec
            local v246 = vector_4(v243.x, v243.y, (v241 + 60))
            local renderer_world_to_screen_33, v247 = renderer.world_to_screen(v246.x, v246.y, v246.z)
            if (v247 ~= nil) then
                v247 = (v247 - 12)
            end
            local v248 = tostring(math.floor(v244))
            renderer.text(renderer_world_to_screen_33, v247, v123, v124, v125, v126, 0, v248)
            v137 = true
            v138 = v243
        else
            v138 = nil
            v137 = false
        end
    end
    local v249 = false
    local function fn64()
        if not ui.get(exploits_tab.aipeek) then
            return
        end
        v249 = false
    end
    local function fn65(a0_443, a1_445)
        local entity_get_local_player_34 = entity.get_local_player()
        local entity_get_prop_35, v250, v251 = entity.get_prop(entity_get_local_player_34, "m_vecAbsOrigin")
        local v252, v253 = fn52(entity_get_prop_35, v250, v251, a1_445.x, a1_445.y, a1_445.z)
        a0_443.in_forward = 1
        a0_443.in_back = 0
        a0_443.in_moveleft = 0
        a0_443.in_moveright = 0
        a0_443.in_speed = 0
        a0_443.forwardmove = 800
        a0_443.sidemove = 0
        a0_443.move_yaw = v253
    end
    local v254, v255, v256, v257 = 255, 255, 255, 255
    local function fn66(a0_447)
        local entity_get_local_player_36 = entity.get_local_player()
        if (entity_get_local_player_36 == nil) then
            return
        end
        if not ui.get(exploits_tab.aipeek) then
            return
        end
        if not entity.is_alive(entity_get_local_player_36) then
            return
        end
        local v258 = (a0_447.in_forward == 1)
        local v259 = (a0_447.in_back == 1)
        local v260 = (a0_447.in_moveleft == 1)
        local v261 = (a0_447.in_moveright == 1)
        if ui.get(v131[2]) then
            local entity_get_player_weapon = entity.get_player_weapon(entity_get_local_player_36)
            if (entity_get_player_weapon == nil) then
                return
            end
            local v262 = v122(entity_get_local_player_36)
            local globals_curtime = globals.curtime()
            local v263 = ((entity.get_prop(entity_get_local_player_36, "m_flNextAttack") <= globals_curtime) and (entity.get_prop(entity_get_player_weapon, "m_flNextPrimaryAttack") <= globals_curtime))
            local entity_get_origin_37, v264, v265 = entity.get_origin(entity_get_local_player_36)
            if (math.abs((entity_get_origin_37 - v128.x)) <= 10) then
                v249 = true
            end
            if (v263 == false) then
                v249 = false
            end
            v254, v255, v256, v257 = 255, 255, 0, 255
            if (((v137 and v249) and (v262 == false)) and (v138 ~= nil)) then
                fn65(a0_447, v138)
                v254, v255, v256, v257 = 0, 255, 0, 255
            elseif ((((((v249 == false) and (v262 == false)) and (v258 == false)) and (v259 == false)) and (v260 == false)) and (v261 == false)) then
                fn65(a0_447, v128)
            end
        else
            v254, v255, v256, v257 = 0, 255, 0, 255
        end
    end
    fn51()
    client.set_event_callback("paint", function()
        if not ui.get(exploits_tab.aipeek) then
            return
        end
        fn50()
        fn63()
    end)
    client.set_event_callback("setup_command", fn66)
    client.set_event_callback("run_command", function()
        local entity_get_local_player_38 = entity.get_local_player()
        if (entity_get_local_player_38 == nil) then
            return
        end
        if (entity.is_alive(entity_get_local_player_38) == false) then
            return
        end
        local entity_hitbox_position_39, v266, v267 = entity.hitbox_position(entity_get_local_player_38, 3)
        local v268 = vector_4(entity_hitbox_position_39, v266, v267)
        local client_camera_angles_40, v269 = client.camera_angles()
        if not ui.get(v131[2]) then
            v127 = vector_4(client_camera_angles_40, v269, 0)
        end
        if not ui.get(v131[2]) then
            v128 = v268
        end
    end)
    client.set_event_callback("aim_fire", fn64)
    client.set_event_callback("predict_command", function(a0_449)
        local entity_get_local_player_41 = entity.get_local_player()
        if (entity_get_local_player_41 == nil) then
            return
        end
        local entity_get_prop_42 = entity.get_prop(entity_get_local_player_41, "m_fFlags")
        local v270 = vector_4(entity.get_prop(entity_get_local_player_41, "m_vecVelocity"))
    end)
