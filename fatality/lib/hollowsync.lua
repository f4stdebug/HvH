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

local menu = fatality.menu
local render = fatality.render
local config = fatality.config
local input = fatality.input
local enable_config = config:add_item("enable_lol", 0)
local enable = menu:add_checkbox("Hollowsync", "RAGE", "ANTI-AIM", "General", enable_config)
local key1c = 0x43
local key2v = 0x56

local manual_left = menu:get_reference("RAGE", "ANTI-AIM", "General", "Left")
local manual_right = menu:get_reference("RAGE", "ANTI-AIM", "General", "Right")
local manual_back = menu:get_reference("RAGE", "ANTI-AIM", "General", "Back")
local fake_freestanding = menu:get_reference("RAGE", "ANTI-AIM", "Standing", "Freestand Fake")
local freestanding = menu:get_reference("RAGE", "ANTI-AIM", "Standing", "Freestand")
local fake_type_standing = menu:get_reference("RAGE", "ANTI-AIM", "Standing", "Fake type")

local jitter_moving = menu:get_reference("RAGE", "ANTI-AIM", "Moving", "Jitter")

local fake_amount = menu:get_reference("RAGE", "ANTI-AIM", "Standing", "Fake amount")

local fakelag_amount = menu:get_reference("RAGE", "ANTI-AIM", "Standing", "Base amount")

local jitter_lol = menu:get_reference("RAGE", "ANTI-AIM", "Standing", "Jitter")

local loop = false

fatality.callbacks:add("paint", function()

    if (input:is_key_pressed(key1c)) then
        enable_config:set_bool(true)
    end

    if (input:is_key_pressed(key2v)) then
        jitter_lol:set_bool(false)
        enable_config:set_bool(false)
    end

    if (enable_config:get_bool()) then


            jitter_lol:set_int(90)
            jitter_moving:set_bool(false)
            fake_freestanding:set_bool(true)
            freestanding:set_bool(true)
            fakelag_amount:set_float(0)
            loop = not loop
    
            if (loop) then
    
            fake_type_standing:set_int(1)
            manual_left:set_bool(true)
    
            fake_amount:set_float(229)
            manual_back:set_bool(true)
    
    
            else
            jitter_lol:set_int(-90)
            fake_type_standing:set_int(2)
            manual_right:set_bool(true)
            fake_amount:set_float(-229)
            manual_back:set_bool(false)
            end
        end
    end)