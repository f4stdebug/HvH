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

    local csgo_weapons = require('gamesense/csgo_weapons')
    local ffi = require('ffi')
    local fsIface = ffi.cast(ffi.typeof("void***"), client.create_interface("filesystem_stdio.dll", "VFileSystem017"))
    local fsFind = ffi.cast("const char*(__thiscall*)(void*, const char*, int*)", fsIface[0][32])
    local function fileExists(filePath)
        local out = ffi.new("int[1]")
        return (fsFind(fsIface, filePath, out) ~= ffi.NULL)
    end
    ffi.cdef([[
	typedef struct {
		char pad_0[0x14];
		int m_nFlags;
		char pad_1[0x10];
		void* m_pParent;
		int m_nValue;
		float m_fValue;
		char* m_pszString;
	} ConVar;
]])
    client.set_event_callback("aim_fire", function()
        invoke_callback("Weapons1", "vol", "0")
        local weapon = entity.get_player_weapon(entity.get_local_player())
        if not csgo_weapons(weapon).is_gun then
            return
        end
        local weaponName = gsub("%s+", "")
        local path = ("sound/customweaponsounds/" .. (weaponName .. ".wav"))
        if not fileExists(path) then
            client.error_log(("File not found: " .. path))
            client.exec("snd_restart")
            return
        end
        client.exec(("play customweaponsounds/" .. weaponName))
    end)
    local previousAmmoCount = 0
    local previousFire = 0
    client.set_event_callback("setup_command", function(event)
        if (event.in_attack ~= 1) then
            return
        end
        invoke_callback("Weapons1", "vol", "0")
        local weapon = entity.get_player_weapon(entity.get_local_player())
        if not csgo_weapons(weapon).is_gun then
            return
        end
        local currentAmmoCount = entity.get_prop(weapon, "m_iClip1")
        local whenReadyToFire = entity.get_prop(weapon, "m_flNextPrimaryAttack")
        if (get_int() ~= 1) then
            if (((currentAmmoCount >= previousAmmoCount) or (whenReadyToFire <= globals.curtime())) or (whenReadyToFire <= previousFire)) then
                previousAmmoCount = currentAmmoCount
                return
            end
        else
            if ((whenReadyToFire <= globals.curtime()) or (whenReadyToFire == previousFire)) then
                return
            end
        end
        previousFire = whenReadyToFire
        previousAmmoCount = currentAmmoCount
        local weaponName = gsub("%s+", "")
        local path = ("sound/customweaponsounds/" .. (weaponName .. ".wav"))
        if not fileExists(path) then
            client.error_log(("File not found: " .. path))
            client.exec("snd_restart")
            return
        end
        client.exec(("play customweaponsounds/" .. weaponName))
    end)
    local function sv_cheats()
        local ICvar = client.create_interface("vstdlib.dll", "VEngineCvar007")
        local findVar = ffi.cast("void*(__thiscall*)(void*, const char*)", ffi.cast("void***", ICvar)[0][15])
        local sv_cheats = ffi.cast("ConVar*", findVar(ICvar, "sv_cheats"))
        sv_cheats.m_nFlags = bit.band(sv_cheats.m_nFlags, bit.bnot(32768))
        sv_cheats.m_nValue = 1
        sv_cheats.m_fValue = 1
    end
    pcall(sv_cheats)
    client.exec("snd_restart")
    client.set_event_callback("player_connect_full", function(event)
        if (client.userid_to_entindex(event.userid) ~= entity.get_local_player()) then
            return
        end
        client.delay_call(3, function()
            pcall(sv_cheats)
            client.exec("snd_restart")
        end)
    end)
    client.set_event_callback("shutdown", function()
        invoke_callback("Weapons1", "vol", "1")
    end)
