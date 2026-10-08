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

local gsub, pairs = string.gsub, pairs

local replacements = {
	["{white}"] = "\x01",
	["{darkred}"] = "\x02",
	["{team}"] = "\x03",
	["{green}"] = "\x04",
	["{lightgreen}"] = "\x05",
	["{lime}"] = "\x06",
	["{red}"] = "\x07",
	["{grey}"] = "\x08",
	["{yellow}"] = "\x09",
	["{bluegrey}"] = "\x0A",
	["{blue}"] = "\x0B",
	["{darkblue}"] = "\x0C",
	["{purple}"] = "\x0D",
	["{violet}"] = "\x0E",
	["{lightred}"] = "\x0F",
	["{orange}"] = "\x10",
	["\u{202E}"] = "",
	["\u{2029}"] = "",
	["  +"] = function(c)
		return " " .. ("\x18 "):rep(c:len()-1)
	end
}

local function find_sig(mdlname, pattern, typename, offset, deref_count)
	local raw_match = utils.find_pattern(mdlname, pattern) or error("signature not found", 2)
	local match = ffi.cast("uintptr_t", raw_match)

	if offset ~= nil and offset ~= 0 then
		match = match + offset
	end

	if deref_count ~= nil then
		for i = 1, deref_count do
			match = ffi.cast("uintptr_t*", match)[0]
			if match == nil then
				return error("signature not found", 2)
			end
		end
	end

	return ffi.cast(typename, match)
end

local function table_concat_tostring(tbl, sep)
	local result = ""
	for i=1, #tbl do
		result = result .. tostring(tbl[i]) .. (i == #tbl and "" or sep)
	end
	return result
end

local function vtable_bind(class, type, index)
    local this = ffi.cast("void***", class)
    return function (...)
        return ffi.cast(ffi.typeof(type), this[0][index])(this, ...)
    end
end

local hud = find_sig("client.dll", "B9 ? ? ? ? 88 46 09", "void*", 1, 1)

local native_FindHudElement = find_sig("client.dll", "55 8B EC 53 8B 5D 08 56 57 8B F9 33 F6 39 77 28", "void***(__thiscall*)(void*, const char*)")

-- thisptr for native_ChatPrintf
local hud_chat = native_FindHudElement(hud, "CHudChat")

local native_ChatPrintf = vtable_bind(hud_chat, "void(__cdecl*)(void*, int, int, const char*, ...)", 27)

local function print_player(entindex, ...)
	local text = table_concat_tostring(entindex == 0 and {" ", ...} or {...}, "")

	for res, rep in pairs(replacements) do
		text = gsub(text, res, rep)
	end

	native_ChatPrintf(entindex, 0, text)
end

return {
	print = function(...)
		return print_player(0, ...)
	end,
	print_player = print_player
}