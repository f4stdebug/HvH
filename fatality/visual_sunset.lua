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

local cl_csm_rot_override = cvar.cl_csm_rot_override
local cl_csm_rot_x = cvar.cl_csm_rot_x
local cl_csm_rot_y = cvar.cl_csm_rot_y

local override_boolean = gui.add_checkbox("Enable sunset mode", "visuals>misc>various")
local x_val_slider = gui.add_slider("Sunset X", "visuals>misc>various", -100, 100, 1)
local y_val_slider = gui.add_slider("Sunset Y", "visuals>misc>various", -100, 100, 1)

function on_paint()
    if override_boolean:get_bool() then
        cl_csm_rot_override:set_int(1)
        cl_csm_rot_x:set_int(x_val_slider:get_int())
        cl_csm_rot_y:set_int(y_val_slider:get_int())
    else
        cl_csm_rot_override:set_int(0)
        cl_csm_rot_x:set_int(0)
        cl_csm_rot_y:set_int(0)
    end
end