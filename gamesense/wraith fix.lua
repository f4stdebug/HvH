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

    local ffi = require('ffi')
    local bit = require('bit')
    local vector = require("vector")
    local v21 = (require("gamesense/antiaim_funcs") or error("https://gamesense.pub/forums/viewtopic.php?id=29665"))
    local surface = require("gamesense/surface")
    local v22 = (require("gamesense/base64") or error("Base64 library required"))
    local v23 = (require("gamesense/clipboard") or error("Clipboard library required"))
    local require, pcall, ipairs, pairs, unpack, tonumber, tostring, toticks, totime = require, pcall, ipairs, pairs, unpack, tonumber, tostring, toticks, totime
    local ffi_1 = {
    new = ffi.new,
    typeof = ffi.typeof,
    cast = ffi.cast,
    cdef = ffi.cdef,
    sizeof = ffi.sizeof,
    string = ffi.string,
}
    local panorama = { loadstring = panorama.loadstring, open = panorama.open }
    local plist = { get = plist.get, set = plist.set }
    local config = { export = config.export, import = config.import, load = config.load }
    local database = { flush = database.flush, read = database.read, write = database.write }
    local bit_2 = {
    arshift = bit.arshift,
    band = bit.band,
    bnot = bit.bnot,
    bor = bit.bor,
    bswap = bit.bswap,
    bxor = bit.bxor,
    lshift = bit.lshift,
    rol = bit.rol,
    ror = bit.ror,
    rshift = bit.rshift,
    tobit = bit.tobit,
    tohex = bit.tohex,
}
    local string = {
    byte = string.byte,
    char = string.char,
    find = string.find,
    format = string.format,
    gmatch = string.gmatch,
    gsub = string.gsub,
    len = string.len,
    lower = string.lower,
    match = string.match,
    rep = string.rep,
    reverse = string.reverse,
    sub = string.sub,
    upper = string.upper,
}
    local math = {
    abs = math.abs,
    acos = math.acos,
    asin = math.asin,
    atan = math.atan,
    atan2 = math.atan2,
    ceil = math.ceil,
    cos = math.cos,
    cosh = math.cosh,
    deg = math.deg,
    exp = math.exp,
    floor = math.floor,
    fmod = math.fmod,
    frexp = math.frexp,
    ldexp = math.ldexp,
    log = math.log,
    log10 = math.log10,
    max = math.max,
    min = math.min,
    modf = math.modf,
    pow = math.pow,
    rad = math.rad,
    random = math.random,
    randomseed = math.randomseed,
    sin = math.sin,
    sinh = math.sinh,
    sqrt = math.sqrt,
    tan = math.tan,
    tanh = math.tanh,
    pi = math.pi,
}
    local ui = {
    get = ui.get,
    is_menu_open = ui.is_menu_open,
    menu_size = ui.menu_size,
    menu_position = ui.menu_position,
    mouse_position = ui.mouse_position,
    name = ui.name,
    new_button = ui.new_button,
    new_checkbox = ui.new_checkbox,
    new_color_picker = ui.new_color_picker,
    new_combobox = ui.new_combobox,
    new_hotkey = ui.new_hotkey,
    new_label = ui.new_label,
    new_listbox = ui.new_listbox,
    new_multiselect = ui.new_multiselect,
    new_slider = ui.new_slider,
    new_string = ui.new_string,
    new_textbox = ui.new_textbox,
    reference = ui.reference,
    set = ui.set,
    set_callback = ui.set_callback,
    set_visible = ui.set_visible,
    update = ui.update,
}
    local renderer = {
    blur = renderer.blur,
    circle = renderer.circle,
    circle_outline = renderer.circle_outline,
    gradient = renderer.gradient,
    indicator = renderer.indicator,
    line = renderer.line,
    load_jpg = renderer.load_jpg,
    load_png = renderer.load_png,
    load_rgba = renderer.load_rgba,
    load_svg = renderer.load_svg,
    measure_text = renderer.measure_text,
    rectangle = renderer.rectangle,
    text = renderer.text,
    texture = renderer.texture,
    triangle = renderer.triangle,
    world_to_screen = renderer.world_to_screen,
}
    local globals = {
    absoluteframetime = globals.absoluteframetime,
    chokedcommands = globals.chokedcommands,
    commandack = globals.commandack,
    curtime = globals.curtime,
    framecount = globals.framecount,
    frametime = globals.frametime,
    lastoutgoingcommand = globals.lastoutgoingcommand,
    mapname = globals.mapname,
    maxplayers = globals.maxplayers,
    oldcommandack = globals.oldcommandack,
    realtime = globals.realtime,
    tickcount = globals.tickcount,
    tickinterval = globals.tickinterval,
}
    local entity = {
    get_all = entity.get_all,
    get_bounding_box = entity.get_bounding_box,
    get_classname = entity.get_classname,
    get_esp_data = entity.get_esp_data,
    get_game_rules = entity.get_game_rules,
    get_local_player = entity.get_local_player,
    get_origin = entity.get_origin,
    get_player_name = entity.get_player_name,
    get_player_resource = entity.get_player_resource,
    get_player_weapon = entity.get_player_weapon,
    get_players = entity.get_players,
    get_prop = entity.get_prop,
    get_steam64 = entity.get_steam64,
    hitbox_position = entity.hitbox_position,
    is_alive = entity.is_alive,
    is_dormant = entity.is_dormant,
    is_enemy = entity.is_enemy,
    new_prop = entity.new_prop,
    set_prop = entity.set_prop,
}
    local v24 = {
    camera_angles = _G.client.camera_angles,
    camera_position = _G.client.camera_position,
    color_log = _G.client.color_log,
    create_interface = _G.client.create_interface,
    current_threat = _G.client.current_threat,
    delay_call = _G.client.delay_call,
    draw_debug_text = _G.client.draw_debug_text,
    draw_hitboxes = _G.client.draw_hitboxes,
    error_log = _G.client.error_log,
    exec = _G.client.exec,
    eye_position = _G.client.eye_position,
    find_signature = _G.client.find_signature,
    fire_event = _G.client.fire_event,
    get_cvar = _G.client.get_cvar,
    get_model_name = _G.client.get_model_name,
    key_state = _G.client.key_state,
    latency = _G.client.latency,
    log = _G.client.log,
    random_float = _G.client.random_float,
    random_int = _G.client.random_int,
    real_latency = _G.client.real_latency,
    register_esp_flag = _G.client.register_esp_flag,
    reload_active_scripts = _G.client.reload_active_scripts,
    request_full_update = _G.client.request_full_update,
    scale_damage = _G.client.scale_damage,
    screen_size = _G.client.screen_size,
    set_clan_tag = _G.client.set_clan_tag,
    set_event_callback = _G.client.set_event_callback,
    system_time = _G.client.system_time,
    timestamp = _G.client.timestamp,
    trace_bullet = _G.client.trace_bullet,
    trace_line = _G.client.trace_line,
    unix_time = _G.client.unix_time,
    unset_event_callback = _G.client.unset_event_callback,
    update_player_list = _G.client.update_player_list,
    userid_to_entindex = _G.client.userid_to_entindex,
    visible = _G.client.visible,
}
    local v25 = ffi_1.typeof('void***')
    local v26 = (v24.create_interface('client.dll', 'VClientEntityList003') or error('VClientEntityList003 wasnt found', 2))
    local v27 = (ffi_1.cast(v25, v26) or error('rawientitylist is nil', 2))
    local v28 = (ffi_1.cast('void*(__thiscall*)(void*, int)', v27[0][3]) or error('get_client_entity is nil', 2))
    local v29 = (ffi_1.cast('void*(__thiscall*)(void*, int)', v27[0][0]) or error('get_client_networkable_t is nil', 2))
    ffi_1.cdef([[
    struct animation_layer_t {
        char  pad_0000[20];
        uint32_t m_nOrder; //0x0014
        uint32_t m_nSequence; //0x0018
        float m_flPrevCycle; //0x001C
        float m_flWeight; //0x0020
        float m_flWeightDeltaRate; //0x0024
        float m_flPlaybackRate; //0x0028
        float m_flCycle; //0x002C
        void *m_pOwner; //0x0030 // player's thisptr
        char  pad_0038[4]; //0x0034
    };

    struct animstate_t1 {
        char pad[ 3 ];
        char m_bForceWeaponUpdate; //0x4
        char pad1[ 91 ];
        void* m_pBaseEntity; //0x60
        void* m_pActiveWeapon; //0x64
        void* m_pLastActiveWeapon; //0x68
        float m_flLastClientSideAnimationUpdateTime; //0x6C
        int m_iLastClientSideAnimationUpdateFramecount; //0x70
        float m_flAnimUpdateDelta; //0x74
        float m_flEyeYaw; //0x78
        float m_flPitch; //0x7C
        float m_flGoalFeetYaw; //0x80
        float m_flCurrentFeetYaw; //0x84
        float m_flCurrentTorsoYaw; //0x88
        float m_flUnknownVelocityLean; //0x8C
        float m_flLeanAmount; //0x90
        char pad2[ 4 ];
        float m_flFeetCycle; //0x98
        float m_flFeetYawRate; //0x9C
        char pad3[ 4 ];
        float m_fDuckAmount; //0xA4
        float m_fLandingDuckAdditiveSomething; //0xA8
        char pad4[ 4 ];
        float m_vOriginX; //0xB0
        float m_vOriginY; //0xB4
        float m_vOriginZ; //0xB8
        float m_vLastOriginX; //0xBC
        float m_vLastOriginY; //0xC0
        float m_vLastOriginZ; //0xC4
        float m_vVelocityX; //0xC8
        float m_vVelocityY; //0xCC
        char pad5[ 4 ];
        float m_flUnknownFloat1; //0xD4
        char pad6[ 8 ];
        float m_flUnknownFloat2; //0xE0
        float m_flUnknownFloat3; //0xE4
        float m_flUnknown; //0xE8
        float m_flSpeed2D; //0xEC
        float m_flUpVelocity; //0xF0
        float m_flSpeedNormalized; //0xF4
        float m_flFeetSpeedForwardsOrSideWays; //0xF8
        float m_flFeetSpeedUnknownForwardOrSideways; //0xFC
        float m_flTimeSinceStartedMoving; //0x100
        float m_flTimeSinceStoppedMoving; //0x104
        bool m_bOnGround; //0x108
        bool m_bInHitGroundAnimation; //0x109
        char m_pad[2];
        float m_flJumpToFall;
        float m_flTimeSinceInAir; //0x10A
        float m_flLastOriginZ; //0x10E
        float m_flHeadHeightOrOffsetFromHittingGroundAnimation; //0x112
        float m_flStopToFullRunningFraction; //0x116
        char pad7[ 4 ]; //0x11A
        float m_flMagicFraction; //0x11E
        char pad8[ 60 ]; //0x122
        float m_flWorldForce; //0x15E
        char pad9[ 462 ]; //0x162
        float m_flMaxYaw; //0x334
    };

]])
    database.write("current_clip_board_to_save", "")
    local v30 = {}
    local v31 = {
    {
    'remove_search_path',
    '\x55\x8B\xEC\x81\xEC\xCC\xCC\xCC\xCC\x8B\x55\x08\x53\x8B\xD9',
    'void(__thiscall*)(void*, const char*, const char*)',
},
    {
    'remove_file',
    '\x55\x8B\xEC\x81\xEC\xCC\xCC\xCC\xCC\x8D\x85\xCC\xCC\xCC\xCC\x56\x50\x8D\x45\x0C',
    'void(__thiscall*)(void*, const char*, const char*)',
},
    {
    'find_next',
    '\x55\x8B\xEC\x83\xEC\x0C\x53\x8B\xD9\x8B\x0D\xCC\xCC\xCC\xCC',
    'const char*(__thiscall*)(void*, int)',
},
    { 'find_is_directory', '\x55\x8B\xEC\x0F\xB7\x45\x08', 'bool(__thiscall*)(void*, int)' },
    { 'find_close', '\x55\x8B\xEC\x53\x8B\x5D\x08\x85', 'void(__thiscall*)(void*, int)' },
    {
    'find_first',
    '\x55\x8B\xEC\x6A\x00\xFF\x75\x10\xFF\x75\x0C\xFF\x75\x08\xE8\xCC\xCC\xCC\xCC\x5D',
    'const char*(__thiscall*)(void*, const char*, const char*, int*)',
},
    {
    'get_current_directory',
    '\x55\x8B\xEC\x56\x8B\x75\x08\x56\xFF\x75\x0C',
    'bool(__thiscall*)(void*, char*, int)',
},
}
    local v32 = require('ffi')
    local function fn3(a1, a1_594, a1_596, a1_598)
        local v33 = (v24.create_interface(a1, a1_594) or error("invalid interface", 2))
        local v34 = (v24.find_signature(a1, a1_596) or error("invalid signature", 2))
        local v35, v36 = pcall(v32.typeof, a1_598)
        if not v35 then
            error(v36, 2)
        end
        local v37 = (v32.cast(v36, v34) or error("invalid typecast", 2))
        return function(...)
        return v37(v33, ...)
    end
    end
    for i38 = 1, #v31, 1 do
        local v39 = v31[i38]
        v30[v39[1]] = fn3('filesystem_stdio.dll', 'VFileSystem017', v39[2], v39[3])
    end
    local v40 = vtable_bind("filesystem_stdio.dll", "VFileSystem017", 11, "void(__thiscall*)(void*, const char*, const char*, int)")
    local v41 = "WRAITH_CONFIGS"
    local v42 = ffi_1.typeof("char[128]")()
    v30.get_current_directory(v42, ffi_1.sizeof(v42))
    local v43 = string.format('%s', ffi_1.string(v42))
    v40(v43, v41, 0)
    local function fn4()
        local v44, v45 = {}, ffi_1.typeof("int[1]")()
        local v46 = v30.find_first("*", v41, v45)
        while (v46 ~= nil) do
            local v47 = ffi_1.string(v46)
            if (not v30.find_is_directory(v45[0]) and v47:find('2124089493w.cfg')) then
                v44[(#v44 + 1)] = v47
            end
            v46 = v30.find_next(v45[0])
        end
        v30.find_close(v45[0])
        return v44
    end
    function update_cfg()
        local v48 = fn4()
        local v49 = {}
        for i50 = 1, #v48, 1 do
            v49[i50] = v48[i50]:gsub('2124089493w.cfg', "")
        end
        return v49
    end
    local v51 = vtable_bind("vgui2.dll", "VGUI_System010", 22, "bool(__thiscall*)(void*, const char*)")
    local attack_use = { attack = bit_2.lshift(1, 0), use = bit_2.lshift(1, 5) }
    local v52 = ffi_1.typeof("struct { float pitch; float yaw; float roll; }")
    local v53 = ffi_1.typeof("struct { float x; float y; float z; }")
    local v54 = ffi_1.typeof([[
        struct
        {
            uintptr_t vfptr;
            int command_number;
            int tick_count;
            $ viewangles;
            $ aimdirection;
            float forwardmove;
            float sidemove;
            float upmove;
            int buttons;
            uint8_t impulse;
            int weaponselect;
            int weaponsubtype;
            int random_seed;
            short mousedx;
            short mousedy;
            bool hasbeenpredicted;
            $ headangles;
            $ headoffset;
        }
        ]], v52, v53, v52, v53)
    local v55 = ffi_1.typeof("$* (__thiscall*)(uintptr_t ecx, int nSlot, int sequence_number)", v54)
    local v56 = ffi_1.typeof([[
        struct
        {
            uintptr_t padding[8];
            $ GetUserCmd;
        }
        ]], v55)
    local v57 = ffi_1.typeof([[
        struct
        {
            $* vfptr;
        }*
        ]], v56)
    local v58 = ffi_1.cast(v57, ffi_1.cast("uintptr_t**", (tonumber(ffi_1.cast("uintptr_t", (v24.find_signature("client.dll", "\xB9\xCC\xCC\xCC\xCC\x8B\x40\x38\xFF\xD0\x84\xC0\x0F\x85") or error("client.dll!:input not found.")))) + 1))[0])
    local v59 = {
    reset_once = false,
    hitgroup_names = {
    [0] = "body",
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
},
    fire_total_hits = 0,
    post_total_hits = 0,
    current_condition = "",
    mode = "back",
    is_defensive_running = false,
    banana = false,
    old_tick_count = 0,
    yaw_increment_spin = 0,
    tickbase_max,
    tickbase_diff,
    current_cmd,
    bomb_defused = false,
    bomb_exploded = false,
    pulse = 240,
    started = 10,
    smooth_wraith = 0,
    smooth_dt = 0,
    smooth_os = 0,
    smooth_pc = 0,
    smooth_bo = 0,
    current_desync = 0,
    fake_fakelag = 0,
    cur = 0,
    is_defusing = false,
    desync_rect_dist = 0,
    dt_os_text_anim = 0,
    current_cond_text_anim = 0,
    smooth_wraith_recode = 0,
    smooth_dt_2 = 0,
    smooth_stance = 0,
    dt_vertical_dist = 0,
    jumping = false,
    on_ground = false,
    rage_fired = false,
    last_jump_ducked = false,
    landing = false,
    waiting_scan_text = 0,
    hittable = false,
    defensive_risk = 0,
    smooth_defensive_bar = 0,
    smooth_left_arrow = 0,
    smooth_right_arrow = 0,
    smooth_up_arrow = 0,
    smooth_arrow_alpha = 0,
}
    local v60 = { cur = {}, prev = {}, pre_prev = {}, pre_pre_prev = {} }
    local v61 = {}
    local v62 = {}
    for i63 = 1, 64, 1 do
        v62[i63] = { stand = {}, stand_type = {}, run = {}, run_type = {}, air = {}, air_type = {}, duck = {}, duck_type = {} }
    end
    local user_build = { ["user"] = "crack", ["build"] = "recode" }
    local v64 = ui.new_checkbox("AA", "Anti-aimbot angles", ("wraith - " .. string.lower(user_build["user"])))
    local v65 = nil
    local v66 = nil
    local v67 = nil
    local v68 = nil
    local v69 = { "anti-aim", "anti-aim 2", "visuals", "misc", "config", "debug" }
    local v70 = {}
    local v71 = {}
    local v72 = {
    "global",
    "standing",
    "moving",
    "slow motion",
    "in air",
    "in air duck",
    "in duck",
    "in duck moving",
    "in fake duck",
    "fakelag",
    "manual",
    "freestanding",
    "backstab",
    "height",
    "high distance",
    "legit",
}
    local v73 = {
    ["lua"] = "",
    ["star"] = "",
    ["lock"] = "",
    ["arrows"] = "",
    ["pizza"] = "",
    ["up arrow"] = "",
    ["cpu"] = "",
    ["smilie"] = "",
    ["heart"] = "",
}
    local v74 = {
    le_icon = "a",
    tabs_names = { "", "⑵", "", "", "", "F" },
    tab = {},
    selected_tab = 0,
    selected_color = { { 20, 20, 20, 255 }, { 210, 210, 210, 255 } },
    is_open = true,
    menu_alpha = 255,
    is_hovered = false,
    height = 68,
    dpi_scaling_y = { { 84, 149 }, { 100, 181 }, { 116, 213 }, { 132, 245 }, { 148, 277 } },
    selected_gs_tab = false,
    mouse_press = false,
    old_mpos = { 0, 0 },
}
    local v75 = false
    local v76 = false
    local v77 = { ["100%"] = 68, ["125%"] = 75, ["150%"] = 85, ["175%"] = 95, ["200%"] = 105 }
    local v78 = {
    tab = ui.new_combobox("AA", "Anti-aimbot angles", "\n", v69),
    ["anti-aim"] = {
    [0] = ui.new_combobox("AA", "Anti-aimbot angles", "type", "gamesense", "wraith (dont use)"),
    [1] = ui.new_combobox("AA", "Anti-aimbot angles", "condition", v72),
},
    ["anti-aim 2"] = {
    [0] = ui.new_multiselect("AA", "Anti-aimbot angles", "add features", "other anti-aim binds", "manual anti-aim"),
    [1] = ui.new_hotkey("AA", "Anti-aimbot angles", "edge-yaw"),
    [2] = ui.new_hotkey("AA", "Anti-aimbot angles", "freestanding"),
    [3] = ui.new_checkbox("AA", "Anti-aimbot angles", "manual anti-aim"),
    [4] = ui.new_hotkey("AA", "Anti-aimbot angles", "left"),
    [8] = ui.new_slider("AA", "Anti-aimbot angles", "\n left angle", 0, 145, 90, true, "°", 1, {}),
    [5] = ui.new_hotkey("AA", "Anti-aimbot angles", "right"),
    [9] = ui.new_slider("AA", "Anti-aimbot angles", "\n right angle", 0, 145, 90, true, "°", 1, {}),
    [6] = ui.new_hotkey("AA", "Anti-aimbot angles", "forward"),
    [7] = ui.new_hotkey("AA", "Anti-aimbot angles", "reset"),
},
    ["visuals"] = {
    [0] = ui.new_combobox("AA", "Anti-aimbot angles", "indicators", "off", "minimal (og)", "anti urine", "recode alpha"),
    [1] = ui.new_color_picker("AA", "Anti-aimbot angles", "anti-aim indicators", 200, 200, 255, 255),
    [6] = ui.new_multiselect("AA", "Anti-aimbot angles", "indicator extras", "animations on scope", "lowercase", "min damage", "desync", "defensive"),
    [3] = ui.new_combobox("AA", "Anti-aimbot angles", "indicators size", "small", "thin", "bold", "blind"),
    [2] = ui.new_checkbox("AA", "Anti-aimbot angles", "watermark"),
    [4] = ui.new_combobox("AA", "Anti-aimbot angles", "size", "small", "thin", "bold", "blind"),
    [7] = ui.new_checkbox("AA", "Anti-aimbot angles", "notifications size"),
    [5] = ui.new_combobox("AA", "Anti-aimbot angles", "\n nigga", "small", "thin", "bold", "blind"),
    [8] = ui.new_combobox("AA", "Anti-aimbot angles", "extended teleport prediction", "off", "box", "circle"),
    [9] = ui.new_checkbox("AA", "Anti-aimbot angles", "manual anti-aim"),
    [10] = ui.new_color_picker("AA", "Anti-aimbot angles", "manual anti-aim", 200, 200, 200, 200),
},
    ["misc"] = {
    [6] = ui.new_hotkey("AA", "Anti-aimbot angles", "extended teleport"),
    [7] = ui.new_hotkey("AA", "Anti-aimbot angles", "extended teleport on hit"),
    [8] = ui.new_combobox("AA", "Anti-aimbot angles", "extended teleport hit risk", "high", "medium", "low", "safest"),
    [1] = ui.new_multiselect("AA", "Anti-aimbot angles", "custom animations", "pitch on land", "fallen legs", "moonwalk", "air walk", "blind", "fake walk", "earthquake", "slide", "fake duck", "smoothing"),
    [2] = ui.new_multiselect("AA", "Anti-aimbot angles", "notify", "fire", "damage", "miss", "hurt", "hurt self", "config changes"),
    [3] = ui.new_multiselect("AA", "Anti-aimbot angles", "type \n nots", "default", "center", "console"),
    [4] = ui.new_checkbox("AA", "Anti-aimbot angles", "trashtalk"),
    [5] = ui.new_checkbox("AA", "Anti-aimbot angles", "bypass anti trashtalk"),
},
    ["config"] = {
    [0] = ui.new_label("AA", "Anti-aimbot angles", "config"),
    [1] = ui.new_listbox("AA", "Anti-aimbot angles", "config_board", ""),
    [2] = ui.new_textbox("AA", "Anti-aimbot angles", "config names"),
    [8] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
    [7] = 0,
},
    ["debug"] = {
    [0] = ui.new_checkbox("AA", "Anti-aimbot angles", "alternative ui"),
    [4] = ui.new_combobox("AA", "Anti-aimbot angles", "debug tab icon", "lua", "star", "lock", "arrows", "pizza", "up arrow", "cpu", "smilie", "heart"),
    [2] = ui.new_checkbox("AA", "Anti-aimbot angles", "fps optimizations"),
    [3] = ui.new_multiselect("AA", "Anti-aimbot angles", "disable\n optiz", "3d sky", "fog", "shadows", "blood", "decals", "bloom", "other"),
    [1] = ui.new_combobox("AA", "Anti-aimbot angles", "anti-aim correction", "off", "desync"),
    [5] = ui.new_checkbox("AA", "Anti-aimbot angles", "on shot only (ragebot)"),
    [6] = ui.new_hotkey("AA", "Anti-aimbot angles", "\n on shot bind", true),
},
}
    ui.new_label("Players", "Adjustments", "wraith anti-aim stealer")
    steal_aa_toggle = ui.new_checkbox("Players", "Adjustments", "scan anti-aim")
    steal_aa_ignore = ui.new_checkbox("Players", "Adjustments", "ignore missing stances")
    for i79, i80 in pairs(v72) do
        v70[i79] = {
    [0] = ui.new_checkbox("AA", "Anti-aimbot angles", string.format("[%s - gamesense]", i80)),
    [1] = ui.new_combobox("AA", "Anti-aimbot angles", string.format("pitch \n %s", i80), { "off", "default", "up", "down", "minimal", "random", "custom" }),
    [2] = ui.new_slider("AA", "Anti-aimbot angles", string.format("\n%s pitch slider", i80), -89, 89, 0, true, "°", 1, {}),
    [3] = ui.new_combobox("AA", "Anti-aimbot angles", string.format("yaw base \n%s", i80), { "local view", "at targets" }),
    [4] = ui.new_combobox("AA", "Anti-aimbot angles", string.format("yaw\n %s", i80), { "off", "180", "spin", "static", "180 Z", "crosshair" }),
    [5] = ui.new_slider("AA", "Anti-aimbot angles", string.format("\n%s yaw add", i80), -180, 180, 0, true, "°", 1, {}),
    [6] = ui.new_combobox("AA", "Anti-aimbot angles", string.format("yaw jitter\n%s", i80), { "off", "offset", "center", "random", "skitter", "slow" }),
    [7] = ui.new_slider("AA", "Anti-aimbot angles", string.format("\n %s yaw jitter", i80), -180, 180, 0, true, "°", 1, {}),
    [8] = ui.new_combobox("AA", "Anti-aimbot angles", string.format("body yaw\n %s", i80), { "off", "opposite", "jitter", "static" }),
    [9] = ui.new_slider("AA", "Anti-aimbot angles", string.format("\n%s body yaw static side", i80), -180, 180, 0, true, "°", 1, {}),
    [10] = ui.new_checkbox("AA", "Anti-aimbot angles", string.format("freestanding body yaw\n %s", i80)),
    [11] = ui.new_checkbox("AA", "Anti-aimbot angles", string.format("edge yaw\n %s", i80)),
    [12] = ui.new_checkbox("AA", "Anti-aimbot angles", string.format("freestanding\n %s", i80)),
    [13] = ui.new_slider("AA", "Anti-aimbot angles", string.format("roll\n %s", i80), -45, 45, 0, true, "°", 1, {}),
    [14] = ui.new_checkbox("AA", "Anti-aimbot angles", string.format("force defensive\n %s", i80)),
    [15] = ui.new_combobox("AA", "Anti-aimbot angles", string.format("defensive pitch\n %s", i80), "off", "up", "random", "minimal", "zero"),
    [16] = ui.new_combobox("AA", "Anti-aimbot angles", string.format("defensive yaw\n %s", i80), "off", "forward", "spin", "jitter", "opposite"),
}
        v71[i79] = {
    [0] = ui.new_checkbox("AA", "Anti-aimbot angles", string.format("[%s - wraith] (incomplete)", i80)),
    [1] = ui.new_combobox("AA", "Anti-aimbot angles", string.format("pitch\n %s w", i80), {
    "off",
    "emotion (89)",
    "up (-89)",
    "fake up (180)",
    "fake down (-180)",
    "fake zero (1080)",
    "fake down (-540)",
}),
    [2] = ui.new_combobox("AA", "Anti-aimbot angles", string.format("yaw jitter\n %s w", i80), { "off", "offset", "center", "random", "3 way", "5 way" }),
    [3] = ui.new_slider("AA", "Anti-aimbot angles", string.format("\n %s yaw jitter w", i80), -180, 180, 0, true, "°", 1, {}),
    [4] = ui.new_combobox("AA", "Anti-aimbot angles", string.format("body yaw\n %s w", i80), { "off", "opposite", "jitter", "static" }),
}
    end
    local v81 = function(a1_600)
        local v82 = "\n{"
        for i83, i84 in pairs(a1_600) do
            if (type(i83) == "string") then
                v82 = (v82 .. ("[\"" .. (i83 .. ("\"]" .. "="))))
            end
            if (type(i84) == "table") then
                v82 = (v82 .. table_to_string(i84))
            elseif (type(i84) == "boolean") then
                v82 = (v82 .. tostring(i84))
            else
                v82 = (v82 .. ("\"" .. (i84 .. "\"")))
            end
            v82 = (v82 .. ",\n")
        end
        if (v82 ~= "") then
            v82 = v82:sub(1, (v82:len() - 1))
        end
        return (v82 .. "}\n")
    end
    local v85 = function(a1_602, a1_604)
        local v86 = {}
        for i87 in string.gmatch(a1_602, ("([^" .. (a1_604 .. "]+)"))) do
            v86[(#v86 + 1)] = string.gsub(i87, "\n", "")
        end
        return v86
    end
    local v88 = function(a1_606)
        if ((a1_606 == "true") or (a1_606 == "false")) then
            return (a1_606 == "true")
        else
            return a1_606
        end
    end
    local v89 = function(a1_608)
        return math.floor((a1_608 + 0.5))
    end
    local v90 = function(a1_610, a1_612, a1_614)
        return math.max(math.min(a1_610, a1_614), a1_612)
    end
    local v91 = function(a1_616, a1_618, a1_620, a1_622)
        return string.format('%02x%02x%02x%02x', a1_616, a1_618, a1_620, a1_622)
    end
    local v92 = function(a1_624)
        local v93 = {}
        for i94, i95 in ipairs(a1_624) do
            v93[i95] = ((v93[i95] or 0) + 1)
        end
        return v93
    end
    local v96 = function(a1_626)
        local v97 = next(a1_626)
        for i98 in pairs(a1_626) do
            if (a1_626[v97] < a1_626[i98]) then
                v97 = i98
            end
        end
        return v97
    end
    local v99 = function(a1_628)
        return v96(v92(a1_628))
    end
    local v100 = {
    rage = {
    ref_doubletap = { ui.reference("RAGE", "Aimbot", "Double tap") },
    ref_safepoint = ui.reference("RAGE", "Aimbot", "Force safe point"),
    ref_baim = { ui.reference("RAGE", "Aimbot", "Force body aim") },
    ref_min_damage = { ui.reference("RAGE", "Aimbot", "Minimum damage") },
    ref_min_damage_override = { ui.reference("RAGE", "Aimbot", "Minimum damage override") },
    other = { ref_fakeduck = ui.reference("RAGE", "Other", "Duck peek assist") },
},
    anti_aim = {
    anti_aimbot_angles = {
    ref_aa_enabled = ui.reference("AA", "Anti-aimbot angles", "Enabled"),
    ref_pitch = { ui.reference("AA", "Anti-aimbot angles", "Pitch") },
    ref_yaw = { ui.reference("AA", "Anti-aimbot angles", "Yaw") },
    ref_yaw_base = ui.reference("AA", "Anti-aimbot angles", "Yaw base"),
    ref_body_yaw = { ui.reference("AA", "Anti-aimbot angles", "Body yaw") },
    ref_yaw_jitter = { ui.reference("AA", "Anti-aimbot angles", "Yaw jitter") },
    ref_freestand_body = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw"),
    ref_edge_yaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw"),
    ref_freestand = { ui.reference("AA", "Anti-aimbot angles", "Freestanding") },
    ref_roll = ui.reference("AA", "Anti-aimbot angles", "Roll"),
},
    fakelag = {},
    other = {
    ref_slowmotion = { ui.reference("AA", "Other", "Slow motion") },
    ref_onshotantiaim = { ui.reference("AA", "Other", "On shot anti-aim") },
},
},
    misc = {
    settings = {
    ref_dpiscale = ui.reference("MISC", "Settings", "DPI scale"),
    ref_menukey = ui.reference("MISC", "Settings", "Menu key"),
    ref_nadetoss = ui.reference("MISC", "Settings", "Faster grenade toss"),
},
    movement = { ref_bhop = ui.reference('MISC', 'Movement', 'Bunny hop') },
},
    plist = {
    players = ui.reference("Players", "Players", "Player list"),
    force_yaw = ui.reference("Players", "Adjustments", "Force body yaw"),
    force_yaw_value = ui.reference("Players", "Adjustments", "Force body yaw value"),
    force_body = ui.reference("Players", "Adjustments", "Force body yaw"),
    force_body_value = ui.reference("Players", "Adjustments", "Force body yaw value"),
    reset = ui.reference("Players", "Players", "Reset all"),
},
}
    local v101 = function(a1_630, a1_632)
        local v102 = false
        for i103 = 1, #a1_630, 1 do
            if (a1_630[i103] == a1_632) then
                v102 = true
                break
            end
        end
        return v102
    end
    local v104 = function(a1_634, a1_636, a1_638)
        return (a1_634 + ((a1_636 - a1_634) * a1_638))
    end
    local v105 = function(a1_640)
        while (a1_640 > 180) do
            a1_640 = (a1_640 - 360)
        end
        while (a1_640 < -180) do
            a1_640 = (a1_640 + 360)
        end
        return a1_640
    end
    function calculate_angle(a1_642, a1_644)
        local v106 = (a1_644 - a1_642)
        local v107 = math.atan((v106.y / v106.x))
        v107 = v105(((v107 * 180) / math.pi))
        if (v106.x >= 0) then
            v107 = v105((v107 + 180))
        end
        return v107
    end
    local v108 = function(a1_646)
        local v109 = entity.get_prop(a1_646, "m_bIsScoped")
        if (v109 == 1) then
            return true
        end
        return false
    end
    local v110 = {}
    local v111 = {}
    ui.set_callback(steal_aa_ignore, function()
        if ui.get(steal_aa_ignore) then
            v110[ui.get(v100.plist.players)] = true
        else
            if v110[ui.get(v100.plist.players)] then
                v110[ui.get(v100.plist.players)] = nil
            end
        end
    end)
    ui.set_callback(v100.plist.players, function()
        ui.set(steal_aa_ignore, (v110[ui.get(v100.plist.players)] ~= nil))
    end)
    ui.set_callback(v100.plist.reset, function()
        v110 = {}
        ui.set(steal_aa_ignore, false)
    end)
    ui.set_callback(steal_aa_toggle, function()
        if ui.get(steal_aa_toggle) then
            v111[ui.get(v100.plist.players)] = true
        else
            if v111[ui.get(v100.plist.players)] then
                v111[ui.get(v100.plist.players)] = nil
            end
        end
    end)
    ui.set_callback(v100.plist.players, function()
        ui.set(steal_aa_toggle, (v111[ui.get(v100.plist.players)] ~= nil))
    end)
    ui.set_callback(v100.plist.reset, function()
        v111 = {}
        ui.set(steal_aa_toggle, false)
    end)
    local v112 = function()
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_aa_enabled, false)
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_pitch[1], "Off")
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_pitch[2], 0)
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[1], "Off")
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[2], 0)
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw_base, "Local view")
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_body_yaw[1], "Off")
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_body_yaw[2], 0)
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw_jitter[1], "Off")
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw_jitter[2], 0)
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_freestand_body, false)
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_edge_yaw, false)
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_freestand[1], false)
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_freestand[2], "Always on")
        ui.set(v100.anti_aim.anti_aimbot_angles.ref_roll, 0)
    end
    local v113 = function(a1_648)
        for i114, i115 in pairs(v100.anti_aim.anti_aimbot_angles) do
            if (type(i115) ~= "table") then
                ui.set_visible(i115, not a1_648)
                if (not a1_648 and (ui.get(v100.anti_aim.anti_aimbot_angles.ref_body_yaw[1]) == "Off")) then
                    ui.set_visible(v100.anti_aim.anti_aimbot_angles.ref_freestand_body, false)
                end
            else
                for i116, i117 in ipairs(i115) do
                    ui.set_visible(i117, not a1_648)
                    if (not a1_648 and (ui.get(v100.anti_aim.anti_aimbot_angles.ref_body_yaw[1]) == "Opposite")) then
                        ui.set_visible(v100.anti_aim.anti_aimbot_angles.ref_body_yaw[2], false)
                    end
                    if ((not a1_648 and (ui.get(i115[1]) == "Off")) and (i114 ~= "ref_pitch")) then
                        ui.set_visible(i115[2], false)
                        if (ui.get(v100.anti_aim.anti_aimbot_angles.ref_yaw[1]) == "Off") then
                            ui.set_visible(v100.anti_aim.anti_aimbot_angles.ref_yaw_jitter[1], false)
                        end
                    end
                    if (not a1_648 and (ui.get(v100.anti_aim.anti_aimbot_angles.ref_pitch[1]) ~= "Custom")) then
                        ui.set_visible(v100.anti_aim.anti_aimbot_angles.ref_pitch[2], false)
                    end
                end
            end
        end
    end
    local v118, v119 = v24.screen_size()
    local v120 = {
    x = (database.read("x_82hdnujdsgfu") or ((v118 - v118) + 10)),
    y = (database.read("y_ajshdahjdjhn") or ((v119 - v119) + 550)),
    w = (database.read("w_akjdfsahsdff") or 100),
    h = (database.read("h_pi2jpoaojkfs") or 100),
    dragging = false,
}
    local function fn5(a1_650, a1_652, a1_654, a1_656)
        local v121, v122 = ui.mouse_position()
        return ((((v121 >= a1_650) and (v121 <= (a1_650 + a1_654))) and (v122 >= a1_652)) and (v122 <= (a1_652 + a1_656)))
    end
    function watermark(a1_658, a1_660)
        if not ui.get(v78["visuals"][2]) then
            return
        end
        local v123 = ""
        local v124 = ("WRAITH [" .. (string.upper(user_build["build"]) .. ("]" .. (" | " .. (string.upper(user_build["user"]) .. (" | " .. (math.floor((v24.latency() * 1000)) .. "MS")))))))
        if (a1_660 == "small") then
            v123 = "-"
            v124 = ("WRAITH   [" .. (string.upper(user_build["build"]) .. ("]" .. ("   |   " .. (string.upper(user_build["user"]) .. ("   |   " .. (math.floor((v24.latency() * 1000)) .. "MS")))))))
        elseif (a1_660 == "thin") then
            v123 = ""
        elseif (a1_660 == "bold") then
            v123 = "b"
        elseif (a1_660 == "blind") then
            v123 = "+"
        end
        local v125, v126 = v24.screen_size()
        local v127 = { ui.mouse_position() }
        local v128 = v24.key_state(1)
        local v129 = { renderer.measure_text(v123, v124) }
        if ui.is_menu_open() then
            if (v120.dragging and not v128) then
                v120.dragging = false
            end
            if (v120.dragging and v128) then
                v120.x = (v127[1] - v120.drag_x)
                v120.y = (v127[2] - v120.drag_y)
            end
            if (fn5(v120.x, v120.y, (v120.w + v129[1]), (v120.h + v129[2])) and v128) then
                v120.dragging = true
                v120.drag_x = (v127[1] - v120.x)
                v120.drag_y = (v127[2] - v120.y)
            end
        end
        if ((v120.x + v129[1]) > v125) then
            v120.x = (v120.x - 5)
        elseif ((v120.x + 20) < 0) then
            v120.x = (v120.x + 5)
        end
        if ((v120.y + v129[2]) > v126) then
            v120.y = (v120.y - 10)
        elseif ((v120.y + v129[2]) < 0) then
            v120.y = (v120.y + 10)
        end
        local v130 = {}
        renderer.gradient(v120.x, ((v120.y + v129[2]) + 8), (v129[1] / 1.5), 1, 0, 0, 0, 0, 220, 220, 220, 220, 255, true)
        renderer.gradient((v120.x + (v129[1] / 1.5)), ((v120.y + v129[2]) + 8), (v129[1] / 1.5), 1, 220, 220, 220, 255, 0, 0, 0, 0, true)
        renderer.gradient(v120.x, v120.y, (v129[1] / 1.5), (v129[2] + 7), 12, 12, 12, 0, 12, 12, 12, 75, true)
        renderer.gradient((v120.x + (v129[1] / 1.5)), v120.y, (v129[1] / 1.5), (v129[2] + 7), 12, 12, 12, 75, 12, 12, 12, 0, true)
        renderer.text((v120.x + 18), (v120.y + 5), 255, 255, 255, 220, v123, 0, v124)
        if not entity.is_alive(a1_658) then
            return
        end
        table.insert(v130, { text = ("- CONDITION: " .. string.upper(v59.current_condition)), r = 240, g = 240, b = 240, a = 220 })
        table.insert(v130, {
    text = ("- TARGET: " .. string.upper((((v24.current_threat() == nil) and "?") or string.sub(entity.get_player_name(v24.current_threat()), 0, 12)))),
    r = 240,
    g = 240,
    b = 240,
    a = 220,
})
        table.insert(v130, {
    text = ("- EXPLOIT CHARGE: " .. (((v21.get_double_tap() == false) and "0") or "1")),
    r = 240,
    g = 240,
    b = 240,
    a = 220,
})
        table.insert(v130, {
    text = ("- DESYNC: " .. (string.upper(math.abs(v59.current_desync)) .. "*")),
    r = 240,
    g = 240,
    b = 240,
    a = 220,
})
        for i131, i132 in pairs(v130) do
            text_size2 = { renderer.measure_text(v123, i132.text) }
            renderer.text((v120.x + 18), ((10 + v120.y) + (text_size2[2] * i131)), i132.r, i132.g, i132.b, i132.a, v123, 0, i132.text)
        end
    end
    function draw_glow(a1_662, a1_664, a1_666, a1_668, a1_670, a1_672)
        renderer.rectangle(a1_662, a1_664, a1_666, a1_668, a1_670[1], a1_670[2], a1_670[3], a1_670[4])
        local v133 = (a1_670[1] * a1_672)
        local v134 = (a1_670[2] * a1_672)
        local v135 = (a1_670[3] * a1_672)
        for i136 = 1, a1_672, 1 do
            local v137 = ((a1_670[4] * i136) / a1_672)
            local v138 = (a1_666 + (i136 * 2))
            local v139 = (a1_668 + (i136 * 2))
            local v140 = (a1_662 - i136)
            local v141 = (a1_664 - i136)
            renderer.rectangle(v140, v141, v138, v139, v133, v134, v135, v137)
        end
    end
    local v142 = function(a1_674, a1_676, a1_678, a1_680, a1_682)
        if not v101(ui.get(v78["visuals"][6]), "desync") then
            return
        end
        dsy_rect = { 255, 255, 255, 255 }
        a1_682 = (a1_682 + 5)
        if (v108(a1_674) and v101(ui.get(v78["visuals"][6]), "animations on scope")) then
            v59.desync_rect_dist = v104(v59.desync_rect_dist, (21 + 2), (globals.frametime() * 15))
        elseif (not v101(ui.get(v78["visuals"][6]), "animations on scope") and (ui.get(v78["visuals"][0]) == "recode alpha")) then
            v59.desync_rect_dist = (21 + 2)
        else
            v59.desync_rect_dist = v104(v59.desync_rect_dist, 0, (globals.frametime() * 10))
        end
        renderer.rectangle(((a1_676 - 21) + v89(v59.desync_rect_dist)), (a1_678 + a1_682), (21 * 2), 4, 15, 15, 15, 255)
        renderer.rectangle(((a1_676 - (21 - 1)) + v89(v59.desync_rect_dist)), ((a1_678 + a1_682) + 1), v90(((math.abs(v59.current_desync) / 58) * ((21 * 2) - 2)), 0, ((21 * 2) - 2)), 2, dsy_rect[1], dsy_rect[2], dsy_rect[3], dsy_rect[4])
    end
    local v143 = function(a1_684, a1_686, a1_688)
        if (not ui.get(v78["visuals"][9]) or not ui.get(v78["anti-aim 2"][3])) then
            return
        end
        v59.smooth_left_arrow = ((v108(a1_684) and v104(v59.smooth_left_arrow, 80, (globals.frametime() * 15))) or v104(v59.smooth_left_arrow, 60, (globals.frametime() * 15)))
        v59.smooth_right_arrow = ((v108(a1_684) and v104(v59.smooth_right_arrow, 80, (globals.frametime() * 15))) or v104(v59.smooth_right_arrow, 60, (globals.frametime() * 15)))
        v59.smooth_up_arrow = ((v108(a1_684) and v104(v59.smooth_up_arrow, 80, (globals.frametime() * 15))) or v104(v59.smooth_up_arrow, 60, (globals.frametime() * 15)))
        local left_right = {
        ["left"] = { indicator = "", x_pos = -v59.smooth_left_arrow, y_pos = -5 },
        ["right"] = { indicator = "", x_pos = v59.smooth_left_arrow, y_pos = -5 },
        ["forward"] = { indicator = "", x_pos = 0, y_pos = -v59.smooth_up_arrow },
    }
        local v144 = { ui.get(v78["visuals"][10]) }
        v59.smooth_arrow_alpha = ((v108(a1_684) and v104(v59.smooth_arrow_alpha, v90((v144[4] - 100), 0, 235), (globals.frametime() * 15))) or v104(v59.smooth_arrow_alpha, v144[4], (globals.frametime() * 15)))
        for i145, i146 in pairs(left_right) do
            if (i145 == v59.mode) then
                renderer.text((a1_686 + math.ceil(i146.x_pos)), (a1_688 + math.ceil(i146.y_pos)), v144[1], v144[2], v144[3], v59.smooth_arrow_alpha, "c+", 0, i146.indicator)
            end
        end
    end
    local v147 = function(a1_690, a1_692, a1_694)
        if not v101(ui.get(v78["visuals"][6]), "defensive") then
            return
        end
        if (((v59.tickbase_diff ~= nil) and (v59.tickbase_diff <= -1)) and (v59.tickbase_diff >= -14)) then
            defensive_size_x, defensive_size_y = renderer.measure_text("c", "- defensive -")
            defensive_size_x = (defensive_size_x + 15)
            renderer.rectangle((a1_692 - (defensive_size_x / 2)), (((a1_694 / 3) + defensive_size_y) - 2), defensive_size_x, 4, 15, 15, 15, 150)
            local v148 = v59.tickbase_diff
            local v149 = math.abs((-v148 - 15))
            local v150 = v149
            if ((v149 == v150) and (v149 > 1)) then
                v150 = (v150 - 1)
            end
            v59.smooth_defensive_bar = v104(v59.smooth_defensive_bar, v150, (globals.frametime() * 50))
            local v151 = v104(75, 200, ((v59.smooth_defensive_bar - 1) / 12))
            renderer.text(a1_692, (a1_694 / 3), 255, 255, 255, v151, "c", 0, "- defensive -")
            renderer.rectangle(((a1_692 + 1) - (defensive_size_x / 2)), ((a1_694 / 3) + 10), (v90(((v59.smooth_defensive_bar / 12) * defensive_size_x), 0, defensive_size_x) - 2), 2, 200, 200, 200, v151)
        else
            v59.smooth_defensive_bar = 0.5
        end
    end
    local v152 = function(a1_696, a1_698, a1_700)
        local v153 = globals.tickinterval()
        local v154 = (cvar.sv_gravity:get_float() * v153)
        local v155 = (cvar.sv_jump_impulse:get_float() * v153)
        local v156 = { a1_698[1], a1_698[2], a1_698[3] }
        local v157 = { entity.get_prop(a1_696, 'm_vecVelocity') }
        local v158 = (((v157[3] > 0) and -v154) or v155)
        for i159 = 1, a1_700, 1 do
            local v160 = { v156[1], v156[2], v156[3] }
            v156[1] = (v156[1] + (v157[1] * v153))
            v156[2] = (v156[2] + (v157[2] * v153))
            v156[3] = (v156[3] + ((v157[3] + v158) * v153))
            local v161 = v24.trace_line(v160[1], v160[2], v160[3], v156[1], v156[2], v156[3])
            if (v161.fraction <= 0.99) then
                return v160
            end
        end
        return v156
    end
    local v162 = function(a1_702, a1_704)
        return { (a1_702[1] + a1_704[1]), (a1_702[2] + a1_704[2]), (a1_702[3] + a1_704[3]) }
    end
    local v163 = function(a1_706, a1_708)
        local v164 = globals.tickinterval()
        local v165 = (cvar.sv_gravity:get_float() * v164)
        local v166 = (cvar.sv_jump_impulse:get_float() * v164)
        local v167 = { entity.get_origin(a1_706) }
        local v168 = { entity.get_origin(a1_706) }
        local v169 = { entity.get_prop(a1_706, 'm_vecVelocity') }
        local v170 = (((v169[3] > 0) and -v165) or v166)
        for i171 = 1, a1_708, 1 do
            v168 = v167
            v167 = { (v167[1] + (v169[1] * v164)), (v167[2] + (v169[2] * v164)), (v167[3] + ((v169[3] + v170) * v164)) }
        end
        return v167
    end
    local v172 = function(a1_710, a1_712, a1_714)
        local v173 = v162({ entity.get_prop(a1_710, 'm_vecMins') }, a1_712)
        local v174 = v162({ entity.get_prop(a1_710, 'm_vecMaxs') }, a1_712)
        local v175 = {
        { v173[1], v173[2], v173[3] },
        { v173[1], v174[2], v173[3] },
        { v174[1], v174[2], v173[3] },
        { v174[1], v173[2], v173[3] },
        { v173[1], v173[2], v174[3] },
        { v173[1], v174[2], v174[3] },
        { v174[1], v174[2], v174[3] },
        { v174[1], v173[2], v174[3] },
    }
        local v176 = {
        { 0, 1 },
        { 1, 2 },
        { 2, 3 },
        { 3, 0 },
        { 5, 6 },
        { 6, 7 },
        { 1, 4 },
        { 4, 8 },
        { 0, 4 },
        { 1, 5 },
        { 2, 6 },
        { 3, 7 },
        { 5, 8 },
        { 7, 8 },
        { 3, 4 },
    }
        for i177 = 1, #v176, 1 do
            if ((v175[v176[i177][1]] ~= nil) and (v175[v176[i177][2]] ~= nil)) then
                local v178 = { renderer.world_to_screen(v175[v176[i177][1]][1], v175[v176[i177][1]][2], v175[v176[i177][1]][3]) }
                local v179 = { renderer.world_to_screen(v175[v176[i177][2]][1], v175[v176[i177][2]][2], v175[v176[i177][2]][3]) }
                renderer.line(v178[1], v178[2], v179[1], v179[2], 255, 255, 255, 255)
            end
        end
    end
    local function fn6(a1_716, a1_718, a1_720, a1_722, a1_724, a1_726, a1_728, a1_730, a1_732)
        local v180 = (a1_732 or 3)
        local v181, v182
        for i183 = 0, 360, v180 do
            local v184 = math.rad(i183)
            local v185, v186, v187 = ((a1_722 * math.cos(v184)) + a1_716), ((a1_722 * math.sin(v184)) + a1_718), a1_720
            local v188, v189 = renderer.world_to_screen(v185, v186, v187)
            if ((v188 ~= nil) and (v181 ~= nil)) then
                renderer.line(v188, v189, v181, v182, a1_724, a1_726, a1_728, a1_730)
            end
            v181, v182 = v188, v189
        end
    end
    local function fn7(a1_734, a1_736, a1_738, a1_740, a1_742, a1_744, a1_746, a1_748, a1_750)
        local v190 = (a1_750 or 3)
        local v191 = {}
        for i192 = 0, 360, v190 do
            local v193 = math.rad(i192)
            local v194, v195, v196 = ((a1_740 * math.cos(v193)) + a1_734), ((a1_740 * math.sin(v193)) + a1_736), a1_738
            table.insert(v191, { v194, v195, v196 })
        end
        for i197 = 1, (#v191 - 2), 1 do
            local v198, v199, v200 = v191[1], v191[(i197 + 1)], v191[(i197 + 2)]
            local v201, v202 = renderer.world_to_screen(v198[1], v198[2], v198[3])
            local v203, v204 = renderer.world_to_screen(v199[1], v199[2], v199[3])
            local v205, v206 = renderer.world_to_screen(v200[1], v200[2], v200[3])
            if ((v201 and v203) and v205) then
                renderer.triangle(v201, v202, v203, v204, v205, v206, a1_742, a1_744, a1_746, a1_748)
            end
        end
    end
    local function fn8(a1_752, a1_754, a1_756, a1_758, a1_760, a1_762, a1_764, a1_766, a1_768, a1_770)
        local v207 = (a1_768 or 3)
        local v208 = (a1_770 or 5)
        local v209 = (a1_766 / v208)
        local v210 = a1_766
        for i211 = 1, v208, 1 do
            fn6(a1_752, a1_754, a1_756, (a1_758 + i211), a1_760, a1_762, a1_764, v210, v207)
            v210 = (v210 - v209)
        end
    end
    local v212 = function(a1_772)
        if ((((ui.get(v100.anti_aim.other.ref_onshotantiaim[1]) and ui.get(v100.anti_aim.other.ref_onshotantiaim[2])) or not (ui.get(v78["misc"][6]) or (ui.get(v78["misc"][7]) and v59.hittable))) or (v59.tickbase_diff == nil)) or (v59.tickbase_diff > 0)) then
            return
        end
        if (not ui.get(v100.rage.ref_doubletap[1]) and not ui.get(v100.rage.ref_doubletap[2])) then
            return
        end
        predicted_pos = v163(a1_772, 14)
        if (ui.get(v78["visuals"][8]) == "circle") then
            fn8(predicted_pos[1], predicted_pos[2], predicted_pos[3], 6, 255, 255, 255, 255, 3, 10)
            fn7(predicted_pos[1], predicted_pos[2], predicted_pos[3], 7, 255, 255, 255, 150, 3)
        elseif (ui.get(v78["visuals"][8]) == "box") then
            v172(a1_772, predicted_pos, true)
        end
    end
    local v213 = {
    main = { 0, 1, 6, 5, 4, 3, 2 },
    left_arm = { 14, 18, 17, 1 },
    right_arm = { 13, 16, 15, 1 },
    left_leg = { 12, 10, 8, 2 },
    right_leg = { 11, 9, 7, 2 },
}
    local v214 = function(a1_774, a1_776, a1_778)
        local v215 = globals.tickinterval()
        local v216 = (cvar.sv_gravity:get_float() * v215)
        local v217 = (cvar.sv_jump_impulse:get_float() * v215)
        local v218, v219 = a1_776, a1_776
        local v220 = { entity.get_prop(a1_774, 'm_vecVelocity') }
        local v221 = (((v220[3] > 0) and -v216) or v217)
        for i222 = 1, a1_778, 1 do
            v219 = v218
            v218 = { (v218[1] + (v220[1] * v215)), (v218[2] + (v220[2] * v215)), (v218[3] + ((v220[3] + v221) * v215)) }
            local v223 = v24.trace_line(-1, v219[1], v219[2], v219[3], v218[1], v218[2], v218[3])
        end
        return v218
    end
    local v224 = function(a1_780)
        for i225, i226 in pairs(v213) do
            for i227, i228 in pairs(i226) do
                if (i227 ~= #i226) then
                    local v229 = {}
                    for i230 = 0, 18, 1 do
                        local v231 = { entity.hitbox_position(a1_780, i230) }
                        local v232 = v231
                        v229[i230] = { x = v232[1], y = v232[2], z = v232[3] }
                    end
                    local v233, v234, v235 = v229[i226[i227]].x, v229[i226[i227]].y, v229[i226[i227]].z
                    local v236, v237 = renderer.world_to_screen(v233, v234, v235)
                    local v238, v239, v240 = v229[i226[(i227 + 1)]].x, v229[i226[(i227 + 1)]].y, v229[i226[(i227 + 1)]].z
                    local v241, v242 = renderer.world_to_screen(v238, v239, v240)
                    renderer.line(v236, v237, v241, v242, 255, 255, 255, 255)
                end
            end
        end
    end
    local function fn9(a1_782, a1_784, a1_786)
        local v243 = string.len(a1_784)
        if (a1_782 < v243) then
            a1_782 = (a1_782 + ((1 * globals.frametime()) * a1_786))
        else
            a1_782 = v243
        end
        local v244 = math.floor(a1_782)
        local v245 = string.sub(a1_784, 1, v244)
        return a1_782, v245
    end
    local v246 = ""
    local v247 = function(a1_788, a1_790, a1_792, a1_794, a1_796)
        if (not a1_790 or not entity.is_alive(a1_792)) then
            return
        end
        v212(a1_792)
        local v248 = {}
        local v249, v250, v251, v252 = ui.get(v78["visuals"][1])
        local v253, v254 = (a1_794[1] / 2), (a1_794[2] / 2)
        local v255 = ""
        v147(a1_792, v253, v254)
        v143(a1_792, v253, v254)
        if (a1_796 == "small") then
            v255 = "-"
        elseif (a1_796 == "thin") then
            v255 = ""
        elseif (a1_796 == "bold") then
            v255 = "b"
        elseif (a1_796 == "blind") then
            v255 = "+"
        end
        if (ui.get(v78["visuals"][0]) ~= "recode alpha") then
            v59.smooth_wraith_recode = 0
            v59.smooth_dt_2 = 0
            v59.smooth_stance = 0
            v59.dt_os_text_anim = 0
            v59.current_cond_text_anim = 0
        end
        if (ui.get(a1_790) == "minimal (og)") then
            local v256 = "SP BAIM FS"
            local v257 = "SP"
            local v258 = " BAIM"
            local v259 = " FS"
            local v260 = "WRAITH"
            local v261 = "DT"
            local v262 = "OS"
            local v263 = string.upper(v59.current_condition)
            if (v255 == "-") then
                v257 = "SP"
                v258 = "  BAIM"
                v259 = "  FS"
                v256 = "SP  BAIM  FS"
            end
            if v101(ui.get(v78["visuals"][6]), "lowercase") then
                v260 = string.lower(v260)
                v261 = string.lower(v261)
                v262 = string.lower(v262)
                v256 = string.lower(v256)
                v257 = string.lower(v257)
                v258 = string.lower(v258)
                v259 = string.lower(v259)
                v263 = string.lower(v263)
            end
            local v264 = { renderer.measure_text(v255, v260) }
            v59.smooth_wraith = ((v108(a1_792) and v104(v59.smooth_wraith, -2, (globals.frametime() * 15))) or v104(v59.smooth_wraith, (renderer.measure_text(v255, v260) / 2), (globals.frametime() * 15)))
            table.insert(v248, { text = v260, r = 210, g = 210, b = 210, a = 255, size = math.ceil(v59.smooth_wraith) })
            v59.smooth_pc = ((v108(a1_792) and v104(v59.smooth_pc, -2, (globals.frametime() * 15))) or v104(v59.smooth_pc, (renderer.measure_text(v255, (math.abs(v59.current_desync) .. "%")) / 2), (globals.frametime() * 15)))
            table.insert(v248, {
        text = (math.abs(v59.current_desync) .. "%"),
        r = 210,
        g = 210,
        b = 210,
        a = 255,
        size = math.ceil(v59.smooth_pc),
    })
            v59.smooth_dt = ((v108(a1_792) and v104(v59.smooth_dt, -2, (globals.frametime() * 15))) or v104(v59.smooth_dt, (renderer.measure_text(v255, v262) / 2), (globals.frametime() * 15)))
            if (ui.get(v100.rage.ref_doubletap[1]) and ui.get(v100.rage.ref_doubletap[2])) then
                local v265 = (v21.get_double_tap() or (v59.tickbase_diff ~= 1))
                table.insert(v248, { text = v261, r = 210, g = 210, b = 210, a = ((v265 and 255) or 100), size = math.ceil(v59.smooth_dt) })
                v59.dt_vertical_dist = v104(v59.dt_vertical_dist, 10, (globals.frametime() * 20))
            else
                v59.dt_vertical_dist = v104(v59.dt_vertical_dist, 0, (globals.frametime() * 20))
            end
            v59.smooth_os = ((v108(a1_792) and v104(v59.smooth_os, -2, (globals.frametime() * 15))) or v104(v59.smooth_os, (renderer.measure_text(v255, v262) / 2), (globals.frametime() * 15)))
            if (ui.get(v100.anti_aim.other.ref_onshotantiaim[1]) and ui.get(v100.anti_aim.other.ref_onshotantiaim[2])) then
                local v266 = (ui.get(v100.rage.ref_doubletap[1]) and ui.get(v100.rage.ref_doubletap[2]))
                table.insert(v248, {
        text = v262,
        r = 210,
        g = 210,
        b = 210,
        a = ((not v266 and 255) or math.max(v59.pulse, 100)),
        size = math.ceil(v59.smooth_os),
    })
            end
            v59.smooth_bo = ((v108(a1_792) and v104(v59.smooth_bo, -2, (globals.frametime() * 15))) or v104(v59.smooth_bo, (renderer.measure_text(v255, v256) / 2), (globals.frametime() * 15)))
            table.insert(v248, {
        text = (("\a%s" .. (v257 .. ("\a%s" .. (v258 .. ("\a%s" .. v259)))))):format(string.format("%02X%02X%02X%02X", v249, v250, v251, ((ui.get(v100.rage.ref_safepoint) and 210) or 100)), string.format("%02X%02X%02X%02X", v249, v250, v251, ((ui.get(v100.rage.ref_baim[1]) and 210) or 100)), string.format("%02X%02X%02X%02X", v249, v250, v251, (((ui.get(v100.anti_aim.anti_aimbot_angles.ref_freestand[1]) and ui.get(v100.anti_aim.anti_aimbot_angles.ref_freestand[2])) and 210) or 100))),
        r = 210,
        g = 210,
        b = 210,
        a = 255,
        size = math.ceil(v59.smooth_bo),
    })
            for i267, i268 in pairs(v248) do
                renderer.text((v253 + (((v101(ui.get(v78["visuals"][6]), "animations on scope") == true) and -i268.size) or -(renderer.measure_text(v255, i268.text) / 2))), ((10 + v254) + (v264[2] * i267)), i268.r, i268.g, i268.b, i268.a, v255, 0, i268.text)
            end
            local v269 = { renderer.measure_text(v255, v260) }
            v142(a1_792, v253, v254, v269[1], v269[2])
        else
            v59.smooth_wraith = 0
            v59.smooth_dt = 0
            v59.smooth_os = 0
            v59.smooth_pc = 0
            v59.smooth_bo = 0
            if (ui.get(a1_790) == "anti urine") then
                table.insert(v248, {
        text = "ANTI URINE",
        r = 255,
        g = 165,
        b = 0,
        a = v59.pulse,
        size = (renderer.measure_text("b", "ANTI URINE") / 2),
    })
                table.insert(v248, {
        text = "MIN DAMAGE",
        r = 191,
        g = 159,
        b = 255,
        a = ((ui.get(v100.rage.ref_min_damage_override[2]) and 255) or 100),
        size = (renderer.measure_text("b", "MIN DAMAGE") / 2),
    })
                table.insert(v248, {
        text = "ON SHOT",
        r = 128,
        g = 230,
        b = 150,
        a = (((ui.get(v100.anti_aim.other.ref_onshotantiaim[1]) and ui.get(v100.anti_aim.other.ref_onshotantiaim[2])) and 255) or 100),
        size = (renderer.measure_text("b", "ON SHOT") / 2),
    })
                local v270 = (ui.get(v100.rage.ref_doubletap[1]) and ui.get(v100.rage.ref_doubletap[2]))
                table.insert(v248, {
        text = "DT",
        r = ((v270 and 210) or 255),
        g = ((v270 and 210) or 0),
        b = ((v270 and 210) or 0),
        a = ((v270 and 255) or 100),
        size = (renderer.measure_text("b", "DT") / 2),
    })
                for i271, i272 in pairs(v248) do
                    renderer.text((v253 - i272.size), ((45 + v254) + (12 * i271)), i272.r, i272.g, i272.b, i272.a, "b", 0, i272.text)
                end
            elseif (ui.get(a1_790) == "recode alpha") then
                local v273 = ("WRAITH\a%s RECODE"):format(string.format("%02X%02X%02X%02X", v249, v250, v251, math.max(v252, 100)))
                local v274 = "DT"
                local v275 = "ON SHOT"
                local v276 = { renderer.measure_text(v255, v273) }
                local v277 = string.upper(v59.current_condition)
                if (v59.mode == "left") then
                    v277 = "MANUAL LEFT"
                elseif (v59.mode == "right") then
                    v277 = "MANUAL RIGHT"
                elseif (v59.mode == "forward") then
                    v277 = "MANUAL FORWARD"
                end
                if v101(ui.get(v78["visuals"][6]), "lowercase") then
                    v273 = string.lower(v273)
                    v274 = string.lower(v274)
                    v275 = string.lower(v275)
                    v277 = string.lower(v277)
                end
                local v278 = (v21.get_double_tap() or (v59.tickbase_diff ~= 1))
                local v279 = (ui.get(v100.anti_aim.other.ref_onshotantiaim[1]) and ui.get(v100.anti_aim.other.ref_onshotantiaim[2]))
                local v280 = (ui.get(v100.rage.ref_doubletap[1]) and ui.get(v100.rage.ref_doubletap[2]))
                local v281 = ""
                if v280 then
                    v281 = v274
                elseif v279 then
                    v281 = v275
                end
                v59.dt_os_text_anim, ayo = fn9(v59.dt_os_text_anim, v281, 50)
                v59.current_cond_text_anim, ayo2 = fn9(v59.current_cond_text_anim, v277, 25)
                if (v246 ~= v277) then
                    if (#v246 <= #v277) then
                        v59.current_cond_text_anim = #v246
                    end
                    v246 = v277
                end
                wraith_recode_text_size = { renderer.measure_text(v255, v273) }
                v59.smooth_wraith_recode = ((v108(a1_792) and v104(v59.smooth_wraith_recode, -2, (globals.frametime() * 15))) or v104(v59.smooth_wraith_recode, (wraith_recode_text_size[1] / 2), (globals.frametime() * 15)))
                table.insert(v248, {
        text = v273,
        r = 240,
        g = 240,
        b = 240,
        a = 255,
        size = math.floor(v59.smooth_wraith_recode),
        txt_measure = { renderer.measure_text(v255, v273) },
    })
                v59.smooth_dt_2 = ((v108(a1_792) and v104(v59.smooth_dt_2, -2, (globals.frametime() * 15))) or v104(v59.smooth_dt_2, (renderer.measure_text(v255, v281) / 2), (globals.frametime() * 15)))
                if (v280 or v279) then
                    table.insert(v248, {
        text = ayo,
        r = ((v280 and ((v278 and 0) or 255)) or 135),
        g = ((v280 and ((v278 and 255) or 0)) or 206),
        b = ((v280 and 0) or 250),
        a = 255,
        size = math.floor(v59.smooth_dt_2),
        txt_measure = { renderer.measure_text(v255, ayo) },
    })
                else
                    v59.dt_os_text_anim = 0
                end
                ayo2 = ("'  " .. (ayo2 .. "  '"))
                v59.smooth_stance = ((v108(a1_792) and v104(v59.smooth_stance, -2, (globals.frametime() * 15))) or v104(v59.smooth_stance, (renderer.measure_text(v255, ayo2) / 2), (globals.frametime() * 15)))
                table.insert(v248, {
        text = ayo2,
        r = 240,
        g = 240,
        b = 240,
        a = 255,
        size = math.floor(v59.smooth_stance),
        txt_measure = { renderer.measure_text(v255, ayo2) },
    })
                for i282, i283 in pairs(v248) do
                    renderer.text((v253 + (((v101(ui.get(v78["visuals"][6]), "animations on scope") == true) and -i283.size) or 0)), ((10 + v254) + (v276[2] * i282)), i283.r, i283.g, i283.b, i283.a, v255, 0, i283.text)
                end
                local v284 = { renderer.measure_text(v255, v273) }
                v142(a1_792, v253, v254, v284[1], v284[2])
            end
        end
    end
    gamesense_outer = function(a1_798, a1_800, a1_802, a1_804, a1_806, a1_808)
        a1_808 = (a1_808 or false)
        if not a1_808 then
            renderer.rectangle(a1_798, (a1_800 - (a1_804 + 3)), a1_802, 1, 12, 12, 12, a1_806)
            renderer.rectangle((a1_798 + 2), (a1_800 - (a1_804 + 2)), (a1_802 - 4), 5, 60, 60, 60, a1_806)
            renderer.rectangle((a1_798 + 2), (a1_800 - (a1_804 + 1)), (a1_802 - 4), 3, 40, 40, 40, a1_806)
            renderer.rectangle(a1_798, (a1_800 - (a1_804 + 3)), 1, (a1_804 + 3), 12, 12, 12, a1_806)
            renderer.rectangle((a1_798 + 1), (a1_800 - (a1_804 + 2)), 4, (a1_804 + 2), 60, 60, 60, a1_806)
            renderer.rectangle((a1_798 + 2), (a1_800 - (a1_804 + 1)), 3, (a1_804 + 1), 40, 40, 40, a1_806)
            renderer.rectangle((a1_798 + 5), (a1_800 - (a1_804 - 2)), 1, (a1_804 - 2), 60, 60, 60, a1_806)
            renderer.rectangle(((a1_798 + a1_802) - 1), (a1_800 - (a1_804 + 3)), 1, (a1_804 + 3), 12, 12, 12, a1_806)
            renderer.rectangle(((a1_798 + a1_802) - 3), (a1_800 - (a1_804 + 2)), 2, (a1_804 + 2), 60, 60, 60, a1_806)
            renderer.rectangle(((a1_798 + a1_802) - 5), (a1_800 - (a1_804 + 1)), 3, (a1_804 + 1), 40, 40, 40, a1_806)
            renderer.rectangle(((a1_798 + a1_802) - 6), (a1_800 - (a1_804 - 2)), 1, (a1_804 - 2), 60, 60, 60, a1_806)
        else
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 4), (a1_800 - 47), (a1_804 + 9), (a1_802 + 9), 12, 12, 12, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 10), (a1_800 - 53), (a1_804 + 20), 1, 12, 12, 12, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 9), (a1_800 - 52), (a1_804 + 18), 1, 60, 60, 60, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 8), (a1_800 - 51), (a1_804 + 17), 3, 40, 40, 40, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 5), (a1_800 - 48), (a1_804 + 10), 1, 60, 60, 60, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 10), (a1_800 - 53), 1, (a1_802 + 19), 12, 12, 12, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 9), (a1_800 - 51), 1, (a1_802 + 18), 60, 60, 60, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 8), (a1_800 - 48), 3, (a1_802 + 10), 40, 40, 40, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 5), (a1_800 - 48), 1, (a1_802 + 9), 60, 60, 60, a1_806)
            renderer.rectangle(((a1_798 + (a1_804 / 2)) + 10), (a1_800 - 53), 1, (a1_802 + 20), 12, 12, 12, a1_806)
            renderer.rectangle(((a1_798 + (a1_804 / 2)) + 9), (a1_800 - 52), 1, (a1_802 + 18), 60, 60, 60, a1_806)
            renderer.rectangle(((a1_798 + (a1_804 / 2)) + 6), (a1_800 - 48), 3, (a1_802 + 10), 40, 40, 40, a1_806)
            renderer.rectangle(((a1_798 + (a1_804 / 2)) + 5), (a1_800 - 48), 1, (a1_802 + 10), 60, 60, 60, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 10), (((a1_800 - 48) + a1_802) + 14), (a1_804 + 20), 1, 12, 12, 12, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 5), (((a1_800 - 51) + a1_802) + 12), (a1_804 + 10), 1, 60, 60, 60, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 8), (((a1_800 - 52) + a1_802) + 14), (a1_804 + 17), 3, 40, 40, 40, a1_806)
            renderer.rectangle(((a1_798 - (a1_804 / 2)) - 8), (((a1_800 - 49) + a1_802) + 14), (a1_804 + 17), 1, 60, 60, 60, a1_806)
        end
    end
    local v285 = (10 + ((string.sub(ui.get(v100.misc.settings.ref_dpiscale), 1, -2) - 100) / 25))
    local v286 = surface.create_font('Lucida Console', v285, 400, { 128 })
    local fn10 = {}
    function fn10:new(L411, L412, L413)
        local v287 = { m_text = L411, m_color = L412, m_time = L413, lerped_pos = vector(v24.screen_size()).y }
        setmetatable(v287, self)
        self.__index = self
        return v287
    end
    local fn13 = {}
    function fn13:new()
        local v288 = { m_notify_text = {} }
        setmetatable(v288, self)
        self.__index = self
        return v288
    end
    function fn13:add(L417, L418, L419, L420, L421)
        L418 = (L418 or { 255, 255, 255, 255 })
        L419 = (L419 or 8.0)
        L420 = (v101(ui.get(v78["misc"][3]), "console") or false)
        L421 = (L421 or "")
        table.insert(self.m_notify_text, fn10:new(L417, L418, L419))
        if L420 then
            if (L421 == "fire") then
                v24.color_log(182, 231, 23, '[gamesense] \0')
                v24.color_log(210, 210, 255, L417)
            else
                print(L417)
            end
        end
    end
    function fn13:think(L422, L423)
        local v289, v290, v291 = 8, 5, (12 + 1)
        local v292, v293 = (L422[1] / 2), (L422[2] / 2)
        local v294
        local v295
        local v296 = "c"
        local v297 = 1
        local v298
        if (L423 == "small") then
            v296 = "-c"
        elseif (L423 == "thin") then
            v296 = "c"
        elseif (L423 == "bold") then
            v296 = "bc"
        elseif (L423 == "blind") then
            v296 = "+c"
            v297 = 10
        end
        if (#self.m_notify_text > 6) then
            table.remove(self.m_notify_text, 1)
        end
        for i299 = #self.m_notify_text, 1, -1 do
            local v300 = self.m_notify_text[i299]
            v300.m_time = (v300.m_time - globals.frametime())
            if (v300.m_time <= 0.0) then
                table.remove(self.m_notify_text, i299)
            end
        end
        if (#self.m_notify_text == 0) then
            return
        end
        for i301, i302 in ipairs(self.m_notify_text) do
            v298 = i302.m_text
            if (L423 == "small") then
                v298 = string.upper(i302.m_text)
            end
            local v303 = { renderer.measure_text(v296, v298) }
            i302.lerped_pos = v104(i302.lerped_pos, (((L422[2] / 2) + 300) + (i301 * (23 + v303[2]))), (globals.frametime() * 10))
            smooth_center_y = i302.lerped_pos
            v295 = i302.m_time
            v294 = i302.m_color
            if (v295 < 0.5) then
                local v304 = v295
                v304 = math.min(math.max(v304, 0.0), 0.5)
                v304 = (v304 / 0.5)
                v294[4] = math.floor((v304 * 255))
                if ((i301 == 1) and (v304 < 0.2)) then
                    v290 = (v290 - (v291 * (1.0 - (v304 / 0.2))))
                end
            else
                v294[4] = 255
            end
            if (v286 and v101(ui.get(v78["misc"][3]), "default")) then
                surface.draw_text(v289, v290, v294[1], v294[2], v294[3], v294[4], v286, i302.m_text)
            end
            if v101(ui.get(v78["misc"][3]), "center") then
                gamesense_outer(v292, smooth_center_y, v303[2], v303[1], v294[4], true)
                smooth_center_y = (smooth_center_y - 46)
                renderer.gradient((v292 - math.ceil(((v303[1] / 2) + 3))), smooth_center_y, (math.ceil(v303[1]) / 2), 1, 59, 175, 222, v294[4], 202, 70, 205, v294[4], true)
                renderer.gradient((v292 - 4), smooth_center_y, math.ceil(((v303[1] / 2) + 7.5)), 1, 202, 70, 205, v294[4], 204, 227, 53, v294[4], true)
                renderer.gradient((v292 - math.ceil(((v303[1] / 2) + 3))), (smooth_center_y + 1), (math.ceil(v303[1]) / 2), 1, 59, 175, 222, (math.max(0, math.min(255, v294[4])) - 100), 202, 70, 205, v294[4], true)
                renderer.gradient((v292 - 4), (smooth_center_y + 1), math.ceil(((v303[1] / 2) + 7.5)), 1, 202, 70, 205, v294[4], 204, 227, 53, (math.max(0, math.min(255, v294[4])) - 100), true)
                renderer.text(v292, ((smooth_center_y + v303[2]) - v297), 209, 209, 209, v294[4], v296, 0, v298)
            end
            v290 = (v290 + v291)
        end
    end
    g_notify = fn13:new()
    local v305 = {
    'جدا الحمد لله أبي',
    "₩Ɽ₳ł₮Ⱨ ₴Ɇ₦Đ ₲ⱤɆɆ₮ł₦₲₴ ₱₳Ɽ₳ ₳ ₵Ø₦₳ Đ₳ ₮Ʉ₳ ₥₳̃Ɇ",
    "ஃᅔ>.< член в заднице у русских ＷＲＡＩＴＨ ＲＥＣＯＤＥᅕஃ",
    "ȶʏ ʄօʀ ʍ2 ƈօʍքɨӼɨօռ աɨȶɦ ȶɦɛ քօքֆ ǟռɖ ȶɦɛ ɮǟռɢֆ ʄȶ 𝔀𝓻𝓸𝓽𝓱 𝓵𝓸𝓪",
    "百萬富翁買鬼 ツ",
    "skeet invite code in morse: ... .-- ..-. -.-- -... .-- ..-. -... .--- --.. -... .-.. -.- .... ..-. .-.. -.- --. .. .-. .--. --. .-.. --.- --.- - -.-- .---- -..- . .-- -.- -.-- --.- ---.. .-.. .... ... ...- --.. -..- -.. .--. -..- -- -... - -.--",
    '𝟝𝟙.𝟙𝟟𝟠.𝟙𝟠𝟝.𝟚𝟛𝟛/𝕡𝕝𝕒𝕪𝕖𝕣𝕤.𝕛𝕤𝕠𝕟 𝓬𝓽𝓻𝓵+f "𝖎𝖘𝖘𝖔 𝖋𝖔𝖎 𝖉𝖔𝖕𝖊, 𝖌𝖆𝖓𝖉𝖆 𝖙𝖔𝖖𝖚𝖊"',
    "🕯️⧚🎃⧚🔮 ƙąYRཞơŋ ῳıƖƖ ƈơơ℘ ʂ℘ıɛƖɛŋ 🔮⧚🎃⧚🕯️",
    " ⓔⓜⓑⓡⓐⓒⓔ ⓡⓐⓒⓘⓢⓜ ",
    "yesterday i got smoked by (っ◔◡◔)っ ιвιzα 6ℓ 1.9 т∂ι 160 ¢υρяα 2004 160 нρ / 118 кω 1896 ¢м3 (115.7 ¢υ-ιи)",
    "【　ＷＲＡＩＴＨ　ＡＮＴＩ－ＡＩＭＢＯＴ　ＲＥＣＯＤＥ　】",
    "ʀᴀᴢ ᴀᴅᴅᴇᴅ ᴛʜɪs ᴛᴏ ᴡʀᴀɪᴛʜ ʀᴇᴄᴏᴅᴇ ᴀɴᴅ ɪᴛ ᴍᴀᴅᴇ ɪᴛ sᴏ ᴍᴜᴄʜ ʙᴇᴛᴛᴇʀ",
}
    last_random = 0
    new_random = 0
    textalhao = ""
    say_time = 0
    ran = false
    local function fn14(a1_810)
        if (not ui.get(v78["misc"][4]) and not ui.get(v78["misc"][5])) then
            return
        end
        local v306, v307 = a1_810.userid, a1_810.attacker
        if ((v306 == nil) or (v307 == nil)) then
            return
        end
        local v308 = v24.userid_to_entindex(v306)
        local v309 = v24.userid_to_entindex(v307)
        if ((v309 == entity.get_local_player()) and entity.is_enemy(v308)) then
            new_random = v24.random_int(1, #v305)
            while (new_random == last_random) do
                new_random = v24.random_int(1, #v305)
            end
            textalhao = ("say " .. v305[new_random])
            if ui.get(v78["misc"][5]) then
                say_time = globals.curtime()
                ran = false
            else
                v24.exec(textalhao)
            end
            last_random = new_random
        end
    end
    local v310 = function(a1_812)
        if not a1_812 then
            ran = false
            return
        end
        if (((globals.curtime() >= (say_time + 1.5)) and (globals.curtime() <= (say_time + 1.6))) and not ran) then
            v24.exec(textalhao)
            ran = true
        end
    end
    local v311 = function(a1_814, a1_816, a1_818)
        if not a1_814 then
            return
        end
        local v312 = cvar.cl_crosshairsize:get_int()
        final_dmg = ((ui.get(v100.rage.ref_min_damage_override[2]) and ui.get(v100.rage.ref_min_damage_override[3])) or ui.get(v100.rage.ref_min_damage[1]))
        dmg_size = renderer.measure_text("", final_dmg)
        renderer.text(((a1_816 / 2) + 10), ((a1_818 / 2) - 20), 255, 255, 255, 250, "", 0, final_dmg)
    end
    local v313 = function(a1_820)
        local v314 = entity.get_local_player()
        local v315 = { v24.screen_size() }
        local v316 = ui.get(v78["visuals"][3])
        local v317 = ui.get(v78["visuals"][4])
        local v318 = ui.get(v78["visuals"][5])
        v310((ui.get(v78["misc"][4]) and ui.get(v78["misc"][5])))
        v311((v101(ui.get(v78["visuals"][6]), "min damage") and entity.is_alive(v314)), v315[1], v315[2])
        watermark(v314, v317)
        v247(a1_820, v78["visuals"][0], v314, v315, v316)
        g_notify:think(v315, v318)
    end
    local v319 = function(a1_822, a1_824)
        a1_824 = (a1_824 or 1)
        a1_822 = ffi_1.cast(v25, a1_822)
        return ffi_1.cast('struct animation_layer_t**', (ffi_1.cast('char*', a1_822) + 10640))[0][a1_824]
    end
    local v320 = function(a1_826)
        duckammount = a1_826.m_fDuckAmount
        speedfraction = math.max(0, math.min(a1_826.m_flFeetSpeedForwardsOrSideWays, 1))
        speedfactor = math.max(0, math.min(1, a1_826.m_flFeetSpeedUnknownForwardOrSideways))
        unk1 = (((a1_826.m_flStopToFullRunningFraction * -0.30000001) - 0.19999999) * speedfraction)
        unk2 = (unk1 + 1)
        unk3 = 0
        if (duckammount > 0) then
            unk2 = (unk2 + ((duckammount * speedfactor) * (0.5 - unk2)))
        end
        unk3 = (a1_826.m_flMaxYaw * unk2)
        return unk3
    end
    local v321 = function(a1_828)
        local v322 = v28(v27, a1_828)
        local v323 = v29(v27, a1_828)
        local v324 = ffi_1.cast(v25, v322)
        local v325 = (ffi_1.cast("char*", v324) + 39264)
        local v326 = ffi_1.cast("struct animstate_t1**", v325)[0]
        if (((v322 == nil) or (v323 == nil)) or (local_animstate == nil)) then
            return
        end
        a1_828.set_prop(a1_828, "m_flPoseParameter", 1, 6)
    end
    local v327 = function(a1_830)
        local v328 = v28(v27, a1_830)
        local v329 = v29(v27, a1_830)
        local v330 = ffi_1.cast(v25, v328)
        local v331 = (ffi_1.cast("char*", v330) + 39264)
        local v332 = ffi_1.cast("struct animstate_t1**", v331)[0]
        if (((v328 == nil) or (v329 == nil)) or (v332 == nil)) then
            return
        end
        if (globals.chokedcommands() == 0) then
            v59.max_desync = v320(v332)
            v59.current_desync = math.min(math.max(((entity.get_prop(a1_830, "m_flPoseParameter", 11) * 120) - 60), -58), 58)
            v59.current_desync = (((v59.current_desync > 0) and math.ceil(v59.current_desync)) or math.floor(v59.current_desync))
        end
        if v101(ui.get(v78["misc"][1]), "air walk") then
            if (vector(entity.get_prop(a1_830, 'm_vecVelocity')):length2d() > 1.5) then
                ANIMATION_LAYER_MOVEMENT_MOVE = v319(v328, 6)
                ANIMATION_LAYER_MOVEMENT_MOVE.m_flWeight = 1
            end
        end
        if v101(ui.get(v78["misc"][1]), "earthquake") then
            ANIMATION_LAYER_LEAN = v319(v328, 12)
            ANIMATION_LAYER_LEAN.m_flWeight = v24.random_float(0, 1)
        end
        if (v101(ui.get(v78["misc"][1]), "fake walk") and v59.in_speed) then
            ANIMATION_LAYER_LEAN = v319(v328, 12)
            ANIMATION_LAYER_LEAN.m_flWeight = 0
            ANIMATION_LAYER_MOVEMENT_MOVE = v319(v328, 6)
            ANIMATION_LAYER_MOVEMENT_MOVE.m_flWeight = 0
        end
        if v101(ui.get(v78["misc"][1]), "blind") then
            ANIMATION_LAYER_FLASHED = v319(v328, 9)
            ANIMATION_LAYER_FLASHED.m_nSequence = 224
            ANIMATION_LAYER_FLASHED.m_flWeight = 1
        end
        if v101(ui.get(v78["misc"][1]), "moonwalk") then
            entity.set_prop(a1_830, 'm_flPoseParameter', 0, 7)
        end
        if v101(ui.get(v78["misc"][1]), "smoothing") then
            entity.set_prop(a1_830, "m_flPoseParameter", 0, 2)
        end
        if v101(ui.get(v78["misc"][1]), "fallen legs") then
            entity.set_prop(a1_830, "m_flPoseParameter", 1, 6)
        end
        if v101(ui.get(v78["misc"][1]), "slide") then
            entity.set_prop(a1_830, "m_flPoseParameter", 1, 0)
        end
        if (v101(ui.get(v78["misc"][1]), "pitch on land") or true) then
            if (((v332.m_bInHitGroundAnimation and (v332.m_flHeadHeightOrOffsetFromHittingGroundAnimation > 0.101)) and v332.m_bOnGround) and not v24.key_state(32)) then
                if v101(ui.get(v78["misc"][1]), "pitch on land") then
                    entity.set_prop(a1_830, 'm_flPoseParameter', 0.5, 12)
                end
                v59.landing = true
            else
                v59.landing = false
            end
        end
    end
    local v333 = {
    ["3d sky"] = { cvar = cvar.r_3dsky, value = 1 },
    ["fog"] = { cvars = { cvar.fog_enable, cvar.fog_enable_water_fog }, value = 1 },
    ["shadows"] = {
    cvars = {
    cvar.r_shadows,
    cvar.cl_csm_static_prop_shadows,
    cvar.cl_csm_shadows,
    cvar.cl_csm_world_shadows,
    cvar.cl_foot_contact_shadows,
    cvar.cl_csm_viewmodel_shadows,
    cvar.cl_csm_rope_shadows,
    cvar.cl_csm_sprite_shadows,
    cvar.cl_csm_translucent_shadows,
    cvar.cl_csm_entity_shadows,
    cvar.cl_csm_world_shadows_in_viewmodelcascade,
},
    value = 1,
},
    ["blood"] = { cvar = cvar.violence_hblood, value = 1 },
    ["decals"] = { cvars = { cvar.r_drawdecals, cvar.r_drawropes, cvar.r_drawsprites }, value = 1 },
    ["bloom"] = { cvar = cvar.mat_disable_bloom, value = 0 },
    ["other"] = {
    cvars = { cvar.r_dynamic, cvar.r_eyegloss, cvar.r_eyes, cvar.r_drawtracers_firstperson, cvar.r_dynamiclighting },
    value = 1,
},
}
    local v334 = function()
        if not ui.get(v78["debug"][2]) then
            for i335, i336 in pairs(v333) do
                if i336.cvar then
                    if (i336.cvar:get_int() ~= i336.value) then
                        i336.cvar:set_int(i336.value)
                    end
                else
                    for i337, i338 in ipairs(i336.cvars) do
                        if (i338:get_int() ~= i336.value) then
                            i338:set_int(i336.value)
                        end
                    end
                end
            end
            return
        end
        for i339, i340 in pairs(v333) do
            if v101(ui.get(v78["debug"][3]), i339) then
                if i340.cvar then
                    if (i340.cvar:get_int() == i340.value) then
                        i340.cvar:set_int((((i340.value == 0) and 1) or (((i340.value == 1) and 0) or i340.value)))
                    end
                else
                    for i341, i342 in ipairs(i340.cvars) do
                        if (i342:get_int() == i340.value) then
                            i342:set_int((((i340.value == 0) and 1) or (((i340.value == 1) and 0) or i340.value)))
                        end
                    end
                end
            else
                if i340.cvar then
                    if (i340.cvar:get_int() ~= i340.value) then
                        i340.cvar:set_int(i340.value)
                    end
                else
                    for i343, i344 in ipairs(i340.cvars) do
                        if (i344:get_int() ~= i340.value) then
                            i344:set_int(i340.value)
                        end
                    end
                end
            end
        end
    end
    local v345 = function()
        local v346 = entity.get_local_player()
        if not entity.is_alive(v346) then
            return
        end
        v327(v346)
        v334()
    end
    reset = function()
        v59.tickbase_max, v59.tickbase_diff = nil, nil
        v59.old_tick_count = 0
        v59.cur = 0
        v59.banana = false
        v59.bomb_defused = false
        v59.bomb_exploded = false
        local cur_prev = { cur = {}, prev = {} }
        local v347 = {}
        local v348 = {}
    end
    reset()
    local v349 = function(a1_832)
        v59.current_cmd = a1_832.command_number
    end
    local v350 = function(a1_834)
        if (a1_834.command_number == v59.current_cmd) then
            v59.current_cmd = nil
            local v351 = entity.get_prop(entity.get_local_player(), "m_nTickBase")
            if (v59.tickbase_max ~= nil) then
                v59.tickbase_diff = (v351 - v59.tickbase_max)
            end
            v59.tickbase_max = math.max(v351, (v59.tickbase_max or 0))
        end
    end
    local v352 = function(a1_836)
        return math.floor((0.5 + (a1_836 / globals.tickinterval())))
    end
    local v353 = function(a1_838)
        return (globals.tickinterval() * a1_838)
    end
    local v354 = function()
        v59.fire_total_hits = 0
        v59.post_total_hits = 0
        v59.mode = "back"
        reset()
    end
    local v355 = function(a1_840)
        if not a1_840 then
            return
        end
        rage_fired = true
        if v101(ui.get(v78["misc"][2]), "fire") then
            local v356 = (v59.hitgroup_names[a1_840.hitgroup] or "?")
            local v357 = a1_840.target
            local v358 = (globals.tickcount() - a1_840.tick)
            local v359 = math.min(math.max(((entity.get_prop(v357, "m_flPoseParameter", 11) * 120) - 60), -58), 58)
            g_notify:add(string.format("fired at %s's %s for %i damage (%d%%) bt=%i (%ims) body=%iº", entity.get_player_name(a1_840.target), v356, a1_840.damage, a1_840.hit_chance, v358, totime((v358 * 1000)), v359), { 210, 210, 255, 255 }, 5, nil, "fire")
        end
        v59.fire_total_hits = entity.get_prop(entity.get_local_player(), "m_totalHitsOnServer")
        v59.handle_time = globals.realtime()
    end
    local v360 = function(a1_842)
        if (not a1_842 and ((v101(ui.get(v78["misc"][2]), "damage") or v101(ui.get(v78["misc"][2]), "hurt")) or v101(ui.get(v78["misc"][2]), "hurt self"))) then
            return
        end
        local v361 = entity.get_local_player()
        local v362 = (v59.hitgroup_names[a1_842.hitgroup] or '?')
        local v363 = v24.userid_to_entindex(a1_842.userid)
        local v364 = v24.userid_to_entindex(a1_842.attacker)
        if (v364 == v361) then
            if v101(ui.get(v78["misc"][2]), "damage") then
                g_notify:add(string.format('hit %s in the %s for %d damage (%d health remaining)', entity.get_player_name(v363), v362, a1_842.dmg_health, a1_842.health), { 255, 255, 255, 255 }, 5)
            end
        elseif ((v364 == 0) and (v363 == v361)) then
            if v101(ui.get(v78["misc"][2]), "hurt self") then
                g_notify:add(string.format("hurt yourself in the %s for %d damage (%d health remaining)", v362, a1_842.dmg_health, a1_842.health), { 255, 255, 255, 255 }, 5)
            end
        elseif ((v364 ~= 0) and (v363 == v361)) then
            if v101(ui.get(v78["misc"][2]), "hurt") then
                g_notify:add(string.format("hurt by %s in the %s for %d damage (%d health remaining)", entity.get_player_name(v364), v362, a1_842.dmg_health, a1_842.health), { 255, 255, 255, 255 }, 5)
            end
        end
    end
    local v365 = function(a1_844)
        if (not a1_844 and v101(ui.get(v78["misc"][2]), "miss")) then
            return
        end
        v59.post_total_hits = entity.get_prop(entity.get_local_player(), 'm_totalHitsOnServer')
        if (a1_844.reason == "?") then
            if (((v59.post_total_hits == (v59.fire_total_hits + 1)) and (v59.post_total_hits < 255)) and (v59.fire_total_hits < 255)) then
                a1_844.reason = "godmode"
            elseif ((globals.realtime() - v59.handle_time) >= 0.5) then
                a1_844.reason = "delay"
            end
        end
        g_notify:add(string.format('missed shot due to %s', a1_844.reason), { 255, 255, 255, 255 }, 5)
    end
    local function fn15(a1_846)
        if not v101(ui.get(v78["misc"][2]), "fire") then
            return
        end
        g_notify:add(string.format("fired at %s's %s for %i damage (%d%%) bt=? (?ms) body=?º s=dormant", entity.get_player_name(a1_846.userid), string.lower(a1_846.aim_hitbox), a1_846.dmg_health, (a1_846.accuracy * 100)), { 210, 210, 255, 255 }, 5, nil, "fire")
    end
    local function fn16(a1_848)
        if not v101(ui.get(v78["misc"][2]), "miss") then
            return
        end
        g_notify:add(string.format("fired at %s's %s for ? damage (%d%%) bt=? (?ms) body=?º s=dormant", entity.get_player_name(a1_848.userid), string.lower(a1_848.aim_hitbox), (a1_848.accuracy * 100)), { 210, 210, 255, 255 }, 5)
        v24.delay_call(0.5, function()
        g_notify:add("missed shot due to dormant", nil, 5)
    end)
    end
    local function fn17(a1_850)
        if not a1_850 then
            return false
        end
        return (v59.mode ~= "back")
    end
    local function fn18(a1_852, a1_854)
        local v366 = { "CWorld", "CCSPlayer", "CFuncBrush", "CPhysicsPropMultiplayer", "CBaseEntity", "CC4" }
        local_origin = vector(entity.get_origin(a1_854))
        local v367, v368, v369 = v24.eye_position()
        local v370, v371 = v24.camera_angles()
        local v372 = math.sin(math.rad(v370))
        local v373 = math.cos(math.rad(v370))
        local v374 = math.sin(math.rad(v371))
        local v375 = math.cos(math.rad(v371))
        local v376 = { (v373 * v375), (v373 * v374), -v372 }
        local v377, v378 = v24.trace_line(a1_854, v367, v368, v369, (v367 + (v376[1] * 8192)), (v368 + (v376[2] * 8192)), (v369 + (v376[3] * 8192)))
        local v379 = true
        if (((v378 == -1) or (v378 == nil)) or (a1_854 == nil)) then
            return
        end
        object_origin = vector(entity.get_origin(v378))
        local v380 = (math.abs(local_origin:dist2d(object_origin)) > 150)
        if (v378 ~= nil) then
            for i381 = 0, #v366, 1 do
                if (entity.get_classname(v378) == v366[i381]) then
                    v379 = false
                end
            end
        end
        if v380 then
            v379 = false
        end
        if ((not v379 and not v59.is_defusing) and a1_852.in_use) then
            a1_852.in_use = 0
        end
    end
    local v382 = function(a1_856, a1_858)
        if (not a1_858 or entity.is_dormant(a1_858)) then
            return
        end
        local v383 = vector(entity.get_origin(a1_858))
        local v384 = vector(entity.get_origin(a1_856))
        if ((v384:dist2d(v383) > 1400) and (vector(entity.get_prop(a1_856, 'm_vecVelocity')):length2d() <= 150)) then
            return true
        end
        return false
    end
    local v385 = function(a1_860, a1_862, a1_864)
        if (not a1_862 or entity.is_dormant(a1_862)) then
            return
        end
        local v386 = { entity.get_origin(a1_862) }
        local v387 = { entity.get_origin(a1_860) }
        local v388 = entity.get_player_weapon(a1_860)
        if (((v387[3] > (v386[3] + 55)) and ((vector(entity.get_prop(a1_860, 'm_vecVelocity')):length2d() <= 60) or (a1_864.in_duck == 1))) or ((a1_864.in_duck == 1) and (entity.get_classname(v388) == "CKnife"))) then
            return true
        end
        return false
    end
    local v389 = function(a1_866, a1_868)
        if (not a1_868 or entity.is_dormant(a1_868)) then
            return
        end
        local v390 = { entity.get_origin(a1_868) }
        local v391 = { entity.get_prop(a1_868, "m_vecViewOffset") }
        local v392 = { v24.eye_position() }
        local v393 = { (v390[1] + v391[1]), (v390[2] + v391[2]), (v390[3] + v391[3]) }
        local v394 = { math.abs((v393[1] - v392[1])), math.abs((v393[2] - v392[2])), math.abs((v393[3] - v392[3])) }
        local v395 = math.abs((v394[1] + v394[2]))
        if (v395 > 425) then
            return
        end
        local v396 = { entity.get_prop(a1_866, 'm_vecVelocity') }
        local v397 = { entity.get_prop(a1_868, 'm_vecVelocity') }
        local v398 = v353(16)
        local v399 = { (v392[1] + (v396[1] * v398)), (v392[2] + (v396[2] * v398)), (v392[3] + (v396[3] * v398)) }
        local v400 = { (v393[1] + (v397[1] * v398)), (v393[2] + (v397[2] * v398)), (v393[3] + (v397[3] * v398)) }
        local v401, v402 = v24.trace_line(a1_866, v399[1], v399[2], v399[3], v400[1], v400[2], v400[3])
        local v403, v404 = v24.trace_line(a1_866, v400[1], v400[2], v400[3], v399[1], v399[2], v399[3])
        local v405, v406 = v24.trace_line(a1_866, v392[1], v392[2], v392[3], v393[1], v393[2], v393[3])
        local v407, v408 = v24.trace_line(a1_866, v392[1], v392[2], v392[3], v390[1], v390[2], v390[3])
        local v409 = ((v402 == a1_868) or (v401 == 1))
        local v410 = ((v404 == a1_866) or (v403 == 1))
        local v411 = ((v406 == a1_868) or (v405 == 1))
        local v412 = ((v408 == a1_868) or (v407 == 1))
        local v413 = entity.get_player_weapon(a1_868)
        if ((entity.get_classname(v413) == "CKnife") and (((v409 or v410) or v411) or v412)) then
            return true
        end
        return false
    end
    local v414 = function()
        local v415 = entity.get_players(true)
        if (#v415 == 0) then
            v59.hittable = false
            return
        end
        for i416, i417 in ipairs(v415) do
            if (entity.is_alive(i417) and not entity.is_dormant(i417)) then
                local v418 = (entity.get_esp_data(i417).flags or 0)
                if (bit_2.band(v418, bit_2.lshift(1, 11)) ~= 0) then
                    v59.hittable = true
                else
                    v59.hittable = false
                end
            else
                v59.hittable = false
            end
        end
        return false
    end
    local v419 = function(a1_870)
        if (ui.get(v100.anti_aim.other.ref_onshotantiaim[1]) and ui.get(v100.anti_aim.other.ref_onshotantiaim[2])) then
            return
        end
        if (not ui.get(v100.rage.ref_doubletap[1]) and not ui.get(v100.rage.ref_doubletap[2])) then
            return
        end
        if (ui.get(v78["misc"][8]) == "safest") then
            v59.defensive_risk = -4
        elseif (ui.get(v78["misc"][8]) == "low") then
            v59.defensive_risk = -3
        elseif (ui.get(v78["misc"][8]) == "medium") then
            v59.defensive_risk = -2
        elseif (ui.get(v78["misc"][8]) == "high") then
            v59.defensive_risk = -1
        end
        if (ui.get(v78["misc"][6]) or (ui.get(v78["misc"][7]) and v59.hittable)) then
            a1_870.force_defensive = 1
            if (v59.tickbase_diff == v59.defensive_risk) then
                ui.set(v100.rage.ref_doubletap[1], false)
                a1_870.force_defensive = 0
            end
        else
            a1_870.force_defensive = 0
            ui.set(v100.rage.ref_doubletap[1], true)
        end
    end
    local v420 = function(a1_872)
        print(v59.tickbase_diff)
        if (v21.get_double_tap() or (((v59.tickbase_diff ~= 1) and ui.get(v100.rage.ref_doubletap[1])) and ui.get(v100.rage.ref_doubletap[2]))) then
            a1_872.force_defensive = 1
            if (v59.tickbase_diff ~= 1) then
                ui.set(v100.rage.ref_doubletap[1], false)
            end
        else
            ui.set(v100.rage.ref_doubletap[1], true)
        end
    end
    local function fn19(a1_874, a1_876, a1_878)
        local v421 = {
{
                    index = 13,
                    condition = "backstab",
                    check = (function()
    return v389(a1_876, a1_878)
end)
                },
{
                    index = 16,
                    condition = "legit",
                    check = (function()
    if ((bit_2.band(a1_874.buttons, 32) == 32) and not v59.is_defusing) then
        fn18(a1_874, a1_876)
        return true
    end
end)
                },
{
                    index = 11,
                    condition = "manual",
                    check = (function()
    if fn17((v101(ui.get(v78["anti-aim 2"][0]), "manual anti-aim") and ui.get(v78["anti-aim 2"][3]))) then
        return true
    end
end)
                },
{
                    index = 14,
                    condition = "height",
                    check = (function()
    return v385(a1_876, a1_878, a1_874)
end)
                },
{
                    index = 15,
                    condition = "high distance",
                    check = (function()
    return v382(a1_876, a1_878)
end)
                },
{
                    index = 12,
                    condition = "freestanding",
                    check = (function()
    return false
end)
                },
{
                    index = 9,
                    condition = "in fake duck",
                    check = (function()
    return (ui.get(v100.rage.other.ref_fakeduck) and (bit_2.band(entity.get_prop(a1_876, "m_fFlags"), 1) ~= 0))
end)
                },
{
                    index = 10,
                    condition = "fakelag",
                    check = (function()
    return (not ui.get(v100.rage.ref_doubletap[2]) and not ui.get(v100.anti_aim.other.ref_onshotantiaim[2]))
end)
                },
{
                    index = 5,
                    condition = "in air",
                    check = (function()
    return (((v59.jumping == true) or (v59.on_ground == false)) and (a1_874.in_duck == 0))
end)
                },
{
                    index = 6,
                    condition = "in air duck",
                    check = (function()
    return (((v59.jumping == true) or (v59.on_ground == false)) and (a1_874.in_duck == 1))
end)
                },
{
                    index = 8,
                    condition = "in duck moving",
                    check = (function()
    return ((a1_874.in_duck == 1) and (vector(entity.get_prop(a1_876, 'm_vecVelocity')):length2d() > 1.1))
end)
                },
{
                    index = 7,
                    condition = "in duck",
                    check = (function()
    return (a1_874.in_duck == 1)
end)
                },
{
                    index = 2,
                    condition = "standing",
                    check = (function()
    return (vector(entity.get_prop(a1_876, 'm_vecVelocity')):length2d() < 1.1)
end)
                },
{
                    index = 4,
                    condition = "slow motion",
                    check = (function()
    return (ui.get(v100.anti_aim.other.ref_slowmotion[1]) and ui.get(v100.anti_aim.other.ref_slowmotion[2]))
end)
                },
{
                    index = 3,
                    condition = "moving",
                    check = (function()
    return ((vector(entity.get_prop(a1_876, 'm_vecVelocity')):length2d() > 1.1) and (bit_2.band(entity.get_prop(a1_876, "m_fFlags"), 1) == 1))
end)
                }
            }
        for i422, i423 in ipairs(v421) do
            if i423.check() then
                if (ui.get(v78["anti-aim"][0]) == "gamesense") then
                    if ((v68 ~= nil) and ui.get(v68[i423.index][0])) then
                        if (ui.get(v68[i423.index][12]) and ui.get(v78["anti-aim 2"][2])) then
                            if ui.get(v68[12][0]) then
                                return "freestanding", 12
                            else
                                return "freestanding", 1
                            end
                        end
                        return i423.condition, i423.index
                    end
                end
            end
        end
        if ((v68 ~= nil) and ui.get(v68[1][0])) then
            return "global", 1
        end
        return "invalid", -1
    end
    local v424 = function(a1_880, a1_882, a1_884, a1_886)
        if not a1_886 then
            return
        end
        v59.current_condition, v59.current_condition_index = fn19(a1_880, a1_882, a1_884)
        if (v59.current_condition == "invalid") then
            v112()
            return
        end
        if (ui.get(v78["anti-aim"][0]) == "gamesense") then
            ui.set(v100.anti_aim.anti_aimbot_angles.ref_pitch[1], ui.get(v68[v59.current_condition_index][1]))
            ui.set(v100.anti_aim.anti_aimbot_angles.ref_pitch[2], ui.get(v68[v59.current_condition_index][2]))
            ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw_base, ui.get(v68[v59.current_condition_index][3]))
            ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[1], ui.get(v68[v59.current_condition_index][4]))
            if (v59.current_condition == "manual") then
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_freestand[1], false)
                if (v59.mode == "left") then
                    ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[2], -ui.get(v78["anti-aim 2"][8]))
                elseif (v59.mode == "right") then
                    ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[2], ui.get(v78["anti-aim 2"][9]))
                elseif (v59.mode == "forward") then
                    ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[2], 180)
                end
            else
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[2], ui.get(v68[v59.current_condition_index][5]))
            end
            if (ui.get(v68[v59.current_condition_index][6]) ~= "slow") then
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw_jitter[1], ui.get(v68[v59.current_condition_index][6]))
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw_jitter[2], ui.get(v68[v59.current_condition_index][7]))
            else
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw_jitter[1], "Off")
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw_jitter[2], 0)
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[2], (((v59.fake_fakelag >= 3) and (-ui.get(v68[v59.current_condition_index][7]) / 2)) or (ui.get(v68[v59.current_condition_index][7]) / 2)))
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_body_yaw[1], "static")
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_body_yaw[2], (((v59.fake_fakelag >= 3) and -180) or 180))
            end
            if (ui.get(v68[v59.current_condition_index][6]) ~= "slow") then
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_body_yaw[1], ui.get(v68[v59.current_condition_index][8]))
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_body_yaw[2], ui.get(v68[v59.current_condition_index][9]))
            end
            ui.set(v100.anti_aim.anti_aimbot_angles.ref_freestand_body, ui.get(v68[v59.current_condition_index][10]))
            ui.set(v100.anti_aim.anti_aimbot_angles.ref_edge_yaw, ui.get(v68[v59.current_condition_index][11]))
            ui.set(v100.anti_aim.anti_aimbot_angles.ref_roll, ui.get(v68[v59.current_condition_index][13]))
            if (v59.current_condition == "freestanding") then
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_freestand[1], true)
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_edge_yaw, false)
            else
                ui.set(v100.anti_aim.anti_aimbot_angles.ref_freestand[1], false)
            end
            if ui.get(v68[v59.current_condition_index][14]) then
                a1_880.force_defensive = 1
            end
            if ((((globals.chokedcommands() < 13) and (v59.tickbase_diff ~= nil)) and (v59.tickbase_diff ~= 1)) and (v59.tickbase_diff < -2)) then
                local v425 = v68[v59.current_condition_index]
                local v426 = ui.get(v425[15])
                local v427 = ui.get(v425[16])
                if ((v426 ~= "off") and (v426 ~= "zero")) then
                    ui.set(v100.anti_aim.anti_aimbot_angles.ref_pitch[1], v426)
                else
                    if (v426 == "zero") then
                        ui.set(v100.anti_aim.anti_aimbot_angles.ref_pitch[1], "custom")
                        ui.set(v100.anti_aim.anti_aimbot_angles.ref_pitch[2], 0)
                    end
                end
                if (v427 ~= "off") then
                    ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[1], "180")
                    ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw_jitter[1], "off")
                    if (v427 == "forward") then
                        ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[2], 180)
                    elseif (v427 == "spin") then
                        ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[2], v90(v105(v59.yaw_increment_spin), -180, 180))
                    elseif (v427 == "jitter") then
                        ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[2], ((v59.banana and 90) or -90))
                    elseif (v427 == "opposite") then
                        local forward_left = { forward = 0, left = 90, right = -90 }
                        local v428 = forward_left[v59.mode]
                        if (v428 ~= nil) then
                            ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[2], v428)
                        end
                    end
                end
            end
            ui.set(v100.anti_aim.anti_aimbot_angles.ref_yaw[1], ui.get(v68[v59.current_condition_index][4]))
        else
            if (ui.get(v78["anti-aim"][0]) == "wraith (dont use)") then
                v112()
            end
        end
    end
    local v429 = function(a1_888)
        local_origin = vector(entity.get_origin(a1_888))
        local v430 = nil
        local v431 = vector(entity.get_prop(entity.get_all("CPlantedC4")[1], "m_vecOrigin"))
        if (v431.x ~= nil) then
            v430 = local_origin:dist(v431)
        else
            v430 = nil
        end
        local v432 = entity.get_prop(a1_888, "m_iTeamNum")
        v59.is_defusing = ((((v432 == 3) and (v430 < 60)) and not v59.bomb_defused) and not v59.bomb_exploded)
    end
    local v433 = function(a1_890)
        local v434 = entity.get_local_player()
        local v435 = v24.current_threat()
        if ((ui.get(v78["debug"][0]) and v74.is_hovered) or v120.dragging) then
            a1_890.in_attack = false
        end
        v59.on_ground = (bit_2.band(entity.get_prop(v434, "m_fFlags"), 1) == 1)
        v59.jumping = (ui.get(v100.misc.movement.ref_bhop) and (a1_890.in_jump == 1))
        v59.in_speed = (bit_2.band(a1_890.buttons, 131072) > 0)
        v414()
        v419(a1_890)
        v429(v434)
        if (globals.chokedcommands() == 0) then
            v59.current_desync = math.min(math.max(((entity.get_prop(v434, "m_flPoseParameter", 11) * 120) - 60), -58), 58)
            v59.current_desync = (((v59.current_desync > 0) and math.ceil(v59.current_desync)) or math.floor(v59.current_desync))
        end
        if (globals.chokedcommands() == 0) then
            v59.fake_fakelag = (v59.fake_fakelag + 1)
            if (v59.fake_fakelag >= 6) then
                v59.fake_fakelag = 0
            end
        end
        v424(a1_890, v434, v435, true)
    end
    local v436 = function()
        if not v74.is_open then
            v74.mouse_press = false
            return
        end
        local v437 = ui.get(v100.misc.settings.ref_dpiscale)
        local v438 = { ui.menu_size() }
        local v439 = { ui.menu_position() }
        local v440 = { ui.mouse_position() }
        scale = { 0, 0 }
        scale_x = 0
        if (v437 == "100%") then
            scale = { v74.dpi_scaling_y[1][1], v74.dpi_scaling_y[1][2] }
            scale_x = 76
        elseif (v437 == "125%") then
            scale = { v74.dpi_scaling_y[2][1], v74.dpi_scaling_y[2][2] }
            scale_x = 95
        elseif (v437 == "150%") then
            scale = { v74.dpi_scaling_y[3][1], v74.dpi_scaling_y[3][2] }
            scale_x = 113
        elseif (v437 == "175%") then
            scale = { v74.dpi_scaling_y[4][1], v74.dpi_scaling_y[4][2] }
            scale_x = 132
        elseif (v437 == "200%") then
            scale = { v74.dpi_scaling_y[5][1], v74.dpi_scaling_y[5][2] }
            scale_x = 151
        end
        if v24.key_state(1) then
            if not v74.mouse_press then
                v74.mouse_press = true
                if ((v440[1] > (v439[1] + 5)) and (v440[1] < ((v439[1] + 5) + scale_x))) then
                    if ((v440[2] > (v439[2] + scale[1])) and (v440[2] < (v439[2] + scale[2]))) then
                        v74.selected_gs_tab = true
                    elseif ((v440[2] > (v439[2] + 19)) or ((((v440[2] < (v439[2] + v438[2])) and ((v440[2] < (v439[2] + scale[1])) and (v440[2] > (v439[2] + scale[2])))) and (v440[2] < (v439[2] + v438[2]))) and (v74.selected_gs_tab == true))) then
                        v74.selected_gs_tab = false
                    end
                end
            end
        else
            v74.mouse_press = false
        end
    end
    local v441 = function()
        if (entity.get_prop(entity.get_local_player(), "m_MoveType") == 8) then
            v59.current_condition_index = 17
            v59.current_condition = "noclip"
        end
        local v442 = {
        ["left"] = v78["anti-aim 2"][4],
        ["right"] = v78["anti-aim 2"][5],
        ["forward"] = v78["anti-aim 2"][6],
        ["back"] = v78["anti-aim 2"][7],
    }
        local v443
        for i444, i445 in pairs(v442) do
            if (ui.get(i445) and v59[(i444 .. "_ready")]) then
                v443 = (((i444 == v59.mode) and "back") or i444)
                v59[(i444 .. "_ready")] = false
            end
            if not ui.get(i445) then
                v59[(i444 .. "_ready")] = true
            end
        end
        v59.mode = (v443 or v59.mode)
    end
    local v446 = function()
        v59.cur = globals.tickcount()
        if (v59.cur > v59.old_tick_count) then
            v59.banana = not v59.banana
            v59.old_tick_count = (v59.cur + 1)
        end
        v59.yaw_increment_spin = (v59.yaw_increment_spin + 20)
        if (v59.yaw_increment_spin >= 1080) then
            v59.yaw_increment_spin = 0
        end
        if (v59.started == 10) then
            if (v59.pulse >= 10) then
                v59.pulse = (v59.pulse + 2.5)
            end
            if (v59.pulse >= 240) then
                v59.started = 1
            end
        end
        if (v59.started == 1) then
            v59.pulse = (v59.pulse - 2.5)
            if (v59.pulse <= 10) then
                v59.started = 10
            end
        end
    end
    local v447 = function(a1_892)
        local v448 = entity.get_players(true)
        if (#v448 == 0) then
            v60 = { cur = {}, prev = {}, pre_prev = {}, pre_pre_prev = {} }
            return nil
        end
        for i449, i450 in ipairs(v448) do
            if (entity.is_alive(i450) and not entity.is_dormant(i450)) then
                local v451 = 0
                local v452 = (entity.get_esp_data(i450).flags or 0)
                if (bit_2.band(v452, bit_2.lshift(1, 17)) ~= 0) then
                    v451 = (v352(entity.get_prop(i450, "m_flSimulationTime")) - 14)
                else
                    v451 = v352(entity.get_prop(i450, "m_flSimulationTime"))
                end
                if ((v60.cur[i450] == nil) or ((v451 - v60.cur[i450].simtime) >= 1)) then
                    v60.pre_pre_prev[i450] = v60.pre_prev[i450]
                    v60.pre_prev[i450] = v60.prev[i450]
                    v60.prev[i450] = v60.cur[i450]
                    local v453 = vector(entity.get_prop(a1_892, "m_vecOrigin"))
                    local v454 = vector(entity.get_prop(i450, "m_angEyeAngles"))
                    local v455 = vector(entity.get_prop(i450, "m_vecOrigin"))
                    local v456 = math.floor(v105((v454.y - calculate_angle(v453, v455))))
                    local v457 = entity.get_prop(i450, "m_flDuckAmount")
                    local v458 = (bit_2.band(entity.get_prop(i450, "m_fFlags"), 1) == 1)
                    local v459 = vector(entity.get_prop(i450, 'm_vecVelocity')):length2d()
                    local v460 = ((v458 and (((v457 == 1) and "duck") or (((v459 > 1.2) and "running") or "standing"))) or "air")
                    local v461 = entity.get_player_weapon(i450)
                    local v462 = entity.get_prop(v461, "m_fLastShotTime")
                    v60.cur[i450] = {
        id = i450,
        origin = vector(entity.get_origin(i450)),
        pitch = v454.x,
        yaw = v456,
        yaw_backwards = math.floor(v105(calculate_angle(v453, v455))),
        simtime = v451,
        stance = v460,
        esp_flags = (entity.get_esp_data(i450).flags or 0),
        last_shot_time = v462,
    }
                end
            end
        end
    end
    local v463 = false
    local v464 = function(a1_894)
        if not entity.is_alive(a1_894) then
            if v463 then
            end
            v463 = false
            return
        end
        local v465 = entity.get_players(true)
        if (#v465 == 0) then
            return nil
        end
        for i466, i467 in ipairs(v465) do
            if (entity.is_alive(i467) and not entity.is_dormant(i467)) then
                if ((((v60.cur[i467] ~= nil) and (v60.prev[i467] ~= nil)) and (v60.pre_prev[i467] ~= nil)) and (v60.pre_pre_prev[i467] ~= nil)) then
                    local v468 = nil
                    local v469 = nil
                    local v470
                    local v471
                    local v472 = math.abs(v105((v60.cur[i467].yaw - v60.prev[i467].yaw)))
                    local v473 = v105((v60.cur[i467].yaw - v60.prev[i467].yaw))
                    if (v60.cur[i467].last_shot_time ~= nil) then
                        v470 = (globals.curtime() - v60.cur[i467].last_shot_time)
                        v471 = (v470 / globals.tickinterval())
                        v469 = (v471 <= math.floor((0.2 / globals.tickinterval())))
                    end
                    if (ui.get(v78["debug"][1]) == "desync") then
                        v463 = true
                        local v474 = v60.cur[i467].yaw
                        local v475 = v60.prev[i467].yaw
                        local v476 = v60.pre_prev[i467].yaw
                        local v477 = v60.pre_pre_prev[i467].yaw
                        local v478 = v105((v474 - v475))
                        local v479 = v105((v474 - v476))
                        local v480 = v105((v475 - v477))
                        local v481 = v105((v475 - v476))
                        local v482 = v105((v476 - v477))
                        local v483 = v105((v477 - v474))
                        local v484 = v105((v472 - v483))
                        if ((v469 and (math.abs((math.abs(v60.cur[i467].pitch) - math.abs(v60.prev[i467].pitch))) > 30)) and (v60.cur[i467].pitch < v60.prev[i467].pitch)) then
                            v468 = "ON SHOT"
                        else
                            if (math.abs(v60.cur[i467].pitch) > 60) then
                                if (((v472 > 30) and (math.abs(v479) < 15)) and (math.abs(v480) < 15)) then
                                    v468 = "[!!]"
                                elseif ((((math.abs(v478) > 15) or (math.abs(v481) > 15)) or (math.abs(v482) > 15)) or (math.abs(v483) > 15)) then
                                    v468 = "[!!!]"
                                end
                            end
                        end
                        if (ui.get(v78["debug"][5]) and ui.get(v78["debug"][6])) then
                            if (v468 ~= "ON SHOT") then
                                plist.set(i467, "Add to whitelist", true)
                            else
                                plist.set(i467, "Add to whitelist", false)
                            end
                        else
                            plist.set(i467, "Add to whitelist", false)
                        end
                        if (v111[i467] and (v468 ~= nil)) then
                            if ((v60.cur[i467].stance == "standing") and (#v62[i467].stand < 20)) then
                                table.insert(v62[i467].stand_type, v468)
                                if ((v468 == "[!!!]") and (v472 > 5)) then
                                    table.insert(v62[i467].stand, v472)
                                else
                                    if (v468 == "[!!]") then
                                        table.insert(v62[i467].stand, v472)
                                    end
                                end
                            elseif ((v60.cur[i467].stance == "running") and (#v62[i467].run < 20)) then
                                table.insert(v62[i467].run_type, v468)
                                if ((v468 == "[!!!]") and (v472 > 5)) then
                                    table.insert(v62[i467].run, v472)
                                else
                                    if (v468 == "[!!]") then
                                        table.insert(v62[i467].run, v472)
                                    end
                                end
                            elseif ((v60.cur[i467].stance == "air") and (#v62[i467].air < 20)) then
                                table.insert(v62[i467].air_type, v468)
                                if ((v468 == "[!!!]") and (v472 > 5)) then
                                    table.insert(v62[i467].air, v472)
                                else
                                    if (v468 == "[!!]") then
                                        table.insert(v62[i467].air, v472)
                                    end
                                end
                            elseif ((v60.cur[i467].stance == "duck") and (#v62[i467].duck < 20)) then
                                table.insert(v62[i467].duck_type, v468)
                                if ((v468 == "[!!!]") and (v472 > 5)) then
                                    table.insert(v62[i467].duck, v472)
                                else
                                    if (v468 == "[!!]") then
                                        table.insert(v62[i467].duck, v472)
                                    end
                                end
                            end
                        end
                        if ((v60.cur[i467].pitch >= 78) and (v60.prev[i467].pitch > 78)) then
                            if ((v468 == "[!!!]") or (v468 == "[!!]")) then
                                if (v468 == "[!!]") then
                                    if (v105((v474 - v475)) > 0) then
                                        plist.set(i467, "Force body yaw", true)
                                        plist.set(i467, "Force body yaw value", 60)
                                    elseif (v105((v474 - v475)) < 0) then
                                        plist.set(i467, "Force body yaw", true)
                                        plist.set(i467, "Force body yaw value", -60)
                                    end
                                elseif (v468 == "[!!!]") then
                                    local v485 = 0
                                    local v486 = 0
                                    if ((((v475 == v105((v474 - v472))) or (v475 == v105((v474 + v472)))) and ((v476 == v105((v474 + v472))) or (v476 == v474))) and ((v476 == v105((v474 + v472))) or (v476 == v474))) then
                                        plist.set(i467, "Force body yaw", true)
                                        plist.set(i467, "Force body yaw value", 0)
                                        v485 = v474
                                    else
                                        if (v474 ~= v485) then
                                            if (v474 < 0) then
                                                plist.set(i467, "Force body yaw", true)
                                                plist.set(i467, "Force body yaw value", 60)
                                            else
                                                plist.set(i467, "Force body yaw", true)
                                                plist.set(i467, "Force body yaw value", -60)
                                            end
                                        end
                                    end
                                end
                            else
                                plist.set(i467, "Force body yaw", false)
                                plist.set(i467, "Force body yaw value", 0)
                            end
                        end
                    elseif (ui.get(v78["debug"][1]) == "---") then
                        v468 = nil
                        v463 = true
                        break
                    elseif (ui.get(v78["debug"][1]) == "off") then
                        if v463 then
                            v468 = nil
                            ui.set(v100.plist.reset, true)
                            plist.set(i467, "Force body yaw", false)
                            plist.set(i467, "Force body yaw value", 0)
                            v463 = false
                        end
                    end
                    v61[i467] = { anti_aim_type = v468, yaw_delta = v473 }
                end
            else
                m_fired = false
                time_difference = 0
                ticks_since_last_shot = 0
            end
        end
    end
    local v487 = function(a1_896)
        a1_896 = entity.get_local_player()
        if not ui.get(v64) then
            return
        end
        if v101(ui.get(v78["misc"][1]), "fake duck") then
            entity.set_prop(a1_896, "m_flPoseParameter", 1, 1)
        end
        v446()
        v447(a1_896)
        v464(a1_896)
    end
    v24.register_esp_flag("", 255, 255, 255, function(a1_898)
        if not entity.is_alive(entity.get_local_player()) then
            return
        end
        if ui.get(v78["debug"][1]) then
            if (entity.is_alive(a1_898) and not entity.is_dormant(a1_898)) then
                if (v61[a1_898] ~= nil) then
                    if (v61[a1_898].anti_aim_type ~= nil) then
                        return true, ("\affffffc8" .. string.upper(v61[a1_898].anti_aim_type))
                    end
                end
            end
        end
    end)
    local v488 = function()
        if (not ui.get(v78["debug"][0]) or not ui.get(v64)) then
            v74.menu_alpha = 0
            v74.is_hovered = false
            v76 = false
            return
        end
        local v489 = ui.get(v100.misc.settings.ref_dpiscale)
        v74.height = (v77[v489] or 68)
        if ui.get(v100.misc.settings.ref_menukey) then
            if not v75 then
                v75 = true
                v74.is_open = not v74.is_open
                v76 = false
            end
        else
            v75 = false
        end
        if not ui.is_menu_open() then
            v74.is_open = false
        end
        if not v76 then
            v74.fade_start_time = ((v74.is_open and globals.realtime()) or globals.realtime())
            v76 = true
        end
        if not v74.selected_gs_tab then
            v74.menu_alpha = 0
        end
        local v490 = (((v74.is_open and v74.selected_gs_tab) and 255) or 0)
        local v491 = (globals.realtime() - v74.fade_start_time)
        local v492 = math.min(1, (v491 / 0.5))
        v74.menu_alpha = v104(v74.menu_alpha, v490, v492)
        if (v74.menu_alpha <= 0) then
            v74.is_hovered = false
            return
        end
        local v493 = { ui.menu_size() }
        local v494 = math.ceil(((v493[1] - 12) / #v74.tabs_names))
        local v495 = { ui.menu_position() }
        local v496 = { ui.mouse_position() }
        v74.is_hovered = ((((v496[1] > v495[1]) and (v496[1] < (v495[1] + (v494 * #v74.tabs_names)))) and (v496[2] > (v495[2] - v74.height))) and (v496[2] < ((v495[2] - v74.height) + v74.height)))
        for i497, i498 in ipairs(v74.tabs_names) do
            local v499 = ((v495[1] + 6) + (v494 * (i497 - 1)))
            local v500 = ((((v496[1] > v499) and (v496[1] < (v499 + v494))) and (v496[2] > (v495[2] - v74.height))) and (v496[2] < v495[2]))
            if (v74.selected_tab == i497) then
                v74.selected_color[1] = { 20, 20, 20 }
                v74.selected_color[2] = { 210, 210, 210 }
            else
                v74.selected_color[1] = { 12, 12, 12 }
                v74.selected_color[2] = { 90, 90, 90 }
            end
            if (v500 and (v74.selected_tab ~= i497)) then
                v74.selected_color[1] = { 12, 12, 12 }
                v74.selected_color[2] = { 167, 167, 167 }
            end
            renderer.rectangle(v499, (v495[2] - v74.height), v494, v74.height, v74.selected_color[1][1], v74.selected_color[1][2], v74.selected_color[1][3], v74.menu_alpha)
            renderer.text((v499 + (v494 / 2)), (v495[2] - (v74.height / 2)), v74.selected_color[2][1], v74.selected_color[2][2], v74.selected_color[2][3], v74.menu_alpha, "c+d", 0, (((i497 == 6) and v73[ui.get(v78["debug"][4])]) or i498))
            if (v500 and v24.key_state(1)) then
                v74.selected_tab = i497
                for i501, i502 in ipairs(v69) do
                    if (v74.selected_tab == i501) then
                        ui.set(v78.tab, i502)
                    end
                end
            end
        end
        gamesense_outer(v495[1], v495[2], v493[1], v74.height, v74.menu_alpha, false)
    end
    local v503 = ui.new_label("Players", "Adjustments", "-")
    local v504 = ui.new_label("Players", "Adjustments", "-")
    local function fn20()
        local v505 = ui.get(v100.plist.players)
        if (v505 == nil) then
            return
        end
        if not v111[v505] then
            g_notify:add("[STEALER] Please enable 'scan anti-aim'.", nil, 5)
            return
        end
        if v110[v505] then
            if ((((#v62[v505].stand >= 20) or (#v62[v505].run >= 20)) or (#v62[v505].air >= 20)) or (#v62[v505].duck >= 20)) then
                if (#v62[v505].stand >= 20) then
                    local v506 = v99(v62[v505].stand_type)
                    local v507 = v99(v62[v505].stand)
                    if (v506 == "[!!]") then
                        v506 = "Center"
                    elseif (v506 == "[!!!]") then
                        v506 = "Skitter"
                    end
                    ui.set(v68[2][6], v506)
                    ui.set(v68[2][7], v507)
                end
                if (#v62[v505].run >= 20) then
                    local v508 = v99(v62[v505].run_type)
                    local v509 = v99(v62[v505].run)
                    if (v508 == "[!!]") then
                        v508 = "Center"
                    elseif (v508 == "[!!!]") then
                        v508 = "Skitter"
                    end
                    ui.set(v68[3][6], v508)
                    ui.set(v68[3][7], v509)
                end
                if (#v62[v505].air >= 20) then
                    local v510 = v99(v62[v505].air_type)
                    local v511 = v99(v62[v505].air)
                    if (v510 == "[!!]") then
                        v510 = "Center"
                    elseif (v510 == "[!!!]") then
                        v510 = "Skitter"
                    end
                    ui.set(v68[5][6], v510)
                    ui.set(v68[5][7], v511)
                end
                if (#v62[v505].duck >= 20) then
                    local v512 = v99(v62[v505].duck_type)
                    local v513 = v99(v62[v505].duck)
                    if (v512 == "[!!]") then
                        v512 = "Center"
                    elseif (v512 == "[!!!]") then
                        v512 = "Skitter"
                    end
                    ui.set(v68[7][6], v512)
                    ui.set(v68[7][7], v513)
                end
            else
                g_notify:add("[STEALER] At least one stance must be done", nil, 5)
            end
        else
            if (#v62[v505].stand ~= 20) then
                g_notify:add("[STEALER] Still scanning standing anti-aim", nil, 5)
                return
            end
            if (#v62[v505].run ~= 20) then
                g_notify:add("[STEALER] Still scanning running anti-aim", nil, 5)
                return
            end
            if (#v62[v505].air ~= 20) then
                g_notify:add("[STEALER] Still scanning air anti-aim", nil, 5)
                return
            end
            if (#v62[v505].duck ~= 20) then
                g_notify:add("[STEALER] Still scanning duck anti-aim", nil, 5)
                return
            end
            if (#v62[v505].stand >= 20) then
                local v514 = v99(v62[v505].stand_type)
                local v515 = v99(v62[v505].stand)
                if (v514 == "[!!]") then
                    v514 = "Center"
                elseif (v514 == "[!!!]") then
                    v514 = "Skitter"
                end
                ui.set(v68[2][6], v514)
                ui.set(v68[2][7], v515)
            end
            if (#v62[v505].run >= 20) then
                local v516 = v99(v62[v505].run_type)
                local v517 = v99(v62[v505].run)
                if (v516 == "[!!]") then
                    v516 = "Center"
                elseif (v516 == "[!!!]") then
                    v516 = "Skitter"
                end
                ui.set(v68[3][6], v516)
                ui.set(v68[3][7], v517)
            end
            if (#v62[v505].air >= 20) then
                local v518 = v99(v62[v505].air_type)
                local v519 = v99(v62[v505].air)
                if (v518 == "[!!]") then
                    v518 = "Center"
                elseif (v518 == "[!!!]") then
                    v518 = "Skitter"
                end
                ui.set(v68[5][6], v518)
                ui.set(v68[5][7], v519)
            end
            if (#v62[v505].duck >= 20) then
                local v520 = v99(v62[v505].duck_type)
                local v521 = v99(v62[v505].duck)
                if (v520 == "[!!]") then
                    v520 = "Center"
                elseif (v520 == "[!!!]") then
                    v520 = "Skitter"
                end
                ui.set(v68[7][6], v520)
                ui.set(v68[7][7], v521)
            end
        end
        g_notify:add(("[STEALER] Imported anti-aim settings from: " .. entity.get_player_name(v505)), nil, 5)
    end
    local v522 = function()
        local v523 = ui.get(v100.plist.players)
        if v523 then
            if v111[v523] then
                perc_stand = ((#v62[v523].stand / 20) * 100)
                perc_run = ((#v62[v523].run / 20) * 100)
                perc_air = ((#v62[v523].air / 20) * 100)
                perc_duck = ((#v62[v523].duck / 20) * 100)
                steal_string = (perc_stand .. ("% - " .. (perc_run .. ("% - " .. (perc_air .. ("% - " .. (perc_duck .. "%")))))))
                ui.set(v503, string.format("%s", steal_string))
                ui.set(v504, string.format("%s", "stand - run - air - duck"))
                if v110[v523] then
                    if ((((perc_stand == 100) or (perc_run == 100)) or (perc_air == 100)) or (perc_duck == 100)) then
                        ui.set(v503, string.format('%s', "done!"))
                    end
                else
                    if ((((perc_stand == 100) and (perc_run == 100)) and (perc_air == 100)) and (perc_duck == 100)) then
                        ui.set(v503, string.format('%s', "done!"))
                    end
                end
            else
                ui.set(v503, string.format('%s', "waiting for scan..."))
                v62[v523].stand = {}
                v62[v523].stand_type = {}
                v62[v523].run = {}
                v62[v523].run_type = {}
                v62[v523].air = {}
                v62[v523].air_type = {}
                v62[v523].duck = {}
                v62[v523].duck_type = {}
            end
        end
    end
    local v524 = ui.new_button("Players", "Adjustments", "import anti-aim", fn20)
    local v525 = false
    local v526 = function()
        local v527 = ui.get(v64)
        local v528 = false
        local v529 = ui.get(v78.tab)
        local v530 = ui.get(v78["anti-aim"][0])
        local v531 = ui.get(v78["anti-aim"][1])
        v488()
        if not ui.is_menu_open() then
            return
        end
        v436()
        v113(v527)
        if not v527 then
            if not v59.reset_once then
                v112()
                v59.reset_once = true
            end
            v59.smooth_wraith = -1080
            v59.smooth_dt = -1080
            v59.smooth_os = -1080
            v59.smooth_pc = -1080
            v59.smooth_bo = -1080
            v59.smooth_wraith_recode = -1080
            v59.smooth_dt_2 = -1080
            v59.smooth_stance = -1080
            v59.dt_os_text_anim = 0
            v59.current_cond_text_anim = 0
        else
            ui.set(v100.anti_aim.anti_aimbot_angles.ref_aa_enabled, true)
            v59.reset_once = false
        end
        if (v529 == "config") then
            ui.update(v78["config"][1], update_cfg())
        end
        ui.set_visible(v78.tab, (v527 and (ui.get(v78["debug"][0]) == false)))
        v522()
        if (ui.get(v78["debug"][1]) ~= "off") then
            ui.set_visible(v100.plist.force_body, false)
            ui.set_visible(v100.plist.force_body_value, false)
            v525 = true
        else
            if v525 then
                ui.set_visible(v100.plist.force_body, true)
                ui.set_visible(v100.plist.force_body_value, true)
                local v532 = entity.get_players(true)
                if (#v532 ~= 0) then
                    for i533, i534 in ipairs(v532) do
                        plist.set(i534, "Force body yaw", false)
                        plist.set(i534, "Force body yaw value", 0)
                    end
                end
                v525 = false
            end
        end
        for i535, i536 in pairs(v78) do
            if (i536 ~= v78.tab) then
                for i537, i538 in pairs(i536) do
                    ui.set_visible(i538, (v527 and (i535 == v529)))
                    if (v529 == "anti-aim 2") then
                        for i539 = 1, 9, 1 do
                            if ((i539 == 1) or (i539 == 2)) then
                                ui.set_visible(v78["anti-aim 2"][i539], (v527 and v101(ui.get(v78["anti-aim 2"][0]), "other anti-aim binds")))
                            elseif ((i539 > 2) and (i539 < 10)) then
                                ui.set_visible(v78["anti-aim 2"][i539], (v527 and v101(ui.get(v78["anti-aim 2"][0]), "manual anti-aim")))
                            end
                        end
                    end
                    if (v529 == "visuals") then
                        ui.set_visible(v78["visuals"][4], (v527 and ui.get(v78["visuals"][2])))
                        ui.set_visible(v78["visuals"][5], (v527 and ui.get(v78["visuals"][7])))
                        if (not v101(ui.get(v78["misc"][3]), "default") and not v101(ui.get(v78["misc"][3]), "center")) then
                            ui.set_visible(v78["visuals"][5], (v527 and false))
                            ui.set_visible(v78["visuals"][7], (v527 and false))
                        end
                    end
                    if (v529 == "misc") then
                        ui.set_visible(v78["misc"][5], (v527 and ui.get(v78["misc"][4])))
                    end
                    if (v529 == "debug") then
                        ui.set_visible(v78["debug"][3], (v527 and ui.get(v78["debug"][2])))
                    end
                end
            end
        end
        for i540, i541 in ipairs({ v70, v71 }) do
            v66 = i541
            for i542, i543 in pairs(i541) do
                if ((v530 == "gamesense") and (i541 == v70)) then
                    v68 = i541
                elseif ((v530 == "wraith (dont use)") and (i541 == v71)) then
                    v67 = i541
                end
                for i544, i545 in pairs(i543) do
                    v528 = (((((((v530 == "gamesense") and (i541 == v70)) or ((v530 == "wraith (dont use)") and (i541 == v71))) and (v72[i542] == v531)) and (v529 == "anti-aim")) and v527) and ((i545 == i541[i542][0]) or ui.get(i541[i542][0])))
                    if ((v530 == "gamesense") and (i541 == v70)) then
                        if ((((v531 == "freestanding") or (v531 == "manual")) or (v531 == "legit")) or (v531 == "backstab")) then
                            v528 = (v528 and ((i545 ~= i541[i542][11]) and (i545 ~= i541[i542][12])))
                        end
                        if (v531 == "manual") then
                            v528 = (v528 and (i545 ~= i541[i542][5]))
                        end
                        if (ui.get(i541[i542][1]) ~= "custom") then
                            v528 = (v528 and (i545 ~= i541[i542][2]))
                        end
                        if (ui.get(i541[i542][4]) == "off") then
                            v528 = (v528 and (((i545 ~= i541[i542][5]) and (i545 ~= i541[i542][6])) and (i545 ~= i541[i542][7])))
                        end
                        if (ui.get(i541[i542][6]) == "off") then
                            v528 = (v528 and (i545 ~= i541[i542][7]))
                        end
                        if ui.get(i541[i542][8]) then
                            if (ui.get(i541[i542][8]) == "off") then
                                v528 = (v528 and (i545 ~= i541[i542][10]))
                            end
                            if ((ui.get(i541[i542][8]) == "off") or (ui.get(i541[i542][8]) == "opposite")) then
                                v528 = (v528 and (i545 ~= i541[i542][9]))
                            end
                        end
                        if (ui.get(i541[i542][6]) == "slow") then
                            v528 = (v528 and ((i545 ~= i541[i542][9]) and (i545 ~= i541[i542][8])))
                        end
                    end
                    ui.set_visible(i545, v528)
                end
            end
        end
    end
    writefile(tostring("!default_preset2124089493w.cfg"), "dHJ1ZV9taW5pbWFsXzBfYXQgdGFyZ2V0c18xODBfMF9za2l0dGVyXzIwX2ppdHRlcl8wX2ZhbHNlX2ZhbHNlX2ZhbHNlXzBfZmFsc2Vfb2ZmX29mZl90cnVlX21pbmltYWxfMF9hdCB0YXJnZXRzXzE4MF8wX3NraXR0ZXJfMzBfaml0dGVyXzBfZmFsc2VfZmFsc2VfZmFsc2VfMF9mYWxzZV9vZmZfb2ZmX3RydWVfZGVmYXVsdF8wX2F0IHRhcmdldHNfMTgwXzBfc2xvd183MF9qaXR0ZXJfMF9mYWxzZV9mYWxzZV9mYWxzZV8wX2ZhbHNlX29mZl9vZmZfdHJ1ZV9kZWZhdWx0XzBfYXQgdGFyZ2V0c18xODBfMF9za2l0dGVyXzUwX2ppdHRlcl8wX2ZhbHNlX2ZhbHNlX2ZhbHNlXzBfZmFsc2Vfb2ZmX29mZl90cnVlX2RlZmF1bHRfMF9hdCB0YXJnZXRzXzE4MF8wX3NraXR0ZXJfMzBfaml0dGVyXzBfZmFsc2VfZmFsc2VfZmFsc2VfMF9mYWxzZV9vZmZfb2ZmX3RydWVfZGVmYXVsdF8wX2F0IHRhcmdldHNfMTgwXzBfc2xvd183M19qaXR0ZXJfMF9mYWxzZV9mYWxzZV9mYWxzZV8wX2ZhbHNlX29mZl9vZmZfdHJ1ZV9taW5pbWFsXzBfYXQgdGFyZ2V0c18xODBfLTE1X29mZl81X3N0YXRpY18tNTRfZmFsc2VfZmFsc2VfZmFsc2VfMF9mYWxzZV9vZmZfb2ZmX3RydWVfbWluaW1hbF8wX2F0IHRhcmdldHNfMTgwXzVfc2tpdHRlcl8zMF9qaXR0ZXJfMF9mYWxzZV9mYWxzZV9mYWxzZV8wX2ZhbHNlX29mZl9vZmZfZmFsc2Vfb2ZmXzBfbG9jYWwgdmlld19vZmZfMF9vZmZfMF9vZmZfMF9mYWxzZV9mYWxzZV9mYWxzZV8wX2ZhbHNlX29mZl9vZmZfdHJ1ZV9taW5pbWFsXzBfYXQgdGFyZ2V0c18xODBfM19vZmZzZXRfMTlfaml0dGVyXzE4MF9mYWxzZV9mYWxzZV9mYWxzZV8wX2ZhbHNlX29mZl9vZmZfdHJ1ZV9taW5pbWFsXzBfbG9jYWwgdmlld18xODBfMF9vZmZfMF9zdGF0aWNfMTgwX2ZhbHNlX2ZhbHNlX2ZhbHNlXzBfZmFsc2Vfb2ZmX2ppdHRlcl9mYWxzZV91cF8wX2F0IHRhcmdldHNfc3Bpbl8xOV9vZmZfNDdfaml0dGVyXzBfZmFsc2VfZmFsc2VfZmFsc2VfMF9mYWxzZV91cF9vZmZfdHJ1ZV9yYW5kb21fMF9hdCB0YXJnZXRzXzE4MF8xODBfb2ZmXzBfb2ZmXzE4MF9mYWxzZV9mYWxzZV9mYWxzZV8wX2ZhbHNlX29mZl9vZmZfdHJ1ZV9taW5pbWFsXzBfYXQgdGFyZ2V0c18xODBfMF9vZmZfOF9zdGF0aWNfMF9mYWxzZV9mYWxzZV9mYWxzZV8wX2ZhbHNlX29mZl9vZmZfdHJ1ZV9kZWZhdWx0XzBfYXQgdGFyZ2V0c18xODBfMF9vZmZfMF9zdGF0aWNfMF9mYWxzZV9mYWxzZV9mYWxzZV8wX2ZhbHNlX29mZl9vZmZfdHJ1ZV9vZmZfMF9sb2NhbCB2aWV3XzE4MF8xODBfb2ZmXzBfaml0dGVyXzBfZmFsc2VfZmFsc2VfZmFsc2VfMF9mYWxzZV9vZmZfb2ZmX2ZhbHNlX29mZl9vZmZfMF9vZmZfZmFsc2Vfb2ZmX29mZl8wX29mZl9mYWxzZV9vZmZfb2ZmXzBfb2ZmX2ZhbHNlX29mZl9vZmZfMF9vZmZfZmFsc2Vfb2ZmX29mZl8wX29mZl9mYWxzZV9vZmZfb2ZmXzBfb2ZmX2ZhbHNlX29mZl9vZmZfMF9vZmZfZmFsc2Vfb2ZmX29mZl8wX29mZl9mYWxzZV9vZmZfb2ZmXzBfb2ZmX2ZhbHNlX29mZl9vZmZfMF9vZmZfZmFsc2Vfb2ZmX29mZl8wX29mZl9mYWxzZV9vZmZfb2ZmXzBfb2ZmX2ZhbHNlX29mZl9vZmZfMF9vZmZfZmFsc2Vfb2ZmX29mZl8wX29mZl9mYWxzZV9vZmZfb2ZmXzBfb2ZmX3RydWVfb2ZmX29mZl8wX29mZl8=")
    writefile(tostring("!default_fs_preset2124089493w.cfg"), "ZmFsc2Vfb2ZmXzBfbG9jYWwgdmlld19vZmZfMF9vZmZfMF9vZmZfMF9mYWxzZV9mYWxzZV9mYWxzZV8wX2ZhbHNlX29mZl9vZmZfdHJ1ZV9kb3duXzBfYXQgdGFyZ2V0c18xODBfMF9za2l0dGVyXzQ1X2ppdHRlcl8wX2ZhbHNlX2ZhbHNlX3RydWVfMF9mYWxzZV9vZmZfb2ZmX3RydWVfZG93bl8wX2F0IHRhcmdldHNfMTgwXy0xX3Nsb3dfNDlfaml0dGVyXzBfZmFsc2VfZmFsc2VfdHJ1ZV8wX3RydWVfb2ZmX29wcG9zaXRlX3RydWVfZG93bl8wX2F0IHRhcmdldHNfMTgwXzFfc2xvd18xMTBfb3Bwb3NpdGVfMF9mYWxzZV9mYWxzZV9mYWxzZV8wX3RydWVfb2ZmX29wcG9zaXRlX3RydWVfZG93bl8wX2F0IHRhcmdldHNfMTgwXy01X2NlbnRlcl8yN19vcHBvc2l0ZV8wX2ZhbHNlX2ZhbHNlX2ZhbHNlXzBfdHJ1ZV96ZXJvX3NwaW5fdHJ1ZV9taW5pbWFsXy00Nl9hdCB0YXJnZXRzXzE4MF8tNV9jZW50ZXJfMjdfc3RhdGljXzdfZmFsc2VfZmFsc2VfZmFsc2VfMF90cnVlX3JhbmRvbV9qaXR0ZXJfdHJ1ZV9kb3duXzBfYXQgdGFyZ2V0c18xODBfLTdfb2ZmXzMyX3N0YXRpY18tMTgwX2ZhbHNlX2ZhbHNlX2ZhbHNlXzBfZmFsc2Vfb2ZmX29mZl90cnVlX21pbmltYWxfMF9hdCB0YXJnZXRzXzE4MF8tMV9zbG93XzQ1X29wcG9zaXRlXy0xODBfZmFsc2VfZmFsc2VfZmFsc2VfMF90cnVlX21pbmltYWxfb3Bwb3NpdGVfdHJ1ZV9kb3duXzBfYXQgdGFyZ2V0c18xODBfLTJfY2VudGVyXzMyX3N0YXRpY18tMTgwX2ZhbHNlX2ZhbHNlX2ZhbHNlXzBfdHJ1ZV9taW5pbWFsX29wcG9zaXRlX2ZhbHNlX29mZl8wX2xvY2FsIHZpZXdfb2ZmXzBfb2ZmXzBfb2ZmXzBfZmFsc2VfZmFsc2VfZmFsc2VfMF9mYWxzZV9vZmZfb2ZmX2ZhbHNlX29mZl8wX2xvY2FsIHZpZXdfb2ZmXzBfb2ZmXzBfb2ZmXzBfZmFsc2VfZmFsc2VfZmFsc2VfMF9mYWxzZV9vZmZfb2ZmX3RydWVfZG93bl8wX2F0IHRhcmdldHNfMTgwXzBfb2ZmXzE1X29wcG9zaXRlXzBfZmFsc2VfZmFsc2VfZmFsc2VfMF9mYWxzZV9vZmZfb2ZmX3RydWVfb2ZmXzBfYXQgdGFyZ2V0c18xODBfMTgwX29mZl8wX29wcG9zaXRlXzBfZmFsc2VfZmFsc2VfZmFsc2VfMF9mYWxzZV9vZmZfb2ZmX2ZhbHNlX21pbmltYWxfMF9hdCB0YXJnZXRzXzE4MF8tMV9vZmZfOF9vcHBvc2l0ZV8zX2ZhbHNlX2ZhbHNlX2ZhbHNlXzBfZmFsc2VfbWluaW1hbF9vZmZfZmFsc2Vfb2ZmXzBfbG9jYWwgdmlld19vZmZfMF9vZmZfMF9vZmZfMF9mYWxzZV9mYWxzZV9mYWxzZV8wX2ZhbHNlX29mZl9vZmZfdHJ1ZV9jdXN0b21fMF9hdCB0YXJnZXRzX29mZl8wX29mZl8wX29wcG9zaXRlXzE4MF9mYWxzZV9mYWxzZV9mYWxzZV8wX2ZhbHNlX29mZl9vZmZfZmFsc2Vfb2ZmX29mZl8wX29mZl9mYWxzZV9vZmZfb2ZmXzBfb2ZmX2ZhbHNlX29mZl9vZmZfMF9vZmZfZmFsc2Vfb2ZmX29mZl8wX29mZl9mYWxzZV9vZmZfb2ZmXzBfb2ZmX2ZhbHNlX29mZl9vZmZfMF9vZmZfZmFsc2Vfb2ZmX29mZl8wX29mZl9mYWxzZV9vZmZfb2ZmXzBfb2ZmX2ZhbHNlX29mZl9vZmZfMF9vZmZfZmFsc2Vfb2ZmX29mZl8wX29mZl9mYWxzZV9vZmZfb2ZmXzBfb2ZmX2ZhbHNlX2Zha2UgZG93biAoLTE4MClfY2VudGVyXzIzX2ppdHRlcl9mYWxzZV9vZmZfb2ZmXzBfb2ZmX2ZhbHNlX29mZl9vZmZfMF9vZmZfZmFsc2Vfb2ZmX29mZl8wX29mZl90cnVlX29mZl9vZmZfMF9vZmZf")
    local v546 = function()
        if (ui.get(v78["config"][2]) == "") then
            if v101(ui.get(v78["misc"][2]), "config changes") then
                g_notify:add("(error) empty config name", nil, 5)
            end
            return
        end
        if not v101(fn4(), (ui.get(v78["config"][2]) .. "2124089493w.cfg")) then
            if v101(ui.get(v78["misc"][2]), "config changes") then
                g_notify:add(("'" .. (ui.get(v78["config"][2]) .. "' anti-aim config created")), nil, 5)
            end
            writefile(tostring((ui.get(v78["config"][2]) .. "2124089493w.cfg")), "blank")
        else
            if v101(ui.get(v78["misc"][2]), "config changes") then
                g_notify:add(("(error) '" .. (string.sub(fn4()[(ui.get(v78["config"][1]) + 1)], 1, -16) .. "' anti-aim config already exists")), nil, 5)
            end
        end
    end
    local v547 = function()
        if ((ui.get(v78["config"][1]) == nil) or (fn4()[(ui.get(v78["config"][1]) + 1)] == nil)) then
            if v101(ui.get(v78["misc"][2]), "config changes") then
                g_notify:add("(error) no config selected", nil, 5)
            end
            return
        end
        if (readfile(fn4()[(ui.get(v78["config"][1]) + 1)]) == "blank") then
            if v101(ui.get(v78["misc"][2]), "config changes") then
                g_notify:add(("(error) '" .. (string.sub(fn4()[(ui.get(v78["config"][1]) + 1)], 1, -16) .. "' anti-aim config is blank")), nil, 5)
            end
            return
        end
        local v548 = v85(v22.decode(readfile(fn4()[(ui.get(v78["config"][1]) + 1)]), "base64"), "_")
        local v549 = 1
        for i550, i551 in ipairs({ v70, v71 }) do
            for i552, i553 in pairs(i551) do
                if (i551 == v70) then
                    for i554 = 0, 16, 1 do
                        if (v548[v549] == "true") then
                            ui.set(i551[i552][i554], true)
                        elseif (v548[v549] == "false") then
                            ui.set(i551[i552][i554], false)
                        else
                            ui.set(i551[i552][i554], tostring(v548[v549]))
                        end
                        v549 = (v549 + 1)
                    end
                else
                    for i555 = 0, 4, 1 do
                        if (v548[v549] == "true") then
                            ui.set(i551[i552][i555], true)
                        elseif (v548[v549] == "false") then
                            ui.set(i551[i552][i555], false)
                        else
                            ui.set(i551[i552][i555], tostring(v548[v549]))
                        end
                        v549 = (v549 + 1)
                    end
                end
            end
        end
        if v101(ui.get(v78["misc"][2]), "config changes") then
            g_notify:add(("'" .. (string.sub(fn4()[(ui.get(v78["config"][1]) + 1)], 1, -16) .. "' anti-aim config loaded")), nil, 5)
        end
    end
    local v556 = function()
        local v557 = ""
        for i558, i559 in ipairs({ v70, v71 }) do
            for i560, i561 in pairs(i559) do
                if (i559 == v70) then
                    for i562 = 0, 16, 1 do
                        v557 = (v557 .. (tostring(ui.get(i559[i560][i562])) .. "_"))
                    end
                elseif (i559 == v71) then
                    for i563 = 0, 4, 1 do
                        v557 = (v557 .. (tostring(ui.get(i559[i560][i563])) .. "_"))
                    end
                end
            end
        end
        database.write("current_clip_board_to_save", v22.encode(v557, "base64"))
        read_data = database.read("current_clip_board_to_save")
        writefile(fn4()[(ui.get(v78["config"][1]) + 1)], read_data)
        if v101(ui.get(v78["misc"][2]), "config changes") then
            g_notify:add(("'" .. (string.sub(fn4()[(ui.get(v78["config"][1]) + 1)], 1, -16) .. "' anti-aim config saved")), nil, 5)
        end
    end
    local v564 = function()
        if ((ui.get(v78["config"][1]) == nil) or (fn4()[(ui.get(v78["config"][1]) + 1)] == nil)) then
            return
        end
        if v101(ui.get(v78["misc"][2]), "config changes") then
            g_notify:add(("'" .. (string.sub(fn4()[(ui.get(v78["config"][1]) + 1)], 1, -16) .. "' anti-aim config deleted")), nil, 5)
        end
        v30.remove_file((v43 .. ("/" .. fn4()[(ui.get(v78["config"][1]) + 1)])), fn4()[(ui.get(v78["config"][1]) + 1)])
    end
    local v565 = function()
        if (v68 == nil) then
            return
        end
        for i566, i567 in pairs(v72) do
            ui.set(v68[i566][0], false)
            ui.set(v68[i566][1], "off")
            ui.set(v68[i566][2], 0)
            ui.set(v68[i566][3], "local view")
            ui.set(v68[i566][4], "off")
            ui.set(v68[i566][5], 0)
            ui.set(v68[i566][6], "off")
            ui.set(v68[i566][7], 0)
            ui.set(v68[i566][8], "off")
            ui.set(v68[i566][9], 0)
            ui.set(v68[i566][10], false)
            ui.set(v68[i566][11], false)
            ui.set(v68[i566][12], false)
            ui.set(v68[i566][13], 0)
            ui.set(v68[i566][14], false)
            ui.set(v68[i566][15], "off")
            ui.set(v68[i566][16], "off")
        end
        if v101(ui.get(v78["misc"][2]), "config changes") then
            g_notify:add("anti-aim config reset", nil, 5)
        end
    end
    local v568 = function()
        local v569 = v85(v22.decode(v23.get(), "base64"), "_")
        local v570 = 1
        for i571, i572 in ipairs({ v70, v71 }) do
            for i573, i574 in pairs(i572) do
                if (i572 == v70) then
                    for i575 = 0, 16, 1 do
                        if (v569[v570] == "true") then
                            ui.set(i572[i573][i575], true)
                        elseif (v569[v570] == "false") then
                            ui.set(i572[i573][i575], false)
                        else
                            ui.set(i572[i573][i575], tostring(v569[v570]))
                        end
                        v570 = (v570 + 1)
                    end
                else
                    for i576 = 0, 4, 1 do
                        if (v569[v570] == "true") then
                            ui.set(i572[i573][i576], true)
                        elseif (v569[v570] == "false") then
                            ui.set(i572[i573][i576], false)
                        else
                            ui.set(i572[i573][i576], tostring(v569[v570]))
                        end
                        v570 = (v570 + 1)
                    end
                end
            end
        end
        if v101(ui.get(v78["misc"][2]), "config changes") then
            g_notify:add("imported wraith anti-aim", nil, 5)
        end
    end
    local v577 = function()
        local v578 = ""
        for i579, i580 in ipairs({ v70, v71 }) do
            for i581, i582 in pairs(i580) do
                if (i580 == v70) then
                    for i583 = 0, 16, 1 do
                        v578 = (v578 .. (tostring(ui.get(i580[i581][i583])) .. "_"))
                    end
                elseif (i580 == v71) then
                    for i584 = 0, 4, 1 do
                        v578 = (v578 .. (tostring(ui.get(i580[i581][i584])) .. "_"))
                    end
                end
            end
        end
        v23.set(v22.encode(v578), "base64")
        if v101(ui.get(v78["misc"][2]), "config changes") then
            g_notify:add("exported wraith anti-aim", nil, 5)
        end
    end
    v78["config"][9] = ui.new_button("AA", "Anti-aimbot angles", "create", v546)
    v78["config"][3] = ui.new_button("AA", "Anti-aimbot angles", "load", v547)
    v78["config"][4] = ui.new_button("AA", "Anti-aimbot angles", "save", v556)
    v78["config"][5] = ui.new_button("AA", "Anti-aimbot angles", "delete", v564)
    v78["config"][6] = ui.new_button("AA", "Anti-aimbot angles", "reset", v565)
    v78["config"][7] = ui.new_button("AA", "Anti-aimbot angles", "import from clipboard", v568)
    v78["config"][8] = ui.new_button("AA", "Anti-aimbot angles", "export to clipboard", v577)
    local v585 = function()
        v112()
        v113(false)
        ui.set_visible(v100.plist.force_body, true)
        ui.set_visible(v100.plist.force_body_value, true)
        local v586 = entity.get_players(true)
        if (#v586 == 0) then
            return nil
        end
        for i587, i588 in ipairs(v586) do
            plist.set(i588, "Force body yaw", false)
            plist.set(i588, "Force body yaw value", 0)
        end
    end
    local v589 = function(a1_900)
        local v590 = ui.get(a1_900)
        local v591 = ((v590 and v24.set_event_callback) or v24.unset_event_callback)
        v591("paint", v313)
        v591("pre_render", v345)
        v591("run_command", v349)
        v591("predict_command", v350)
        v591("setup_command", v433)
        v591("net_update_start", v441)
        v591("net_update_end", v487)
        v591("dormant_hit", fn15)
        v591("dormant_miss", fn16)
        v591("round_prestart", v354)
        v591("aim_fire", v355)
        v591("player_hurt", v360)
        v591("aim_miss", v365)
        v591("player_death", fn14)
        v591("bomb_defused", function()
            v59.bomb_defused = true
        end)
        v591("bomb_exploded", function()
            v59.bomb_exploded = true
        end)
        v591("cs_match_end_restart", reset)
        v591("cs_game_disconnected", reset)
        v591("client_disconnect", reset)
        v591("player_connect_full", reset)
        v591("game_newmap", reset)
    end
    ui.set_callback(v64, v589)
    v589(v64)
    v24.set_event_callback("paint_ui", v526)
    v24.set_event_callback("shutdown", v585)
    cvar.cl_use_opens_buy_menu:set_int(0)
    cvar.cl_autowepswitch:set_int(0)
