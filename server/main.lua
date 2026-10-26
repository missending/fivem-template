RegisterNetEvent('template:server:requestData', function()
    local src = source
    local id = GetIdentifier(src)
    if not id then return end

    local row = MySQL.single.await('SELECT * FROM template_data WHERE identifier = ?', { id })
    if not row then
        MySQL.insert.await('INSERT INTO template_data (identifier, value) VALUES (?, ?)', { id, 0 })
        row = { identifier = id, value = 0 }
    end

    TriggerClientEvent('template:client:data', src, {
        name = GetPlayerName(src),
        money = GetMoney(src),
        value = row.value
    })
end)

RegisterNetEvent('template:server:save', function(value)
    local src = source
    local id = GetIdentifier(src)
    if not id or type(value) ~= 'number' then return end

    MySQL.update.await('UPDATE template_data SET value = ? WHERE identifier = ?', { value, id })
    TriggerClientEvent('template:client:notify', src, 'Saved', 'success')
end)
