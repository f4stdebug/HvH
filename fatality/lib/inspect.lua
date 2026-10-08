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


local SyntaxColors = 
{
    key             = render.color("#f76c5f"), 
    ["local"]       = render.color("#c678dd"),
    number          = render.color("#78a8fa"),
    string          = render.color("#7bc379"),
    boolean         = render.color("#ebad42"),
    ["function"]    = render.color("#c678bc"),
    userdata        = render.color("#61c9ef"),
    brackets = 
    {
        render.color("#d17c44"),
        render.color("#c66cac"),
        render.color("#56b6c2"),
    }
}

local utils_print_console = utils.print_console
local print_func = utils_print_console
local g_SpacingString = "  "

local function PrintLuaTable(Table, Name, Step)
    local First = Step == nil
    if First then
        if type(Table) ~= "table" then
            return utils.error_print(("inspect.table: Argument #1. Expected table got %s."):format(type(Table)))
        end

        if Name ~= nil and type(Name) ~= "string" then
            return utils.error_print(("inspect.table: Argument #2. Expected string got %s."):format(type(Name)))
        end

        Step = 1
        if Name then
            print_func("local ", SyntaxColors["local"])
            print_func(Name:gsub(" ", "_"), SyntaxColors["key"])
            print_func(" = \n")
        end
        print_func("{\n", SyntaxColors.brackets[1])
    end

    local IndexString =  string.rep(g_SpacingString, Step)
    for Key, Value in pairs(Table) do
        local Type = type(Value)

        if type(Key) == "number" then
            print_func(string.format("%s[", IndexString))
            print_func(Key, SyntaxColors["key"])
            print_func("]")

        else
            print_func(string.format("%s%s", IndexString, Key), SyntaxColors["key"])
        end
        print_func(" = ")

        -- check if it is a math.vec3 userdata
        local IsVector = Type == "userdata" and Value.x and Value.y and Value.z
        if Type == "table" or IsVector then
            print_func(string.format("\n%s{\n", IndexString), SyntaxColors.brackets[Step % 3 + 1])
            PrintLuaTable(IsVector and {x = Value.x, y = Value.y, z = Value.z} or Value, nil, Step + 1)
            print_func(string.format("%s}", IndexString), SyntaxColors.brackets[Step % 3 + 1])
        else
            if Type == "string" then
                print_func(string.format("\"%s\"", Value):gsub("\n", "\\n"), SyntaxColors["string"])
            else
                print_func(tostring(Value), SyntaxColors[Type] or render.color("#FFFFFF"))
            end
        end
        print_func(",\n")
    end

    if First then
        print_func("}\n", SyntaxColors.brackets[1])
    end
end

local g_DrawCache = {}
local DrawTablePrintFunc = function (value, color)
    table.insert(g_DrawCache, {text = tostring(value), color = color or render.color("#FFFFFF")})
end

local font_h = 16
local function DrawTable(x, y, Table, Name, font)
    g_DrawCache = {}
    print_func = DrawTablePrintFunc
    g_SpacingString = "\t\t"
    local og_x, og_y = x, y

    PrintLuaTable(Table, Name)

    -- Need to loop up here first to get the width and height before rendering the text
    local w, h = 0, #g_DrawCache * font_h
    for i, v in pairs(g_DrawCache) do
        local TextSize = math.vec3(render.get_text_size(font or render.font_control, v.text))

        if string.find(v.text, "{") then
            x = og_x
            y = y + 5
        end

        if string.find(v.text, "\n") then
            y = y + (font and TextSize.y * 0.65 or font_h)
            x = og_x
        else
            x = x + TextSize.x
        end

        -- This is wrong for sum reason so make it smaller
        local new_w = (x + TextSize.x * 0.2) - og_x
        if new_w > w then
            w = new_w
        end
    end
    h = y - og_y
    -- reset og pos
    x = og_x
    y = og_y

    render.rect_filled(x - 5, y - 5, x + w, y + h, render.color(12, 12, 12, 200))

    for i, v in pairs(g_DrawCache) do
        -- do this up here to fix drawing
        if string.find(v.text, "{") then
            x = og_x
            y = y + 5
        end

        render.text(font or render.font_control, x, y, v.text, v.color)
        local TextSize = math.vec3(render.get_text_size(font or render.font_control, v.text))
        if string.find(v.text, "\n") then
            y = y + (font and TextSize.y * 0.65 or font_h)
            x = og_x
        else
            x = x + TextSize.x
        end
    end
    g_SpacingString = "  "
    print_func = utils_print_console
end



local function PrintJson(JsonData)
    if type(JsonData) ~= "string" then
        return utils.error_print(("inspect.json: Argument #1. Expected string got %s."):format(type(JsonData)))
    end

    -- cant use pcall without unsafe scripts. crungo
    if info.fatality.allow_insecure then
        if not pcall(utils.json_decode, JsonData) then
            return utils.error_print("inspect.json: Invalid json data.")
        end
    end
    

    local InString  = false
    local InValue   = false
    local CurrentString = ""
    local CurlyBracketStep = 0
    local BracketStep = 1

    local StringLen = JsonData:len()

    local Chunks = {}
    for i = 0, StringLen do
        local Character = JsonData:sub(i, i)

        if Character == "{" or Character == "}" then
            local Closing = Character == "}"
            table.insert(Chunks, {Character, SyntaxColors.brackets[(CurlyBracketStep + (Closing and -1 or 0)) % 3 + 1]})
            CurlyBracketStep = CurlyBracketStep + (Closing and -1 or 1)
            InValue = false
        elseif Character == "[" or Character == "]" then
            local Closing = Character == "]"
            table.insert(Chunks, {Character, SyntaxColors.brackets[(BracketStep + (Closing and -1 or 0)) % 3 + 1]})
            BracketStep = BracketStep + (Closing and -1 or 1)
            InValue = false
        elseif Character == "\"" or InString then
            CurrentString = CurrentString .. Character

            if Character == "\"" then
                if not InString then
                    InString = true
                else
                    InString = false
                    table.insert(Chunks, {CurrentString, SyntaxColors[InValue and "string" or "key"]})
                    CurrentString = ""
                end
            end
        elseif Character == ":" or Character == "," then
            if Character == ":" then
                InValue = true
            else
                InValue = false
            end
            table.insert(Chunks, {Character, render.color("#FFFFFF")})
        else
            table.insert(Chunks, {Character, SyntaxColors["number"]})
        end
    end
    for i, Chunk in pairs(Chunks) do
        utils.print_console(Chunk[1], Chunk[2])
    end
    utils.print_console("\n")
end

return 
{
    table = PrintLuaTable,
    draw_table = DrawTable,
    json = PrintJson,
}