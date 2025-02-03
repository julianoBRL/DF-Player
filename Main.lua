
os.loadAPI("ChatBox.lua")
os.loadAPI("Player.lua")
os.loadAPI("CommandRegister.lua")

local dfpwm = require("cc.audio.dfpwm")
local decoder = dfpwm.make_decoder()

Player.setDecoder(decoder)
CommandRegister.loadCommands()

ChatBox.monitorChat()
