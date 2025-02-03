commands = {}

function register(exec_func, load_func, command)
    load_func()
    commands[command] = exec_func
end

function execute(command_str, username)
    local args = {}
    for word in string.gmatch(command_str, "%S+") do
        table.insert(args, word)
    end

    local base_command = args[1] .. (args[2] and " " .. args[2] or "") -- Mantém comandos compostos, ex: "!music play"
    local command_args = {table.unpack(args, 3)} -- Pega os argumentos extras se houverem

    if commands[base_command] then
        commands[base_command](username, command_args) -- Passa os argumentos corretamente
    else
        ChatBox.sendMessageToPlayer("Comando não existe", username)
    end
end

-- Carregar comandos da pasta 'comandos'
function loadCommands()
    local files = fs.list("commands")
    for _, file in ipairs(files) do
        if string.sub(file, -4) == ".lua" then
            local commandModule = dofile("commands/" .. file)
            if commandModule and commandModule.exec and commandModule.command then
                register(commandModule.exec, commandModule.load, commandModule.command)
            end
        end
    end
end
