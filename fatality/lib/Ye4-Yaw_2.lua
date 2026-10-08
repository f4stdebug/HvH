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

local v0=0;local v1={get_pose_params={"client.dll","55 8B EC 8B 45 08 57 8B F9 8B 4F 04 85 C9 75 15"}};local v2={animstate=39356 -(83 + 9),m_pStudioHdr=3577 + 6999,landing_anim=170 + 95};local v3=function(v12,v13)return function(...)return v12(v13,...);end;end;local v4=ffi.typeof("uintptr_t**");local v5=ffi.cast(v4,utils.find_interface("client.dll","VClientEntityList003"));local v6=v3(ffi.cast("void*(__thiscall*)(void*, int)",v5[0 + 0][3]),v5);local v7=ffi.cast("struct {char pad[8]; float m_flStart; float m_flEnd; float m_flState;}*(__thiscall* )( void*, int )",utils.find_pattern(unpack(v1.get_pose_params)));local v8={};local v9=function(v14,v15,v16,v17)v14=ffi.cast("unsigned int",v14);if (v14==0) then return false;end local v20=ffi.cast("void**",v14 + v2.m_pStudioHdr)[0 + 0];if (v20==nil) then return false;end local v21=v7(v20,v15);if (v21==nil) then return;end if (v8[v15]==nil) then v8[v15]={};v8[v15].m_flStart=v21.m_flStart;v8[v15].m_flEnd=v21.m_flEnd;v8[v15].m_flState=v21.m_flState;v8[v15].installed=false;return true;end if ((v16~=nil) and  not v8[v15].installed) then v21.m_flStart=v16;v21.m_flEnd=v17;v21.m_flState=(v21.m_flStart + v21.m_flEnd)/2;v8[v15].installed=true;return true;end if v8[v15].installed then v21.m_flStart=v8[v15].m_flStart;v21.m_flEnd=v8[v15].m_flEnd;v21.m_flState=v8[v15].m_flState;v8[v15].installed=false;return true;end return false;end;local v10=function(v18)local v22=v6(engine.get_local_player());if (v22==nil) then return;end local v23=ffi.cast("void**",ffi.cast("unsigned int",v22) + v2.animstate)[0];if (v23==nil) then return;end v23=ffi.cast("unsigned int",v23);if (v23==(0 + 0)) then return;end local v24=ffi.cast("bool*",v23 + v2.landing_anim)[1642 -(298 + 1344)];if (v24==nil) then return;end for v28,v29 in pairs(v8) do v9(v22,v28);end v9(v22,272 -(100 + 172), -180, -(1599 -(307 + 1113)));v9(v22,6,1493.9 -(389 + 1104),627 -(337 + 289));end;local v11=function()local v25=v6(engine.get_local_player());if (v25==nil) then return;end for v30,v31 in pairs(v8) do v9(v25,v30);end end;on_create_move=function(v19)v10(v19);local v26=entities.get_entity(engine.get_local_player());if (v26==nil) then return;end local v27=bit.band(v26:get_prop("m_fFlags"),187 -(126 + 60));if (v27==(1920 -(711 + 1208))) then v0=v0 + (2 -1);else v0=0;end end;on_shutdown=function()v11();end;


local pGetModuleHandle_sig =
    utils.find_pattern("engine.dll", " FF 15 ? ? ? ? 85 C0 74 0B") or error("Couldn't find signature #1")
local pGetProcAddress_sig =
    utils.find_pattern("engine.dll", " FF 15 ? ? ? ? A3 ? ? ? ? EB 05") or error("Couldn't find signature #2")


local pGetProcAddress = ffi.cast("uint32_t**", ffi.cast("uint32_t", pGetProcAddress_sig) + 2)[0][0]
local fnGetProcAddress = ffi.cast("uint32_t(__stdcall*)(uint32_t, const char*)", pGetProcAddress)

local pGetModuleHandle = ffi.cast("uint32_t**", ffi.cast("uint32_t", pGetModuleHandle_sig) + 2)[0][0]
local fnGetModuleHandle = ffi.cast("uint32_t(__stdcall*)(const char*)", pGetModuleHandle)

local function proc_bind(module_name, function_name, typedef)
    local ctype = ffi.typeof(typedef)
    local module_handle = fnGetModuleHandle(module_name)
    local proc_address = fnGetProcAddress(module_handle, function_name)
    local call_fn = ffi.cast(ctype, proc_address)

    return call_fn
end

local nativeVirtualProtect =
    proc_bind(
    "kernel32.dll",
    "VirtualProtect",
    "int(__stdcall*)(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect)"
)

local function VirtualProtect(lpAddress, dwSize, flNewProtect, lpflOldProtect)
    return nativeVirtualProtect(ffi.cast("void*", lpAddress), dwSize, flNewProtect, lpflOldProtect)
end

local function PatchByte(address, value)
    local prot = ffi.new("unsigned long[1]")
    VirtualProtect(address, 1, 0x40, prot);
    ffi.cast("unsigned char*", address)[0] = value
    VirtualProtect(address, 1, prot[0], prot);
end

ffi.cdef
[[
    struct vec3_t
    {
        float x, y, z;
    };

    struct color_t
    {
        unsigned char r, g, b, a;
    };
]]

local master = gui.add_checkbox("Glow bullet impacts (Ye4-Yaw)", "lua>tab a")
local client_color = gui.add_colorpicker("lua>tab a>Glow bullet impacts (Ye4-Yaw)", false, render.color("#FF0000"))
local server_color = gui.add_colorpicker("lua>tab a>Glow bullet impacts (Ye4-Yaw)", false, render.color("#0000FF"))


local RenderGlowBoxesFN = utils.find_pattern("client.dll", "89 6C 24 04 8B EC 83 EC 60 56 57 8B F9 89 7D DC") - 0x10
local GlowObjectManager = ffi.cast("uint32_t*", utils.find_pattern("client.dll", "0F 11 05 ? ? ? ? 83 C8 01 C7 05 ? ? ? ? 00 00 00 00") + 3)[0]
local AddGlowBoxFN = ffi.cast("int(__thiscall*)(uint32_t, struct vec3_t, struct vec3_t, struct vec3_t, struct vec3_t, struct color_t, float)", utils.find_pattern("client.dll", "55 8B EC 53 56 8D"))
local PassAddr = utils.find_pattern("client.dll", "8B 4C 24 20 57 6A") + 0x6

-- fix fucked up z stencil
PatchByte(RenderGlowBoxesFN + 0x239, 1)
-- change draw pass to always be GLOWBOX_PASS_STENCIL
PatchByte(PassAddr, 1)

function on_shutdown()
    PatchByte(RenderGlowBoxesFN + 0x239, 3)
    PatchByte(PassAddr, 0)
end


local col = ffi.new("struct color_t")
local pos, ang, min, max = ffi.new("struct vec3_t"), ffi.new("struct vec3_t"), ffi.new("struct vec3_t"), ffi.new("struct vec3_t")
local function AddGlowBox(position, angle, mins, maxs, color, duration)
    pos.x, pos.y, pos.z = position:unpack()
    ang.x, ang.y, ang.z = angle:unpack()
    min.x, min.y, min.z = mins:unpack()
    max.x, max.y, max.z = maxs:unpack()

    col.r, col.g, col.b, col.a = color.r, color.g, color.b, 255

    AddGlowBoxFN(GlowObjectManager, pos, ang, min, max, col, duration)
end

local IMPACTBOX_MIN, IMPACTBOX_MAX = math.vec3(-1, -1, -1), math.vec3(1, 1, 1)



function on_shot_registered(shot)
    if not master:get_bool() then
        return
    end

    for _, ClientImpact in pairs(shot.client_impacts) do
        AddGlowBox(ClientImpact, math.vec3(0), IMPACTBOX_MIN, IMPACTBOX_MAX, client_color:get_color(), 4)
    end

    for _, ServerImpact in pairs(shot.server_impacts) do
        AddGlowBox(ServerImpact, math.vec3(0), IMPACTBOX_MIN, IMPACTBOX_MAX, server_color:get_color(), 4)
    end
end