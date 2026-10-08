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

--#region defines
local hitgroup_str = {
    [0] = 'generic',
    'head', 'chest', 'stomach',
    'left arm', 'right arm',
    'left leg', 'right leg',
    'neck', 'generic', 'gear'
}
local logs_data = {}
local functions = {}
local ss = {}
ss.x,ss.y = render.get_screen_size()
local font = render.create_font("verdana.ttf", 11,render.font_flag_shadow)
--#endregion

--#region menu
local menuchbx = {
    ["hit"] = gui.add_checkbox("hit", "lua>tab a"),
    ["resolve"] = gui.add_checkbox("resolve", "lua>tab a"),
    ["spread"] = gui.add_checkbox("spread", "lua>tab a"),
    ["server correction"] = gui.add_checkbox("server correction", "lua>tab a"),
    ["extrapolation"] = gui.add_checkbox("extrapolation", "lua>tab a"),
    ["anti-exploit"] =gui.add_checkbox("anti-exploit", "lua>tab a")
}
local menuclrs = {
    ["hit"] = gui.add_colorpicker("lua>tab a>hit", false, render.color(148,199,59)),
    ["resolve"] = gui.add_colorpicker("lua>tab a>resolve", false, render.color(255,0,0)),
    ["spread"] = gui.add_colorpicker("lua>tab a>spread", false, render.color(255,199,0)),
    ["server correction"] = gui.add_colorpicker ("lua>tab a>server correction", false, render.color(255,127,127)),
    ["extrapolation"] = gui.add_colorpicker("lua>tab a>extrapolation", false, render.color(255,199,127)),
    ["anti-exploit"] = gui.add_colorpicker("lua>tab a>anti-exploit", false, render.color(255,127,127))
}

--#endregion

--#region functions
functions.multi_color = function(data,x,y,font,alphamod)
    local textp = 0
    local totaltext = ""
    for k,v in pairs(data) do
        totaltext = totaltext .. v.text
    end
    local ttx = {}
        ttx.x,ttx.y = render.get_text_size(font,totaltext)
    for k,v in pairs(data) do
        if alphamod then
            v.clr.a = alphamod
        end
        render.text(font, x+textp-ttx.x/2,y,v.text,v.clr)
        textp = textp + render.get_text_size(font,v.text)
    end
end
functions.on_miss = function (s)
    if menuchbx[s.result] and menuchbx[s.result]:get_bool() and s.result ~= "hit" then
        local accent = render.color("#FFFFFF")
        local rescol = menuclrs[s.result]:get_color()
        table.insert(logs_data,
        {
            data = {
                {
                    text = "Missed",
                    clr = accent
                },
                {
                    text = (" %s"):format(engine.get_player_info(s.target).name),
                    clr = rescol
                },
                {
                    text = ("'s"),
                    clr = accent
                },
                {
                    text = (" %s"):format(hitgroup_str[s.client_hitgroup]),
                    clr = rescol
                },
                {
                    text = (" due to"),
                    clr = accent
                },
                {
                    text = (" %s"):format(s.result),
                    clr = rescol
                },
                {
                    text = (" ("),
                    clr = accent
                },
                {
                    text = ("%s"):format(math.floor(.5+s.hitchance)),
                    clr = rescol
                },
                {
                    text = ([[% hitchance)]]),
                    clr = accent
                },
            },
            info = {
                tick = s.tick,
                alpha = render.create_animator_float(0, .1)
                }
            }
        )
    end
end
functions.on_hit = function (e)
    if not menuchbx["hit"]:get_bool() then return end
    local attacker = e:get_int("attacker")
    local attacked = e:get_int("userid")
    local attacked_index = engine.get_player_for_user_id(attacked)
    local attacked_name = engine.get_player_info(attacked_index)['name']
    if engine.get_player_for_user_id(attacker)== engine.get_local_player() and attacked ~= attacker then
        local accent = render.color("#FFFFFF")
        local rescol = menuclrs["hit"]:get_color()
        table.insert(logs_data,
        {
            data = {
                {
                    text = "Hit",
                    clr = accent
                },
                {
                    text = (" %s"):format(attacked_name),
                    clr = rescol
                },
                {
                    text = ("'s"),
                    clr = accent
                },
                {
                    text = (" %s"):format(hitgroup_str[e:get_int("hitgroup")]),
                    clr = rescol
                },
                {
                    text = (" for"),
                    clr = accent
                },
                {
                    text = (" %s"):format(e:get_int("dmg_health")),
                    clr = rescol
                },
                {
                    text = (" damage ("),
                    clr = accent
                },
                {
                    text = ("%s"):format(e:get_int("health")),
                    clr = rescol
                },
                {
                    text = ([[ health remaining)]]),
                    clr = accent
                },
            },
            info = {
                tick = global_vars.tickcount,
                alpha = render.create_animator_float(0, .1)
                }
            }
        )
    end
end
functions.on_draw = function()
    for k, v in pairs(logs_data) do
        v.info.alpha:direct(255)
        if 2.9-(global_vars.tickcount/64-v.info.tick/64) < 0 then
            v.info.alpha:direct(0)
        end
        functions.multi_color(v.data,ss.x/2,ss.y/2 + 160 + (13 * (k-1))+(v.info.alpha:get_value()/255*13),font,v.info.alpha:get_value())
        if v.info.alpha:get_value() <= 0.1 and (2.9-(global_vars.tickcount/64-v.info.tick/64) < 0) then
            table.remove(logs_data,k)
        end
    end
end
--#endregion

--#region callbacks
function on_paint()
    functions.on_draw()
end
function on_shot_registered(e)
    functions.on_miss(e)
end
function on_player_hurt(e)
    functions.on_hit(e)
end
--#endregion