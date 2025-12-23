RegisterNetEvent('revive:client')
AddEventHandler('revive:client', function()
    local ped = PlayerPedId()

    -- 🔴 VISN_ARE REVIVE + Death Screen stoppen
    exports('revivePlayer', function()
    exports('stopDeathScreen', function()
    exports['visn_are']:revive()
    ))

    -- Sicherheit: Health setzen
    SetEntityHealth(ped, 200)

    -- Tasks & Animationen löschen
    ClearPedTasksImmediately(ped)

    -- Injured / Limp entfernen
    ResetPedMovementClipset(ped, 0.0)
    ResetPedStrafeClipset(ped)
    ResetPedWeaponMovementClipset(ped)

    -- ESX Death zurücksetzen
    if isDead ~= nil then
        isDead = false
    end
    TriggerEvent('esx:onPlayerSpawn')

    -- 🔧 ox_inventory FIX
    LocalPlayer.state:set('dead', false, true)
    TriggerEvent('ox_inventory:disarm', false)

    print('[revive_command] visn_are Revive + ox_inventory Fix abgeschlossen')
end)
