Framework = nil
FrameworkName = nil

CreateThread(function()
    if Config.Framework == 'esx' or (Config.Framework == 'auto' and GetResourceState('es_extended') == 'started') then
        Framework = exports['es_extended']:getSharedObject()
        FrameworkName = 'esx'
    elseif Config.Framework == 'qb' or (Config.Framework == 'auto' and GetResourceState('qb-core') == 'started') then
        Framework = exports['qb-core']:GetCoreObject()
        FrameworkName = 'qb'
    end
end)

function GetPlayerData()
    if FrameworkName == 'esx' then
        return Framework.GetPlayerData()
    elseif FrameworkName == 'qb' then
        return Framework.Functions.GetPlayerData()
    end
    return {}
end

function Notify(msg, type)
    if FrameworkName == 'esx' then
        Framework.ShowNotification(msg)
    elseif FrameworkName == 'qb' then
        Framework.Functions.Notify(msg, type or 'primary')
    else
        print(msg)
    end
end
