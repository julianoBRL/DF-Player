return {
    command = "!music play",
    exec = function(username, args)
        -- music_name = "Rob Zombie - Dragula (Lyrics).dfpwm"
        if not args[1] then
            ChatBox.sendMessageToPlayer("uso correto: !music play <name>", username)
            return
        end
        music_name = args[1]
        ChatBox.sendMessageToPlayer("Playing: "..music_name, username)
        Player.play(music_name)
    end,
    load = function()
        print("!music play -> loaded.")
    end
}