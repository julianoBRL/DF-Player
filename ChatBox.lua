
local chatBox = peripheral.find("chatBox")

if not chatBox then
    print("Failed to load chatBox")
end

function sendMessage(message)
    if chatBox then
        chatBox.sendMessage(message)
    end
end

function sendMessageToPlayer(message, player)
    if chatBox then
        chatBox.sendMessageToPlayer(message, player)
    end
end

function monitorChat()
    if chatBox then
        while true do
            local event, username, message = os.pullEvent("chat")
            if string.sub(message, 1, 1) == "!" then
                CommandRegister.execute(message, username)
            end
        end
    end
end