local CurDist = 0
local dspTime = 0

RegisterNetEvent('SaltyChat_VoiceRangeChanged')
AddEventHandler('SaltyChat_VoiceRangeChanged', function(voiceRange, index, availableVoiceRanges)
    CurDist = voiceRange
    dspTime = 0
               
    exports['okokNotify']:Alert('SaltyChat', 'Voicerange Now: ' .. voiceRange, 2000, 'info', true)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if dspTime < 25 then
            local Coords = GetEntityCoords(PlayerPedId())
            DrawMarker(1, Coords.x, Coords.y, Coords.z - 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, CurDist * 1.3, CurDist * 1.3, 0.5, 154, 1, 248, 110, false, false, 2, false, nil, nil, false)
            dspTime = dspTime + 1
        else
            Citizen.Wait(250) --Change Showtime
        end
    end
end)
