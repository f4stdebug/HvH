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

    local http = require("gamesense/http")
    local ignored_nickname = "N3yl0V1miy"
    local ref = gui.Reference("MISC", "General")
    local deepseek_group = gui.Groupbox(ref, "DeepSeek Trashtalk", 325, 25, 200)
    local deepseek_enabled = gui.Combobox(deepseek_group, "trashtalk_mode", "Trashtalk mode", "Off", "AI")
    local function load_prompt()
        local prompt_file = io.open("promt.txt", "r")
        if not prompt_file then
            client.log("Error: Could not open promt.txt")
            return nil
        end
        local prompt = read("*all")
        close()
        return prompt
    end
    client.set_event_callback("player_chat", function(e)
        if (GetValue() ~= 1) then
            return
        end
        local player = entity.get_player_by_userid(e.userid)
        if (not player or (player == entity.get_local_player())) then
            return
        end
        local nickname = get_name()
        local message = e.text
        if (string.lower(nickname) == string.lower(ignored_nickname)) then
            return
        end
        local prompt_template = load_prompt()
        if not prompt_template then
            return
        end
        local prompt = gsub("{txt}", message)
        http.post("https://api.deepseek.com/v1/chat/completions", {
        headers = { ["Content-Type"] = "application/json", ["Authorization"] = "Bearer YOUR_DEEPSEEK_API_KEY" },
        json = {
        model = "deepseek-chat",
        messages = { { role = "user", content = prompt } },
        max_tokens = 70,
        temperature = 0.7,
    },
    }, function(success, data)
            if (success and (data.status == 200)) then
                local json_response = json.parse(data.body)
                if ((json_response and json_response.choices) and json_response.choices[1]) then
                    local ai_response = json_response.choices[1].message.content
                    if ((ai_response and (ai_response ~= "")) and (ai_response ~= "игнор")) then
                        client.exec(("say " .. ai_response))
                    end
                end
            else
                client.log(("DeepSeek API error: " .. ((data and data.status) or "no response")))
            end
        end)
    end)
    client.log("DeepSeek Trashtalk AI loaded!")
