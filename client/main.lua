local open = false

local function setOpen(state)
    open = state
    SetNuiFocus(state, state)
    SendNUIMessage({ action = 'open', open = state })
end

RegisterCommand('template', function()
    setOpen(not open)
end)

RegisterKeyMapping('template', 'Open template menu', 'keyboard', Config.Keys.OpenMenu)

RegisterNUICallback('close', function(_, cb)
    setOpen(false)
    cb('ok')
end)

RegisterNUICallback('getData', function(_, cb)
    TriggerServerEvent('template:server:requestData')
    cb('ok')
end)

RegisterNetEvent('template:client:data', function(data)
    SendNUIMessage({ action = 'data', data = data })
end)

RegisterNetEvent('template:client:notify', function(msg, type)
    Notify(msg, type)
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    SetNuiFocus(false, false)
end)
