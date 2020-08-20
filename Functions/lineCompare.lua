local TextA = 
[[@name Midiplayer v5

# [ Config ] #
@persist Speed HoloCount OpsLimit Loop [Version LastUpdate]:string PowerSaving TimeMult

# [ General & Misc ] #
@persist [Mode PrevMode]:string HoloC [Status ]:table HoloY HoloX ChannelC

# [ Not Functions ] #
@persist Requesting Importing ProgLast Archiving ArLoaded ArLoading
 
# [ Player ] #
INVALID LINE LOL 
@persist [Midi Directory]:string 
@persist [Notes Data Counters Timetracker AltSounds]:table
@persist [ AvSpeakers Instruments  ]:array

@trigger all
]]

local TextB = 
[[@name Midiplayer v5

# [ Config ] #
@persist Speed HoloCount OpsLimit Loop [Version LastUpdate]:string PowerSaving TimeMult

# [ General & Misc ] #
@persist [Mode PrevMode]:string HoloC [Status ]:table HoloY HoloX ChannelC

# [ Functions ] #
@persist Requesting Importing ProgLast Archiving ArLoaded ArLoading
 
# [ Player ] #
@persist IsPlaying IsParsed Downloaded StartTime Playtime NoteCounter ExpCheck PrevZ PitchBuff PrevSid
@persist [Midi Directory]:string 
@persist [Notes Data Counters Timetracker AltSounds]:table
@persist [ AvSpeakers Instruments  ]:array

@trigger all
]]

local function compareLines(A, B)
    if not A or not B then return nil end 

    local aL = {}
    local bL = {}

    do 
        local aT = type(A)
        local bT = type(B)

        if aT == "string" then 
            aL = string.Split(A, "\n")
        elseif aT == "table" then 
            aL = A 
        else return 0, 0 end 

        if bT == "string" then 
            bL = string.Split(B, "\n")
        elseif bT == "table" then 
            bL = bL 
        else return nil end 
    end 

    -- Remove every common suffix 
    local eL = 0 
    if #aL ~= #bL then 
        eL = (#aL > #bL and #aL or #bL)
    else 
        eL = #aL 
        while eL >= 1 and aL[eL] == bL[eL] do  
            eL = eL - 1
        end
    end

    -- They are the same 
    if eL == 0 then return {0,0} end

    -- Remove every common prefix 
    local sL = 1
    while aL[sL] == bL[sL] and sL < eL do  
        sL = sL + 1
    end

    -- Returns the Start and End of area where lines werent the same 
    return {sL, eL}
end

PrintTable(compareLines(TextA, TextB))