RegisterCommand('revive', function(source, args)
    local src = source

    -- Wenn keine ID angegeben → sich selbst reviven
    if not args[1] then
        TriggerClientEvent('revive:client', src)
        return
    end

    local targetId = tonumber(args[1])

    if GetPlayerName(targetId) then
        TriggerClientEvent('revive:client', targetId)
        print(('[revive] Spieler %s wurde revived von %s'):format(targetId, src))
    else
        TriggerClientEvent('chat:addMessage', src, {
            args = { '^1SYSTEM', 'Ungültige Spieler-ID!' }
        })
    end
end, false)
