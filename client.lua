 -- Chat-Suggestion
CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/inv', 'Revive dich selbst oder einen anderen Spieler', {
        { name = 'id', help = 'Spieler-ID (optional, leer = selbst)' }
    })
end)

-- Client Revive Event
RegisterNetEvent('txrevive:revivePlayer')
AddEventHandler('txrevive:revivePlayer', function()
    local ped = PlayerPedId()

    -- NativeUI Death Screen schließen
    isDead = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "closeDeathScreen" })

    -- Spieler reviven
    if IsEntityDead(ped) then
        NetworkResurrectLocalPlayer(GetEntityCoords(ped), true, true, false)
        ClearPedTasksImmediately(ped)
    end

    -- Health & Flags
    SetEntityHealth(ped, 200)
    SetPlayerInvincible(ped, false)

    -- Tasks & Animationen zurücksetzen
    ClearPedTasksImmediately(ped)
    ResetPedMovementClipset(ped, 0.0)
    ResetPedStrafeClipset(ped)
    ResetPedWeaponMovementClipset(ped)

    -- ESX Death zurücksetzen
    if isDead ~= nil then isDead = false end
    TriggerEvent('esx:onPlayerSpawn')

    -- ox_inventory Fix
    LocalPlayer.state:set('dead', false, true)
    TriggerEvent('ox_inventory:disarm', false)

    -- Death Screen entfernen
    DoScreenFadeIn(250)

    print('[txrevive] Spieler revived + ox_inventory Fix abgeschlossen')
end)
