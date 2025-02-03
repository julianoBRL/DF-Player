return {
    command = "!ping",
    exec = function(username, args)
        ChatBox.sendMessageToPlayer("Pong!", username)
    end,
    load = function()
        print("!ping -> loaded.")
    end
}