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

    local v44 = "hysteria"
    local v45 = "2.1"
    local v46 = true
    local defer = defer
    local error = error
    local getfenv = getfenv
    local setfenv = setfenv
    local getmetatable = getmetatable
    local setmetatable = setmetatable
    local ipairs = ipairs
    local pairs = pairs
    local next = next
    local printf = printf
    local rawequal = rawequal
    local rawset = rawset
    local rawlen = rawlen
    local readfile = readfile
    local writefile = writefile
    local require = require
    local select = select
    local tonumber = tonumber
    local tostring = tostring
    local toticks = toticks
    local totime = totime
    local type = type
    local unpack = unpack
    local pcall = pcall
    local xpcall = xpcall
    local vtable_bind = vtable_bind
    if not LPH_OBFUSCATED then
        function LPH_NO_VIRTUALIZE(...)
            return ...
        end
        function LPH_JIT(...)
            return ...
        end
        function LPH_JIT_MAX(...)
            return ...
        end
        function LPH_ENCSTR(...)
            return ...
        end
        function LPH_ENCNUM(...)
            return ...
        end
        function LPH_CRASH(...)
            return ...
        end
    end
    local function fn2(a1)
        local v47 = {}
        for iter_7_0, iter_7_1 in next, a1 do
            v47[iter_7_0] = iter_7_1
        end
        return v47
    end
    local v48 = fn2(table)
    local v49 = fn2(math)
    local v50 = fn2(string)
    local v51 = fn2(ui)
    local v52 = fn2(client)
    local v53 = fn2(database)
    local v54 = fn2(entity)
    local v55 = fn2(require("ffi"))
    local v56 = fn2(globals)
    local v57 = fn2(panorama)
    local v58 = fn2(renderer)
    local v59 = fn2(bit)
    local v60 = LPH_JIT(function(a1_755, a1_757)
        local v61, v62 = pcall(require, a1_755)
        if v61 then
            return v62
        end
        if a1_757 then
            print(a1_755, " library not found")
            v46 = false
        else
            assert(v61, ("you are not subscribed to " .. a1_755))
        end
        return false
    end)
    if (not v46 or not v60("lib.inspect", true)) then
        local function fn3()
            return
        end
    end
    local v63 = (v60(((v46 and "lib.pui") or "pui"), true) or v60("gamesense/pui"))
    local v64 = v60("gamesense/http")
    local v65 = v60("gamesense/antiaim_funcs")
    local v66 = v60("gamesense/base64")
    local v67 = v60("gamesense/msgpack")
    local v68 = v60("gamesense/csgo_weapons")
    local v69 = require("vector")
    LPH_NO_VIRTUALIZE(function()
        v49.FLOAT_MAX = 3.4028234663852886e+38
        v49.radindeg, v49.deginrad = (180 / v49.pi), (v49.pi / 180)
        v49.randomseed(v52.timestamp())
        function v49.lerp(a1_759, a1_761, a1_763)
            return (a1_759 + ((a1_761 - a1_759) * a1_763))
        end
        function v49.round(a1_765)
            return v49.floor((a1_765 + 0.5))
        end
        function v49.sqrt3(a1_767, a1_769, a1_771)
            return v49.sqrt((((a1_767 * a1_767) + (a1_769 * a1_769)) + ((a1_771 and (a1_771 * a1_771)) or 0)))
        end
        function v49.sq3(a1_773, a1_775, a1_777)
            return (((a1_773 * a1_773) + (a1_775 * a1_775)) + ((a1_777 and (a1_777 * a1_777)) or 0))
        end
        function v49.clamp(a1_779, a1_781, a1_783)
            return ((((a1_779 < a1_781) and a1_781) or ((a1_783 < a1_779) and a1_783)) or a1_779)
        end
        function v49.cycle(a1_785, a1_787)
            local v70 = (a1_785 % a1_787)
            return (((v70 == 0) and a1_787) or v70)
        end
        function v49.roundb(a1_789, a1_791)
            return (v49.floor((a1_789 + 0.5)) / ((a1_791 or 0) ^ 1))
        end
        function v49.average(a1_793)
            local v71 = 0
            local v72 = 0
            for iter_18_0 = 1, #a1_793, 1 do
                v72, v71 = iter_18_0, (v71 + a1_793[iter_18_0])
            end
            return (v71 / v72)
        end
        function v49.angle_to(a1_795, a1_797)
            local v73 = (a1_797.x - a1_795.x)
            local v74 = (a1_797.y - a1_795.y)
            local v75 = (a1_797.z - a1_795.z)
            return (v49.atan2(-v75, v49.sqrt(((v73 * v73) + (v74 * v74)))) * v49.radindeg), (v49.atan2(v74, v73) * v49.radindeg)
        end
        function v49.angle_diff(a1_799, a1_801)
            return ((((a1_799 - a1_801) + 180) % 360) - 180)
        end
        function v49.tolerate(a1_803, a1_805)
            if (a1_803 < a1_805) then
                return 0
            elseif (a1_803 > (1 - a1_805)) then
                return 1
            end
            return a1_803
        end
        function v49.extrapolate(a1_807, a1_809, a1_811)
            return (a1_807 + ((a1_809 * v56.tickinterval) * a1_811))
        end
        function v49.relative_yaw(a1_813, a1_815)
            return (v49.atan2((a1_813.y - a1_815.y), (a1_813.x - a1_815.x)) * v49.radindeg)
        end
        function v49.normalize_yaw(a1_817)
            return (((a1_817 + 180) % -360) + 180)
        end
        function v49.relative_pitch(a1_819, a1_821)
            return (v49.atan2(-(a1_821.z - a1_819.z), v49.sqrt((((a1_821.x - a1_819.x) * (a1_821.x - a1_819.x)) + ((a1_821.y - a1_819.y) * (a1_821.y - a1_819.y))))) * v49.radindeg)
        end
        function v49.normalize_pitch(a1_823)
            return v49.clamp(a1_823, -89, 89)
        end
        function v49.closest_ray_point(a1_825, a1_827, a1_829)
            local v76 = (a1_825 - a1_827)
            local v77 = (a1_829 - a1_827)
            local v78 = v77:length()
            local v79 = (v77 / v78)
            local v80 = v79:dot(v76)
            if (v80 < 0) then
                return a1_827
            elseif (v78 < v80) then
                return a1_829
            end
            return (a1_827 + (v79 * v80))
        end
        v48.new, v48.clear = require("table.new"), require("table.clear")
        function v48.has(a1_831, a1_833)
            for iter_28_0 = 1, #a1_831, 1 do
                if (a1_831[iter_28_0] == a1_833) then
                    return true
                end
            end
            return false
        end
        function v48.find(a1_835, a1_837)
            for iter_29_0 = 1, #a1_835, 1 do
                if (a1_835[iter_29_0] == a1_837) then
                    return iter_29_0
                end
            end
        end
        function v48.copy(a1_839)
            if (type(a1_839) ~= "table") then
                return a1_839
            end
            local v81 = {}
            for iter_30_0, iter_30_1 in pairs(a1_839) do
                v81[v48.copy(iter_30_0)] = v48.copy(iter_30_1)
            end
            return v81
        end
        function v48.place(a1_841, a1_843, a1_845)
            local v82 = a1_841
            for iter_31_0, iter_31_1 in ipairs(a1_843) do
                if (type(v82[iter_31_1]) == "table") then
                    v82 = v82[iter_31_1]
                else
                    v82[iter_31_1] = (((iter_31_0 < #a1_843) and {}) or a1_845)
                    v82 = v82[iter_31_1]
                end
            end
            return a1_841
        end
        function v48.filter(a1_847)
            local v83 = {}
            local v84 = 1
            for iter_32_0 = 1, v48.maxn(a1_847), 1 do
                if (a1_847[iter_32_0] ~= nil) then
                    v83[v84], v84 = a1_847[iter_32_0], (v84 + 1)
                end
            end
            return v83
        end
        function v48.distribute(a1_849, a1_851, a1_853)
            local v85 = {}
            for iter_33_0, iter_33_1 in ipairs(a1_849) do
                v85[((a1_853 and iter_33_1[a1_853]) or iter_33_0)] = (((a1_851 == nil) and iter_33_0) or iter_33_1[a1_851])
            end
            return v85
        end
        function v50.clean(a1_855)
            return v50.gsub(v50.gsub(a1_855, "^%s+", ""), "%s+$", "")
        end
        function v50.limit(a1_857, a1_859, a1_861)
            local v86 = {}
            local v87 = 1
            for iter_35_0 in v50.gmatch(a1_857, ".[\x80-\xBF]*") do
                v87, v86[v87] = (v87 + 1), iter_35_0
                if (a1_859 < v87) then
                    if a1_861 then
                        v86[v87] = (((a1_861 == true) and "...") or a1_861)
                    end
                    break
                end
            end
            return v48.concat(v86)
        end
        function v50.alphen(a1_863, a1_865)
            return v50.gsub(a1_863, "\a(%x%x%x%x%x%x)(%x%x)", function(a1_867, a1_869)
            v50.format("%s%02x", a1_867, (tonumber(a1_869, 16) * a1_865))
        end)
        end
        function v50.insert(a1_871, a1_873, a1_875)
            return (v50.sub(a1_871, 1, a1_875) .. (a1_873 .. v50.sub(a1_871, (a1_875 + 1))))
        end
    end)()
    local function fn4(...)
        return v48.concat({ v50.char(...) })
    end
    local function fn5(a1_877)
        return v48.concat({ v50.byte(a1_877, 1, #a1_877) }, ",")
    end
    local function fn6()
        return
    end
    local v88
    local v89
    local v90, fn16 = v89, v89
    local function fn7(...)
        if v46 then
            fn16(...)
        end
    end
    local function fn8(a1_879, ...)
        if v46 then
            printf(a1_879, ...)
        end
    end
    local function fn9(a1_881, a1_883, a1_885)
        if a1_881 then
            return a1_883
        else
            return a1_885
        end
    end
    local function fn10(a1_887, ...)
        local v91, v92 = pcall(a1_887, ...)
        return (v91 and v92)
    end
    local v93
    local v94
    local v95
    local var_0_1 = {
    build = "stable",
    level = 0,
    user = ((_USER_NAME or (v46 and "admin")) or "user"),
    script = ((_SCRIPT_NAME or (v46 and "hysteria • debug")) or "hysteria • beta"),
    version = v45,
}
    local v96 = {
    hysteria = { 1, "stable" },
    ["hysteria • bliss"] = { 2, "bliss" },
    ["hysteria • beta"] = { 3, "beta" },
    ["hysteria • debug"] = { 4, "debug" },
}
    var_0_1.level, var_0_1.build = v96[var_0_1.script][1], v96[var_0_1.script][2]
    local v97, v98 = var_0_1.level, (var_0_1.level >= 2)
    local v99 = {}
    local v100 = "filesystem_stdio.dll"
    local v101 = "VFileSystem017"
    local v102 = vtable_bind(v100, v101, 11, "void (__thiscall*)(void*, const char*, const char*, int)")
    local v103 = vtable_bind(v100, v101, 12, "bool (__thiscall*)(void*, const char*, const char*)")
    local v104 = vtable_bind(v100, v101, 1, "int (__thiscall*)(void*, void const*, int, void*)")
    local v105 = vtable_bind(v100, v101, 2, "void* (__thiscall*)(void*, const char*, const char*, const char*)")
    local v106 = vtable_bind(v100, v101, 3, "void (__thiscall*)(void*, void*)")
    local v107 = vtable_bind("engine.dll", "VEngineClient014", 36, "const char*(__thiscall*)(void*)")
    v99.game_directory = v50.sub(v55.string(v107()), 1, -5)
    v102(v99.game_directory, "ROOT_PATH", 0)
    defer(function()
        v103(v99.game_directory, "ROOT_PATH")
    end)
    v99.create_directory = vtable_bind(v100, v101, 22, "void (__thiscall*)(void*, const char*, const char*)")
    v99.create_directory(v44, "ROOT_PATH")
    function v99.write(a1_889, a1_891)
        local v108 = v105(a1_889, "wb", "ROOT_PATH")
        v104(a1_891, #a1_891, v108)
        v106(v108)
    end
    local v109
    LPH_NO_VIRTUALIZE(function()
        local var_0_34 = { set = v52.set_event_callback, unset = v52.unset_event_callback, fire = v52.fire_event }
        local v110
        v110 = {
                set = (function(a1_893, a1_895)
        if ((type(a1_895) == "function") and (a1_893.proxy[a1_895] == nil)) then
            local v111 = (#a1_893.callbacks + 1)
            a1_893.proxy[a1_895], a1_893.callbacks[v111] = v111, a1_895
        end
    end),
                unset = (function(a1_897, a1_899)
        local v112 = a1_897.proxy[a1_899]
        if (v112 == nil) then
            return
        end
        v48.remove(a1_897.callbacks, v112)
        a1_897.proxy[a1_899] = nil
        for iter_50_0, iter_50_1 in next, a1_897.proxy do
            if (v112 < iter_50_1) then
                a1_897.proxy[iter_50_0] = (iter_50_1 - 1)
            end
        end
    end),
                __call = (function(a1_901, a1_903, a1_905)
        if a1_903 then
            v110.set(a1_901, a1_905)
        else
            v110.unset(a1_901, a1_905)
        end
    end),
                fire = (function(a1_907, ...)
        return a1_907.hook(...)
    end),
                gfire = (function(a1_909, ...)
        var_0_34.fire(a1_909[0], ...)
    end),
                unhook = (function(a1_911)
        var_0_34.unset(a1_911[0], a1_911.hook)
    end)
            }
        v110.__index = v110
        v109 = setmetatable({}, {
        __index = function(a1_913, a1_915)
            local v113 = setmetatable({ [0] = a1_915, proxy = {}, callbacks = {} }, v110)
            function v113.hook(...)
                local v114
                for iter_56_0 = 1, #v113.callbacks, 1 do
                    if v113.callbacks[iter_56_0] then
                        local v115 = v113.callbacks[iter_56_0](...)
                        if (v115 ~= nil) then
                            v114 = v115
                        end
                    end
                end
                return v114
            end
            var_0_34.set(v113[0], v113.hook)
            rawset(a1_913, a1_915, v113)
            return v113
        end,
    })
    end)()
    local v116
    LPH_NO_VIRTUALIZE(function()
        local v117 = v55.typeof("struct { uint8_t r; uint8_t g; uint8_t b; uint8_t a; }")
        local function fn11(a1_917, a1_919)
            return v50.format(((a1_919 and "%02X%02X%02X") or "%02X%02X%02X%02X"), a1_917.r, a1_917.g, a1_917.b, a1_917.a)
        end
        local function fn12(a1_921)
            a1_921 = v50.gsub(a1_921, "^#", "")
            return tonumber(v50.sub(a1_921, 1, 2), 16), tonumber(v50.sub(a1_921, 3, 4), 16), tonumber(v50.sub(a1_921, 5, 6), 16), (tonumber(v50.sub(a1_921, 7, 8), 16) or 255)
        end
        local v118
        local var_57_1 = {
                __eq = (function(a1_923, a1_925)
        return ((((a1_923.r == a1_925.r) and (a1_923.g == a1_925.g)) and (a1_923.b == a1_925.b)) and (a1_923.a == a1_925.a))
    end),
                lerp = (function(a1_927, a1_929, a1_931)
        return v118((a1_927.r + ((a1_929.r - a1_927.r) * a1_931)), (a1_927.g + ((a1_929.g - a1_927.g) * a1_931)), (a1_927.b + ((a1_929.b - a1_927.b) * a1_931)), (a1_927.a + ((a1_929.a - a1_927.a) * a1_931)))
    end),
                to_hex = fn11,
                alphen = (function(a1_933, a1_935, a1_937)
        return v118(a1_933.r, a1_933.g, a1_933.b, ((a1_937 and (a1_935 * a1_933.a)) or a1_935))
    end),
                unpack = (function(a1_939)
        return a1_939.r, a1_939.g, a1_939.b, a1_939.a
    end)
            }
        var_57_1.__index = var_57_1
        v118 = v55.metatype(v117, var_57_1)
        local function fn13(a1_941, a1_943, a1_945, a1_947)
            a1_941 = ((a1_941 and v49.min(a1_941, 255)) or 255)
            return v118(a1_941, ((a1_943 and v49.min(a1_943, 255)) or a1_941), ((a1_945 and v49.min(a1_945, 255)) or a1_941), ((a1_947 and v49.min(a1_947, 255)) or 255))
        end
        local function fn14(a1_949)
            return v118(fn12(a1_949))
        end
        v116 = setmetatable({ rgb = fn13, hex = fn14, rgb_to_hex = fn11, hex_to_rgb = fn12 }, {
        __call = function(a1_951, a1_953, a1_955, a1_957, a1_959)
            return (((type(a1_953) == "string") and fn14(a1_953)) or fn13(a1_953, a1_955, a1_957, a1_959))
        end,
    })
    end)()
    local v119
    local v120 = v55.typeof("char[?]")
    local v121 = vtable_bind("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)")
    local v122 = vtable_bind("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)")
    local v123 = vtable_bind("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)")
    local get_set = {
            get = (function()
    local v124 = v121()
    if (v124 == 0) then
        return
    end
    local v125 = v120(v124)
    v123(0, v125, v124)
    return v55.string(v125, (v124 - 1))
end),
            set = (function(a1_961)
    a1_961 = tostring(a1_961)
    v122(a1_961, #a1_961)
end)
        }
    local fn15
    LPH_NO_VIRTUALIZE(function()
        local v126 = vtable_bind("vstdlib.dll", "VEngineCvar007", 25, "void(__cdecl*)(void*, const void*, const char*, ...)")
        local v127 = v116.rgb(217, 217, 217)
        local ___ = { ["\r"] = "\aD9D9D9", ["\v"] = "\aA0F020" }
        local v128 = "[\r\v]"
        local v129 = "\a(%x%x%x%x%x%x)([^\a]*)"
        v109.accent_recolor:set(function(a1_963, a1_965)
            ___["\v"] = a1_965
        end)
        function fn15(...)
            local v130 = { ... }
            for iter_71_0 = 1, #v130, 1 do
                for iter_71_1, iter_71_2 in v50.gmatch(("\aD9D9D9" .. v50.gsub(tostring(v130[iter_71_0]), v128, ___)), v129) do
                    v126(v116.hex(iter_71_1), iter_71_2)
                end
            end
            v126(v127, "\n")
        end
        function fn16(...)
            fn15("\vhysteria\r ", ...)
        end
    end)()
    local v131
    local version_key = { version = 2, key = (v44 .. "::db") }
    local v132 = v53.read(version_key.key)
    if not v132 then
        v132 = {
    version = version_key.version,
    configs = {},
    servers = {},
    stats = { killed = 0, playtime = 0, loaded = 1, evaded = 0 },
}
        v53.write(version_key.key, v132)
    end
    if (v132.version ~= version_key.version) then
        v132.stats.candies = nil
        v132.version = version_key.version
    end
    if not v132.stats.killed then
        v132.stats.killed = 0
    end
    if not v132.stats.evaded then
        v132.stats.evaded = 0
    end
    if not v132.stats.playtime then
        v132.stats.playtime = 0
    end
    if not v132.stats.loaded then
        v132.stats.loaded = 1
    end
    v132.stats.loaded = (v132.stats.loaded + 1)
    local function fn17()
        v109.database_pre_save:fire()
        v53.write(version_key.key, v132)
        v52.delay_call(300, fn17)
    end
    v52.delay_call(300, fn17)
    defer(function()
        v53.write(version_key.key, v132)
        v53.flush()
    end)
    version_key.stats = setmetatable({}, {
    __index = function(a1_967, a1_969)
        local v133 = v132.stats[a1_969]
        if v133 then
            return v133
        else
            v132.stats[a1_969] = 0
            return 0
        end
    end,
    __newindex = function(a1_971, a1_973, a1_975)
        v132.stats[a1_973] = a1_975
        v109.stats_update:fire()
    end,
})
    setmetatable(version_key, {
    __index = v132,
    __call = function(a1_977, a1_979)
        v53.write(version_key.key, v132)
        if (a1_979 == true) then
            v53.flush()
        end
    end,
})
    function v51.is_active(a1_981, a1_983)
        a1_983 = (((a1_983 == nil) and true) or a1_983)
        return ((a1_981.value == a1_983) and a1_981.hotkey:get())
    end
    v52.open_link = v57.open().SteamOverlayAPI.OpenExternalBrowserURL
    function v52.extrapolate(a1_985, a1_987, a1_989, a1_991, a1_993)
        local v134 = (v56.tickinterval() * a1_993)
        return (a1_985 + (a1_991.x * v134)), (a1_987 + (a1_991.y * v134)), (a1_989 + (a1_991.z * v134))
    end
    LPH_NO_VIRTUALIZE(function()
        local v135 = v55.typeof("struct { char pad0[0x18]; float anim_update_timer; char pad1[0xC]; float started_moving_time; float last_move_time; char pad2[0x10]; float last_lby_time; char pad3[0x8]; float run_amount; char pad4[0x10]; void* entity; void* active_weapon; void* last_active_weapon; float last_client_side_animation_update_time; int\t last_client_side_animation_update_framecount; float eye_timer; float eye_angles_y; float eye_angles_x; float goal_feet_yaw; float current_feet_yaw; float torso_yaw; float last_move_yaw; float lean_amount; char pad5[0x4]; float feet_cycle; float feet_yaw_rate; char pad6[0x4]; float duck_amount; float landing_duck_amount; char pad7[0x4]; float current_origin[3]; float last_origin[3]; float velocity_x; float velocity_y; char pad8[0x4]; float unknown_float1; char pad9[0x8]; float unknown_float2; float unknown_float3; float unknown; float m_velocity; float jump_fall_velocity; float clamped_velocity; float feet_speed_forwards_or_sideways; float feet_speed_unknown_forwards_or_sideways; float last_time_started_moving; float last_time_stopped_moving; bool on_ground; bool hit_in_ground_animation; char pad10[0x4]; float time_since_in_air; float last_origin_z; float head_from_ground_distance_standing; float stop_to_full_running_fraction; char pad11[0x4]; float magic_fraction; char pad12[0x3C]; float world_force; char pad13[0x1CA]; float min_yaw; float max_yaw; } **")
        local v136 = v55.typeof("struct { char pad_0x0000[0x18]; uint32_t sequence; float prev_cycle; float weight; float weight_delta_rate; float playback_rate; float cycle;void *entity;char pad_0x0038[0x4]; } **")
        local v137 = vtable_bind("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
        function v54.get_pointer(a1_995)
            return v137(a1_995)
        end
        function v54.get_animstate(a1_997)
            local v138 = (a1_997 and v137(a1_997))
            if v138 then
                return v55.cast(v135, (v55.cast("char*", v55.cast("void***", v138)) + 39264))[0]
            end
        end
        function v54.get_animlayer(a1_999, a1_1001)
            local v139 = v137(a1_999)
            if v139 then
                return v55.cast(v136, (v55.cast("char*", v55.cast("void***", v139)) + 10640))[0][(a1_1001 or 0)]
            end
        end
        function v54.get_simtime(a1_1003)
            local v140 = v137(a1_1003)
            if v140 then
                return v54.get_prop(a1_1003, "m_flSimulationTime"), v55.cast("float*", (v55.cast("uintptr_t", v140) + 620))[0]
            else
                return 0
            end
        end
        function v54.get_max_desync(a1_1005)
            local v141 = v49.clamp(a1_1005.feet_speed_forwards_or_sideways, 0, 1)
            local v142 = ((((a1_1005.stop_to_full_running_fraction * -0.3) - 0.2) * v141) + 1)
            local v143 = a1_1005.duck_amount
            if (v143 > 0) then
                v142 = (v142 + ((v143 * v141) * (0.5 - v142)))
            end
            return v49.clamp(v142, 0.5, 1)
        end
    end)()
    local v144 = {
    hex = "\a74A6A9FF",
    hexs = "\a74A6A9",
    accent = v116.hex("74A6A9"),
    back = v116.rgb(23, 26, 28),
    dark = v116.rgb(5, 6, 8),
    white = v116.rgb(255),
    black = v116.rgb(0),
    null = v116.rgb(0, 0, 0, 0),
    text = v116.rgb(230),
    panel = {
    l1 = v116.rgb(5, 6, 8, 96),
    g1 = v116.rgb(5, 6, 8, 140),
    l2 = v116.rgb(23, 26, 28, 96),
    g2 = v116.rgb(23, 26, 28, 140),
},
}
    local v145 = 1
    local v146, v147 = v52.screen_size()
    local v148 = v146
    local v149 = v147
    local x_y = { x = (v146 * 0.5), y = (v147 * 0.5) }
    local x_y_1 = { x = (v148 * 0.5), y = (v149 * 0.5) }
    local v150 = LPH_NO_VIRTUALIZE(function()
        local v151 = 1
        local v152 = {}
        local v153 = ""
        local v154
        local v155 = v51.reference("MISC", "Settings", "DPI scale")
        v154 = {
                scalable = false,
                callback = (function()
        local v156 = v145
        v145 = ((v154.scalable and (tonumber(v50.sub(v51.get(v155), 1, -2)) * 0.01)) or 1)
        v148, v149 = v52.screen_size()
        v146, v147 = (v148 / v145), (v149 / v145)
        x_y.x, x_y.y = (v146 * 0.5), (v147 * 0.5)
        v153 = (((v145 ~= 1) and "d") or "")
        if (v156 ~= v145) then
            v109.dpi_change:fire(v145, v156)
            local v157 = v145
        end
    end)
            }
        v154.callback()
        v51.set_callback(v155, v154.callback)
        local function fn18()
            if ((v146 == 0) or (v147 == 0)) then
                v154.callback()
            else
                v109.paint_ui:unset(fn18)
            end
        end
        v109.paint_ui:set(fn18)
        local v158 = v49.floor
        render = setmetatable({
        valid = false,
        cheap = true,
        dpi_t = v154,
        push_alpha = function(a1_1007)
            local v159 = #v152
            if (v159 > 255) then
                error("alpha stack exceeded 255 objects, report to developers")
            end
            v152[(v159 + 1)] = a1_1007
            v151 = ((v151 * v152[(v159 + 1)]) * (v152[v159] or 1))
        end,
        pop_alpha = function()
            local v160 = #v152
            local v161
            v152[v160], v161 = nil, (v160 - 1)
            v151 = (((v161 == 0) and 1) or (v152[v161] * (v152[(v161 - 1)] or 1)))
        end,
        get_alpha = function()
            return v151
        end,
        blur = function(a1_1009, a1_1011, a1_1013, a1_1015, a1_1017, a1_1019)
            if ((not render.cheap and render.valid) and (((a1_1017 or 1) * v151) > 0.25)) then
                blurs[(#blurs + 1)] = { v158((a1_1009 * v145)), v158((a1_1011 * v145)), v158((a1_1013 * v145)), v158((a1_1015 * v145)) }
            end
        end,
        gradient = function(a1_1021, a1_1023, a1_1025, a1_1027, a1_1029, a1_1031, a1_1033)
            v58.gradient(v158((a1_1021 * v145)), v158((a1_1023 * v145)), v158((a1_1025 * v145)), v158((a1_1027 * v145)), a1_1029.r, a1_1029.g, a1_1029.b, (a1_1029.a * v151), a1_1031.r, a1_1031.g, a1_1031.b, (a1_1031.a * v151), (a1_1033 or false))
        end,
        gradient_outline = function(a1_1035, a1_1037, a1_1039, a1_1041, a1_1043, a1_1045, a1_1047, a1_1049)
            a1_1035, a1_1037, a1_1039, a1_1041, a1_1049 = v158((a1_1035 * v145)), v158((a1_1037 * v145)), v158((a1_1039 * v145)), v158((a1_1041 * v145)), v158(((a1_1049 or 1) * v145))
            local v162 = a1_1043.r
            local v163 = a1_1043.g
            local v164 = a1_1043.b
            local v165 = (a1_1043.a * v151)
            local v166 = a1_1045.r
            local v167 = a1_1045.g
            local v168 = a1_1045.b
            local v169 = (a1_1045.a * v151)
            if a1_1047 then
                v58.gradient(a1_1035, a1_1037, (a1_1039 - a1_1049), a1_1049, v162, v163, v164, v165, v166, v167, v168, v169, a1_1047)
                v58.rectangle(a1_1035, (a1_1037 + a1_1049), a1_1049, (a1_1041 - a1_1049), v162, v163, v164, v165)
                v58.rectangle(((a1_1035 + a1_1039) - a1_1049), a1_1037, a1_1049, (a1_1041 - a1_1049), v166, v167, v168, v169)
                v58.gradient((a1_1035 + a1_1049), ((a1_1037 + a1_1041) - a1_1049), (a1_1039 - a1_1049), a1_1049, v162, v163, v164, v165, v166, v167, v168, v169, a1_1047)
            else
                v58.rectangle(a1_1035, a1_1037, (a1_1039 - a1_1049), a1_1049, v162, v163, v164, v165, a1_1047)
                v58.gradient(a1_1035, (a1_1037 + a1_1049), a1_1049, (a1_1041 - a1_1049), v162, v163, v164, v165, v166, v167, v168, v169, a1_1047)
                v58.gradient(((a1_1035 + a1_1039) - a1_1049), a1_1037, a1_1049, (a1_1041 - a1_1049), v162, v163, v164, v165, v166, v167, v168, v169, a1_1047)
                v58.rectangle((a1_1035 + a1_1049), ((a1_1037 + a1_1041) - a1_1049), (a1_1039 - a1_1049), a1_1049, v166, v167, v168, v169, a1_1047)
            end
        end,
        line = function(a1_1051, a1_1053, a1_1055, a1_1057, a1_1059)
            v58.line(v158((a1_1051 * v145)), v158((a1_1053 * v145)), v158((a1_1055 * v145)), v158((a1_1057 * v145)), a1_1059.r, a1_1059.g, a1_1059.b, (a1_1059.a * v151))
        end,
        rectangle = function(a1_1061, a1_1063, a1_1065, a1_1067, a1_1069, a1_1071)
            a1_1061, a1_1063, a1_1065, a1_1067, a1_1071 = v158((a1_1061 * v145)), v158((a1_1063 * v145)), v158((a1_1065 * v145)), v158((a1_1067 * v145)), ((a1_1071 and v158((a1_1071 * v145))) or 0)
            local v170 = a1_1069.r
            local v171 = a1_1069.g
            local v172 = a1_1069.b
            local v173 = (a1_1069.a * v151)
            if (a1_1071 == 0) then
                v58.rectangle(a1_1061, a1_1063, a1_1065, a1_1067, v170, v171, v172, v173)
            else
                v58.circle((a1_1061 + a1_1071), (a1_1063 + a1_1071), v170, v171, v172, v173, a1_1071, 180, 0.25)
                v58.rectangle((a1_1061 + a1_1071), a1_1063, ((a1_1065 - a1_1071) - a1_1071), a1_1071, v170, v171, v172, v173)
                v58.circle(((a1_1061 + a1_1065) - a1_1071), (a1_1063 + a1_1071), v170, v171, v172, v173, a1_1071, 90, 0.25)
                v58.rectangle(a1_1061, (a1_1063 + a1_1071), a1_1065, ((a1_1067 - a1_1071) - a1_1071), v170, v171, v172, v173)
                v58.circle((a1_1061 + a1_1071), ((a1_1063 + a1_1067) - a1_1071), v170, v171, v172, v173, a1_1071, 270, 0.25)
                v58.rectangle((a1_1061 + a1_1071), ((a1_1063 + a1_1067) - a1_1071), ((a1_1065 - a1_1071) - a1_1071), a1_1071, v170, v171, v172, v173)
                v58.circle(((a1_1061 + a1_1065) - a1_1071), ((a1_1063 + a1_1067) - a1_1071), v170, v171, v172, v173, a1_1071, 0, 0.25)
            end
        end,
        rect_outline = function(a1_1073, a1_1075, a1_1077, a1_1079, a1_1081, a1_1083, a1_1085)
            a1_1073, a1_1075, a1_1077, a1_1079, a1_1083, a1_1085 = v158((a1_1073 * v145)), v158((a1_1075 * v145)), v158((a1_1077 * v145)), v158((a1_1079 * v145)), ((a1_1083 and v158((a1_1083 * v145))) or 0), v158(((a1_1085 or 1) * v145))
            local v174 = a1_1081.r
            local v175 = a1_1081.g
            local v176 = a1_1081.b
            local v177 = (a1_1081.a * v151)
            if (a1_1083 == 0) then
                v58.rectangle(a1_1073, a1_1075, (a1_1077 - a1_1085), a1_1085, v174, v175, v176, v177)
                v58.rectangle(a1_1073, (a1_1075 + a1_1085), a1_1085, (a1_1079 - a1_1085), v174, v175, v176, v177)
                v58.rectangle(((a1_1073 + a1_1077) - a1_1085), a1_1075, a1_1085, (a1_1079 - a1_1085), v174, v175, v176, v177)
                v58.rectangle((a1_1073 + a1_1085), ((a1_1075 + a1_1079) - a1_1085), (a1_1077 - a1_1085), a1_1085, v174, v175, v176, v177)
            else
                v58.circle_outline((a1_1073 + a1_1083), (a1_1075 + a1_1083), v174, v175, v176, v177, a1_1083, 180, 0.25, a1_1085)
                v58.rectangle((a1_1073 + a1_1083), a1_1075, ((a1_1077 - a1_1083) - a1_1083), a1_1085, v174, v175, v176, v177)
                v58.circle_outline(((a1_1073 + a1_1077) - a1_1083), (a1_1075 + a1_1083), v174, v175, v176, v177, a1_1083, 270, 0.25, a1_1085)
                v58.rectangle(a1_1073, (a1_1075 + a1_1083), a1_1085, ((a1_1079 - a1_1083) - a1_1083), v174, v175, v176, v177)
                v58.circle_outline((a1_1073 + a1_1083), ((a1_1075 + a1_1079) - a1_1083), v174, v175, v176, v177, a1_1083, 90, 0.25, a1_1085)
                v58.rectangle((a1_1073 + a1_1083), ((a1_1075 + a1_1079) - a1_1085), ((a1_1077 - a1_1083) - a1_1083), a1_1085, v174, v175, v176, v177)
                v58.circle_outline(((a1_1073 + a1_1077) - a1_1083), ((a1_1075 + a1_1079) - a1_1083), v174, v175, v176, v177, a1_1083, 0, 0.25, a1_1085)
                v58.rectangle(((a1_1073 + a1_1077) - a1_1085), (a1_1075 + a1_1083), a1_1085, ((a1_1079 - a1_1083) - a1_1083), v174, v175, v176, v177)
            end
        end,
        triangle = function(a1_1087, a1_1089, a1_1091, a1_1093, a1_1095, a1_1097, a1_1099)
            a1_1087, a1_1089, a1_1091, a1_1093, a1_1095, a1_1097 = (a1_1087 * v145), (a1_1089 * v145), (a1_1091 * v145), (a1_1093 * v145), (a1_1095 * v145), (a1_1097 * v145)
            v58.triangle(a1_1087, a1_1089, a1_1091, a1_1093, a1_1095, a1_1097, a1_1099.r, a1_1099.g, a1_1099.b, (a1_1099.a * v151))
        end,
        circle = function(a1_1101, a1_1103, a1_1105, a1_1107, a1_1109, a1_1111)
            v58.circle((a1_1101 * v145), (a1_1103 * v145), a1_1105.r, a1_1105.g, a1_1105.b, (a1_1105.a * v151), (a1_1107 * v145), (a1_1109 or 0), (a1_1111 or 1))
        end,
        circle_outline = function(a1_1113, a1_1115, a1_1117, a1_1119, a1_1121, a1_1123, a1_1125)
            v58.circle((a1_1113 * v145), (a1_1115 * v145), a1_1117.r, a1_1117.g, a1_1117.b, (a1_1117.a * v151), (a1_1119 * v145), (a1_1121 or 0), (a1_1123 or 1), (a1_1125 * v145))
        end,
        screen_size = function(a1_1127)
            local v178, v179 = v52.screen_size()
            if a1_1127 then
                return v178, v179
            else
                return (v178 / v145), (v179 / v145)
            end
        end,
        load_rgba = function(a1_1129, a1_1131, a1_1133)
            return v58.load_rgba(a1_1129, a1_1131, a1_1133)
        end,
        load_jpg = function(a1_1135, a1_1137, a1_1139)
            return v58.load_jpg(a1_1135, a1_1137, a1_1139)
        end,
        load_png = function(a1_1141, a1_1143, a1_1145)
            return v58.load_png(a1_1141, a1_1143, a1_1145)
        end,
        load_svg = function(a1_1147, a1_1149, a1_1151)
            return v58.load_svg(a1_1147, a1_1149, a1_1151)
        end,
        texture = function(a1_1153, a1_1155, a1_1157, a1_1159, a1_1161, a1_1163, a1_1165)
            if not a1_1153 then
                return
            end
            v58.texture(a1_1153, v158((a1_1155 * v145)), v158((a1_1157 * v145)), v158((a1_1159 * v145)), v158((a1_1161 * v145)), a1_1163.r, a1_1163.g, a1_1163.b, (a1_1163.a * v151), (a1_1165 or "f"))
        end,
        text = function(a1_1167, a1_1169, a1_1171, a1_1173, a1_1175, ...)
            v58.text((a1_1167 * v145), (a1_1169 * v145), a1_1171.r, a1_1171.g, a1_1171.b, (a1_1171.a * v151), ((a1_1173 or "") .. v153), (a1_1175 or 0), ...)
        end,
        measure_text = function(a1_1177, a1_1179)
            local v180, v181 = v58.measure_text(((a1_1177 or "") .. v153), a1_1179)
            return (v180 / v145), (v181 / v145)
        end,
    }, { __index = v58 })
        return render
    end)()
    local v182 = LPH_NO_VIRTUALIZE(function()
        local v183 = setmetatable({}, { __mode = "kv" })
        local v184 = v56.absoluteframetime()
        local v185 = 1
        local v186 = {
                pow = {
    (function(a1_1181, a1_1183)
        return (1 - ((1 - a1_1181) ^ (a1_1183 or 3)))
    end),
    (function(a1_1185, a1_1187)
        return (a1_1185 ^ (a1_1187 or 3))
    end),
    (function(a1_1189, a1_1191)
        return (((a1_1189 < 0.5) and (4 * v49.pow(a1_1189, (a1_1191 or 3)))) or (1 - (v49.pow(((-2 * a1_1189) + 2), (a1_1191 or 3)) * 0.5)))
    end)
                }
            }
        anima = {
                pulse = 0,
                easings = v186,
                lerp = (function(a1_1193, a1_1195, a1_1197, a1_1199)
        local v187 = (a1_1193 + ((((a1_1195 - a1_1193) * v184) * (a1_1197 or 8)) * v185))
        return (((v49.abs((a1_1195 - v187)) < (a1_1199 or 0.005)) and a1_1195) or v187)
    end),
                condition = (function(a1_1201, a1_1203, a1_1205, a1_1207)
        local v188 = ((a1_1201[1] and a1_1201) or v183[a1_1201])
        if not v188 then
            v183[a1_1201] = { ((a1_1203 and 1) or 0), a1_1203 }
            v188 = v183[a1_1201]
        end
        a1_1205 = (a1_1205 or 4)
        local v189 = a1_1205
        if (type(a1_1205) == "table") then
            v189 = ((a1_1203 and a1_1205[1]) or a1_1205[2])
        end
        v188[1] = v49.clamp((v188[1] + (((v184 * v49.abs(v189)) * v185) * ((a1_1203 and 1) or -1))), 0, 1)
        return (((((v188[1] % 1) == 0) or (v189 < 0)) and v188[1]) or v186.pow[(((a1_1207 and ((a1_1203 and a1_1207[1][1]) or a1_1207[2][1])) or (a1_1203 and 1)) or 3)](v188[1], ((a1_1207 and ((a1_1203 and a1_1207[1][2]) or a1_1207[2][2])) or 3)))
    end)
            }
        v109.paint_ui:set(function()
            anima.pulse = ((v49.sin(v56.realtime()) * 0.5) + 0.5)
            v184 = v56.frametime()
        end)
        return anima
    end)()
    local v190
    local v191 = {
    corner_h = v150.load_svg("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M0 6V4c0-2 2-4 4-4v2C2 2 0 4 0 6Z\"/></svg>", 8, 12),
    corner_v = v150.load_svg("<svg width=\"5.87\" height=\"4\" viewBox=\"0 0 6 4\"><path fill=\"#fff\" d=\"M2 0H0c0 2 2 4 4 4h2C4 4 2 2 2 0Z\"/></svg>", 12, 8),
    warning = v150.load_svg("<svg width=\"16\" height=\"16\" viewBox=\"0 0 16 16\"><path fill=\"#fff\" d=\"m13.259 13h-10.518c-0.35787 0.0023-0.68906-0.1889-0.866-0.5-0.18093-0.3088-0.18093-0.6912 0-1l5.259-9.015c0.1769-0.31014 0.50696-0.50115 0.864-0.5 0.3568-0.00121 0.68659 0.18986 0.863 0.5l5.26 9.015c0.1809 0.3088 0.1809 0.6912 0 1-0.1764 0.3097-0.5056 0.5006-0.862 0.5zm-6.259-3v2h2v-2zm0-5v4h2v-4z\"/></svg>", 16, 16),
    manual = v150.load_svg("<svg width=\"8\" height=\"10\" viewBox=\"0 0 8 10\"><path fill=\"#fff\" d=\"m0.384 5.802c-0.24286-0.19453-0.3842-0.48884-0.3842-0.8s0.14134-0.60547 0.3842-0.8l6.08-4c0.29513-0.22371 0.69277-0.25727 1.0212-0.086202 0.32846 0.17107 0.52889 0.51613 0.51477 0.8862l-1.92 3.96 1.92 4.04c0.01412 0.37007-0.18631 0.71513-0.51477 0.8862-0.32846 0.1711-0.7261 0.1375-1.0212-0.0862z\"/></svg>", 10, 10),
    mini_bfly = v150.load_png([[PNG

   IHDR   	   	   à   sBIT|d   ýIDATWcäççïøøñc9߮O>¥300< b..®å߾}³ Êw2þ¿ÿaÁåååßýúÅÆÆ6µ³³+!!APP¬Xabb"Ãüùó@
@÷͡Cà
a
8Àzä&IIɼööv΀ °BذaCVV֏çϟg¬sPSSÛróæMnäÀ
UTT>ݽ{×¤H è¸ûöíãIøúúþټy3mnnòH$°³³O1~þü¹Èù¨À
(t¦îl $ßai]iÛy    IEND®B`]], 9, 9),
    logo_l = v150.load_png([[PNG

   IHDR         úQßæ   sBIT|d  iIDAT8O½T=qÿ¿WÇ	ºXáâ;5åXN¡4TÐ 	"M:£éà94wC!.
%t tXøÒâ`)Nw:¤¶¨Üqö{^ÿ»$2â¸|¾Þßïùx_%vA"]SF£Ñ{½^ÿìz½~tóÇy6AD[~¿ÿØëõ2§ÓÉ Ëçóç1©o<¿n6ÌårÐýÔï÷Ñhd$íÃF®L¥zí¯L{þÇ)/Ã#Áp%N³H$"ìÎçó'Áét:¦ÕjUøJ¹\>Ã0a­VY­VǿD£QF£¹$òNçÙl6m¤Ýn/nÍf¿ÁkdSÝnår9º×i¡Pؤ8ù¢ÐZÓéÔ2Í6jµډÛíÞ*JÌçó-±q
µl6'"|¥ûp eÇèþùòq?»ÝNM]µ¸ÃrɄ6ÒF½êùڶ¸O߇%I%99Ð+äË ; @Y n4Ìáp01À՗)JUÑÈ=ÎÐëõ¦ÅbñPÊd2û¡Pè1ó%ò¸W@ìaggç³Ç㱘L¦Ë£®醘öj¨A!¼¹2HÝDJB¸ÕjU]Ý[¨?Âï-h\<{Ì*ÊÝ@ì~DÍÝ%Ë/ã)ÌìJü½8܃MjJ­0ݢ5.â6poCo@éór Cá1ñv4à«DHÞÿCÁ6bÏ×<û[zMCw±túJæ?Ë:"$sàÿþÿû	ûy1ãl    IEND®B`]], 26, 15),
    logo_r = v150.load_png("\x89PNG\r\n\x1A\n\x00\x00\x00\rIHDR\x00\x00\x00\x18\x00\x00\x00\x0F\b\x06\x00\x00\x00\xFE\xA4\x0F\xDB\x00\x00\x00\x04sBIT\b\b\b\b|\bd\x88\x00\x00\x02\bIDAT8O\xD5S=hZQ\x14>\xCF`\x97$(\x11\x87\xB8\xF8\b\xB5`\x92\x16%\x85\xBA\x89?%c\xA1\xA3ƀ\xE8P\x02]2\xE8T4\xA3B;\xB4\x0E\x19\xD4M\tAh\x93\xA9P\x95b\a\xC9 \x15\x92A\x9Ct\x90R\x84`\v\xA5Xh_\xBFss\x1F<)\xA4 dȅ\x8Fs\xEEy\xE7\x9C\xEF\xBB\x1F<\x85n\xF8(7\xBC\x9F\xE6!X\x9CN\xA7c\x93\xC9\xF4\xC7l6/\xFDO\xE0<\x04\xAF5M{>\x1C\x0EIU\xD5' 8\xBD\x8E\xC4H\xB0\x88F\x15\xF8\x01\f\fC\x9B\xC85y\xE7\xFA'\xC0+\xEF;\x88\x15\x99\xDB\x11y\x87qVX\xF4\xB4\xDDn\x1F\xF8|>^$N\xADV\xEB\x04\x02\x81{6\x9Bm٨n<\x1E\xFF\xB6\xDB\xED\v\\\x93/\b#\xFD:\x1A\x8D:\x0E\x87\xE3\x0E׻\xDD.y<\x1E\xAAV\xAB\x14\x8DF\x15\xA5\xDF\xEF\x7Fw\xB9\\\xCB\xF9|\x9E\x90S\xB1X\x14M^\xAF\x97&\x93\tY,\x16R\x94\xAB\x87&\x12\t\n\x06\x83\x14\x89D\x88\xFB\xD3\xE9\xF4\x16z:ܓL&\xA9T*\xD1`0 \xAB\xD5\xCAx\xCB\xE2\x15\xF8\xA9?_,ї\xF32&\x93J>K[\xBE`\xE1*\xF7aA\xABR\xA9\xD8@\xB6\xD1h4(\x1C\x0E\x1F\x97\xCB\xE5\x87\xF1x|Mޅ}\x82@_j\xB0\xE3U\xBD^\xDF\x0F\x85B\xBA\xB2\xFB\xF8v\xD1l6\xDFú\xEDV\xAB\xF5\xCB\xEF\xF7\x1F\xE5r\xB9\xDDT*\xA5\x8Bx\x06\xF2CË}\x989S\xA0B\xE3'\x1BO\xA1P\xB8\x8C\xC5b+R\xE99\xE2\x03\xCE3\x99L;\x9B\xCD\xF2\xA08l\x1D[\xE2t:ŝ\x95\xB3(>\xBD^\xEF\xA7\xDB\xED^gsg,\x92\xB3\x1F\x10\x1F\x03߀7\xC0\vY\x7F\x89\xB8o\x10\xD3A\xBE5\xA3n\xF6\xB2\xC3\x04\x8F\x80\xA8\xAC\xF3\xC2\x8F\xC0]`C\xD6NX\x9C\xCCU\xC4\x04`\x01΀w\xC0\x1E\xC0\x16\x0EY8\xB0\rL\x0017Ϗv\x8D\xE0\x7F?\xDD~\x82\xBF).\xBB\x8B\x1E\xD2\x13\xD3\x00\x00\x00\x00IEND\xAEB`\x82", 24, 15),
}
    local v192 = readfile("hysteria/butterfly.png")
    local function fn19(a1_1209)
        v191.butterfly = v150.load_png(a1_1209, 1024, 1024)
        v191.butterfly_s = v150.load_png(a1_1209, 64, 64)
    end
    if not v192 then
        v64.get("https://cdn.hysteria.one/main/butterfly.png", function(a1_1211, a1_1213)
        if (a1_1211 and (v50.sub(a1_1213.body, 2, 4) == "PNG")) then
            fn19(a1_1213.body)
            writefile("hysteria/butterfly.png", a1_1213.body)
        end
    end)
    else
        fn19(v192)
    end
    if _AZAZI then
        v64.get("https://cdn.hysteria.one/azazogo/logo_lo.png", function(a1_1215, a1_1217)
        if (a1_1215 and (v50.sub(a1_1217.body, 2, 4) == "PNG")) then
            v191.logo_l = v150.load_png(a1_1217.body, 35, 15)
        end
    end)
        v64.get("https://cdn.hysteria.one/azazogo/logo_ro.png", function(a1_1219, a1_1221)
        if (a1_1219 and (v50.sub(a1_1221.body, 2, 4) == "PNG")) then
            v191.logo_r = v150.load_png(a1_1221.body, 35, 15)
        end
    end)
    end
    local v193 = LPH_NO_VIRTUALIZE(function()
        local v194
        local v195 = {}
        local bg_line = { bg = v116(255), line = v116(255) }
        local v196 = 0
        local v197 = 0
        local v198 = 0
        local v199 = 0
        local v200 = 0
        local v201 = 0
        v109.paint_ui:set(function()
            v196, v197 = v51.mouse_position()
            v196, v197 = (v196 / v145), (v197 / v145)
            v198, v199 = v51.menu_position()
            v200, v201 = v51.menu_size()
            v198, v199, v200, v201 = (v198 / v145), (v199 / v145), (v200 / v145), (v201 / v145)
        end)
        local function fn20(a1_1223, a1_1225, a1_1227, a1_1229, a1_1231, a1_1233)
            return ((((a1_1227 <= a1_1223) and (a1_1229 <= a1_1225)) and (a1_1223 <= a1_1231)) and (a1_1225 <= a1_1233))
        end
        local menu_bg = { menu = { 0 }, bg = { 0 } }
        v109.paint_ui:set(function()
            local v202 = v182.condition(menu_bg.bg, (v194 ~= nil), 2)
            if (v202 == 0) then
                return
            end
            v150.push_alpha(v202)
            v150.rectangle(0, 0, v146, v147, v144.panel.l1)
            v150.pop_alpha()
        end)
        local function fn21(a1_1235)
            local v203 = a1_1235.__drag
            if (v203.locked or not v63.menu_open) then
                return
            end
            local v204 = v52.key_state(1)
            local v205 = (fn20(v196, v197, a1_1235.x, a1_1235.y, (a1_1235.x + a1_1235.w), (a1_1235.y + a1_1235.h)) and not fn20(v196, v197, v198, v199, (v198 + v200), (v199 + v201)))
            if (v204 and (v203.ready == nil)) then
                v203.ready = v205
                v203.ix, v203.iy = a1_1235.x, a1_1235.y
                v203.px, v203.py = (a1_1235.x - v196), (a1_1235.y - v197)
            end
            if (v204 and v203.ready) then
                if ((v194 == nil) and v203.on_held) then
                    v203.on_held(a1_1235, v203)
                end
                v194 = (((v203.ready and (v194 == nil)) and a1_1235.id) or v194)
                v203.active = (v194 == a1_1235.id)
            elseif not v204 then
                if (v203.active and v203.on_release) then
                    v203.on_release(a1_1235, v203)
                end
                v203.active = false
                v194, v203.ready, v203.aligning, v203.px, v203.py, v203.ix, v203.iy = nil
            end
            v203.hovered = (v205 or v203.active)
            local v206 = {}
            local v207 = (a1_1235.x * v145)
            local v208 = (a1_1235.y * v145)
            local v209 = (a1_1235.w * v145)
            local v210 = (a1_1235.h * v145)
            local v211 = ((v203.px and ((v203.px + v196) * v145)) or v207)
            local v212 = ((v203.py and ((v203.py + v197) * v145)) or v208)
            local v213 = (v207 + (v209 * 0.5))
            local v214 = (v208 + (v210 * 0.5))
            local v215 = v182.condition(v203.progress[1], v203.hovered, 4)
            local v216 = v182.condition(v203.progress[2], v203.active, 4)
            v150.rectangle((a1_1235.x - 3), (a1_1235.y - 3), (a1_1235.w + 6), (a1_1235.h + 6), bg_line.bg:alphen((12 + (24 * v215))), 6)
            v150.push_alpha(v216)
            if not v52.key_state(162) then
                local v217 = ((v211 + (v209 * 0.5)) / v145)
                local v218 = ((v212 + (v210 * 0.5)) / v145)
                for iter_124_0, iter_124_1 in ipairs(v203.rulers) do
                    local v219 = (iter_124_1[2] / v145)
                    local v220 = (iter_124_1[3] / v145)
                    local v221 = (v49.abs(((iter_124_1[1] and (v217 - v219)) or (v218 - v220))) < (10 * v145))
                    local v222 = ((iter_124_1[1] and 1) or 2)
                    if not v206[v222] then
                        v206[v222] = ((v221 and ((iter_124_1[1] and (v219 - (a1_1235.w * 0.5))) or (v220 - (a1_1235.h * 0.5)))) or nil)
                    end
                    iter_124_1.p = (iter_124_1.p or { 0 })
                    local v223 = v49.abs(((iter_124_1[1] and (v213 - v219)) or (v214 - v220)))
                    local v224 = ((v182.condition(iter_124_1.p, (v221 or (v223 < (10 * v145))), -8) * 0.35) + 0.1)
                    v150.rectangle(v219, v220, ((iter_124_1[1] and 1) or iter_124_1[4]), ((iter_124_1[1] and iter_124_1[4]) or 1), bg_line.line:alphen(v224, true))
                end
                if v203.border[5] then
                    local v225 = v203.border[1]
                    local v226 = v203.border[2]
                    local v227 = v203.border[3]
                    local v228 = v203.border[4]
                    local v229 = fn20(a1_1235.x, a1_1235.y, v225, v226, ((v227 - (a1_1235.w * 0.5)) - 1), ((v228 - (a1_1235.h * 0.5)) - 1))
                    local v230 = v182.condition(v203.progress[3], not v229)
                    v150.rect_outline(v225, v226, (v227 - v225), (v228 - v226), bg_line.line:alphen(((v230 * 0.75) + 0.25), true), 4)
                end
            end
            v150.pop_alpha()
            if v203.active then
                local v231 = (v206[1] or (v211 / v145))
                local v232 = (v206[2] or (v212 / v145))
                local v233 = ((v203.border[1] - (v209 * 0.5)) / v145)
                local v234 = ((v203.border[2] - (v210 * 0.5)) / v145)
                local v235 = ((v203.border[3] - (v209 * 0.5)) / v145)
                local v236 = ((v203.border[4] - (v210 * 0.5)) / v145)
                local v237 = v49.clamp(v231, v49.max(v233, 0), v49.min(v235, (v146 - a1_1235.w)))
                local v238 = v49.clamp(v232, v49.max(v234, 0), v49.min(v236, (v147 - a1_1235.h)))
                a1_1235:set_position(v237, v238)
                if v203.on_active then
                    v203.on_active(a1_1235, v203, fin)
                end
            end
        end
        drag = {
                data = v195,
                new = (function(a1_1237, a1_1239)
        v195[a1_1237.id] = {
        x = v63.slider("MISC", "Settings", v50.format("%s::%s-x", v44, a1_1237.id), 0, 10000, ((a1_1237.x / v146) * 10000)),
        y = v63.slider("MISC", "Settings", v50.format("%s::%s-y", v44, a1_1237.id), 0, 10000, ((a1_1237.y / v147) * 10000)),
    }
        v195[a1_1237.id].x:set_visible(false)
        v195[a1_1237.id].y:set_visible(false)
        v195[a1_1237.id].x:set_callback(function(a1_1241)
            a1_1237.x = v49.round(((a1_1241.value * 0.0001) * v146))
        end, true)
        v195[a1_1237.id].y:set_callback(function(a1_1243)
            a1_1237.y = v49.round(((a1_1243.value * 0.0001) * v147))
        end, true)
        a1_1239 = (((type(a1_1239) == "table") and a1_1239) or {})
        a1_1237.__drag = {
        locked = false,
        active = false,
        config = v195[a1_1237.id],
        progress = { { 0 }, { 0 }, { 0 } },
        ix = a1_1237.x,
        iy = a1_1237.y,
        rulers = (a1_1239.rulers or {}),
        border = (a1_1239.border or { 0, 0, v148, v149 }),
        on_release = a1_1239.on_release,
        on_held = a1_1239.on_held,
        on_active = a1_1239.on_active,
        work = fn21,
    }
        v109.dpi_change:set(function()
            v195[a1_1237.id].x:set(v195[a1_1237.id].x.value)
            v195[a1_1237.id].y:set(v195[a1_1237.id].y.value)
            a1_1237.x, a1_1237.y = v49.round(((v195[a1_1237.id].x.value * 0.0001) * v146)), v49.round(((v195[a1_1237.id].y.value * 0.0001) * v147))
        end)
        v109.setup_command:set(function(a1_1245)
            if (v63.menu_open and (a1_1237.__drag.hovered or a1_1237.__drag.active)) then
                a1_1245.in_attack = 0
            end
        end)
    end)
            }
        return drag
    end)()
    local v239 = LPH_NO_VIRTUALIZE(function()
        local v240
        v240 = {
                update = (function(a1_1247)
        return 1
    end),
                paint = (function(a1_1249, a1_1251, a1_1253, a1_1255, a1_1257)
        return
    end),
                set_position = (function(a1_1259, a1_1261, a1_1263)
        if a1_1259.__drag then
            if a1_1261 then
                a1_1259.__drag.config.x:set(((a1_1261 / v146) * 10000))
                a1_1259.x = a1_1261
            end
            if a1_1263 then
                a1_1259.__drag.config.y:set(((a1_1263 / v147) * 10000))
                a1_1259.y = a1_1263
            end
        else
            a1_1259.x, a1_1259.y = (a1_1261 or a1_1259.x), (a1_1263 or a1_1259.y)
        end
    end),
                get_position = (function(a1_1265)
        local v241 = (a1_1265.__drag and a1_1265.__drag.config)
        if not v241 then
            return a1_1265.x, a1_1265.y
        end
        return ((v241.x.value * 0.0001) * v146), ((v241.y.value * 0.0001) * v147)
    end),
                __call = (function(a1_1267)
        local v242 = a1_1267.__list
        local v243 = a1_1267.__drag
        if v242 then
            v242.items, v242.active = v242.collect(), 0
            for iter_135_0 = 1, #v242.items, 1 do
                if v242.items[iter_135_0].active then
                    v242.active = (v242.active + 1)
                end
            end
        end
        a1_1267.alpha = a1_1267:update()
        v150.push_alpha(a1_1267.alpha)
        if (a1_1267.alpha > 0) then
            if v243 then
                v243.work(a1_1267)
            end
            if v242 then
                v240.traverse(a1_1267)
            end
            a1_1267:paint(a1_1267.x, a1_1267.y, a1_1267.w, a1_1267.h)
        end
        v150.pop_alpha()
    end),
                enlist = (function(a1_1269, a1_1271, a1_1273)
        a1_1269.__list = {
        active = 0,
        longest = 0,
        items = {},
        progress = setmetatable({}, { __mode = "k" }),
        minwidth = a1_1269.w,
        collect = a1_1271,
        paint = a1_1273,
    }
    end),
                traverse = (function(a1_1275)
        local v244 = a1_1275.__list
        local v245 = 0
        local v246 = 0
        local v247 = 0
        v244.active, v244.longest = 0, 0
        for iter_137_0 = 1, #v244.items, 1 do
            local v248 = v244.items[iter_137_0]
            local v249 = (v248.name or iter_137_0)
            v244.progress[v249] = (v244.progress[v249] or { 0 })
            local v250 = v182.condition(v244.progress[v249], v248.active)
            if (v250 > 0) then
                v150.push_alpha(v250)
                local v251, v252 = v244.paint(a1_1275, v248, v245, v250)
                v150.pop_alpha()
                v244.active, v245 = (v244.active + 1), (v245 + (v252 * v250))
                v244.longest = v49.max(v244.longest, v251)
            end
        end
        a1_1275.w = v182.lerp(a1_1275.w, v49.max(v244.longest, v244.minwidth), 10, 0.5)
    end),
                lock = (function(a1_1277, a1_1279)
        if not a1_1277.__drag then
            return
        end
        a1_1277.__drag.locked = ((a1_1279 and true) or false)
    end)
            }
        v240.__index = v240
        widget = {
                new = (function(a1_1281, a1_1283, a1_1285, a1_1287, a1_1289, a1_1291)
        local arg_139_0 = {
        type = 0,
        alpha = 0,
        id = a1_1281,
        x = (a1_1283 or 0),
        y = (a1_1285 or 0),
        w = (a1_1287 or 0),
        h = (a1_1289 or 0),
        progress = { 0 },
    }
        if a1_1291 then
            v193.new(arg_139_0, a1_1291)
        end
        return setmetatable(arg_139_0, v240)
    end)
            }
        return widget
    end)()
    local v253
    local states_snaps = {
    states = {
    { "default", "Default", "D" },
    { "stand", "Standing", "S" },
    { "run", "Running", "R" },
    { "walk", "Walking", "W" },
    { "air", "Air", "A" },
    { "airc", "Air & crouch", "AC" },
    { "crouch", "Crouching", "C" },
    { "sneak", "Sneaking", "3" },
    { "fakelag", "Fakelag", "FL" },
},
    snaps = {
    { "default", "Default", "D" },
    { "air", "Air", "A" },
    { "airc", "Air & crouch", "AC" },
    { "crouch", "Crouching", "C" },
    { "sneak", "Sneaking", "S" },
    { "peek", "On peek", "P" },
},
}
    local v254 = {
    hitgroups = {
    [0] = "generic",
    "head",
    "chest",
    "stomach",
    "left arm",
    "right arm",
    "left leg",
    "right leg",
    "neck",
    "generic",
    "gear",
},
    states = v48.distribute(states_snaps.states, nil, 1),
    snaps = v48.distribute(states_snaps.snaps, nil, 1),
    build = { stable = { "", "" }, beta = { "β", "" }, debug = { "♪", "" } },
    exploit = { OS = 2, DT = 1 },
    aspect_ratios = { { 125, "5:4" }, { 133, "4:3" }, { 150, "3:2" }, { 160, "16:10" }, { 178, "16:9" }, { 200, "2:1" } },
}
    local builder_snap = { builder = { custom = {} }, snap = { custom = {} } }
    local v255
    local v256
    local v257, v258 = {
    vulnerable = false,
    side = 0,
    duck_amount = 0,
    max_speed = 0,
    peeking = false,
    velocity_sqr = 0,
    valid = false,
    velocity = 0,
    self = v54.get_local_player(),
    origin = v69(),
    threat = v52.current_threat(),
    exploit = { lc_left = 0, defensive = false, ready = false },
    predicted = { velocity = 0 },
}, {}
    local v259 = 0
    local v260 = 0
    local v261
    v109.predict_command:set(function(a1_1293)
        if (not v257.valid or (v261 ~= a1_1293.command_number)) then
            return
        end
        v259 = v54.get_prop(v257.weapon, "m_flPostponeFireReadyTime")
        local v262 = (v54.get_prop(v257.self, "m_nTickBase") or 0)
        if (v49.abs((v262 - v260)) > 64) then
            v260 = 0
        end
        if (v262 > v260) then
            v260 = v262
        elseif (v262 < v260) then
        end
        v257.exploit.lc_left = v49.min(14, v49.max(0, ((v260 - v262) - 1)))
        v257.exploit.defensive = (v257.exploit.lc_left > 0)
    end)
    v109.run_command:set(function(a1_1295)
        v261 = a1_1295.command_number
    end)
    local function fn22(a1_1297)
        if not v257.weapon then
            return false
        end
        if not v54.get_prop(v257.weapon, "m_bPinPulled") then
            return
        end
        local v263 = v54.get_prop(v257.weapon, "m_fThrowTime")
        return (v263 and (v263 ~= 0))
    end
    local function fn23()
        if ((not v257.valid or not v257.weapon) or not v257.weapon_t) then
            return
        end
        if (((v257.weapon_t.weapon_type_int == 9) or (v257.weapon_t.name == "Medi-Shot")) or (v257.weapon_t.type == "c4")) then
            return
        end
        if (v54.get_prop(v257.weapon, "m_iClip1") == 0) then
            return
        end
        local v264 = (v54.get_prop(v257.self, "m_nTickBase") * v56.tickinterval())
        local v265 = v54.get_prop(v257.self, "m_flNextAttack")
        local v266 = v54.get_prop(v257.weapon, "m_flNextPrimaryAttack")
        if (not v265 or not v266) then
            return
        end
        if ((v54.get_prop(v257.weapon, "m_iItemDefinitionIndex") == 64) and not (v259 < v56.curtime())) then
            return
        end
        return ((v265 <= v264) and (v266 <= v264))
    end
    local function fn24()
        local v267 = false
        local v268 = false
        local v269 = v69(v54.get_prop(v257.self, "m_vecVelocity"))
        local v270 = ((v253.misc.settings.maxshift.value - v253.rage.aimbot.dt_fl[1].value) + 1)
        local v271 = v69(v52.eye_position())
        local v272 = v69(v52.extrapolate(v271.x, v271.y, v271.z, v269, v270))
        for iter_144_0 = 1, #v258, 1 do
            local v273 = v258[iter_144_0]
            if v54.is_enemy(v273) then
                if (v59.band((v54.get_esp_data(v273).flags or 0), v59.lshift(1, 11)) == 0) then
                    local v274 = { v54.hitbox_position(v273, 0) }
                    local v275 = { v52.extrapolate(v274[1], v274[2], v274[3], v269, 4) }
                    local v276 = { v52.trace_bullet(v257.self, v272.x, v272.y, v272.z, v275[1], v275[2], v275[3]) }
                    if (v276[2] and (v276[2] > 0)) then
                        v267 = true
                        break
                    end
                else
                    v268 = true
                end
            end
        end
        return v267, v268
    end
    local function fn25()
        if not v257.weapon_t then
            return 0
        end
        if (v54.get_prop(v257.self, "m_bIsScoped") == 1) then
            return v257.weapon_t.max_player_speed_alt
        else
            return v257.weapon_t.max_player_speed
        end
    end
    local function fn26(a1_1299)
        v257.self = v54.get_local_player()
        v257.valid = (((v257.self and v54.is_alive(v257.self)) and true) or false)
        v257.threat = ((v257.valid and v52.current_threat()) or nil)
        v257.weapon = ((v257.valid and v54.get_player_weapon(v257.self)) or nil)
        v257.weapon_t = (v257.weapon and v68(v257.weapon))
        if v257.valid then
            v257.exploit.active = ((((v253.rage.aimbot.double_tap[1].value and v253.rage.aimbot.double_tap[1].hotkey:get()) and v254.exploit.DT) or ((v253.aa.other.onshot.value and v253.aa.other.onshot.hotkey:get()) and v254.exploit.OS)) or v254.exploit.OFF)
            if v253.rage.other.duck:get() then
                v257.exploit.active = nil
            end
            v257.exploit.ready = v65.get_double_tap()
            v257.origin = v69(v54.get_origin(v257.self))
            v257.animstate = v54.get_animstate(v257.self)
            if a1_1299 then
                local v277 = v54.get_prop(v257.self, "m_fFlags")
                v257.throwing_nade = (fn22(a1_1299) or false)
                v257.can_shoot = (fn23() or false)
                v257.using = (a1_1299.in_use == 1)
                v257.in_score = (a1_1299.in_score == 1)
                v257.on_ground = (v59.band(v277, v59.lshift(1, 0)) == 1)
                v257.jumping = (not v257.on_ground or (a1_1299.in_jump == 1))
                v257.walking = ((v257.velocity > 5) and (a1_1299.in_speed == 1))
                v257.crouching = (a1_1299.in_duck == 1)
                v257.side = ((((a1_1299.in_moveright == 1) and -1) or ((a1_1299.in_moveleft == 1) and 1)) or 0)
            end
        end
    end
    local function fn27(a1_1301)
        v257.self = v54.get_local_player()
        v257.valid = (((v257.self and v54.is_alive(v257.self)) and true) or false)
        v257.in_game = true
        v150.valid = v257.valid
        v257.threat = ((v257.valid and v52.current_threat()) or nil)
        v257.weapon = ((v257.valid and v54.get_player_weapon(v257.self)) or nil)
        v258 = v54.get_players()
        if v257.valid then
            v257.origin = v69(v54.get_origin(v257.self))
            v257.duck_amount = v54.get_prop(v257.self, "m_flDuckAmount")
            v257.max_speed = fn25()
            local v278, v279, v280 = v54.get_prop(v257.self, "m_vecVelocity")
            v257.velocity = v49.sqrt3(v278, v279, v280)
            v257.movetype = v54.get_prop(v257.self, "m_MoveType")
        end
    end
    local function fn28(a1_1303)
        if v257.valid then
            v257.peeking, v257.vulnerable = fn24()
        end
    end
    local function fn29()
        v257.self = v54.get_local_player()
        v257.valid = (((v257.self and v54.is_alive(v257.self)) and true) or false)
        v257.gamerules = v54.get_game_rules()
    end
    v109.setup_command:set(fn26)
    v109.run_command:set(fn27)
    v109.predict_command:set(fn28)
    v109.net_update_end:set(fn29)
    v109.player_death:set(function(a1_1305)
        if (v52.userid_to_entindex(a1_1305.userid) ~= v257.self) then
            return
        end
        v109.local_death:fire(a1_1305)
    end)
    v109.player_spawn:set(function(a1_1307)
        if (v52.userid_to_entindex(a1_1307.userid) ~= v257.self) then
            return
        end
        v109.local_spawn:fire(a1_1307)
    end)
    v109.player_connect_full:set(function(a1_1309)
        if (v52.userid_to_entindex(a1_1309.userid) ~= v257.self) then
            return
        end
        v109.local_connect_full:fire(a1_1309)
    end)
    local v281
    v109.paint_ui:set(function()
        local v282 = (v56.mapname() ~= nil)
        if (v281 and not v282) then
            v257.self, v257.valid = nil, false
            v257.in_game = false
            v109.local_disconnect:fire()
            v281 = false
        end
        v281 = v282
    end)
    function v54.is_lethal(a1_1311)
        if ((not v257.weapon_t or not a1_1311) or v54.is_dormant(a1_1311)) then
            return false
        end
        local v283 = (v257.weapon_t.damage * 1.25)
        return (v49.ceil(((v257.weapon_t.armor_ratio * 0.5) * v283)) >= v54.get_prop(a1_1311, "m_iHealth"))
    end
    local v284
    local v285
    LPH_NO_VIRTUALIZE(function()
        v253 = {
        rage = {
        weapon = v63.reference("RAGE", "Weapon type", "Weapon type"),
        aimbot = {
        enable = v63.reference("RAGE", "Aimbot", "Enabled"),
        force_baim = v63.reference("RAGE", "Aimbot", "Force body aim"),
        force_sp = v63.reference("RAGE", "Aimbot", "Force safe point"),
        hit_chance = v63.reference("RAGE", "Aimbot", "Minimum hit chance"),
        damage = v63.reference("RAGE", "Aimbot", "Minimum damage"),
        damage_ovr = { v63.reference("RAGE", "Aimbot", "Minimum damage override") },
        double_tap = { v63.reference("RAGE", "Aimbot", "Double tap") },
        dt_fl = { v63.reference("RAGE", "Aimbot", "Double tap fake lag limit") },
    },
        other = {
        peek = v63.reference("RAGE", "Other", "Quick peek assist"),
        duck = v63.reference("RAGE", "Other", "Duck peek assist"),
        log_misses = v63.reference("RAGE", "Other", "Log misses due to spread"),
    },
    },
        aa = {
        angles = {
        enable = v63.reference("AA", "Anti-Aimbot angles", "Enabled"),
        pitch = { v63.reference("AA", "Anti-Aimbot angles", "Pitch") },
        yaw = { v63.reference("AA", "Anti-Aimbot angles", "Yaw") },
        base = v63.reference("AA", "Anti-Aimbot angles", "Yaw base"),
        jitter = { v63.reference("AA", "Anti-Aimbot angles", "Yaw jitter") },
        body = { v63.reference("AA", "Anti-Aimbot angles", "Body yaw") },
        edge = v63.reference("AA", "Anti-Aimbot angles", "Edge yaw"),
        fs_body = v63.reference("AA", "Anti-Aimbot angles", "Freestanding body yaw"),
        freestand = v63.reference("AA", "Anti-Aimbot angles", "Freestanding"),
        roll = v63.reference("AA", "Anti-Aimbot angles", "Roll"),
    },
        fakelag = {
        enable = v63.reference("AA", "Fake lag", "Enabled"),
        amount = v63.reference("AA", "Fake lag", "Amount"),
        variance = v63.reference("AA", "Fake lag", "Variance"),
        limit = v63.reference("AA", "Fake lag", "Limit"),
    },
        other = {
        slowmo = v63.reference("AA", "Other", "Slow motion"),
        legs = v63.reference("AA", "Other", "Leg movement"),
        onshot = v63.reference("AA", "Other", "On shot anti-aim"),
        fp = v63.reference("AA", "Other", "Fake peek"),
    },
    },
        misc = {
        clantag = v63.reference("MISC", "Miscellaneous", "Clan tag spammer"),
        log_damage = v63.reference("MISC", "Miscellaneous", "Log damage dealt"),
        ping_spike = v63.reference("MISC", "Miscellaneous", "Ping spike"),
        settings = {
        dpi = v63.reference("MISC", "Settings", "DPI scale"),
        accent = v63.reference("MISC", "Settings", "Menu color"),
        maxshift = v63.reference("MISC", "Settings", "sv_maxusrcmdprocessticks2"),
    },
        helper = fn10(v63.reference, "VISUALS", "Other ESP", "Helper"),
    },
    }
        local v286
        local v287
        local v288
        local v289 = {}
        v52.delay_call(0.1, function()
            for iter_156_0 = 1, #v289, 1 do
                local v290 = v289[iter_156_0]
                v290[1]:set_callback(function()
                v290[1]:set(v290[2])
                if v290[3] then
                    v290[1]:set_visible(false)
                else
                    v290[1]:set_enabled(false)
                end
            end, true)
            end
        end)
        local v291 = {
                tabs = {
    {
    "home",
    "Home"
                    },
    {
    "settings",
    "Settings"
                    },
    {
    "antiaim",
    "Anti-aim"
                    }
                },
                header = (function(a1_1313, a1_1315)
        local v292
        if a1_1315 then
            v292 = { a1_1313:label(v50.format("\v%s", a1_1315)), a1_1313:label("\a373737FF‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾") }
        else
            v292 = a1_1313:label("\a373737FF‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾")
        end
        return v292
    end),
                feature = (function(a1_1317, a1_1319)
        a1_1317 = (((a1_1317.__type == "pui::element") and { a1_1317 }) or a1_1317)
        local v293, v294 = a1_1319(a1_1317[1])
        for iter_159_0, iter_159_1 in pairs(v293) do
            iter_159_1:depend({ a1_1317[1], v294 })
        end
        v293[(a1_1317.key or "on")] = a1_1317[1]
        return v293
    end),
                space = (function(a1_1321)
        return a1_1321:label("\n")
    end),
                private = (function(a1_1323, a1_1325, a1_1327)
        a1_1325 = (a1_1325 or 2)
        if (a1_1325 > v97) then
            v289[(#v289 + 1)] = { a1_1323, (a1_1327 or false), (a1_1325 >= 3) }
        end
        return a1_1323
    end)
            }
        local other_angles = {
        other = v63.group("AA", "Other"),
        angles = v63.group("AA", "Anti-aimbot angles"),
        fakelag = v63.group("AA", "Fake lag"),
    }
        v63.macros.hysteria = "\a74A6A9FF"
        v63.macros.dot = "\v•\r  "
        v63.macros.p = "\aCDCDCD50—  \r"
        v63.macros.silent = "\aCDCDCD50"
        v63.macros.insecure = "\aB6B665FF"
        v285 = {
        title = other_angles.fakelag:label("hysteria"),
        selector = other_angles.fakelag:combobox("\nawselector", v48.distribute(v291.tabs, 2, nil)),
        v291.header(other_angles.fakelag),
        home = {
        info = {
        user = other_angles.fakelag:label(v50.format("Welcome, \v%s", var_0_1.user)),
        version = other_angles.fakelag:label(v50.format("Version: \v%s", var_0_1.version)),
    },
        config = {
        v291.header(other_angles.other, "New config"),
        name = other_angles.other:textbox("Name"),
        create = other_angles.other:button("Create"),
        import = other_angles.other:button("Import"),
        v291.header(other_angles.angles, "Your configs"),
        list = other_angles.angles:listbox("Configs", { "Default" }),
        selected = other_angles.angles:label("Selected: \vDefault"),
        list_report = other_angles.angles:label("REPORT"),
        load = other_angles.angles:button("\f<hysteria>Load"),
        loadaa = other_angles.angles:button("Load AA only"),
        save = other_angles.angles:button("Save"),
        export = other_angles.angles:button("Export"),
        delete = other_angles.angles:button("\aD95148FFDelete"),
        deleteb = other_angles.angles:button("\aD9514840Delete"),
    },
        verify = {
        v291.space(other_angles.other),
        v291.header(other_angles.other, "Discord"),
        other_angles.other:button("Join us", function()
            v52.open_link("https://discord.gg/eC82SmcF9E")
        end),
        auth = other_angles.other:button("Copy authcode"),
    },
    },
        servers = {
        list = {
        v291.header(other_angles.angles, "Your servers"),
        [0] = other_angles.angles:listbox("Servers", { "" }),
        connect = other_angles.angles:button("Connect"),
        export = other_angles.angles:button("Export"),
        delete = other_angles.angles:button("Delete"),
    },
        new = {
        v291.header(other_angles.other, "New server"),
        other_angles.other:label("IP"),
        ip = other_angles.other:textbox("IP"),
        paste = other_angles.other:button("Paste IP"),
        other_angles.other:label("Name"),
        name = other_angles.other:textbox("Name"),
        create = other_angles.other:button("Create"),
        v291.header(other_angles.other),
        import = other_angles.other:button("Import"),
    },
    },
        settings = {
        tab = other_angles.angles:combobox("\nstab", { "Features", "Visual" }),
        space = v291.space(other_angles.angles),
    },
    }
        v284 = {
                rage = {
    v291.header(other_angles.angles, "Ragebot"),
                    teleport = v291.feature({ other_angles.angles:checkbox("Auto teleport", 0) }, function(a1_1329)
            return {
            land = other_angles.angles:checkbox("\f<p>Ensure landing"),
            pistol = other_angles.angles:checkbox("\f<p>Allow pistols"),
        }, true
        end),
                    exswitch = v291.feature({ other_angles.angles:checkbox("Auto hide shots") }, function(a1_1331)
            return { allow = other_angles.angles:multiselect("\f<p>Additional weapons", { "Pistols", "Desert Eagle" }) }, true
        end),
                    recharge = other_angles.angles:checkbox("Allow force recharge"),
                    resolver = v291.private(other_angles.angles:checkbox("Jitter resolver")),
                    peekfix = v291.private(other_angles.angles:checkbox("Early defensive"))
                },
                visuals = {
    other_angles.angles:label("Accent color"),
                    accent = other_angles.angles:color_picker("\nacccent", v144.accent.r, v144.accent.g, v144.accent.b, 255),
    v291.space(other_angles.angles),
    v291.header(other_angles.angles, "Screen"),
                    crosshair = v291.feature(other_angles.angles:checkbox("Crosshair indicators"), function(a1_1333)
            return {
            style = other_angles.angles:combobox("\nch_style", { "Classic", "Mini" }),
            logo = other_angles.angles:checkbox("\f<p>Butterfly"),
        }, true
        end),
                    damage = other_angles.angles:checkbox("Damage indicator"),
                    arrows = other_angles.angles:checkbox("Anti-aim arrows"),
                    water = v291.feature(other_angles.angles:checkbox("Watermark"), function()
            return {
            hide = other_angles.angles:checkbox("\f<p>Hide logo"),
            other_angles.angles:label("\f<p>Custom name"),
            name = other_angles.angles:textbox("\ncustomname"),
        }, true
        end),
                    keylist = other_angles.angles:checkbox("Keylist"),
                    speclist = other_angles.angles:checkbox("Speclist"),
                    slowdown = other_angles.angles:checkbox("Slowdown warning"),
                    marker = other_angles.angles:checkbox("Hitmarker"),
    v291.space(other_angles.angles),
    v291.header(other_angles.angles, "Other"),
                    aspect = v291.feature(other_angles.angles:checkbox("Aspect ratio"), function()
            return {
            ratio = other_angles.angles:slider("\naratio", 80, 200, 133, true, nil, 0.01, v48.distribute(v254.aspect_ratios, 2, 1)),
        }, true
        end),
                    dpi = other_angles.angles:checkbox("DPI scaling")
                },
                misc = {
    v291.space(other_angles.angles),
    v291.header(other_angles.angles, "Miscellaneous"),
                    clantag = other_angles.angles:checkbox("Clantag"),
                    filter = other_angles.angles:checkbox("Console filter"),
                    logs = v291.feature(other_angles.angles:checkbox("Eventlogger"), function(a1_1335)
            return {
            events = other_angles.angles:multiselect("\f<p>Events", { "Ragebot shots", "Harming enemies", "Getting harmed", "Anti-aim info" }),
            output = other_angles.angles:multiselect("\f<p>Output", { "Console", "Screen" }),
        }, true
        end),
                    ladder = other_angles.angles:checkbox("Fast ladder"),
                    breaker = v291.feature(other_angles.angles:checkbox("Animation breaker"), function(a1_1337)
            return {
            pitch = other_angles.angles:checkbox("\f<p>Pitch 0 on land"),
            slia = other_angles.angles:checkbox("\f<p>Static legs in air"),
            legs = other_angles.angles:combobox("\f<p>Legs", { "None", "Static", "Jitter", "No step back" }),
        }, true
        end)
                },
                antiaim = {
                    on = other_angles.fakelag:checkbox("Enable\naa"),
                    tab = other_angles.fakelag:combobox("\naatab", { "General", "Builder", "Defensive" }, nil, false),
                    general = {
    v291.header(other_angles.angles, "General"),
                        mode = other_angles.angles:combobox("Anti-aim operator", { "gamesense", "hysteria" }),
                        invert = other_angles.angles:hotkey("Inverter", false, 0),
                        edge = other_angles.angles:hotkey("Edge yaw", false, 0),
                        fs = v291.feature(other_angles.angles:checkbox("Freestanding", 0), function(a1_1339)
            return { static = other_angles.angles:checkbox("\f<p>Static\nfs") }, true
        end),
                        manual = v291.feature(other_angles.angles:checkbox("Manual yaw"), function()
            return {
            static = other_angles.angles:checkbox("\f<p>Static\nmy"),
            left = other_angles.angles:hotkey("\f<p>Left \f<silent>HK\r", false, 0),
            right = other_angles.angles:hotkey("\f<p>Right \f<silent>HK\r", false, 0),
            reset = other_angles.angles:hotkey("\f<p>Reset \f<silent>HK\r", false, 0),
        }, true
        end),
    v291.space(other_angles.angles),
    v291.header(other_angles.angles, "Misc"),
                        head = v291.feature(other_angles.angles:checkbox("Safe head"), function()
            return {}, true
        end),
                        jmove = other_angles.angles:checkbox("Jitter move"),
                        stab = other_angles.angles:checkbox("Avoid backstab"),
                        use = other_angles.angles:checkbox("Legit AA"),
                        fl = v291.feature(other_angles.angles:checkbox("Fakelag"), function()
            return {
            mode = other_angles.angles:combobox("\nflmode", { "Dynamic", "Maximum", "Fluctuate" }),
            limit = other_angles.angles:slider("\nflLimit", 1, 15, 14, true, "t"),
        }, true
        end)
                    },
                    state = {
    v291.header(other_angles.angles, "States builder"),
                        selector = other_angles.angles:combobox("\nstateselector", v48.distribute(states_snaps.states, 2), nil, false),
    v291.header(other_angles.angles)
                    },
                    builder = {
                    },
                    def = {
    v291.header(other_angles.other, "General"),
                        snap = v291.feature(other_angles.other:checkbox("\f<insecure>Defensive AA", 0), function()
            return { os = other_angles.other:checkbox("\f<p>Allow with On shot AA") }, true
        end),
    v291.space(other_angles.other),
    v291.header(other_angles.other, "Misc"),
                        triggers = other_angles.other:multiselect("LC break triggers", { "Jumping", "Crouching", "Weapon change" }),
                        setup = {
    v291.header(other_angles.angles, "Defensive setup"),
                            selector = other_angles.angles:combobox("\nstateselector", v48.distribute(states_snaps.snaps, 2), nil, false),
    v291.header(other_angles.angles)
                        }
                    },
                    snaps = {
                    }
                },
                drag = v193.data
            }
        local function fn30(a1_1341, a1_1343)
            a1_1343:set_callback(function(a1_1345)
            v48.place(builder_snap.builder.custom, a1_1341, a1_1345.value)
        end, true)
            return a1_1343
        end
        local v295 = { delay = { [1] = "Off" } }
        for iter_155_0, iter_155_1 in ipairs(states_snaps.states) do
            local v296 = iter_155_1[1]
            local v297 = iter_155_1[2]
            local v298 = iter_155_1[3]
            v284.antiaim.builder[v296], v63.macros.z = {}, ("\n" .. v298)
            local v299 = v284.antiaim.builder[v296]
            local v300 = other_angles.angles
            if not (v296 == "default") then
                v299.override = fn30({ v296, "override" }, v300:checkbox(("Override \v" .. v50.lower(v297))))
                v299[(#v299 + 1)] = v300:label("\n")
            end
            v299[(#v299 + 1)] = v300:label("\vYaw")
            v299.off = fn30({ v296, "off" }, v300:slider("Offset\f<z>", -60, 60, 0, true, "°"))
            v299.add = v291.feature(fn30({ v296, "add", "on" }, v300:checkbox("Add yaw left / right\f<z>")), function(a1_1347)
            return {
            l = fn30({ v296, "add", "l" }, v300:slider("\f<z>addyawl", -60, 60, 0, true, "°")),
            r = fn30({ v296, "add", "r" }, v300:slider("\f<z>addyawr", -60, 60, 0, true, "°")),
        }, true
        end)
            v299.mod = v291.feature(fn30({ v296, "mod", "type" }, v300:combobox("Modifier\f<z>", { "Off", "Jitter", "Ways", "Skitter", "Rotate", "Random" })), function(a1_1349)
            return {
            ways = fn30({ v296, "mod", "ways" }, v300:slider("\f<p>Ways\f<z>", 3, 7, 3)):depend({ a1_1349, "Ways", "Skitter" }),
            deg = fn30({ v296, "mod", "deg" }, v300:slider("\f<p>Degree\f<z>", 0, 60, 0, true, "°")),
        }, function(a1_1351)
                return (a1_1351.value ~= "Off")
            end
        end)
            v299[(#v299 + 1)] = v300:label("\n")
            v299[(#v299 + 1)] = v300:label("\vBody yaw")
            v299.des = v291.feature(fn30({ v296, "des", "on" }, v300:checkbox("Desync\f<z>")), function()
            return {
            j = fn30({ v296, "des", "j" }, v300:checkbox("\f<p>Jitter\f<z>des")),
            l = fn30({ v296, "des", "l" }, v300:slider("\f<p>Left / right\f<z>des", 0, 60, 60, true, "°")):depend({ v284.antiaim.general.mode, "hysteria" }),
            r = fn30({ v296, "des", "r" }, v300:slider("\ndesright\f<z>", 0, 60, 60, true, "°")):depend({ v284.antiaim.general.mode, "hysteria" }),
        }, true
        end)
            v299.delay = fn30({ v296, "delay" }, v300:slider("Delay\f<z>", 1, 16, 0, true, "t", 1, v295.delay))
            v63.traverse(v299, function(a1_1353, a1_1355)
            a1_1353:depend({ v284.antiaim.state.selector, v297 }, (((a1_1355[1] ~= "override") and v299.override) or nil))
        end)
        end
        local function fn31(a1_1357, a1_1359)
            a1_1359:set_callback(function(a1_1361)
            v48.place(builder_snap.snap.custom, a1_1357, a1_1361.value)
        end, true)
            return a1_1359
        end
        local delay_duration = {
        delay = { [0] = "Off" },
        duration = { [13] = "Max" },
        pitch = { [0] = "Zero", [89] = "Down", [-89] = "Up" },
    }
        for iter_155_2, iter_155_3 in ipairs(states_snaps.snaps) do
            local v301 = iter_155_3[1]
            local v302 = iter_155_3[2]
            v284.antiaim.snaps[v301], v63.macros.z = {}, ("\nS" .. iter_155_3[3])
            local v303 = v284.antiaim.snaps[v301]
            local v304 = other_angles.angles
            local v305 = (v301 == "default")
            v303.on = fn31({ v301, "on" }, v304:combobox("\f<z>", ((v305 and { "Off", "Custom" }) or { "Default", "Off", "Custom" })))
            v303[(#v303 + 1)] = v291.space(v304)
            v303.pitch = v291.feature(fn31({ v301, "x", "on" }, v304:checkbox("\vPitch\f<z>")), function()
            local v306 = fn31({ v301, "x", "mode" }, v304:combobox("\f<p>Mode\f<z>x", { "Static", "Jitter", "Random", "Random Static", "Spin", "Camera", "At target" }))
            return {
            mode = v306,
            ang = fn31({ v301, "x", "ang" }, v304:slider("\f<p>Angle\f<z>x", -89, 89, -89, true, "°", 1, delay_duration.pitch)):depend({ v306, "Static", "Jitter", "Random", "Random Static", "Spin", "Camera", "At target" }),
            ang2 = fn31({ v301, "x", "ang2" }, v304:slider("\f<p>Angle 2\f<z>x", -89, 89, -89, true, "°", 1, delay_duration.pitch)):depend({ v306, "Jitter", "Random", "Random Static", "Spin" }),
            speed = fn31({ v301, "x", "speed" }, v304:slider("\f<p>Speed\f<z>x", -50, 50, 20, true, "", 0.1)):depend({ v306, "Spin" }),
        }, true
        end)
            v303[(#v303 + 1)] = v291.space(v304)
            v303.yaw = v291.feature(fn31({ v301, "y", "on" }, v304:checkbox("\vYaw\f<z>")), function()
            local v307 = fn31({ v301, "y", "mode" }, v304:combobox("\f<p>Mode\f<z>y", {
            "Static",
            "Jitter",
            "Random",
            "Random Jitter",
            "Random Static",
            "Spin",
            "Spin Jitter",
            "90w",
            "180v",
            "Camera",
            "At target",
            "Opposite",
        }))
            return {
            mode = v307,
            ang = fn31({ v301, "y", "ang" }, v304:slider("\f<p>Angle\f<z>y", 0, 360, 180, true, "°")):depend({
            v307,
            "Static",
            "Jitter",
            "Random",
            "Random Jitter",
            "Random Static",
            "Spin",
            "Spin Jitter",
            "90w",
            "180v",
            "Camera",
            "At target",
        }),
            delay = fn31({ v301, "y", "delay" }, v304:slider("\f<p>Delay\f<z>y", 0, 14, 0, true, "t", 1, delay_duration.delay)):depend({ v307, "Jitter", "Spin Jitter" }),
            speed = fn31({ v301, "y", "speed" }, v304:slider("\f<p>Speed\f<z>y", -50, 50, 20, true, "", 0.1)):depend({ v307, "Spin", "Spin Jitter", "90w", "180v" }),
        }, true
        end)
            v303[(#v303 + 1)] = v291.space(v304)
            v303[(#v303 + 1)] = v304:label("\vMisc")
            v303.time = fn31({ v301, "time" }, v304:slider("Duration\f<z>", 1, 13, 13, true, "t", 1, delay_duration.duration))
            v303.sd = fn31({ v301, "sd" }, v304:checkbox("Control desync side\f<z>"))
            v63.traverse(v303, function(a1_1363, a1_1365)
            a1_1363:depend({ v284.antiaim.def.setup.selector, v302 }, { v284.antiaim.def.snap.on, true }, (((a1_1365[1] ~= "on") and { v303.on, "Custom" }) or nil))
        end)
        end
        v63.traverse(v284.antiaim.def.setup, function(a1_1367, a1_1369)
            a1_1367:depend({ v284.antiaim.def.snap.on, true })
        end)
        v63.macros.z = nil
        v63.traverse(v253.aa, function(a1_1371)
            a1_1371:set_visible(false)
        end)
        v253.aa.angles.yaw[2]:depend({ v253.aa.angles.yaw[1], 1 })
        v253.aa.angles.pitch[2]:depend({ v253.aa.angles.pitch[1], 1 })
        v253.aa.angles.jitter[1]:depend({ v253.aa.angles.yaw[1], 1 })
        v253.aa.angles.jitter[2]:depend({ v253.aa.angles.jitter[1], 1 })
        v253.aa.angles.body[2]:depend({ v253.aa.angles.body[1], 1 })
        v253.aa.angles.fs_body:depend({ v253.aa.angles.body[1], 1 })
        for iter_155_4, iter_155_5 in next, v253.aa.other do
            if (iter_155_4 ~= "legs") then
                iter_155_5:depend({ v285.selector, "Settings" })
                if iter_155_5.hotkey then
                    iter_155_5.hotkey:depend({ v285.selector, "Settings" })
                end
            end
        end
        v109.shutdown:set(function()
            v63.traverse(v253.aa, function(a1_1373)
                a1_1373:set_visible(true)
            end)
        end)
        local v308
        v63.traverse(v285.home, function(a1_1375)
            a1_1375:depend({ v285.selector, "Home" })
        end)
        v63.traverse(v285.servers, function(a1_1377)
            a1_1377:depend({ v285.selector, "Servers" })
        end)
        local v309 = { "Features", "Features", "Visual" }
        for iter_155_6, iter_155_7 in next, v285.settings do
            iter_155_7:depend({ v285.selector, "Settings" })
        end
        v63.traverse({ v284.misc, v284.rage, v284.visuals }, function(a1_1379, a1_1381)
            a1_1379:depend({ v285.selector, "Settings" }, { v285.settings.tab, v309[a1_1381[1]] })
        end)
        v309 = { def = "Defensive", general = "General", state = "Builder", snaps = "Defensive", builder = "Builder" }
        v63.traverse(v284.antiaim, function(a1_1383, a1_1385)
            local v310 = v309[a1_1385[1]]
            a1_1383:depend({ v285.selector, "Anti-aim" }, (((a1_1385[1] ~= "on") and { v284.antiaim.on, true }) or nil), (v310 and { v284.antiaim.tab, v310 }))
        end)
        v309 = nil
        v284.visuals.accent:set_callback(function(a1_1387)
            local v311, v312, v313 = unpack(a1_1387.value)
            local v314 = v116.rgb(v311, v312, v313, 255)
            v109.accent_recolor:fire(v314, v144.hexs, v144.hex)
            v144.accent = v314
            v144.hexs = v50.format("\a%02X%02X%02X", v311, v312, v313)
            v144.hex = (v144.hexs .. "FF")
        end, true)
        v284.visuals.dpi:set_callback(function(a1_1389)
            v150.dpi_t.scalable = a1_1389.value
            v150.dpi_t.callback()
        end, true)
        local v315 = {}
        for iter_155_8 in v50.gmatch("hysteria", ".[\x80-\xBF]*") do
            v315[(#v315 + 1)] = { n = 0, d = false, w = iter_155_8, p = { 0 } }
        end
        local v316 = false
        v109.paint_ui:set(function()
            if not v63.menu_open then
                if v316 then
                    collectgarbage()
                    v316 = false
                end
                return
            end
            v316 = true
            if ((v56.frametime() % 2) == 0) then
                return
            end
            local v317 = v56.realtime()
            local v318 = {}
            local v319 = v116(unpack(v253.misc.settings.accent.value))
            local v320 = v116.rgb(205, 205, 205, 80)
            for iter_197_0 = 1, #v315, 1 do
                local v321 = v315[iter_197_0]
                if (v317 >= v321.n) then
                    v321.d = not v321.d
                    v321.n = (v317 + v52.random_float(1, 3))
                end
                local v322 = v182.condition(v321.p, v321.d, -1)
                local v323 = v320:lerp(v319, v49.min((v322 + 0.5), 1))
                v318[(#v318 + 1)] = v50.format("\a%02x%02x%02x%02x%s", v323.r, v323.g, v323.b, ((200 * v322) + 55), v321.w)
            end
            if (v97 > 1) then
                v318[(#v318 + 1)] = v50.format("\f<silent> — %s", var_0_1.build)
            end
            v285.title:set(v48.concat(v318))
        end)
    end)()
    local v324
    LPH_NO_VIRTUALIZE(function()
        v324 = {
        default = "hysteria::GS::KG15IHByZXNldClbYWRtaW5de4WkZHJhZ4ioc3BlY2xpc3SCoXnNE4iheM0LZKZhcnJvd3OCoXnNE2KheM0Sfqljcm9zc2hhaXKCoXnNFLCheM0TC6hzbG93ZG93boKhec0NvqF4zRJPp2tleWxpc3SCoXnNE4iheM0LZKZkYW1hZ2WCoXnNE62heM0TnKl3YXRlcm1hcmuDoXnMuaF4zSa2oWECpGxvZ3OCoXnNHBGheM0Qeqd2aXN1YWxzjKNkcGnCpWNoZWFww6Zhc3BlY3SCpXJhdGlvzIWib27Cpm1hcmtlcsOoc3BlY2xpc3TCpmFycm93c8Ona2V5bGlzdMKoc2xvd2Rvd27DpmFjY2VudKkjNzRBNkE5RkamZGFtYWdlw6V3YXRlcoOkaGlkZcKkbmFtZaCib27DqWNyb3NzaGFpcoOkbG9nb8Olc3R5bGWnQ2xhc3NpY6JvbsOkbWlzY4WmZmlsdGVyw6ZsYWRkZXLCp2NsYW50YWfCp2JyZWFrZXKEpHNsaWHCpXBpdGNowqJvbsKkbGVnc6ROb25lpGxvZ3ODpmV2ZW50c5WtUmFnZWJvdCBzaG90c69IYXJtaW5nIGVuZW1pZXOuR2V0dGluZyBoYXJtZWStQW50aS1haW0gaW5mb6Fz113Zpm91dHB1dJOnQ29uc29sZaZTY3JlZW6hfqJvbsOnYW50aWFpbYWnYnVpbGRlcomlc25lYWuGo2Rlc4ShcjyhasKhbDyib27Co21vZIOjZGVnAKR3YXlzA6JvbqNPZmajb2ZmAKVkZWxheQGjYWRkg6FyAKFsAKJvbsKob3ZlcnJpZGXCp2Zha2VsYWeGo2Rlc4ShcjyhasKhbDyib27Co21vZIOjZGVnAKR3YXlzA6JvbqNPZmajb2ZmAKVkZWxheQGjYWRkg6FyAKFsAKJvbsKob3ZlcnJpZGXCpHdhbGuGo2Rlc4Shch6hasOhbB6ib27Do21vZIOjZGVnDqR3YXlzA6JvbqZSYW5kb22jb2ZmAKVkZWxheQijYWRkg6FyGaFs5KJvbsOob3ZlcnJpZGXDo2FpcoajZGVzhKFyHqFqw6FsHqJvbsOjbW9kg6NkZWcdpHdheXMDom9upkppdHRlcqNvZmYHpWRlbGF5AqNhZGSDoXIAoWwAom9uwqhvdmVycmlkZcOkYWlyY4ajZGVzhKFyPKFqw6FsPKJvbsOjbW9kg6NkZWchpHdheXMDom9upkppdHRlcqNvZmYHpWRlbGF5AaNhZGSDoXIooWznom9uwqhvdmVycmlkZcOlc3RhbmSGo2Rlc4ShcjyhasOhbDyib27Do21vZIOjZGVnAKR3YXlzA6JvbqNPZmajb2ZmAKVkZWxheQGjYWRkg6FyAKFsAKJvbsKob3ZlcnJpZGXDpmNyb3VjaIajZGVzhKFyPKFqwqFsPKJvbsKjbW9kg6NkZWcApHdheXMDom9uo09mZqNvZmYApWRlbGF5AaNhZGSDoXIAoWwAom9uwqhvdmVycmlkZcKjcnVuhqNkZXOEoXI8oWrDoWw8om9uw6Ntb2SDo2RlZyGkd2F5cwOib26mSml0dGVyo29mZgalZGVsYXkBo2FkZIOhcgChbACib27CqG92ZXJyaWRlw6dkZWZhdWx0haNkZXOEoXIeoWrDoWweom9uw6Ntb2SDo2RlZx2kd2F5cwOib26mSml0dGVyo29mZgelZGVsYXkCo2FkZIOhcgChbACib27CpXNuYXBzhqRwZWVrhaVwaXRjaIWkYW5nMtCno2FuZ9Cnom9uwqRtb2RlplN0YXRpY6VzcGVlZBSkdGltZQ2ic2TCom9upkN1c3RvbaN5YXeFpWRlbGF5AKNhbmfMtKJvbsKkbW9kZaM5MHelc3BlZWQUo2FpcoWlcGl0Y2iFpGFuZzIAo2FuZ9Cnom9uw6Rtb2RlrVJhbmRvbSBTdGF0aWOlc3BlZWQUpHRpbWUNonNkwqJvbqZDdXN0b22jeWF3haVkZWxheQCjYW5nzPCib27DpG1vZGWtUmFuZG9tIFN0YXRpY6VzcGVlZAqkYWlyY4WlcGl0Y2iFpGFuZzIto2FuZwCib27DpG1vZGWmU3RhdGljpXNwZWVkFKR0aW1lDaJzZMKib26mQ3VzdG9to3lhd4WlZGVsYXkAo2FuZ80BaKJvbsOkbW9kZaRTcGlupXNwZWVkCqZjcm91Y2iFpXBpdGNohaRhbmcy0KejYW5n0Keib27DpG1vZGWmU3RhdGljpXNwZWVkFKR0aW1lDaJzZMOib26mQ3VzdG9to3lhd4WlZGVsYXkAo2FuZ8y0om9uw6Rtb2RlplN0YXRpY6VzcGVlZBSlc25lYWuFpXBpdGNohaRhbmcy0KejYW5n0Keib27CpG1vZGWmU3RhdGljpXNwZWVkFKR0aW1lDaJzZMKib26nRGVmYXVsdKN5YXeFpWRlbGF5AKNhbmfMtKJvbsKkbW9kZaZTdGF0aWOlc3BlZWQUp2RlZmF1bHSFpXBpdGNohaRhbmcy0KejYW5n0Keib27CpG1vZGWmU3RhdGljpXNwZWVkFKR0aW1lDaJzZMKib26mQ3VzdG9to3lhd4WlZGVsYXkAo2FuZ8y0om9uwqRtb2RlplN0YXRpY6VzcGVlZBSnZ2VuZXJhbIqjdXNlw6ZpbnZlcnSTAQChfqJmbIOlbGltaXQOpG1vZGWnRHluYW1pY6JvbsOkaGVhZIGib27Dpm1hbnVhbIWlcmlnaHSTAQChfqRsZWZ0kwEAoX6lcmVzZXSTAQChfqJvbsKmc3RhdGljwqRlZGdlkwEAoX6lam1vdmXDomZzg6Rvbl9okwEAoX6ib27CpnN0YXRpY8Kkc3RhYsOoaW1wbGljaXTCom9uw6NkZWaCpHNuYXCDom9zwqRvbl9okwAAoX6ib27DqHRyaWdnZXJzlKdKdW1waW5nqUNyb3VjaGluZ61XZWFwb24gY2hhbmdloX6kcmFnZYWocmVjaGFyZ2XDqGV4c3dpdGNogqVhbGxvd5GhfqJvbsKodGVsZXBvcnSEpG9uX2iTAQChfqZwaXN0b2zCom9uwqRsYW5kwqdwZWVrZml4wqhyZXNvbHZlcsJ9",
        name = "",
        selected = 0,
        badge = v63.format("\v•\r "),
        list = {},
    }
        local v325 = v285.home.config
        v325.save:depend(true, { v325.list, 0, true })
        v325.export:depend(true, { v325.list, 0, true })
        v325.delete:depend({ v325.list, 0, true })
        v325.deleteb:depend({ v325.list, 0 })
        v325.deleteb:depend(true, { v325.list, 0, true })
        local v326 = {
                eval = (function(a1_1391, a1_1393)
        if not a1_1391 then
            return "\fConfig not found."
        end
        local v327, v328, v329 = v50.match(a1_1391, "^hysteria::(%a+)::([%w%+%/]+)(_*)")
        if (v327 ~= "GS") then
            return "\fNot for gamesense"
        end
        local v330
        v330 = ((v329 and v50.rep("=", #v329)) or "")
        local v331 = v50.gsub(v328, "z%d%d%dZ", { z113Z = "+", z143Z = "/" })
        local v332 = v66.decode((v331 .. v330))
        local v333, v334, v335 = v50.match(v332, "^%((.*)%)%[(.*)%]%{(.+)%}")
        return v333, v334, ((((a1_1393 ~= true) and (v335 ~= nil)) and v67.unpack(v335)) or {})
    end)
            }
        function v326.save(a1_1395, a1_1397)
            if (a1_1395 == "Default") then
                return "\fCan't overwrite Default"
            end
            a1_1395 = tostring(a1_1395)
            local v336
            local v337
            if (a1_1397 == true) then
                local v338
                v338, v337 = v326.eval(version_key.configs[a1_1395], true)
            end
            local v339 = v324.system:save()
            local v340 = v50.format("(%s)[%s]{%s}", a1_1395, (v337 or var_0_1.user), v67.pack(v339))
            local v341 = v50.gsub(v66.encode(v340), "[%+%/%=]", { ["="] = "_", ["/"] = "z143Z", ["+"] = "z113Z" })
            local v342 = v50.format("hysteria::GS::%s", v341)
            version_key.configs[a1_1395] = v342
            return ("\a" .. (a1_1395 .. " saved"))
        end
        function v326.create(a1_1399)
            if (a1_1399 == "") then
                return "\fEnter the name"
            elseif (a1_1399 == "Default") then
                return "\fCan't overwrite Default"
            elseif (#a1_1399 > 24) then
                return "\fThis name is too long"
            elseif version_key.configs[a1_1399] then
                return ("\f" .. (a1_1399 .. " is in the list"))
            end
            return v326.save(a1_1399, true)
        end
        function v326.delete(a1_1401)
            version_key.configs[a1_1401] = nil
        end
        function v326.export(a1_1403)
            if (not a1_1403 or (a1_1403 == "")) then
                return "\fNot selected"
            end
            get_set.set(version_key.configs[a1_1403])
            return "\aCopied to clipboard."
        end
        function v326.import()
            local v343 = get_set.get()
            if not v343 then
                return "\fEmpty clipboard"
            end
            local v344, v345, v346 = v326.eval(v343, true)
            if not v345 then
                return v344
            end
            local v347 = v343:match("^hysteria::%a+::[%w%+%/]+_*")
            if (v344 == "Default") then
                return "\fCan't import default config"
            end
            version_key.configs[v344] = v347
            return ("\a" .. (v344 .. (" by " .. (v345 .. " added"))))
        end
        function v326.load(a1_1405, ...)
            if (not a1_1405 or (a1_1405 == "")) then
                return "ERR: can't load: not selected"
            end
            local v348 = (((a1_1405 == "Default") and v324.default) or version_key.configs[a1_1405])
            local v349, v350, v351 = v326.eval(v348)
            if (not v350 or not v351) then
                return v349
            end
            if (({ ... })[1] == "antiaim") then
                v351.antiaim.general.manual = nil
                v351.antiaim.general.edge = nil
                v351.antiaim.general.fs.on_h = nil
            end
            v324.system:load(v351, ...)
            if ... then
                return
            end
            v324.loaded = a1_1405
        end
        local v352
        v325.list_report:depend({ v325.list_report, 0 })
        local v353 = 0
        local v354 = false
        local function fn32()
            if (v353 < v56.realtime()) then
                v325.list_report:set_visible(false)
                v325.selected:set_visible(true)
                v109.paint_ui:unset(fn32)
                v354 = false
            end
        end
        local function fn33(a1_1407)
            if not a1_1407 then
                return
            end
            v353 = (v56.realtime() + 1)
            local v355 = a1_1407:gsub("[\f\a]", { ["\f"] = "\aFF4040FF", ["\a"] = "\aB6DE47FF" })
            v325.list_report:set(v355)
            if not v354 then
                v325.list_report:set_visible(true)
                v325.selected:set_visible(false)
                v109.paint_ui:set(fn32)
                v354 = true
            end
        end
        local function fn34(a1_1409)
            if (a1_1409 ~= true) then
                v324.list = {}
                for iter_208_0 in next, version_key.configs do
                    v324.list[(#v324.list + 1)] = iter_208_0
                end
                v48.sort(v324.list)
                v48.insert(v324.list, 1, "Default")
                local v356 = v48.find(v324.list, v324.loaded)
                if v356 then
                    v324.list[v356] = (v324.badge .. v324.list[v356])
                else
                    v324.loaded = 0
                end
                v325.list:update(v324.list)
            end
            v324.selected = (v325.list.value + 1)
            v324.name = v50.gsub((v324.list[v324.selected] or ""), "^\a%x%x%x%x%x%x%x%x•\a%x%x%x%x%x%x%x%x ", "")
            v325.selected:set((v63.format("Selected: \v") .. v324.name))
            v325.list:set((v324.selected - 1))
        end
        local function fn35(a1_1411, ...)
            local v357, v358, v359, v360 = pcall(v326[a1_1411], ...)
            fn7(a1_1411, ": ", v357, ", ", v358, ", ", v359, ", ", v360)
            fn33((v359 or v358))
            fn34()
        end
        fn34()
        v325.list:set_callback(function()
            fn34(true)
        end)
        v325.create:set_callback(function()
            fn35("create", v325.name:get())
        end)
        v325.import:set_callback(function()
            fn35("import", v325.name:get())
        end)
        v325.load:set_callback(function()
            fn35("load", v324.name)
        end)
        v325.loadaa:set_callback(function()
            fn35("load", v324.name, "antiaim")
        end)
        v325.save:set_callback(function()
            fn35("save", v324.name)
        end)
        v325.delete:set_callback(function()
            fn35("delete", v324.name)
        end)
        v325.export:set_callback(function()
            fn35("export", v324.name)
        end)
    end)()
    local v361 = var_0_1.user
    local v362 = ((v98 and "skeet-bliss") or "skeet")
    local function fn36(a1_1413)
        local v363 = {}
        local v364 = { v50.byte(a1_1413, 1, #a1_1413) }
        for iter_218_0, iter_218_1 in ipairs(v364) do
            v363[iter_218_0] = v50.format("%x", iter_218_1)
        end
        local v365 = v50.gsub(v48.concat(v363), "[64]", { ["6"] = "a7", ["4"] = "9r" })
        while (#v365 < 16) do
            v365 = (v365 .. v365)
        end
        return v50.sub(v365, 1, 16)
    end
    v51.set_callback(v285.home.verify.auth.ref, function()
        v285.home.verify.auth:set_enabled(false)
        local v366 = fn36((v361 .. v362))
        v64.get("https://backend.hysteria.one/keygen", {
        headers = {
        ["hst-uname"] = v361,
        ["hst-cheat"] = v362,
        UserAgent = ("ltcp_debug" .. (".." .. ("|" .. (".." .. v366)))),
    },
    }, function(a1_1415, a1_1417)
            fn7(a1_1415, ": ", (a1_1417 and a1_1417.body))
            if not a1_1415 then
                fn16("Something went wrong. Try again later.")
                return
            end
            local v367, v368 = pcall(json.parse, a1_1417.body)
            if not v367 then
                fn16("Something went wrong. Try again later.")
                return
            end
            if (v368.is_connected == "yes") then
                get_set.set("You have already linked your discord")
                fn16("You have already linked your discord")
            else
                get_set.set(v368.status)
            end
        end)
    end)
    local v369
    LPH_JIT_MAX(function()
        local v370
        local v371 = {}
        local v372 = { counter = 0, send_packet = false, sent = 0, state = 1, switch = false }
        local v373 = { yaw = 0, pitch = 89, mod = 0, des = 0 }
        local v374 = {}
        local v375 = {
        pitch = v253.aa.angles.pitch[2],
        base = v253.aa.angles.base,
        yaw = v253.aa.angles.yaw[2],
        body = v253.aa.angles.body[2],
        pitch_mode = v253.aa.angles.pitch[1],
        yaw_mode = v253.aa.angles.yaw[1],
        jitter_mode = v253.aa.angles.jitter[1],
        jitter = v253.aa.angles.jitter[2],
        body_mode = v253.aa.angles.body[1],
    }
        local v376
        local function fn37()
            if v257.on_ground then
                if (v257.duck_amount > 0) then
                    return (((v257.velocity > 5) and v254.states.sneak) or v254.states.crouch)
                end
                if (v257.velocity > 5) then
                    return (((v370.in_speed == 1) and v254.states.walk) or v254.states.run)
                end
                return v254.states.stand
            else
                return (((v257.duck_amount > 0) and v254.states.airc) or v254.states.air)
            end
        end
        local function fn38()
            local v377
            local v378 = 0
            local v379 = v372.state
            if (v378 == 0) then
                v377 = builder_snap.builder.custom
            else
                v377 = builder_snap.builder[v378]
            end
            if (v377.fakelag.override and (v257.exploit.active == v254.exploit.OFF)) then
                v379 = v254.states.fakelag
            elseif (not v377.airc.override and (v379 == v254.states.airc)) then
                v379 = v254.states.air
            elseif (not v377.sneak.override and (v379 == v254.states.sneak)) then
                v379 = v254.states.crouch
            end
            v379 = ((v377[states_snaps.states[v379][1]].override and v379) or v254.states.default)
            v371 = { [0] = v377, cur = v377[states_snaps.states[v379][1]] }
        end
        local function fn39()
            v371.snap = nil
            if not v51.is_active(v284.antiaim.def.snap.on) then
                return
            end
            if ((v257.exploit.active == v254.exploit.OS) and not v284.antiaim.def.snap.os.value) then
                return
            end
            local v380
            local v381 = 0
            local v382 = v254.snaps.default
            if (v381 == 0) then
                v380 = builder_snap.snap.custom
            else
                v380 = builder_snap.snap[v381]
            end
            if (((v380.airc.on ~= "Default") and v257.jumping) and v257.crouching) then
                v382 = v254.snaps.airc
            elseif ((v380.air.on ~= "Default") and v257.jumping) then
                v382 = v254.snaps.air
            elseif ((((v380.sneak.on ~= "Default") and v257.on_ground) and v257.crouching) and (v257.velocity > 5)) then
                v382 = v254.snaps.sneak
            elseif (((v380.crouch.on ~= "Default") and v257.on_ground) and v257.crouching) then
                v382 = v254.snaps.crouch
            elseif (((v380.peek.on ~= "Default") and v257.on_ground) and v257.peeking) then
                v382 = v254.snaps.peek
            end
            local v383 = v380[states_snaps.snaps[v382][1]]
            if (v383.on == "Off") then
                return
            end
            v382 = (((v383.on == "Custom") and v382) or v254.snaps.default)
            local v384 = v380[states_snaps.snaps[v382][1]]
            if (v384 and (v384.on ~= "Off")) then
                v371.snap = v384
            end
        end
        local v385 = 0
        local v386 = 0
        v109.player_hurt:set(function(a1_1419)
            if (v52.userid_to_entindex(a1_1419.userid) == v257.self) then
                v386 = v56.tickcount()
            end
        end)
        v109.bullet_impact:set(function(a1_1421)
            if (not v257.valid or (v385 == v56.tickcount())) then
                return
            end
            local v387 = v52.userid_to_entindex(a1_1421.userid)
            if ((not v387 or not v54.is_enemy(v387)) or v54.is_dormant(v387)) then
                return
            end
            local v388 = v69(a1_1421.x, a1_1421.y, a1_1421.z)
            local v389 = v69(v54.get_origin(v387))
            v389.z = (v389.z + 64)
            local v390 = {}
            for iter_226_0 = 1, #v258, 1 do
                local v391 = v258[iter_226_0]
                if not v54.is_enemy(v391) then
                    local v392 = v69(v54.hitbox_position(v391, 0))
                    local v393 = v49.closest_ray_point(v392, v389, v388)
                    v390[(((v391 == v257.self) and 0) or (#v390 + 1))] = v392:dist(v393)
                end
            end
            if ((v390[0] and ((#v390 == 0) or (v390[0] < v49.min(unpack(v390))))) and (v390[0] < 80)) then
                v52.delay_call(totime(1), function()
                v109.enemy_shot:fire({ damaged = (v385 == v386), dist = v390[0], attacker = v387, userid = a1_1421.userid })
            end)
                v385 = v56.tickcount()
            end
        end)
        local function fn40()
            v372.resort = (v284.antiaim.general.resort and v284.antiaim.general.resort.value)
            v372.send_packet = (v370.chokedcommands == 0)
            v372.state = fn37()
            fn38()
            fn39()
        end
        local v394
        local v395 = {
                angles = {
                    manual_buttons = {
    {
    "left",
                            yaw = -90,
                            item = v284.antiaim.general.manual.left
                        },
    {
    "right",
                            yaw = 90,
                            item = v284.antiaim.general.manual.right
                        },
    {
    "reset",
                            item = v284.antiaim.general.manual.reset
                        }
                    },
                    manual = (function(a1_1423)
        if not v284.antiaim.general.manual.on.value then
            return
        end
        for iter_229_0, iter_229_1 in ipairs(a1_1423.manual_buttons) do
            local v396, v397 = iter_229_1.item:get()
            if (iter_229_1.active == nil) then
                iter_229_1.active = v396
            end
            if (iter_229_1.active == v396) then
            else
                iter_229_1.active = v396
                if (iter_229_1.yaw == nil) then
                    a1_1423.manual_current = nil
                end
                if (v397 == 1) then
                    a1_1423.manual_current = ((v396 and iter_229_0) or nil)
                elseif (v397 == 2) then
                    a1_1423.manual_current = (((a1_1423.manual_current ~= iter_229_0) and iter_229_0) or nil)
                end
            end
        end
        local v398 = (((a1_1423.manual_current ~= nil) and a1_1423.manual_buttons[a1_1423.manual_current].yaw) or nil)
        return (((type(v398) == "number") and v398) or nil)
    end),
                    work = (function(a1_1425)
        local v399 = 88.94
        local v400 = 0
        v372.camera_ang = { v52.camera_angles() }
        local v401 = v372.camera_ang[2]
        if v257.threat then
            local v402 = v69(v54.get_origin(v257.threat))
            v372.threat_ang = { v49.angle_to(v257.origin, v402) }
            v372.threat_dist = v49.sqrt3(((v257.origin - v402)):unpack())
            v401 = v372.threat_ang[2]
        else
            v372.threat_ang, v372.threat_dist = nil
        end
        local v403 = (v401 - 180)
        local v404 = a1_1425:manual()
        local v405 = v284.antiaim.general.edge:get()
        local v406 = ((not v405 and not v404) and v51.is_active(v284.antiaim.general.fs.on))
        v253.aa.angles.freestand:override(v406)
        v253.aa.angles.edge:override(v405)
        if v404 then
            v403 = (v372.camera_ang[2] - v404)
            if v284.antiaim.general.manual.static.value then
                local v407 = 120
                v374.no_modifier, v374.force_desync = true, (((v404 > 0) and -v407) or v407)
            end
        end
        if v405 then
            v374.force_implicit = true
        elseif v406 then
            v374.force_implicit = true
            if v284.antiaim.general.fs.static.value then
                v374.no_modifier, v374.force_desync = true, 120
            end
        end
        v372.manual_yaw, v372.edge_yaw, v372.freestanding = v404, v405, v406
        v373.yaw, v373.pitch = v403, v399
    end)
                },
                modifier = {
                    skitter_sequence = {
    -1,
    1,
    0,
    -1,
    1,
    0,
    -1,
    0,
    1,
    -1,
    0,
    1
                    },
                    Jitter = (function(a1_1427)
        return ((v372.switch and a1_1427.deg) or -a1_1427.deg)
    end),
                    Ways = (function(a1_1429)
        local v408 = ((v372.counter % a1_1429.ways) / (a1_1429.ways - 1))
        return v49.lerp(-a1_1429.deg, a1_1429.deg, (((side == -1) and (1 - v408)) or v408))
    end),
                    ["Skitter Old"] = (function(a1_1431, a1_1433)
        local v409 = (v372.counter % ((a1_1431.ways * 2) - 2))
        if (v409 >= a1_1431.ways) then
            v409 = ((a1_1431.ways + 1) - v409)
        end
        local v410 = (v409 / (a1_1431.ways - 1))
        local v411 = v49.lerp(-a1_1431.deg, a1_1431.deg, (((v409 < 0) and (1 + v410)) or v410))
        if v371.cur.des.on then
            local v412 = v49.lerp(-v371.cur.des.r, v371.cur.des.l, (((side == -1) and (1 - v410)) or v410))
            v374.force_desync = v412
        end
        return v411
    end),
                    Skitter = (function(a1_1435, a1_1437)
        local v413 = v49.cycle(v372.counter, #a1_1437.skitter_sequence)
        local v414 = a1_1437.skitter_sequence[v413]
        local v415 = (v414 * a1_1435.deg)
        local v416 = v371.cur.des
        if (v416.on and v416.j) then
            v374.force_desync = ((((v414 > 0) and v416.l) or ((v414 < 0) and -v416.r)) or ((v414 == 0) and 0))
        end
        return v415
    end),
                    Rotate = (function(a1_1439)
        return v49.lerp(-a1_1439.deg, a1_1439.deg, ((v56.curtime() * 4) % 1))
    end),
                    Random = (function(a1_1441)
        return v52.random_int(-a1_1441.deg, a1_1441.deg)
    end),
                    work = (function(a1_1443)
        v373.mod = 0
        local v417 = v371.cur.mod
        if (v417.type ~= "Off") then
            v373.mod = a1_1443[v417.type](v417, a1_1443)
        end
        if not v374.no_offset then
            v373.mod = (v373.mod + v371.cur.off)
        end
    end)
                },
                desync = {
                    work = (function(a1_1445)
        v373.des = nil
        local v418 = v371.cur.des
        if not v418.on then
            return
        end
        if v418.j then
            v373.des = ((v418.on and ((v372.switch and v418.r) or -v418.l)) or nil)
        else
            v373.des = ((v418.on and ((v284.antiaim.general.invert:get() and v418.r) or -v418.l)) or nil)
        end
    end)
                },
                defensive = {
                    urgent = false,
                    ticks = 0,
                    prev_des = 0,
                    counter = 0,
                    pitch = {
                        Static = (function(a1_1447, a1_1449)
        return a1_1449.ang
    end),
                        Jitter = (function(a1_1451, a1_1453)
        return ((v372.switch and a1_1453.ang) or a1_1453.ang2)
    end),
                        Random = (function(a1_1455, a1_1457)
        return v52.random_int(a1_1457.ang, a1_1457.ang2)
    end),
                        ["Random Static"] = (function(a1_1459, a1_1461)
        if not a1_1459.once.srx then
            a1_1459.once.srx = v52.random_int(a1_1461.ang, a1_1461.ang2)
        end
        return a1_1459.once.srx
    end),
                        Spin = (function(a1_1463, a1_1465)
        return v49.lerp(a1_1465.ang, a1_1465.ang2, (((v56.curtime() * a1_1465.speed) * 0.1) % 1))
    end),
                        Camera = (function(a1_1467, a1_1469)
        return (a1_1469.ang + ((v372.camera_ang and v372.camera_ang[1]) or 0))
    end),
                        ["At target"] = (function(a1_1471, a1_1473)
        return (a1_1473.ang + ((v372.threat_ang and v372.threat_ang[1]) or 0))
    end)
                    },
                    yaw = {
                        Static = (function(a1_1475, a1_1477)
        return (360 - a1_1477.ang)
    end),
                        Jitter = (function(a1_1479, a1_1481)
        return (180 + (a1_1481.ang * ((a1_1479.once.switch and 0.5) or -0.5)))
    end),
                        Random = (function(a1_1483, a1_1485)
        return (180 + v52.random_int((a1_1485.ang * -0.5), (a1_1485.ang * 0.5)))
    end),
                        ["Random Jitter"] = (function(a1_1487, a1_1489)
        local v419 = (((v49.random(0, 1) == 0) and 1) or -1)
        local v420 = v49.random((a1_1489.ang * -0.25), (a1_1489.ang * 0.25))
        return ((v419 * 90) + v420)
    end),
                        ["Random Static"] = (function(a1_1491, a1_1493)
        if not a1_1491.once.sry then
            a1_1491.once.sry = v49.random((a1_1493.ang * -0.5), (a1_1493.ang * 0.5))
        end
        return (180 + a1_1491.once.sry)
    end),
                        Spin = (function(a1_1495, a1_1497)
        return (180 + v49.lerp((a1_1497.ang * -0.5), (a1_1497.ang * 0.5), ((v56.curtime() * (a1_1497.speed * 0.1)) % 1))), true
    end),
                        ["Spin Jitter"] = (function(a1_1499, a1_1501)
        local v421 = ((a1_1499.once.switch and 1) or -1)
        local v422 = v49.lerp((a1_1501.ang * -0.5), (a1_1501.ang * 0.5), ((v56.curtime() * (a1_1501.speed * 0.1)) % 1))
        return ((v421 * 90) + v422)
    end),
                        ["90w"] = (function(a1_1503, a1_1505)
        local v423 = ((((a1_1503.counter % 2) == 0) and 1) or -1)
        local v424 = v49.lerp((a1_1505.ang * -0.5), (a1_1505.ang * 0.5), ((((v257.exploit.lc_left / v371.snap.time) * a1_1505.speed) * 0.05) % 1))
        return ((v423 * 90) + v424), true
    end),
                        ["180v"] = (function(a1_1507, a1_1509)
        local v425 = ((v49.sin((v56.curtime() * (a1_1509.speed * 0.2))) * 0.5) + 0.5)
        return (180 + v49.lerp((a1_1509.ang * -0.5), (a1_1509.ang * 0.5), v425)), true
    end),
                        Camera = (function(a1_1511, a1_1513)
        return (((((v372.camera_ang and v372.camera_ang[2]) or 0) - v373.yaw) - a1_1513.ang) + 180)
    end),
                        ["At target"] = (function(a1_1515, a1_1517)
        local v426 = (v372.threat_ang or v372.camera_ang)
        return (((((v426 and v426[2]) or 0) - v373.yaw) - a1_1517.ang) + 180)
    end),
                        Opposite = (function(a1_1519, a1_1521)
        return (180 - v373.mod)
    end)
                    },
                    once = {
                    },
                    snap = (function(a1_1523)
        local v427 = v371.snap
        local v428 = (((((v427 ~= nil) and v257.exploit.active) and (v257.exploit.lc_left > ((v374.force_implicit and 1) or 0))) and not v372.use_aa) and not v372.manual_yaw)
        if (((a1_1523.might_cross and not v372.send_packet) and not v257.exploit.active) and (v257.exploit.lc_left > 0)) then
            v374.force_send, v374.no_modifier, v374.no_offset = true, true, true
            a1_1523.might_cross = false
        end
        if v428 then
            a1_1523.ticks = (a1_1523.ticks + 1)
            v428 = (v427.time >= a1_1523.ticks)
        else
            a1_1523.ticks = 0
        end
        v372.will_break_lc = (v257.exploit.active and ((v257.exploit.active == v254.exploit.OS) or v370.force_defensive))
        if v428 then
            if ((v427.x.on or v427.y.on) and (not v372.snapping or (v257.exploit.lc_left <= 2))) then
                v374.force_send = true
            end
            v372.snapping, v373.snap = true, {}
            a1_1523.once.apex = (a1_1523.once.apex or v257.exploit.lc_left)
            a1_1523.once.delayed = (a1_1523.once.delayed or 0)
            if (a1_1523.once.delayed >= (v427.y.delay + 1)) then
                a1_1523.once.switch = not a1_1523.once.switch
                a1_1523.once.delayed = 0
            elseif v372.send_packet then
                a1_1523.once.delayed = (a1_1523.once.delayed + 1)
            end
            if v427.x.on then
                local v429 = a1_1523.pitch[v427.x.mode](a1_1523, v427.x)
                if v429 then
                    v373.snap[1] = v429
                    a1_1523.might_cross = true
                end
            end
            if v427.y.on then
                local v430, v431 = a1_1523.yaw[v427.y.mode](a1_1523, v427.y)
                if v430 then
                    v373.snap[2] = (v373.yaw + v430)
                    if v427.sd then
                        v373.des = (((v430 < 180) and 60) or -60)
                        a1_1523.prev_des = v373.des
                    end
                    a1_1523.might_cross = true
                end
                if v431 then
                    v374.force_send = true
                end
            end
        elseif v372.snapping then
            a1_1523.counter = (a1_1523.counter + 1)
            v372.snapping, v373.snap = false
            v48.clear(a1_1523.once)
            a1_1523.might_cross = false
        end
    end),
                    lc = (function(a1_1525)
        local v432 = v284.antiaim.def.triggers
        return ((((v370.weaponselect ~= 0) and v432:get("Weapon change")) or (not v257.on_ground and v432:get("Jumping"))) or ((v257.crouching and v257.on_ground) and v432:get("Crouching")))
    end),
                    work = (function(a1_1527)
        if a1_1527:lc() then
            v370.force_defensive = true
        end
        a1_1527:snap()
    end)
                },
                head = {
                    smart = (function()
        local v433, v434, v435 = v54.hitbox_position(v257.self, 0)
        local v436, v437, v438 = v54.get_origin(v257.threat)
        if not v438 then
            return
        end
        local v439 = ((v435 - (v438 + 68)) / v372.threat_dist)
        local v440 = 0
        local v441 = 0.75
        local v442 = false
        if (v257.on_ground and not v257.crouching) then
            v440, v441 = 0.25, 0.5, true
        elseif (v257.on_ground and v257.crouching) then
            v440, v441 = -0.05, 0.3, true
        elseif (v372.state == v254.states.air) then
            v440, v441 = 0.35, 0.75
        elseif (v372.state == v254.states.airc) then
            if (v257.weapon_t and (v257.weapon_t.type == "knife")) then
                v440, v441 = -0.05, 0.55
            else
                v440, v441 = 0.25, 0.75
            end
        end
        if ((v439 < v440) or (v441 < v439)) then
            return
        end
        v372.safe_head = true
        v374.no_modifier, v374.no_offset, v374.force_desync = true, true, 0
    end),
                    basic = (function()
        local v443, v444, v445 = v54.get_origin(v257.threat)
        if not v445 then
            return
        end
        local v446 = v372.threat_dist
        local v447 = (v257.origin.z - v445)
        local v448, v449, v450 = v52.eye_position()
        local v451 = (v257.weapon_t and (v257.weapon_t.weapon_type_int == 0))
        if ((v257.jumping and v451) and (v447 > -32)) then
            v372.safe_head = true
            v374.no_modifier, v374.no_offset, v374.force_desync = true, true, 0
        end
    end),
                    work = (function(a1_1529)
        v372.safe_head = false
        if (((not v284.antiaim.general.head.on.value or not v257.threat) or v372.manual_yaw) or v372.use_aa) then
            return
        end
        a1_1529.basic()
    end)
                },
                stab = {
                    work = (function(a1_1531)
        local v452 = v372.backstab
        v372.backstab = false
        if (v284.antiaim.general.stab.value and v257.threat) then
            local v453 = v372.threat_dist
            local v454 = v68(v54.get_player_weapon(v257.threat))
            if (((v453 < 280) and v454) and (v454.type == "knife")) then
                if not v452 then
                    v370.no_choke = true
                    v374.force_send = true
                end
                v373.yaw = (v373.yaw + 180)
                v374.no_snap = true
                v372.backstab = true
            end
        end
    end)
                },
                fl = {
                    overridden = false,
                    work = (function(a1_1533)
        local v455 = v253.aa.fakelag
        local v456 = v284.antiaim.general.fl
        if v456.on.value then
            v455.enable:override(true)
            v455.amount:override(v456.mode.value)
            v455.limit:override(v456.limit.value)
            v455.variance:override(v49.clamp(((v257.velocity / 300) * 100), 0, 100))
            a1_1533.overridden = true
        elseif a1_1533.overridden then
            v455.enable:override()
            v455.amount:override()
            v455.limit:override()
            v455.variance:override()
            a1_1533.overridden = false
        end
    end)
                },
                legs = {
                    work = (function(a1_1535)
        if (v284.antiaim.general.legs.value == "Pseudo-walk") then
            local v457 = (v372.sent % 3)
            local v458 = "Off"
            if (v457 == 2) then
                v458 = "Always slide"
            elseif (v457 == 3) then
                v458 = "Never slide"
            end
            v253.aa.other.legs:override(v458)
        else
            v253.aa.other.legs:override(v284.antiaim.general.legs.value)
        end
    end)
                },
                use_aa = {
                    wait = false,
                    check = (function()
        local v459 = v54.get_prop(v257.self, "m_iTeamNum")
        local v460 = (v54.get_prop(v257.self, "m_bIsDefusing") == 1)
        local v461 = (v54.get_prop(v257.self, "m_bIsGrabbingHostage") == 1)
        if (v460 or v461) then
            return false
        end
        if ((v459 == 3) and (v370.pitch > 15)) then
            local v462 = v54.get_all("CC4")
            for iter_267_0 = 1, #v462, 1 do
                local v463, v464, v465 = v54.get_origin(v462[iter_267_0])
                if v49.sqrt3((v257.origin.x - v463), (v257.origin.y - v464), (v257.origin.z - v465)) then
                    return false
                end
            end
        end
        return true
    end),
                    work = (function(a1_1537)
        v372.use_aa = false
        if not v284.antiaim.general.use.value then
            return
        end
        if v257.using then
            v372.use_aa = true
            v374.force_implicit = false
            if (a1_1537.wait == false) then
                v370.no_choke = true
                v374.force_send = true
                v374.no_antiaim = true
                a1_1537.wait = true
            elseif (a1_1537.wait == true) then
                if a1_1537.check() then
                    v373.pitch, v373.yaw = v372.camera_ang[1], v372.camera_ang[2]
                else
                    v374.no_antiaim = true
                end
            end
        elseif a1_1537.wait then
            v370.no_choke = true
            v374.force_send = true
            v374.no_offset, v374.no_modifier = true, true
            a1_1537.wait = false
        end
    end)
                }
            }
        local v466 = {
                work = (function()
        v395.angles:work()
        v395.modifier:work()
        v395.desync:work()
        v395.defensive:work()
        v395.head:work()
        v395.stab:work()
        v395.use_aa:work()
        v395.fl:work()
        if v374.no_snap then
            v373.snap = nil
        end
        if v374.no_modifier then
            v373.mod = 0
        end
        if (v374.force_desync ~= nil) then
            v373.des = (v374.force_desync or nil)
        end
        if (((not v374.no_offset and v371.cur.add.on) and v373.des) and (v373.des ~= 0)) then
            v373.mod = (v373.mod + (((v373.des > 0) and v371.cur.add.r) or v371.cur.add.l))
        end
    end)
            }
        local v467
        local direct_implicit = {
                direct = {
                    yaw = 0,
                    pitch = 0,
                    previous_body = 0,
                    allowed = (function()
        if (((((v374.no_antiaim or v257.throwing_nade) or ((v370.in_attack == 1) and v257.can_shoot)) or (v257.using and not v284.antiaim.general.use.value)) or ((v257.movetype == 9) and ((v370.sidemove ~= 0) or (v370.forwardmove ~= 0)))) or (v54.get_prop(v257.gamerules, "m_bFreezePeriod") == 1)) then
            return false
        end
        return true
    end),
                    micromove = (function()
        if (not v257.on_ground or (v257.movetype == 9)) then
            return
        end
        if (((v253.misc.helper and v257.weapon_t) and (v257.weapon_t.weapon_type_int == 9)) and v51.is_active(v253.misc.helper)) then
            return
        end
        local v468 = ((((v370.in_forward == 1) or (v370.in_back == 1)) or (v370.in_moveleft == 1)) or (v370.in_moveright == 1))
        local v469 = ((((v257.duck_amount > 0) and v257.on_ground) and 3.3) or 1.1)
        if ((not v468 and (v257.velocity < 20)) and not v370.quick_stop) then
            v370.sidemove = ((((v370.command_number % 2) == 0) and v469) or -v469)
        end
    end),
                    jitter_move = (function()
        if (v257.jumping or v257.walking) then
            return
        end
        local v470 = 90
        local v471 = 0.1875
        local v472 = (((v370.command_number % 64) * v471) + v470)
        if (v472 <= 100) then
            v470 = (((v472 >= 90) and v472) or 100)
        end
        local v473 = ((v470 * 0.01) * 320)
        if (v473 <= 0) then
            return
        end
        local v474 = v49.sqrt3(v370.forwardmove, v370.sidemove)
        if ((v474 < 10) or (v474 < v473)) then
            return
        end
        v370.forwardmove = ((v370.forwardmove / v474) * v473)
        v370.sidemove = ((v370.sidemove / v474) * v473)
    end),
                    compensate = {
                        previous = 0,
                        ready = false,
                        feet = (function(a1_1539, a1_1541, a1_1543)
        local v475 = a1_1541
        local v476 = false
        if ((v49.abs(a1_1541) - v49.abs(a1_1543)) > 5) then
            local v477 = v54.get_max_desync(v257.animstate)
        end
        return v475, v476
    end)
                    },
                    work = (function(a1_1545)
        a1_1545.micromove()
        if not a1_1545.allowed() then
            return
        end
        if not v374.hybrid then
            v253.aa.angles.enable:override(false)
        end
        if v284.antiaim.general.jmove.value then
            a1_1545.jitter_move()
        end
        a1_1545.pitch = ((v373.snap and v373.snap[1]) or v373.pitch)
        if ((v372.send_packet or v374.force_send) or v374.speeding) then
            a1_1545.yaw = ((v373.snap and v373.snap[2]) or (v373.yaw + v373.mod))
        end
        v370.pitch = v49.normalize_pitch(a1_1545.pitch)
        v370.yaw = v49.normalize_yaw(a1_1545.yaw)
        if (v372.send_packet and v373.des) then
            local v478 = v49.clamp(v373.des, -60, 60)
            local v479 = ((v257.on_ground and 2) or 1)
            if v374.speeding then
                v479 = 1
            end
            v370.yaw = (v370.yaw - (v478 * v479))
            v370.allow_send_packet = false
        end
    end)
                },
                implicit = {
                    work = (function(a1_1547)
        local v480 = v49.normalize_pitch(((v373.snap and v373.snap[1]) or v373.pitch))
        local v481 = v49.normalize_yaw(((v373.snap and v373.snap[2]) or (v373.yaw + v373.mod)))
        v253.aa.angles.enable:override(true)
        v375.pitch_mode:override("Custom")
        v375.pitch:override(v480)
        if (v372.send_packet or v374.force_send) then
            v375.yaw_mode:override("Static")
            v375.yaw:override(v481)
            v375.jitter_mode:override("Off")
            v375.body_mode:override((((v373.des ~= nil) and "Static") or "Off"))
            if v373.des then
                v375.body:override(((((v373.des > 0) and 1) or ((v373.des < 0) and -1)) or 0))
            end
        end
    end)
                }
            }
        local v482
        local v483 = 0
        local function fn41(a1_1549)
            if ((a1_1549 <= v483) or (v257.exploit.active == v254.exploit.OFF)) then
                if v372.send_packet then
                    v372.counter = (((v372.counter >= 65535) and 0) or (v372.counter + 1))
                    v372.switch = ((v372.counter % 2) == 0)
                    v483 = 0
                end
            else
                v483 = (v483 + 1)
            end
        end
        local function fn42()
            if v372.send_packet then
                v372.sent = (((v372.sent >= 65535) and 0) or (v372.sent + 1))
            end
            fn41(v371.cur.delay)
            v48.clear(v374)
        end
        local v484 = {
                work = (function(a1_1551)
        v370 = a1_1551
        fn40()
        v374.force_implicit = (v284.antiaim.general.mode.value == "gamesense")
        v374.force_implicit = (v374.force_implicit or not v51.is_active(v253.rage.aimbot.enable))
        v466:work()
        if v374.force_implicit then
            direct_implicit.implicit:work()
        else
            direct_implicit.direct:work()
        end
        fn42()
    end)
            }
        v369 = {
                data = v372,
                ctx = v373,
                restore = (function()
        v253.aa.angles.enable:override()
        for iter_279_0, iter_279_1 in next, v375 do
            iter_279_1:override()
        end
    end),
                run = (function(a1_1553)
        v284.antiaim.on:set_callback(function(a1_1555)
            v109.setup_command(a1_1555.value, v484.work)
            v253.aa.angles.freestand:override(fn9(a1_1555.value, false, nil))
            v253.aa.angles.freestand.hotkey:override(((a1_1555.value and { "Always on", 0 }) or nil))
            v253.aa.angles.fs_body:override(fn9(a1_1555.value, false, nil))
            if not a1_1555.value then
                v369.restore()
            end
        end, true)
    end)
            }
        v369:run()
    end)()
    LPH_NO_VIRTUALIZE(function()
        local v485 = {}
        v485.clantag = {
                last = 0,
                enabled = false,
                list = {
    "h ⠀ ⠀⠀⠀",
    "hy ⠀ ⠀ ⠀",
    "hys ⠀⠀⠀",
    "hyst  ⠀⠀ ",
    "hyste⠀⠀",
    "hyster ⠀",
    "hysteri⠀",
    "hysteria",
    "hysteria",
    "hysteria",
    "hysteria",
    "hysteria",
    "hysteria",
    "hysteria",
    "hysteria",
    "hysteria",
    "hysteria",
    "⠀ysteria",
    "⠀ steria",
    "⠀⠀ teria",
    "⠀⠀⠀eria",
    "⠀⠀ ⠀ ria",
    "⠀ ⠀ ⠀ ia",
    "⠀ ⠀⠀⠀ a"
                },
                work = (function()
        if (v485.clantag.enabled and not v284.misc.clantag.value) then
            v485.clantag.enabled = false
            v109.net_update_end:unset(v485.clantag.work)
            v52.set_clan_tag()
        end
        local v486 = ((v49.round((v56.curtime() * 3)) % #v485.clantag.list) + 1)
        if (v486 == v485.clantag.last) then
            return
        end
        v485.clantag.last = v486
        v52.set_clan_tag(v485.clantag.list[v486])
    end),
                run = (function(a1_1557)
        v284.misc.clantag:set_callback(function(a1_1559)
            v253.misc.clantag:set_enabled(not a1_1559.value)
            if a1_1559.value then
                a1_1557.enabled = true
                v109.net_update_end:set(a1_1557.work)
                v253.misc.clantag:override(false)
            else
                v253.misc.clantag:override()
                v52.set_clan_tag()
            end
        end, true)
        defer(function()
            v253.misc.clantag:set_enabled(true)
            v253.misc.clantag:override()
            v52.set_clan_tag()
        end)
    end)
            }
        v485.ladder = {
                work = (function(a1_1561)
        if ((v257.movetype ~= 9) or (a1_1561.forwardmove == 0)) then
            v485.ladder.start = false
            return
        end
        if (v485.ladder.start == false) then
            v485.ladder.start = true
        else
            local v487, v488 = v52.camera_angles()
            local v489 = ((a1_1561.forwardmove < 0) or (v487 > 45))
            a1_1561.in_moveleft, a1_1561.in_moveright = ((v489 and 1) or 0), ((not v489 and 1) or 0)
            a1_1561.in_forward, a1_1561.in_back = ((v489 and 1) or 0), ((not v489 and 1) or 0)
            a1_1561.pitch, a1_1561.yaw = 89, v49.normalize_yaw((a1_1561.move_yaw + 90))
        end
    end),
                run = (function(a1_1563)
        v284.misc.ladder:set_callback(function(a1_1565)
            v109.setup_command(a1_1565.value, a1_1563.work)
        end, true)
    end)
            }
        v485.breaker = {
                work = (function()
        if not v257.valid then
            return
        end
        local v490 = v54.get_animstate(v257.self)
        if not v490 then
            return
        end
        local v491 = v284.misc.breaker
        if ((v491.pitch.value and not v257.jumping) and v490.hit_in_ground_animation) then
            v54.set_prop(v257.self, "m_flPoseParameter", 0.5, 12)
        end
        if (v491.slia.value and v257.jumping) then
            v54.set_prop(v257.self, "m_flPoseParameter", 1, 6)
        end
        if (v491.legs.value == "Static") then
            v253.aa.other.legs:override("Always slide")
            v54.set_prop(v257.self, "m_flPoseParameter", 0, 0)
        elseif (v491.legs.value == "Jitter") then
            v253.aa.other.legs:override("Always slide")
            if ((v56.tickcount() % 4) > 1) then
                v54.set_prop(v257.self, "m_flPoseParameter", 0, 0)
            end
        elseif (v491.legs.value == "No step back") then
            v253.aa.other.legs:override("Never slide")
            v54.set_prop(v257.self, "m_flPoseParameter", 0.5, 7)
        else
            v253.aa.other.legs:override()
        end
    end),
                run = (function(a1_1567)
        v284.misc.breaker.on:set_callback(function(a1_1569)
            v109.pre_render(a1_1569.value, a1_1567.work)
            if not a1_1569.value then
                v253.aa.other.legs:override()
            end
        end, true)
    end)
            }
        v485.filter = {
                callback = (function(a1_1571)
        v52.delay_call(0, function()
            cvar.con_filter_enable:set_int(((a1_1571.value and 1) or 0))
            cvar.con_filter_text:set_string(((a1_1571.value and "hysteria") or ""))
        end)
    end),
                run = (function(a1_1573)
        v284.misc.filter:set_callback(a1_1573.callback, true)
        v109.shutdown:set(function()
            cvar.con_filter_enable:set_int(0)
            cvar.con_filter_text:set_string("")
        end)
    end)
            }
        for iter_282_0, iter_282_1 in next, v485 do
            iter_282_1:run()
        end
        local v492 = v285.servers
        local v493 = (version_key.servers or {})
        local v494 = 0
        local v495
        local v496
        v496 = {
                update = (function()
        v494 = v492.list[0]:get()
        v495 = v493[v494]
        v492.list.connect:set_enabled((v495 ~= nil))
        v492.list.export:set_enabled((v495 ~= nil))
        v492.list.delete:set_enabled((v495 ~= nil))
    end),
                save = (function()
        version_key.servers = v493
        version_key()
    end),
                refresh = (function()
        v492.list[0]:update(v493)
        v496.update()
    end),
                export = (function(a1_1575, a1_1577)
        get_set.set(v50.format("[\"%s\"]:[%s]", a1_1575, a1_1577))
    end),
                import = (function()
        if not get_set.get() then
            return
        end
        local v497, v498 = v50.match("[\"(.+)\"]:[(.+)]")
        if (not v497 or not v498) then
            return
        end
        v496.add(v497, v498)
    end),
                add = (function(a1_1579, a1_1581)
        if (not a1_1579 or not a1_1581) then
            return
        end
        a1_1579 = v50.limit(a1_1579, 32)
        v493[(#v493 + 1)] = { a1_1579, a1_1581 }
        v496.refresh()
    end),
                delete = (function(a1_1583)
        if not v493[a1_1583] then
            return
        end
        v48.remove(v493, a1_1583)
        v496.refresh()
    end)
            }
        v492.list[0]:set_callback(v496.update)
        v52.delay_call(0.1, v496.update)
        v492.new.create:set_callback(function()
            local v499 = v50.clean(v492.new.name:get())
            local v500 = v50.clean(v492.new.ip:get())
            if ((#v499 == 0) or (#v500 == 0)) then
                return
            end
            v496.add(v499, v500)
        end)
        v492.list.delete:set_callback(function()
            v496.delete(v494)
        end)
        local v501
        local v502 = {}
        local v503 = { "knife", "c4", "decoy", "flashbang", "hegrenade", "incgrenade", "molotov", "inferno", "smokegrenade" }
        local v504 = {
        mismatch = { "\aD59A4D", "\aD59A4D\x01", "\a", v116.hex("D59A4D") },
        hit = { "\aA3D350", "\aA3D350\x01", "\x06", v116.hex("A3D350") },
        miss = { "\aA67CCF", "\aA67CCF\x01", "\x03", v116.hex("A67CCF") },
        harm = { "\ad35050", "\ad35050\x01", "\a", v116.hex("d35050") },
        brute = { "\aBFBFBF", "\aBFBFBF\x01", "\x01", v116.hex("BFBFBF") },
        evaded = { "\aB0C6FF", "\aB0C6FF\x01", "\x01", v116.hex("AB0C6F") },
    }
        local v505 = { list = {} }
        v505.events = {
                evade = (function(a1_1585)
        if (a1_1585.damaged or not v284.misc.logs.events:get("Anti-aim info")) then
            return
        end
        v505.invent("evaded", { { true, "evaded " }, { false, "Evaded " }, { { v54.get_player_name(a1_1585.attacker) }, "'s shot" } })
    end),
                receive = (function(a1_1587, a1_1589, a1_1591)
        local v506 = ((a1_1589 == a1_1591) or (a1_1591 == 0))
        local v507 = (a1_1587.health == 0)
        local v508 = a1_1587.weapon
        local v509 = a1_1587.dmg_health
        local v510 = (v254.hitgroups[(a1_1587.hitgroup or 0)] or "generic")
        local v511 = ((v507 and "Killed by") or "Harmed by")
        a1_1591 = (((a1_1591 ~= 0) and v54.get_player_name(a1_1591)) or "world")
        local v512 = {
        ((v506 and { true, { "you" }, ((v507 and " killed ") or " harmed ") }) or { true, v50.lower(v511), " " }),
        ((v506 and { false, { "You" }, ((v507 and " killed ") or " harmed ") }) or { false, v511, " " }),
        { ((v506 and { "yourself" }) or { a1_1591 }) },
        (((not v506 and (v510 ~= "generic")) and { " in ", { v510 } }) or nil),
        ((not v507 and { " for ", { v509, " hp" } }) or nil),
    }
        v505.invent("harm", v512)
    end),
                harm = (function(a1_1593, a1_1595, a1_1597)
        if (not v48.find(v503, a1_1593.weapon) and (a1_1593.weapon ~= "knife")) then
            return
        end
        local v513 = (a1_1593.health == 0)
        local v514 = ("a " .. a1_1593.weapon)
        if (a1_1593.weapon == "hegrenade") then
            v514 = "an HE grenade"
        end
        local v515 = v54.get_player_name(a1_1595)
        local v516 = ((v513 and "Killed") or "Harmed")
        if (v513 and (a1_1593.weapon == "hegrenade")) then
            v516 = "Exploded"
        elseif (v513 and (a1_1593.weapon == "knife")) then
            v516 = "Stabbed"
        elseif (a1_1593.weapon == "inferno") then
            v516 = "Burnt"
        end
        local v517 = {
        { true, v50.lower(v516), " " },
        { false, v516, " " },
        { { v515 } },
        ((not v513 and { " for ", { a1_1593.dmg_health, " hp" } }) or nil),
        (((v513 and (v516 == "Burnt")) and { " to ", { "death" } }) or nil),
        ((((v516 == "Killed") or (v516 == "Harmed")) and { true, " with ", { v514 } }) or nil),
    }
        v505.invent("hit", v517)
    end),
                damage = (function(a1_1599)
        local v518 = v52.userid_to_entindex(a1_1599.userid)
        local v519 = (((a1_1599.attacker ~= 0) and v52.userid_to_entindex(a1_1599.attacker)) or 0)
        if ((v518 == v257.self) and v284.misc.logs.events:get("Getting harmed")) then
            v505.events.receive(a1_1599, v518, v519)
        elseif (((v519 == v257.self) and (v518 ~= v257.self)) and v284.misc.logs.events:get("Harming enemies")) then
            v505.events.harm(a1_1599, v518, v519)
        end
    end),
                miss = (function(a1_1601)
        if not v284.misc.logs.events:get("Ragebot shots") then
            return
        end
        local v520 = (v502[a1_1601.id] or {})
        local v521 = "Missed"
        local v522 = v54.get_player_name(a1_1601.target)
        local v523 = a1_1601.reason
        if (((v523 == "prediction error") and v520.difference) and (v520.difference > 2)) then
            v523 = "unpredicted occasion"
        end
        local v524 = v254.hitgroups[a1_1601.hitgroup]
        local v525 = {
        { false, v521, " " },
        { true, v50.lower(v521), " " },
        { { v522 } },
        (v524 and { "'s ", { v524 } }),
        (((v523 ~= "?") and { " due to ", { v523 } }) or nil),
    }
        local v526 = {
        (v520.damage and { "dmg: ", { v520.damage } }),
        ({
        "hc: ",
        { v49.round(a1_1601.hit_chance), "%%" },
        ((((v253.rage.aimbot.hit_chance.value - a1_1601.hit_chance) > 3) and "⮟") or ""),
    } or nil),
        (((v520.difference and (v520.difference ~= 0)) and { "Δ: ", { v520.difference, "t" }, (((v520.difference < 0) and "⮟") or "") }) or nil),
        ((v520.teleport and { { "LC" } }) or nil),
        (((v520.interpolated or v520.extrapolated) and { { ((v520.interpolated and "IN") or ""), ((v520.extrapolated and "EP") or "") } }) or nil),
    }
        v505.invent("miss", v525, v526)
        v502[a1_1601.id] = nil
    end),
                hit = (function(a1_1603)
        if not v284.misc.logs.events:get("Ragebot shots") then
            return
        end
        local v527 = (v502[a1_1603.id] or {})
        local v528 = "Hit"
        if not v54.is_alive(a1_1603.target) then
            v528 = "Killed"
        end
        local v529 = v54.get_player_name(a1_1603.target)
        local v530 = v254.hitgroups[a1_1603.hitgroup]
        local v531 = v254.hitgroups[(v527.hitgroup or 0)]
        local v532 = ((v528 == "Hit") and (a1_1603.hitgroup ~= v527.hitgroup))
        local v533 = ((v528 == "Hit") and (((v527.damage or 0) - (a1_1603.damage or 0)) > 10))
        local v534
        if ((v533 and v532) and v531) then
            v534 = { v531, "-", v527.damage }
        elseif v533 then
            v534 = { v527.damage, " hp" }
        end
        local v535 = {
        { true, v50.lower(v528), " ", { v529 } },
        { false, v528, " ", { v529 } },
        (((v530 and (v530 ~= "generic")) and { (((v528 == "Hit") and "'s ") or " in "), { v530 }, ((v532 and "\aD59A4D!\r") or "") }) or nil),
        (((v528 == "Hit") and { " for ", { a1_1603.damage, " hp" }, ((v533 and "\aD59A4D!\r") or "") }) or nil),
    }
        local v536 = {
        (v534 and { "exp: ", v534 }),
        (((v527.difference ~= 0) and { "Δ: ", { v527.difference, "t" } }) or nil),
        ((((v253.rage.aimbot.hit_chance.value - a1_1603.hit_chance) > 5) and { "hc: ", { v49.floor(a1_1603.hit_chance), "%%" }, "⮟" }) or nil),
    }
        v505.invent("hit", v535, v536)
        v502[a1_1603.id] = nil
    end),
                aim = (function(a1_1605)
        if not v284.misc.logs.events:get("Ragebot shots") then
            return
        end
        a1_1605.difference = (v56.tickcount() - a1_1605.tick)
        v502[a1_1605.id] = a1_1605
    end)
            }
        function v505.invent(a1_1607, a1_1609, a1_1611)
            local console_screen = { console = {}, screen = {}, chat = {} }
            if a1_1607 then
                local v537 = 0
                local v538 = 0
                local v539 = v504[a1_1607]
                console_screen.console[(v537 + 1)], console_screen.console[(v537 + 2)] = ((v539 and v539[1]) or ""), " •\r "
                console_screen.screen[(v538 + 1)], console_screen.screen[(v538 + 2)] = ((v539 and v539[2]) or ""), "•\aE6E6E6\x02 "
            end
            for iter_313_0 = 1, v48.maxn(a1_1609), 1 do
                local v540 = a1_1609[iter_313_0]
                if not v540 then
                elseif (type(v540) == "table") then
                    local v541 = ((((a1_1609[iter_313_0][1] == true) and 1) or ((a1_1609[iter_313_0][1] == false) and 2)) or 0)
                    for iter_313_1, iter_313_2 in ipairs(v540) do
                        local v542 = type(iter_313_2)
                        if ((v542 ~= "boolean") or (iter_313_1 ~= 1)) then
                            if (v541 ~= 2) then
                                if (v542 == "table") then
                                    v48.move(iter_313_2, 1, #iter_313_2, (#console_screen.console + 1), console_screen.console)
                                    v48.move(iter_313_2, 1, #iter_313_2, (#console_screen.chat + 1), console_screen.chat)
                                else
                                    local v543 = #console_screen.console
                                    local v544 = #console_screen.chat
                                    console_screen.console[(v543 + 1)], console_screen.console[(v543 + 2)], console_screen.console[(v543 + 3)] = "\a909090", (((v542 == "string") and iter_313_2) or tostring(iter_313_2)), "\r"
                                    console_screen.chat[(v544 + 1)], console_screen.chat[(v544 + 2)], console_screen.chat[(v544 + 3)] = "\b", (((v542 == "string") and v50.gsub(iter_313_2, "\a%x%x%x%x%x%x", "")) or tostring(iter_313_2)), "\x01"
                                end
                            end
                            if (v541 ~= 1) then
                                if (v542 == "table") then
                                    local v545 = #console_screen.screen
                                    for iter_313_3 = 1, #iter_313_2, 3 do
                                        console_screen.screen[(v545 + iter_313_3)], console_screen.screen[((v545 + iter_313_3) + 1)], console_screen.screen[((v545 + iter_313_3) + 2)] = "\aE6E6E6\x01", iter_313_2[iter_313_3], "\aE6E6E6\x02"
                                    end
                                else
                                    local v546 = #console_screen.screen
                                    console_screen.screen[(v546 + 1)], console_screen.screen[(v546 + 2)] = (((v542 == "string") and v50.gsub(iter_313_2, "\a%x%x%x%x%x%x", function(a1_1613)
            return (a1_1613 .. "\x01")
        end)) or tostring(iter_313_2)), "\aE6E6E6\x02"
                                end
                            end
                        end
                    end
                else
                    local v547 = #console_screen.console
                    console_screen.console[(v547 + 1)], console_screen.console[(v547 + 2)], console_screen.console[(v547 + 3)] = "\a808080", tostring(v540), "\r"
                    console_screen.screen[(#console_screen.screen + 1)] = (((type(v540) == "string") and v50.gsub(v540, "\a%x%x%x%x%x%x", function(a1_1615)
            return (a1_1615 .. "\x02")
        end)) or tostring(v540))
                end
            end
            a1_1611 = (((type(a1_1611) == "table") and v48.filter(a1_1611)) or nil)
            if (a1_1611 and (#a1_1611 > 0)) then
                console_screen.console[(#console_screen.console + 1)] = " \v~\r "
                for iter_313_4 = 1, #a1_1611, 1 do
                    if (type(a1_1611[iter_313_4]) == "table") then
                        for iter_313_5, iter_313_6 in ipairs(a1_1611[iter_313_4]) do
                            local v548 = type(iter_313_6)
                            if (v548 == "table") then
                                console_screen.console[(#console_screen.console + 1)] = "\aAAAAAA"
                                v48.move(iter_313_6, 1, #iter_313_6, (#console_screen.console + 1), console_screen.console)
                            else
                                local v549 = #console_screen.console
                                console_screen.console[(v549 + 1)], console_screen.console[(v549 + 2)] = "\a707070", (((v548 == "string") and iter_313_6) or tostring(iter_313_6))
                            end
                            console_screen.console[(#console_screen.console + 1)] = "\r"
                        end
                    else
                        local v550 = #console_screen.console
                        console_screen.console[(v550 + 1)], console_screen.console[(v550 + 2)], console_screen.console[(v550 + 3)] = "\a707070", tostring(a1_1609[iter_313_4]), "\r"
                    end
                    if (iter_313_4 < #a1_1611) then
                        console_screen.console[(#console_screen.console + 1)] = "\a707070, \r"
                    end
                end
            end
            v505.push(a1_1607, v48.concat(console_screen.console), v48.concat(console_screen.screen), v48.concat(console_screen.chat))
        end
        function v505.push(a1_1617, a1_1619, a1_1621, a1_1623)
            if (a1_1619 and v284.misc.logs.output:get("Console")) then
                fn16(a1_1619)
            end
            if (a1_1621 and v284.misc.logs.output:get("Screen")) then
                v48.insert(v505.list, 1, { event = a1_1617, text = a1_1621, time = v56.realtime(), progress = { 0 } })
            end
        end
        function v505.clear_stack()
            v502 = {}
        end
        function v505.run(a1_1625)
            v284.misc.logs.on:set_callback(function(a1_1627)
            v109.aim_fire(a1_1627.value, a1_1625.events.aim)
            v109.aim_hit(a1_1627.value, a1_1625.events.hit)
            v109.aim_miss(a1_1627.value, a1_1625.events.miss)
            v109.player_hurt(a1_1627.value, a1_1625.events.damage)
            v109.enemy_shot(a1_1627.value, a1_1625.events.evade)
            v109.local_spawned(a1_1627.value, a1_1625.clear_stack)
            local v551 = fn9(a1_1627.value, false, nil)
            v253.rage.other.log_misses:override(v551)
            v253.misc.log_damage:override(v551)
        end, true)
            v253.rage.other.log_misses:depend(true, { v284.misc.logs.on, false })
            v253.misc.log_damage:depend(true, { v284.misc.logs.on, false })
        end
        v505:run()
        local v552 = {}
        v552.aspect = {
                active = false,
                value = (v146 / v147),
                init = (v146 / v147),
                activate = (function()
        v552.aspect.active = true
    end),
                work = (function()
        local v553 = v552.aspect
        local v554 = v284.visuals.aspect
        if not v553.active then
            return
        end
        if v554.on.value then
            local v555 = (v554.ratio.value * 0.01)
            v553.value = v182.lerp(v553.value, v555, 8, 0.001)
            v553.active = (v555 ~= v553.value)
            cvar.r_aspectratio:set_float(v553.value)
        else
            v553.value = v182.lerp(v553.value, v553.init)
            cvar.r_aspectratio:set_float(v553.value)
            if (v553.value == v553.init) then
                v109.paint_ui:unset(v553.work)
                cvar.r_aspectratio:set_float(0)
                v553.active = false
            end
        end
    end),
                run = (function(a1_1629)
        local v556 = v284.visuals.aspect
        v556.on:set_callback(function(a1_1631)
            a1_1629.active = true
            if a1_1631.value then
                v109.paint_ui:set(a1_1629.work)
            end
        end, true)
        v556.ratio:set_callback(a1_1629.activate, true)
        defer(function()
            cvar.r_aspectratio:set_float(0)
        end)
    end)
            }
        v552.marker = {
                duration = 2,
                list = {
                },
                marker = (function(a1_1633, a1_1635, a1_1637)
        local v557, v558 = v58.world_to_screen(a1_1633.x, a1_1633.y, a1_1633.z)
        if (v557 and v558) then
            local v559, v560 = (v557 / v145), (v558 / v145)
            if a1_1637 then
                local v561 = (32 * a1_1635)
                v150.circle(v559, v560, v144.accent:alphen((1 - a1_1635), true), v561)
            end
            v150.texture(v191.mini_bfly, (v559 - 5), (v560 - 5), 9, 9, v144.accent)
        end
    end),
                work = (function()
        local v562 = v552.marker
        for iter_326_0, iter_326_1 in ipairs(v562.list) do
            local v563 = (iter_326_1.time > v56.realtime())
            local v564 = v182.condition(iter_326_1.progress, v563, { 3, -4 }, { { 1, 4 }, { 3, 4 } })
            v150.push_alpha(v564)
            v562.marker(iter_326_1, v564, v563)
            v150.pop_alpha()
            if (not v563 and (v564 == 0)) then
                v48.remove(v562.list, iter_326_0)
            end
        end
    end),
                append = {
                    temp = {
                    },
    (function(a1_1639)
        v552.marker.append.temp[a1_1639.id] = { x = a1_1639.x, y = a1_1639.y, z = a1_1639.z }
    end),
    (function(a1_1641)
        local v565 = v552.marker
        local v566 = v565.append.temp[a1_1641.id]
        v48.insert(v565.list, 1, { x = v566.x, y = v566.y, z = v566.z, time = (v56.realtime() + v565.duration), progress = { 0 } })
        v565.append.temp[a1_1641.id] = nil
    end),
    (function(a1_1643)
        v552.marker.append.temp[a1_1643.id] = nil
    end)
                },
                run = (function(a1_1645)
        local v567 = v284.visuals.marker
        v567:set_event("aim_fire", a1_1645.append[1])
        v567:set_event("aim_hit", a1_1645.append[2])
        v567:set_event("aim_miss", a1_1645.append[3])
        v567:set_event("paint", a1_1645.work)
    end)
            }
        for iter_282_2, iter_282_3 in next, v552 do
            iter_282_3:run()
        end
        local v568 = {}
        v568.teleport = {
                active = false,
                latest = 0,
                work = (function(a1_1647, a1_1649)
        v568.teleport.active = v284.rage.teleport.on.hotkey:get()
        if (not v568.teleport.active or (v257.exploit.active ~= v254.exploit.DT)) then
            return
        end
        local v569 = false
        local v570 = v568.teleport
        local v571 = v284.rage.teleport
        local v572 = ((v253.misc.settings.maxshift.value - v253.rage.aimbot.dt_fl[1].value) + 1)
        v570.active = ((((v570.active and not (v572 < 8)) and (v570.latest ~= a1_1647.command_number)) and not (v257.velocity < 100)) and not not v257.jumping)
        if not v570.active then
            return
        end
        local v573 = v257.weapon_t
        if not v573 then
            return
        end
        local v574 = v573.weapon_type_int
        v570.active = ((((v570.active and not v573.is_full_auto) and (v574 ~= 9)) and (v574 ~= 0)) and (not not v571.pistol.value or (v574 ~= 1)))
        if not v570.active then
            return
        end
        local v575 = (((v253.rage.aimbot.damage_ovr[1].value and v253.rage.aimbot.damage_ovr[1]:get_hotkey()) and v253.rage.aimbot.damage_ovr[2].value) or v253.rage.aimbot.damage.value)
        local v576 = v69(v54.get_prop(v257.self, "m_vecVelocity"))
        local v577 = v69(v54.get_prop(v257.self, "m_vecOrigin"))
        local v578 = v69(v52.eye_position())
        local v579 = v69(v52.extrapolate(v578.x, v578.y, v578.z, v576, v572))
        local v580 = v52.trace_line(v257.self, v578.x, v578.y, v578.z, v579.x, v579.y, v579.z)
        v579.x = v49.lerp(v578.x, v579.x, v580)
        v579.y = v49.lerp(v578.y, v579.y, v580)
        v579.z = v49.lerp(v578.z, v579.z, v580)
        local v581 = v52.current_threat()
        for iter_331_0 = 1, #v258, 1 do
            local v582 = v258[iter_331_0]
            if ((not v582 or not v54.is_enemy(v582)) or not v54.is_alive(v582)) then
            elseif ((v577:dist(v69(v54.get_prop(v582, "m_vecOrigin"))) < 400) or (v582 == v581)) then
                local v583 = v69(v54.hitbox_position(v582, 0))
                if v52.visible(v583.x, v583.y, v583.z) then
                    v569 = true
                    break
                end
                local v584 = { v52.trace_bullet(v257.self, v579.x, v579.y, v579.z, v583.x, v583.y, v583.z) }
                local v585 = (v584[2] or 0)
                local v586 = v49.min(v575, v54.get_prop(v582, "m_iHealth"))
                if (v584[1] and (v586 < v585)) then
                    v569 = true
                    break
                end
            end
        end
        if v569 then
            if v571.land.value then
                local v587 = ((v257.crouching and v573.recovery_time_crouch) or v573.recovery_time_stand)
                local v588 = v69(v52.extrapolate(v577.x, v577.y, v577.z, v576, v572))
                v588.z = (v588.z - v587)
                if not (v52.trace_line(v257.self, v577.x, v577.y, v577.z, v588.x, v588.y, v588.z) < 1) then
                    return
                end
            end
            v570.latest = a1_1647.command_number
            a1_1647.discharge_pending = true
        end
    end),
                run = (function(a1_1651)
        v284.rage.teleport.on:set_callback(function(a1_1653)
            v109.setup_command(a1_1653.value, a1_1651.work)
        end, true)
    end)
            }
        v568.resolver = {
                records = {
                },
                gather = (function(a1_1655, a1_1657)
        local v589, v590 = v54.get_prop(a1_1655, "m_angEyeAngles")
        return {
        time = a1_1657,
        pos = ((v54.get_prop(a1_1655, "m_flPoseParameter", 11) * 120) - 60),
        pitch = v589,
        yaw = v590,
    }
    end),
                work = (function()
        local v591 = v568.resolver
        v52.update_player_list()
        for iter_335_0 = 1, #v258, 1 do
            local v592 = v258[iter_335_0]
            local v593 = v54.get_steam64(v258[iter_335_0])
            if (v54.is_enemy(v592) and v593) then
                local v594, v595 = v54.get_simtime(v592)
                local v596, v597 = toticks(v594), toticks(v595)
                local v598 = v591.records[v593]
                local v599 = v591.gather(v592, v596)
                local v600
                v600 = (v598 and v598.prev)
                if not v598 then
                    v591.records[v593] = { diff = (v596 - v597), prev = v599 }
                    v598 = v591.records[v593]
                    local v601 = v598.prev
                else
                    v598.diff = (v596 - v597)
                end
                local v602
                if ((((v598 ~= nil) and (v598.diff >= 0)) and (v598.diff <= 2)) and not v54.is_lethal(v592)) then
                    local v603 = v54.get_animstate(v592)
                    local v604 = v49.normalize_yaw((v599.yaw - v603.goal_feet_yaw))
                    v599.gfy = v603.goal_feet_yaw
                    if (v604 ~= 0) then
                        v602 = ((((v604 > 0) and -1) or 1) * v54.get_max_desync(v603))
                        if v602 then
                            plist.set(v592, "Force body yaw value", v602)
                        end
                    end
                end
                v598.active = (v602 ~= nil)
                plist.set(v592, "Force body yaw", (v602 ~= nil))
                plist.set(v592, "Correction active", true)
                v598.prev = v599
            else
                plist.set(v592, "Correction active", false)
            end
        end
    end),
                refresh = (function()
        v48.clear(v568.resolver.records)
    end),
                restore = (function()
        local v605 = v568.resolver
        for iter_337_0 = 1, 64, 1 do
            plist.set(iter_337_0, "Force body yaw", false)
        end
        v605.records = {}
    end),
                debug = (function()
        local v606 = v568.resolver
        for iter_338_0 = 1, #v258, 1 do
            local v607 = v258[iter_338_0]
            local v608 = v54.get_steam64(v258[iter_338_0])
            local v609 = v606.records[v608]
            local v610, v611, v612, v613, v614 = v54.get_bounding_box(v607)
            if (v609 and (v614 > 0)) then
                v150.text(v49.lerp(v610, v612, 0.5), (v611 - 18), v144.text, "c", nil, "diff: ", v609.diff)
            end
        end
    end),
                run = (function(a1_1659)
        v284.rage.resolver:set_callback(function(a1_1661)
            v109.predict_command(a1_1661.value, a1_1659.work)
            v109.round_start(a1_1661.value, a1_1659.refresh)
            if not a1_1661.value then
                a1_1659.restore()
            end
        end)
        v109.shutdown(a1_1659.restore)
    end)
            }
        v568.exswitch = {
                ovr = false,
                latest = false,
                work = (function(a1_1663)
        local v615 = v568.exswitch
        local v616 = v284.rage.exswitch
        local v617 = v253.rage.aimbot.double_tap[1].hotkey:get()
        local v618 = v253.aa.other.onshot.hotkey:get()
        local v619 = (v253.rage.other.peek.value and v253.rage.other.peek.hotkey:get())
        local v620 = (((not v257.walking and not (v257.velocity < 5)) or not not v619) and not v257.crouching)
        local v621 = false
        local v622 = v257.weapon_t
        if v622 then
            local v623 = v54.get_prop(v257.weapon, "m_iItemDefinitionIndex")
            local v624
            v621, v624 = v622.is_full_auto, (v623 == 1)
            if ((((v622.weapon_type_int == 1) and not v624) and not v616.allow:get("Pistols")) or (v624 and not v616.allow:get("Desert Eagle"))) then
                v621 = true
            end
        end
        if ((((v257.on_ground and v617) and not v621) and not v620) and (a1_1663.weaponselect == 0)) then
            v253.rage.aimbot.double_tap[1]:override(false)
            v253.aa.other.onshot.hotkey:override({ "Always on", 0 })
            v615.ovr = true
        elseif v615.ovr then
            v253.rage.aimbot.double_tap[1]:override()
            v253.rage.aimbot.double_tap[1]:set(true)
            v253.aa.other.onshot.hotkey:override()
            v615.ovr = false
        end
    end),
                run = (function(a1_1665)
        v284.rage.exswitch.on:set_event("setup_command", a1_1665.work)
        v284.rage.exswitch.on:set_callback(function(a1_1667)
            if not a1_1667.value then
                v253.rage.aimbot.double_tap[1]:override()
                v253.aa.other.onshot.hotkey:override()
            end
        end)
        v109.shutdown:set(function()
            v253.rage.aimbot.double_tap[1]:override()
            v253.aa.other.onshot.hotkey:override()
        end)
    end)
            }
        v568.recharger = {
                last = false,
                state = false,
                work = (function(a1_1669)
        local v625 = v568.recharger
        local v626 = ((v253.rage.aimbot.double_tap[1].value and v253.rage.aimbot.double_tap[1].hotkey:get()) or (v253.aa.other.onshot.value and v253.aa.other.onshot.hotkey:get()))
        if (v626 ~= v625.last) then
            v625.last = v626
            if v625.last then
                v625.state = false
            end
        end
        if (v253.rage.aimbot.enable.value == false) then
            v253.rage.aimbot.enable.hotkey:override()
            v625.state = nil
        end
        if ((v625.state == false) and (a1_1669.weaponselect == 0)) then
            v253.rage.aimbot.enable.hotkey:override({ "On Hotkey", 0 })
            v625.state = true
        elseif ((v625.state == true) or (a1_1669.weaponselect ~= 0)) then
            v253.rage.aimbot.enable.hotkey:override()
            v253.rage.aimbot.enable.hotkey:set("Always On", 0)
            v625.state = nil
        end
    end),
                run = (function(a1_1671)
        v284.rage.recharge:set_event("setup_command", a1_1671.work)
        v284.rage.recharge:set_callback(function(a1_1673)
            if a1_1673.value then
            elseif (a1_1671.state ~= nil) then
                v253.rage.aimbot.enable.hotkey:override()
                v253.rage.aimbot.enable.hotkey:set("Always On", 0)
                a1_1671.state = nil
            end
        end)
    end)
            }
        v568.peekfix = {
                work = (function(a1_1675)
        if (v257.exploit.active ~= v254.exploit.DT) then
            return
        end
        if v257.peeking then
            a1_1675.force_defensive = true
        end
    end),
                run = (function(a1_1677)
        v284.rage.peekfix:set_callback(function(a1_1679)
            v109.setup_command(a1_1679.value, a1_1677.work)
        end, true)
    end)
            }
        for iter_282_4, iter_282_5 in pairs(v568) do
            if iter_282_5.run then
                iter_282_5:run()
            end
        end
        function v150.logo(a1_1681, a1_1683)
            v150.texture(v191.logo_l, a1_1681, a1_1683, ((_AZAZI and 35) or 26), 15, v144.accent)
            v150.texture(v191.logo_r, (a1_1681 + ((_AZAZI and 35) or 26)), a1_1683, ((_AZAZI and 35) or 24), 15, v144.text)
        end
        function v150.edge_v(a1_1685, a1_1687, a1_1689, a1_1691)
            a1_1691 = (a1_1691 or v144.accent)
            v150.texture(v191.corner_v, a1_1685, (a1_1687 + 4), 6, -4, a1_1691, "f")
            v150.rectangle(a1_1685, (a1_1687 + 4), 2, (a1_1689 - 8), a1_1691)
            v150.texture(v191.corner_v, a1_1685, ((a1_1687 + a1_1689) - 4), 6, 4, a1_1691, "f")
        end
        function v150.edge_h(a1_1693, a1_1695, a1_1697, a1_1699)
            a1_1699 = (a1_1699 or v144.accent)
            v150.texture(v191.corner_h, a1_1693, a1_1695, 4, 6, a1_1699, "f")
            v150.rectangle((a1_1693 + 4), a1_1695, (a1_1697 - 8), 2, a1_1699)
            v150.texture(v191.corner_h, (a1_1693 + a1_1697), a1_1695, -4, 6, a1_1699, "f")
        end
        function v150.capsule(a1_1701, a1_1703, a1_1705, a1_1707, a1_1709)
            a1_1701, a1_1703, a1_1705, a1_1707 = (a1_1701 * v145), (a1_1703 * v145), (a1_1705 * v145), (a1_1707 * v145)
            local v627 = a1_1709.r
            local v628 = a1_1709.g
            local v629 = a1_1709.b
            local v630 = (a1_1709.a * v150.get_alpha())
            local v631 = (a1_1707 * 0.5)
            v58.circle((a1_1701 + v631), (a1_1703 + v631), v627, v628, v629, v630, v631, 180, 0.5)
            v58.rectangle((a1_1701 + v631), a1_1703, (a1_1705 - a1_1707), a1_1707, v627, v628, v629, v630)
            v58.circle(((a1_1701 + a1_1705) - v631), (a1_1703 + v631), v627, v628, v629, v630, v631, 0, 0.5)
        end
        function v150.rounded_side_v(a1_1711, a1_1713, a1_1715, a1_1717, a1_1719, a1_1721)
            a1_1711, a1_1713, a1_1715, a1_1717, a1_1721 = (a1_1711 * v145), (a1_1713 * v145), (a1_1715 * v145), (a1_1717 * v145), ((a1_1721 or 0) * v145)
            local v632 = a1_1719.r
            local v633 = a1_1719.g
            local v634 = a1_1719.b
            local v635 = (a1_1719.a * v150.get_alpha())
            v58.circle((a1_1711 + a1_1721), (a1_1713 + a1_1721), v632, v633, v634, v635, a1_1721, 180, 0.25)
            v58.rectangle((a1_1711 + a1_1721), a1_1713, (a1_1715 - a1_1721), a1_1721, v632, v633, v634, v635)
            v58.rectangle(a1_1711, (a1_1713 + a1_1721), a1_1715, ((a1_1717 - a1_1721) - a1_1721), v632, v633, v634, v635)
            v58.circle((a1_1711 + a1_1721), ((a1_1713 + a1_1717) - a1_1721), v632, v633, v634, v635, a1_1721, 270, 0.25)
            v58.rectangle((a1_1711 + a1_1721), ((a1_1713 + a1_1717) - a1_1721), (a1_1715 - a1_1721), a1_1721, v632, v633, v634, v635)
        end
        function v150.rounded_side_h(a1_1723, a1_1725, a1_1727, a1_1729, a1_1731, a1_1733)
            a1_1723, a1_1725, a1_1727, a1_1729, a1_1733 = (a1_1723 * v145), (a1_1725 * v145), (a1_1727 * v145), (a1_1729 * v145), ((a1_1733 or 0) * v145)
            local v636 = a1_1731.r
            local v637 = a1_1731.g
            local v638 = a1_1731.b
            local v639 = (a1_1731.a * v150.get_alpha())
            v58.circle((a1_1723 + a1_1733), (a1_1725 + a1_1733), v636, v637, v638, v639, a1_1733, 180, 0.25)
            v58.rectangle((a1_1723 + a1_1733), a1_1725, ((a1_1727 - a1_1733) - a1_1733), a1_1733, v636, v637, v638, v639)
            v58.circle(((a1_1723 + a1_1727) - a1_1733), (a1_1725 + a1_1733), v636, v637, v638, v639, a1_1733, 90, 0.25)
            v58.rectangle(a1_1723, (a1_1725 + a1_1733), a1_1727, (a1_1729 - a1_1733), v636, v637, v638, v639)
        end
        local v640 = v239.new("crosshair", (x_y.x - 24), (x_y.y + 32), 48, 16, {
        border = { x_y_1.x, (x_y_1.y - 100), x_y_1.x, (x_y_1.y + 100) },
        rulers = { { true, x_y_1.x, (x_y_1.y - 100), 200 } },
    })
        v640.data, v640.items = { scope = { reserved = false, side = 0, target = 0 } }, {}
        function v640.enumerate(a1_1735)
            local v641 = x_y.x
            local v642 = a1_1735.y
            local v643 = ((v182.condition("crosshair::yposition", (a1_1735.y > x_y.y), 3) * 2) - 1)
            local v644 = v640.data.scope.side
            local v645 = ((v644 * 0.5) + 0.5)
            for iter_357_0, iter_357_1 in ipairs(a1_1735.items) do
                iter_357_1[0] = (iter_357_1[0] or { 0 })
                v150.push_alpha(iter_357_1[1])
                local v646, v647, v648 = iter_357_1[2](iter_357_1, (v641 + iter_357_1.x), v642)
                v150.pop_alpha()
                iter_357_1[1] = v182.condition(iter_357_1[0], v646, -8)
                iter_357_1.x = ((v647 * -v645) - (v644 * 16))
                v642 = (v642 + ((v648 * iter_357_1[1]) * v643))
            end
            return v49.abs((v642 - a1_1735.y))
        end
        v640.items = {
    {
    0,
    (function(a1_1737, a1_1739, a1_1741)
        if (a1_1737[1] > 0) then
            local v649 = v182.condition(a1_1737.bfly, v284.visuals.crosshair.logo.value, -8)
            if (v649 > 0) then
                v150.texture(v191.butterfly_s, (a1_1739 - 3), (a1_1741 - 10), 32, 32, v144.accent:alphen((255 * v649)), "f")
            end
            v150.logo(a1_1739, a1_1741)
        end
        return (v284.visuals.crosshair.style.value == "Classic"), ((_AZAZI and 66) or 48), 15
    end),
                    desync = 0,
                    x = 0,
                    bfly = {
    0
                    }
                },
    {
    0,
    (function(a1_1743, a1_1745, a1_1747)
        local v650 = v284.visuals.crosshair.logo.value
        local v651 = ("HYSTERIA" .. (((not v650 and (v97 > 1)) and (v144.hexs .. (v50.format("%02x", (v150.get_alpha() * 255)) .. v50.upper(var_0_1.build)))) or ""))
        local v652, v653 = v150.measure_text("-", v651)
        if v284.visuals.crosshair.logo.value then
            v652 = (v652 + 7)
        end
        if (a1_1743[1] > 0) then
            v150.text(a1_1745, a1_1747, v144.text, "-", nil, v651)
            if v284.visuals.crosshair.logo.value then
                v150.texture(v191.mini_bfly, ((a1_1745 + v652) - 6), (a1_1747 + 1), 9, 9, v144.accent)
            end
        end
        return (v284.visuals.crosshair.style.value == "Mini"), v652, (v653 + 3)
    end),
                    x = 0,
                    desync = 0
                },
    {
    0,
    (function(a1_1749, a1_1751, a1_1753)
        local v654 = (v253.rage.aimbot.double_tap[1].value and v253.rage.aimbot.double_tap[1].hotkey:get())
        if (a1_1749[1] > 0) then
            local v655 = (((v257.exploit.lc_left > 0) and 14) or v65.get_tickbase_shifting())
            local v656 = (v65.get_double_tap() or (v257.exploit.lc_left > 0))
            local v657 = v182.condition(a1_1749.fd, not v253.rage.other.duck:get(), -8)
            local v658 = (v144.hexs .. (v50.format("%02x", (v150.get_alpha() * 255)) .. v50.insert("llllll", v50.format("\aFFFFFF%02x", (((v656 and 96) or 64) * v150.get_alpha())), v49.min((v655 * 0.5), 6))))
            local v659 = ("DT " .. v658)
            v150.text(a1_1751, a1_1753, v144.text:alphen(v49.lerp(96, 255, v657)), "-", nil, v659)
        end
        return v654, v150.measure_text("-", "DT llllll")
    end),
                    x = 0,
                    fd = {
    0
                    }
                },
    {
    0,
    (function(a1_1755, a1_1757, a1_1759)
        local v660 = ((not v284.visuals.damage.value and v253.rage.aimbot.damage_ovr[1].value) and v253.rage.aimbot.damage_ovr[1].hotkey:get())
        local v661 = "DMG"
        if (a1_1755[1] > 0) then
            v150.text(a1_1757, a1_1759, v144.text, "-", nil, v661)
        end
        return v660, v150.measure_text("-", v661)
    end),
                    x = 0
                },
    {
    0,
    (function(a1_1761, a1_1763, a1_1765)
        local v662 = (v253.rage.other.peek.value and v253.rage.other.peek.hotkey:get())
        local v663 = v65.get_double_tap()
        local v664 = ("PA" .. ((v663 and "+") or ""))
        if (a1_1761[1] > 0) then
            local v665 = v182.condition(a1_1761.ideal, v663, -8)
            v150.text(a1_1763, a1_1765, v144.text:lerp(v144.accent, v665), "-", nil, v664)
        end
        return v662, v150.measure_text("-", v664)
    end),
                    x = 0,
                    ideal = {
    0
                    }
                },
    {
    0,
    (function(a1_1767, a1_1769, a1_1771)
        local v666, v667 = v284.rage.teleport.on.hotkey:get()
        local v668 = ((v284.rage.teleport.on.value and v666) and (v667 ~= 0))
        local v669 = "TP"
        if (a1_1767[1] > 0) then
            local v670 = v182.condition(a1_1767.ideal, v568.teleport.active, -8)
            v150.text(a1_1769, a1_1771, v144.text:lerp(v144.accent, v670), "-", nil, v669)
        end
        return v668, v150.measure_text("-", v669)
    end),
                    x = 0,
                    ideal = {
    0
                    }
                },
    {
    0,
    (function(a1_1773, a1_1775, a1_1777)
        local v671 = (v253.aa.other.onshot.value and v253.aa.other.onshot:get_hotkey())
        local v672 = "OS"
        if (a1_1773[1] > 0) then
            local v673 = (v253.rage.aimbot.double_tap[1].value and v253.rage.aimbot.double_tap[1]:get_hotkey())
            local v674 = v182.condition(a1_1773.a1, not v673, 8)
            v150.text(a1_1775, a1_1777, v144.text:alphen(v49.lerp(96, 255, v674)), "-", nil, v672)
        end
        return v671, v150.measure_text("-", v672)
    end),
                    x = 0,
                    a1 = {
    0
                    }
                },
    {
    0,
    (function(a1_1779, a1_1781, a1_1783)
        local v675 = v253.rage.aimbot.force_baim:get()
        local v676 = "BA"
        if (a1_1779[1] > 0) then
            v150.text(a1_1781, a1_1783, v144.text, "-", nil, v676)
        end
        return v675, v150.measure_text("-", v676)
    end),
                    x = 0
                },
    {
    0,
    (function(a1_1785, a1_1787, a1_1789)
        local v677 = v253.rage.aimbot.force_sp:get()
        local v678 = "SP"
        if (a1_1785[1] > 0) then
            v150.text(a1_1787, a1_1789, v144.text, "-", nil, v678)
        end
        return v677, v150.measure_text("-", v678)
    end),
                    x = 0
                },
    {
    0,
    (function(a1_1791, a1_1793, a1_1795)
        local v679 = (v253.aa.angles.freestand.value and v253.aa.angles.freestand:get_hotkey())
        local v680 = "FS"
        if (a1_1791[1] > 0) then
            v150.text(a1_1793, a1_1795, v144.text, "-", nil, v680)
        end
        return v679, v150.measure_text("-", v680)
    end),
                    x = 0
                },
    {
    0,
    (function(a1_1797, a1_1799, a1_1801)
        local v681, v682 = v253.misc.ping_spike.hotkey:get()
        local v683 = ((v253.misc.ping_spike.value and v681) and (v682 ~= 0))
        local v684 = "PS"
        if (a1_1797[1] > 0) then
            v150.text(a1_1799, a1_1801, v144.text, "-", nil, v684)
        end
        return v683, v150.measure_text("-", v684)
    end),
                    x = 0
                },
    {
    0,
    (function(a1_1803, a1_1805, a1_1807)
        local v685 = v253.rage.other.duck:get()
        local v686 = "FD"
        if (a1_1803[1] > 0) then
            local v687 = ((v257.valid and v54.get_prop(v257.self, "m_flDuckAmount")) or 0)
            v150.text(a1_1805, a1_1807, v144.text:lerp(v144.accent, v687), "-", nil, v686)
        end
        return v685, v150.measure_text("-", v686)
    end),
                    x = 0
                }
            }
        function v640.update(a1_1809)
            if (v257.valid and (v54.get_prop(v257.self, "m_bIsScoped") == 1)) then
                if (not a1_1809.data.scope.reserved and (v257.side ~= 0)) then
                    a1_1809.data.scope.target, a1_1809.data.scope.reserved = -v257.side, true
                end
            else
                a1_1809.data.scope.target, a1_1809.data.scope.reserved = 0, false
            end
            a1_1809.data.scope.side = v182.lerp(v640.data.scope.side, v640.data.scope.target, 12)
            return v182.condition(v640.progress, ((v284.visuals.crosshair.on.value and v257.valid) and not v257.in_score))
        end
        function v640.paint(a1_1811, a1_1813, a1_1815, a1_1817, a1_1819)
            v640:enumerate()
        end
        local v688 = {
                watermark = v239.new("watermark", (v146 - 24), 24, 160, 24, {
        rulers = { { true, x_y_1.x, 0, v149 }, { false, 0, (v149 - 32), v148 }, { false, 0, 32, v148 } },
        on_release = function(a1_1821, a1_1823)
            local v689 = (v146 / 3)
            local v690 = (a1_1821.x + (a1_1821.w * 0.5))
            local v691 = v49.floor((v690 / v689))
            if (v691 == a1_1821.align) then
                return
            end
            a1_1821.align = v691
            if (a1_1821.align == 1) then
                a1_1821:set_position(v690)
                a1_1821.x = (a1_1821.x - (a1_1821.w * 0.5))
            elseif (a1_1821.align == 2) then
                a1_1821:set_position((a1_1821.x + a1_1821.w))
                a1_1821.x = (a1_1821.x - a1_1821.w)
            end
            a1_1823.config.a:set(v691)
        end,
        on_held = function(a1_1825, a1_1827)
            a1_1825.align = 0
            a1_1827.config.a:set(0)
        end,
    })
            }
        v688.watermark.align, v688.watermark.logop, v688.watermark.logo = 2, { 0 }, 0
        v688.watermark.__drag.config.a = v63.slider("MISC", "Settings", "watermark:align", 0, 2, v688.watermark.align)
        v688.watermark.__drag.config.a:set_visible(false)
        v688.watermark.__drag.config.a:set_callback(function(a1_1829)
            v688.watermark.align = a1_1829.value
        end, true)
        v688.watermark.items = {
    {
    0,
    (function(a1_1831, a1_1833, a1_1835)
        local v692 = v284.visuals.water.name:get()
        local v693 = v50.format((((var_0_1.build == "stable") and "%s") or "%s %s%02x— %s"), (((v692 ~= "") and v692) or var_0_1.user), v144.hexs, ((v150.get_alpha() * a1_1831[1]) * 255), var_0_1.build)
        local v694, v695 = v150.measure_text("", v693)
        if (a1_1831[1] > 0) then
            v150.blur(a1_1833, (a1_1835 + 1), (v694 + 16), 22, 1, 8)
            v150.rectangle(a1_1833, (a1_1835 + 1), (v694 + 16), 22, v144.panel.l1, 4)
            v150.text((a1_1833 + 8), (a1_1835 + 6), v144.text, nil, nil, v693)
        end
        return true, (v694 + 16)
    end),
    {
                    }
                },
    {
    0,
    (function(a1_1837, a1_1839, a1_1841)
        local v696, v697 = v52.system_time()
        local v698 = v50.format("%02d:%02d", v696, v697)
        local v699, v700 = v150.measure_text("", v698)
        if (a1_1837[1] > 0) then
            v150.blur(a1_1839, (a1_1841 + 1), (v699 + 16), 22, 1, 8)
            v150.rectangle(a1_1839, (a1_1841 + 1), (v699 + 16), 22, v144.panel.l1, 4)
            v150.text((a1_1839 + 8), (a1_1841 + 6), v144.text, nil, nil, v698)
        end
        return true, (v699 + 16)
    end),
    {
                    }
                },
    {
    0,
    (function(a1_1843, a1_1845, a1_1847)
        local v701 = (v52.latency() * 1000)
        local v702 = v50.format("%dms", v701)
        local v703, v704 = v150.measure_text("", v702)
        if (a1_1843[1] > 0) then
            v150.blur(a1_1845, (a1_1847 + 1), (v703 + 16), 22, 1, 8)
            v150.rectangle(a1_1845, (a1_1847 + 1), (v703 + 16), 22, v144.panel.l1, 4)
            v150.text((a1_1845 + 8), (a1_1847 + 6), v144.text, nil, nil, v702)
        end
        return (v701 > 5), (v703 + 16)
    end),
    {
                    }
                }
            }
        function v688.watermark.enumerate(a1_1849)
            local v705 = (a1_1849.logo * 68)
            for iter_378_0, iter_378_1 in ipairs(a1_1849.items) do
                v150.push_alpha(iter_378_1[1])
                local v706, v707 = iter_378_1[2](iter_378_1, (a1_1849.x + v705), a1_1849.y)
                v150.pop_alpha()
                iter_378_1[1] = v182.condition(iter_378_1[3], v706)
                v705 = (v705 + ((v707 + 2) * iter_378_1[1]))
            end
            a1_1849.w = v182.lerp(a1_1849.w, v705, nil, 0.5)
        end
        function v688.watermark.update(a1_1851)
            local v708, v709 = a1_1851:get_position()
            if (a1_1851.align == 2) then
                a1_1851.x = (v708 - (a1_1851.w * a1_1851.alpha))
            elseif (a1_1851.align == 1) then
                a1_1851.x = (v708 - (a1_1851.w * 0.5))
            end
            return v182.condition(a1_1851.progress, v284.visuals.water.on.value, 3)
        end
        function v688.watermark.paint(a1_1853, a1_1855, a1_1857, a1_1859, a1_1861)
            a1_1853.logo = v182.condition(a1_1853.logop, not v284.visuals.water.hide.value)
            if (a1_1853.logo > 0) then
                local v710 = 64
                v150.push_alpha(a1_1853.logo)
                v150.blur(a1_1855, a1_1857, v710, a1_1861, 1, 8)
                v150.rounded_side_v(a1_1855, a1_1857, v710, a1_1861, v144.panel.g1, 4)
                v150.rectangle((a1_1855 + v710), a1_1857, 2, a1_1861, v144.panel.g1)
                v150.logo((a1_1855 + 8), (a1_1857 + 5))
                v150.edge_v((a1_1855 + v710), a1_1857, 24)
                v150.pop_alpha()
            end
            a1_1853:enumerate()
        end
        v688.damage = v239.new("damage", (x_y.x + 4), (x_y.y + 4), 6, 4, { border = { (x_y_1.x - 40), (x_y_1.y - 40), (x_y_1.x + 40), (x_y_1.y + 40), true } })
        v688.damage.dmg = v253.rage.aimbot.damage.value
        v688.damage.ovr_alpha = 0
        v688.damage.ovr_alpha_p = { 0 }
        function v688.damage.update(a1_1863)
            if not v284.visuals.damage.value then
                return v182.condition(a1_1863.progress, false, -4)
            end
            local v711 = (v253.rage.aimbot.damage_ovr[1].value and v253.rage.aimbot.damage_ovr[1]:get_hotkey())
            local v712 = ((v711 and v253.rage.aimbot.damage_ovr[2].value) or v253.rage.aimbot.damage.value)
            a1_1863.dmg = v182.lerp(a1_1863.dmg, v712, 16)
            a1_1863.ovr_alpha = v182.condition(v688.damage.ovr_alpha_p, v711, -8)
            local v713 = v257.weapon_t
            local v714 = ((v713 and (v713.weapon_type_int ~= 9)) and (v713.weapon_type_int ~= 0))
            return v182.condition(a1_1863.progress, (((v257.valid and (v714 or v63.menu_open)) and not v257.in_score) and v257.in_game), -8)
        end
        function v688.damage.paint(a1_1865, a1_1867, a1_1869, a1_1871, a1_1873)
            local v715 = v49.round(a1_1865.dmg)
            v715 = ((((v715 == 0) and "A") or ((v715 > 100) and ("+" .. (v715 - 100)))) or tostring(v715))
            a1_1865.w, a1_1865.h = v150.measure_text("-", v715)
            a1_1865.h, a1_1865.w = (a1_1865.h - 3), (a1_1865.w + 1)
            v150.text((a1_1867 - 1), (a1_1869 - 2), v144.text:alphen(v49.lerp(96, 255, a1_1865.ovr_alpha)), "-", nil, v715)
        end
        v688.arrows = v239.new("arrows", (x_y.x - 32), (x_y.y - 5), 10, 10, {
        border = { (x_y_1.x - 120), (x_y_1.y + 1), (x_y_1.x - 10), (x_y_1.y + 1) },
        rulers = { { false, (x_y_1.x - 120), x_y_1.y, 110 } },
    })
        v688.arrows.leftp, v688.arrows.rightp = { 0 }, { 0 }
        function v688.arrows.update(a1_1875)
            return v182.condition(a1_1875.progress, ((v284.visuals.arrows.value and v257.in_game) and v257.valid))
        end
        function v688.arrows.paint(a1_1877, a1_1879, a1_1881, a1_1883, a1_1885)
            local v716 = ((v63.menu_open and v144.white:alphen(128)) or v144.null)
            local v717 = v182.condition(v688.arrows.leftp, (v369.data.manual_yaw == -90), 6)
            v150.texture(v191.manual, a1_1879, a1_1881, 10, 10, v716:lerp(v144.accent, v717), "f")
            local v718 = v182.condition(v688.arrows.rightp, (v369.data.manual_yaw == 90), 6)
            v150.texture(v191.manual, ((v146 - a1_1879) + 1), a1_1881, -10, 10, v716:lerp(v144.accent, v718), "f")
        end
        v688.slowdown = v239.new("slowdown", (x_y.x - 60), (x_y.y - 160), 120, 32, { rulers = { { true, x_y_1.x, 0, v149 } } })
        v688.slowdown.speed = 0.5
        function v688.slowdown.update(a1_1887)
            if (not v284.visuals.slowdown.value or not v257.valid) then
                return v182.condition(a1_1887.progress, false, -4)
            end
            a1_1887.speed = v54.get_prop(v257.self, "m_flVelocityModifier")
            return v182.condition(a1_1887.progress, (v63.menu_open or (v257.valid and (a1_1887.speed < 1))), -8)
        end
        function v688.slowdown.paint(a1_1889, a1_1891, a1_1893, a1_1895, a1_1897)
            local v719 = v116.rgb(240, 60, 60):lerp(v144.text, a1_1889.speed)
            v150.blur((a1_1891 + 36), (a1_1893 + 1), (a1_1895 - 36), (a1_1897 - 2))
            v150.rectangle((a1_1891 + 36), (a1_1893 + 1), (a1_1895 - 36), (a1_1897 - 2), v144.panel.l1, 4)
            v150.blur(a1_1891, a1_1893, 32, a1_1897, 1, 8)
            v150.rounded_side_v(a1_1891, a1_1893, 32, a1_1897, v144.panel.g1, 4)
            v150.rectangle((a1_1891 + 32), a1_1893, 2, a1_1897, v144.panel.g1)
            v150.texture(v191.warning, (a1_1891 + 8), (a1_1893 + 8), 16, 16, v719)
            v150.edge_v((a1_1891 + 32), a1_1893, a1_1897)
            v150.text((a1_1891 + 44), (a1_1893 + 6), v144.text:alphen((((1 - a1_1889.speed) * 196) + 64)), nil, nil, "slowed")
            v150.text(((a1_1891 + a1_1895) - 8), (a1_1893 + 6), v719, "r", nil, v50.format("%d%%", (a1_1889.speed * 100)))
            v150.rectangle((a1_1891 + 44), (a1_1893 + 21), 67, 2, v144.white:alphen(32))
            v150.rectangle((a1_1891 + 44), (a1_1893 + 21), (a1_1889.speed * 67), 2, v144.accent:alphen(((a1_1889.speed * 196) + 58)))
        end
        v688.logs = v239.new("logs", (x_y.x - 150), (x_y.y + 160), 300, 32, { rulers = { { true, x_y_1.x, 0, v149 } } })
        v688.logs.align_p, v688.logs.preview_p = { 0 }, { 0 }
        v688.logs.preview, v688.logs.dummy = false, {
        {
        text = "\aA3D350\x01•\aE6E6E6\x02 Killed\aE6E6E6\x02 \aE6E6E6\x02\aE6E6E6\x01maj0r\aE6E6E6\x02 in \aE6E6E6\x02\aE6E6E6\x01head\aE6E6E6\x02\aE6E6E6\x02",
        event = "hit",
        time = v49.huge,
        progress = { 0 },
    },
        {
        text = "\aA67CCF\x01•\aE6E6E6\x02 Missed\aE6E6E6\x02 \aE6E6E6\x01enQ\aE6E6E6\x02's\aE6E6E6\x01 head\aE6E6E6\x02 due to \aE6E6E6\x01unpredicted occasion",
        event = "miss",
        time = v49.huge,
        progress = { 0 },
    },
        {
        text = "\ad35050\x01•\aE6E6E6\x02 Harmed by\aE6E6E6\x02 \aE6E6E6\x01enQ\aE6E6E6\x02 in \aE6E6E6\x01head\aE6E6E6\x02 for \aE6E6E6\x0172",
        event = "harm",
        time = v49.huge,
        progress = { 0 },
    },
    }
        function v688.logs.update(a1_1899)
            return v182.condition(a1_1899.progress, ((v284.misc.logs.on.value and v284.misc.logs.output:get("Screen")) and v257.in_game))
        end
        function v688.logs.part(a1_1901, a1_1903, a1_1905, a1_1907, a1_1909, a1_1911)
            local v720 = v50.gsub(a1_1903.text, "[\x01\x02]", {
        ["\x01"] = v50.format("%02x", ((a1_1907 * v150.get_alpha()) * 255)),
        ["\x02"] = v50.format("%02x", ((a1_1907 * v150.get_alpha()) * 128)),
    })
            local v721, v722 = v150.measure_text("", v720)
            local v723 = v49.lerp((((a1_1901.x + (a1_1901.w * 0.5)) - (v721 * 0.5)) - 18), a1_1901.x, a1_1901.align)
            local v724 = a1_1905
            if not a1_1909 then
                v723 = (v723 + (((1 - a1_1907) * (v721 * 0.5)) * ((((a1_1911 % 2) == 0) and -1) or 1)))
            end
            v150.blur(v723, v724, 24, 24)
            v150.rounded_side_v(v723, v724, 24, 24, v144.panel.g1, 4)
            v150.rectangle((v723 + 24), v724, 2, 24, v144.panel.g1)
            v150.edge_v((v723 + 24), v724, 24)
            v150.blur((v723 + 28), (v724 + 1), (v721 + 14), 22)
            v150.rectangle((v723 + 28), (v724 + 1), (v721 + 14), 22, v144.panel.l1, 4)
            v150.texture(v191.mini_bfly, (v723 + 8), (v724 + 8), 9, 9, v144.accent)
            v150.text((v723 + 35), (v724 + 5), v144.text:alphen(128), nil, nil, v720)
        end
        function v688.logs.paint(a1_1913, a1_1915, a1_1917, a1_1919, a1_1921)
            if not v284.misc.logs.on.value then
                return
            end
            local v725
            a1_1913.align = v182.condition(v688.logs.align_p, (a1_1913.x < (v146 / 3)))
            a1_1913.preview = v182.condition(v688.logs.preview_p, ((v63.menu_open and v284.misc.logs.output:get("Screen")) and (#v505.list == 0)))
            a1_1917 = (a1_1917 + 4)
            local v726 = (((a1_1913.preview > 0) and a1_1913.dummy) or v505.list)
            for iter_389_0 = 1, #v726, 1 do
                local v727 = v726[iter_389_0]
                local v728 = (((v56.realtime() - v727.time) < 4) and (iter_389_0 < 10))
                local v729 = v182.condition(v727.progress, fn9((a1_1913.preview > 0), (a1_1913.preview == 1), v728))
                if (v729 == 0) then
                    v725 = iter_389_0
                end
                v150.push_alpha(v729)
                a1_1913:part(v727, a1_1917, v729, v728, iter_389_0)
                v150.pop_alpha()
                a1_1917 = (a1_1917 + (28 * ((v728 and v729) or 1)))
            end
            if v725 then
                v48.remove(v505.list, v725)
            end
        end
        v688.keylist = v239.new("keylist", (x_y.x - 400), x_y.y, 120, 22, true)
        v688.keylist.binds = {
    {
                    name = "Minimum damage",
                    ref = v253.rage.aimbot.damage_ovr[1],
                    state = (function()
        return v253.rage.aimbot.damage_ovr[2].value
    end)
                },
    {
                    name = "Double tap",
                    ref = v253.rage.aimbot.double_tap[1]
                },
    {
                    name = "Hide shots",
                    ref = v253.aa.other.onshot
                },
    {
                    name = "Quick peek",
                    ref = v253.rage.other.peek
                },
    {
                    name = "Defensive snap",
                    ref = v284.antiaim.def.snap.on
                },
    {
                    name = "Manual yaw",
                    ref = (function()
        return v369.data.manual_yaw
    end),
                    state = (function()
        return ((((v369.data.manual_yaw == -90) and "left") or ((v369.data.manual_yaw == 90) and "right")) or "~")
    end)
                },
    {
                    name = "Edge yaw",
                    ref = v253.aa.angles.edge
                },
    {
                    name = "Freestanding",
                    ref = v253.aa.angles.freestand
                }
            }
        v688.keylist:enlist(function()
            local v730 = {}
            for iter_393_0 = 1, #v688.keylist.binds, 1 do
                local v731 = v688.keylist.binds[iter_393_0]
                local v732 = false
                local v733 = "on"
                if (type(v731.ref) == "function") then
                    v732 = v731.ref()
                elseif (v731.ref ~= nil) then
                    v732 = v731.ref.value
                    if v731.ref.hotkey then
                        local v734, v735 = v731.ref.hotkey:get()
                        v732 = ((v732 and v734) and (v735 ~= 0))
                    end
                end
                if v731.state then
                    if (type(v731.state) == "function") then
                        v733 = v731.state()
                    else
                        v733 = v731.state
                    end
                end
                v730[iter_393_0] = { name = v731.name, active = v732, state = v733 }
            end
            return v730
        end, function(a1_1923, a1_1925, a1_1927, a1_1929)
            local v736 = (a1_1923.x + 4)
            local v737 = ((a1_1923.y + a1_1927) + ((a1_1923.h + 6) * a1_1929))
            local v738 = (a1_1923.w - 8)
            local v739 = 20
            v150.blur(v736, v737, v738, v739)
            v150.rectangle(v736, v737, v738, v739, v144.panel.l1, 4)
            v150.text((v736 + 6), (v737 + 3), v144.text, nil, nil, a1_1925.name)
            v150.text(((v736 + v738) - 6), (v737 + 3), v144.accent, "r", nil, a1_1925.state)
            return (v150.measure_text(nil, (a1_1925.name .. a1_1925.state)) + 32), (v739 + 2)
        end)
        function v688.keylist.update(a1_1931)
            return v182.condition(a1_1931.progress, (v284.visuals.keylist.value and (v63.menu_open or (a1_1931.__list.active > 0))))
        end
        function v688.keylist.paint(a1_1933, a1_1935, a1_1937, a1_1939, a1_1941)
            v150.blur(a1_1935, a1_1937, a1_1939, a1_1941)
            v150.rounded_side_h(a1_1935, a1_1937, a1_1939, a1_1941, v144.panel.g1, 4)
            v150.edge_h(a1_1935, (a1_1937 + a1_1941), a1_1939)
            v150.text((a1_1935 + (a1_1939 * 0.5)), (a1_1937 + 11), v144.text, "c", nil, "Hotkeys")
        end
        v688.speclist = v239.new("speclist", (x_y.x - 400), x_y.y, 120, 22, true)
        v688.speclist:enlist(function()
            local v740 = {}
            if v257.valid then
                local v741
                local v742 = v54.get_prop(v257.self, "m_hObserverTarget")
                local v743 = v54.get_prop(v257.self, "m_iObserverMode")
                if (v742 and ((v743 == 4) or (v743 == 5))) then
                    v741 = v742
                else
                    v741 = v257.self
                end
                for iter_397_0 = 1, 64, 1 do
                    if ((v54.get_classname(iter_397_0) == "CCSPlayer") and (iter_397_0 ~= v257.self)) then
                        local v744 = v54.get_prop(iter_397_0, "m_hObserverTarget")
                        local v745 = v54.get_prop(iter_397_0, "m_iObserverMode")
                        v740[(#v740 + 1)] = {
            name = iter_397_0,
            nick = v50.limit(v54.get_player_name(iter_397_0), 20, "..."),
            active = ((v744 and (v744 == v741)) and ((v745 == 4) or (v745 == 5))),
        }
                    end
                end
            end
            return v740
        end, function(a1_1943, a1_1945, a1_1947, a1_1949)
            local v746 = (a1_1943.x + 4)
            local v747 = ((a1_1943.y + a1_1947) + ((a1_1943.h + 6) * a1_1949))
            local v748 = (a1_1943.w - 8)
            local v749 = 20
            v150.blur(v746, v747, v748, v749)
            v150.rectangle(v746, v747, v748, v749, v144.panel.l1, 4)
            v150.text((v746 + 6), (v747 + 3), v144.text, nil, nil, a1_1945.nick)
            return (v150.measure_text(nil, a1_1945.nick) + 32), (v749 + 2)
        end)
        function v688.speclist.update(a1_1951)
            return v182.condition(a1_1951.progress, (v284.visuals.speclist.value and (v63.menu_open or (a1_1951.__list.active > 0))))
        end
        function v688.speclist.paint(a1_1953, a1_1955, a1_1957, a1_1959, a1_1961)
            v150.blur(a1_1955, a1_1957, a1_1959, a1_1961)
            v150.rounded_side_h(a1_1955, a1_1957, a1_1959, a1_1961, v144.panel.g1, 4)
            v150.edge_h(a1_1955, (a1_1957 + a1_1961), a1_1959)
            v150.text((a1_1955 + (a1_1959 * 0.5)), (a1_1957 + 11), v144.text, "c", nil, v50.format("Spectators (%d)", a1_1953.__list.active))
        end
        local function fn43()
            if (v284.visuals.water.on.value or (v688.watermark.alpha > 0)) then
                v688.watermark()
            end
            if (v284.visuals.damage.value or (v688.damage.alpha > 0)) then
                v688.damage()
            end
            if (v284.visuals.arrows.value or (v688.arrows.alpha > 0)) then
                v688.arrows()
            end
            if (v284.visuals.slowdown.value or (v688.slowdown.alpha > 0)) then
                v688.slowdown()
            end
            if ((v284.misc.logs.on.value and v284.misc.logs.output:get("Screen")) or (v688.logs.alpha > 0)) then
                v688.logs()
            end
            if (v284.visuals.speclist.value or (v688.speclist.alpha > 0)) then
                v688.speclist()
            end
            if (v284.visuals.keylist.value or (v688.keylist.alpha > 0)) then
                v688.keylist()
            end
            if (v284.visuals.crosshair.on.value or (v640.alpha > 0)) then
                v640()
            end
        end
        v109.paint_ui:set(fn43)
        if not v46 then
            local completing_state = { completing = false, state = true, progress = { { 0 }, { 0 }, { 0 } } }
            function completing_state.render()
                local v750 = v182.condition(completing_state.progress[1], completing_state.state, 2)
                local v751 = v182.condition(completing_state.progress[2], (v750 == 1), 2)
                v150.rectangle(0, 0, v146, v147, v144.back:alphen((v750 * 180)))
                local v752 = 400
                v150.texture(v191.butterfly, (x_y.x - (v752 * 0.5)), (x_y.y - (v752 * 0.5)), v752, v752, v144.accent:alphen((v751 * 255)))
                if not completing_state.completing then
                    v52.delay_call(3, function()
            if completing_state then
                completing_state.state = false
            end
        end)
                    completing_state.completing = true
                end
            end
            v52.delay_call(1, function()
            v109.paint_ui:set(completing_state.render)
        end)
            v52.delay_call(6, function()
            v109.paint_ui:unset(completing_state.render)
            completing_state = nil
        end)
        end
    end)()
    v324.system = v63.setup(v284)
