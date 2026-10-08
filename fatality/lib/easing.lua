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


local Easing = {}

Easing.in_sine = function (x)
    return 1 - math.cos((x * math.pi) / 2)
end

Easing.out_sine = function (x)
    return math.sin((x * math.pi) / 2)
end

Easing.in_out_sine = function (x)
    return -(math.cos(math.pi * x) - 1) / 2
end

Easing.in_quad = function (x)
    return x * x
end

Easing.out_quad = function (x)
    return 1 - (1 - x) * (1 - x)
end

Easing.in_out_quad = function (x)
    return x < 0.5 and 2 * x * x or 1 - math.pow(-2 * x + 2, 2) / 2
end

Easing.in_cubic = function (x)
    return x * x * x
end

Easing.out_cubic = function (x)
    return 1 - math.pow(1 - x, 3)
end

Easing.in_out_cubic = function (x)
    return x < 0.5 and 4 * x * x * x or 1 - math.pow(-2 * x + 2, 3) / 2
end

Easing.in_quart = function (x)
    return x * x * x * x
end

Easing.out_quart = function (x)
    return 1 - math.pow(1 - x, 4)
end

Easing.in_out_quart = function (x)
    return x < 0.5 and 8 * x * x * x * x or 1 - math.pow(-2 * x + 2, 4) / 2
end

Easing.in_quint = function (x)
    return x * x * x * x * x
end

Easing.out_quint = function (x)
    return 1 - math.pow(1 - x, 5)
end

Easing.in_out_quint = function (x)
    return x < 0.5 and 16 * x * x * x * x * x or 1 - math.pow(-2 * x + 2, 5) / 2
end

Easing.in_expo = function (x)
    return x == 0 and 0 or math.pow(2, 10 * x - 10)
end

Easing.out_expo = function (x)
    return x == 1 and 1 or 1 - math.pow(2, -10 * x)
end

Easing.in_out_expo = function (x)
    return x == 0 and 0 or x == 1 and 1 or x < 0.5 and math.pow(2, 20 * x - 10) / 2 or (2 - math.pow(2, -20 * x + 10)) / 2
end

Easing.in_circ = function (x)
    return 1 - math.sqrt(1 - math.pow(x, 2))
end

Easing.out_circ = function (x)
    return math.sqrt(1 - math.pow(x - 1, 2))
end

Easing.in_out_circ = function (x)
    return x < 0.5 and (1 - math.sqrt(1 - math.pow(2 * x, 2))) / 2 or (math.sqrt(1 - math.pow(-2 * x + 2, 2)) + 1) / 2
end

Easing.in_back = function (x)
    return 2.70158 * x * x * x - 1.70158 * x * x
end

Easing.out_back = function (x)
    return 1 + 2.70158 * math.pow(x - 1, 3) + 1.70158 * math.pow(x - 1, 2)
end

Easing.in_out_back = function (x)
    return x < 0.5 and (math.pow(2 * x, 2) * ((2.5949095 + 1) * 2 * x - 2.5949095)) / 2 or (math.pow(2 * x - 2, 2) * ((2.5949095 + 1) * (x * 2 - 2) + 2.5949095) + 2) / 2
end

Easing.in_elastic = function (x)
    return x == 0 and 0 or x == 1 and 1 or -math.pow(2, 10 * x - 10) * math.sin((x * 10 - 10.75) * 2.09439510239319)
end

Easing.out_elastic = function (x)
    return x == 0 and 0 or x == 1 and 1 or math.pow(2, -10 * x) * math.sin((x * 10 - 0.75) * 2.09439510239319) + 1
end

Easing.in_out_elastic = function (x)
    return x == 0 and 0 or x == 1 and 1 or x < 0.5 and -(math.pow(2, 20 * x - 10) * math.sin((20 * x - 11.125) * 1.396263401595463)) / 2 or (math.pow(2, -20 * x + 10) * math.sin((20 * x - 11.125) * 1.396263401595463)) / 2 + 1
end

Easing.in_bounce = function (x)
    return 1 - Easing.out_bounce(1 - x)
end

Easing.out_bounce = function (x)
    if x < 1 / 2.75 then
        return 7.5625 * x * x
    elseif x < 2 / 2.75 then
        x = x - 1.5 / 2.75
        return 7.5625 * x * x + 0.75
    elseif x < 2.5 / 2.75 then
        x = x - 2.25 / 2.75
        return 7.5625 * x * x + 0.9375
    else
        x = x - 2.625 / 2.75
        return 7.5625 * x * x + 0.984375
    end
end

Easing.in_out_bounce = function (x)
    return x < 0.5 and (1 - Easing.out_bounce(1 - 2 * x)) / 2 or (1 + Easing.out_bounce(2 * x - 1)) / 2
end

return Easing