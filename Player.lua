
local speaker = peripheral.find("speaker")

local isPaused = false
local isPlaying = false
local pausedData = nil
local musicPath = nil
local decoder = nil

function setDecoder(decoder_set)
    decoder = decoder_set
end

function play(music_name)
    musicPath = "music/"..music_name
    isPaused = false
    isPlaying = true

    for chunk in io.lines(musicPath, 16 * 1024) do
        if isPaused then
            pausedData = chunk
            return
        end

        local buffer = decoder(chunk)

        while not speaker.playAudio(buffer) do
            os.pullEvent("speaker_audio_empty")
        end

    end

    isPlaying = false

end

function pause()
    if isPlaying and not isPaused then
        isPaused = true
        print("Música pausada.")
    end
end

function resume()
end

function stop()
    if isPlaying then
        speaker.stop()
        isPlaying = false
        isPaused = false
        pausedData = nil
        print("Música parada.")
    end
end
