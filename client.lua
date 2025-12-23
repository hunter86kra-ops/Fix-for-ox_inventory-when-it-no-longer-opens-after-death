RegisterCommand('revive', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    -- GTA Revive
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)
    SetEntityHealth(ped, 200)
    ClearPedTasksImmediately(ped)

    -- visn_are Injured / Movement FIX
    ResetPedMovementClipset(ped, 0.0)
    ResetPedStrafeClipset(ped)
    ResetPedWeaponMovementClipset(ped)

    -- ESX Death-State
    if isDead ~= nil then
        isDead = false
    end
    TriggerEvent('esx:onPlayerSpawn')

    -- ⏳ WARTEN bis visn_are alles gesetzt hat
    Wait(300)

    -- 🔴 ox_inventory FINAL FIX
    LocalPlayer.state:set('dead', false, true)
    LocalPlayer.state:set('injured', false, true)

    -- ox_inventory explizit öffnen erlauben
    exports.ox_inventory:setPlayerBusy(false)
    TriggerEvent('ox_inventory:disarm', false)

    print('[revive_command] Revive + ox_inventory Fix ausgeführt')
end, false)
