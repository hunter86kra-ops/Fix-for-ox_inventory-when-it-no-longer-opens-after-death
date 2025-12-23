-- /revive Command
RegisterCommand('inv', function(source, args)
    local src = source

    -- Spieler-ID ermitteln (falls keine ID, selbst reviven)
    local targetId = args[1] and tonumber(args[1]) or src

    if GetPlayerName(targetId) then
        TriggerClientEvent('txrevive:revivePlayer', targetId)
        print(('[revive] Spieler %s revived von %s'):format(targetId, src))
    else
        TriggerClientEvent('chat:addMessage', src, { args = {'^1SYSTEM', 'Ungültige Spieler-ID!'} })
    end
end, false)
