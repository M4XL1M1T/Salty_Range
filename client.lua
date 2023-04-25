local CurrentDistance = 0
local showTime = 0

RegisterNetEvent('SaltyChat_VoiceRangeChanged')
AddEventHandler('SaltyChat_VoiceRangeChanged', function(voiceRange, index, availableVoiceRanges)
    CurrentDistance = voiceRange
    showTime = 0
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if showTime < 25 then
            local pedCoords = GetEntityCoords(PlayerPedId())
            DrawMarker(1, pedCoords.x, pedCoords.y, pedCoords.z - 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, CurrentDistance * 1.3, CurrentDistance * 1.3, 0.5, 154, 1, 248, 110, false, false, 2, false, nil, nil, false)
            showTime = showTime + 1
        else
            Citizen.Wait(250)
        end
    end
end)

AddEventHandler("SaltyChat_VoiceRangeChanged", function(voiceRange, index, availableVoiceRanges)
    --Paste your Notify export here 
     exports['okokNotify']:Alert('SaltyChat', 'Voicerange Now: ' .. voiceRange, 2000, 'info', true)
    end)

