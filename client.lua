RegisterCommand('revive', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    -- GTA Revive
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)
    SetEntityHealth(ped, 200)

    --visn_are fix
    exports('revivePlayer', function()
    exports('stopDeathScreen', function()
    exports['visn_are']:revive()

    -- Tasks & Animationen löschen
    ClearPedTasksImmediately(ped)

    -- 🔴 visn_are Death / Injured FIX
    ResetPedMovementClipset(ped, 0.0)
    ResetPedStrafeClipset(ped)
    ResetPedWeaponMovementClipset(ped)

    -- ESX Death-State
    if isDead ~= nil then
        isDead = false
    end
    TriggerEvent('esx:onPlayerSpawn')

    -- ox_inventory
    LocalPlayer.state:set('dead', false, true)
    LocalPlayer.state:set('injured', false, true)
    TriggerEvent('ox_inventory:disarm', false)

    print('[revive_command] Revive + Injured Fix ausgeführt')
end, false)))
