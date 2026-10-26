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

function GetPlayer(src)
    if FrameworkName == 'esx' then
        return Framework.GetPlayerFromId(src)
    elseif FrameworkName == 'qb' then
        return Framework.Functions.GetPlayer(src)
    end
end

function GetIdentifier(src)
    local p = GetPlayer(src)
    if not p then return nil end
    if FrameworkName == 'esx' then
        return p.identifier
    elseif FrameworkName == 'qb' then
        return p.PlayerData.citizenid
    end
end

function GetMoney(src, account)
    local p = GetPlayer(src)
    if not p then return 0 end
    if FrameworkName == 'esx' then
        return p.getAccount(account or 'money').money
    elseif FrameworkName == 'qb' then
        return p.Functions.GetMoney(account or 'cash')
    end
    return 0
end

function AddMoney(src, amount, account)
    local p = GetPlayer(src)
    if not p then return false end
    if FrameworkName == 'esx' then
        p.addAccountMoney(account or 'money', amount)
    elseif FrameworkName == 'qb' then
        p.Functions.AddMoney(account or 'cash', amount)
    end
    return true
end

function RemoveMoney(src, amount, account)
    local p = GetPlayer(src)
    if not p then return false end
    if GetMoney(src, account) < amount then return false end
    if FrameworkName == 'esx' then
        p.removeAccountMoney(account or 'money', amount)
    elseif FrameworkName == 'qb' then
        p.Functions.RemoveMoney(account or 'cash', amount)
    end
    return true
end
