local QBCore = exports['qb-core']:GetCoreObject()
local isVisible = true

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    isVisible = true
    SendNUIMessage({
        action = "showHUD",
        display = true
    })
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    isVisible = false
    SendNUIMessage({
        action = "showHUD",
        display = false
    })
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if isVisible then
            SendNUIMessage({
                action = "updateHUD",
                display = true
            })
        end
    end
end)