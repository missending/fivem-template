Util = {}

function Util.Debug(...)
    if not Config.Debug then return end
    print('[' .. GetCurrentResourceName() .. ']', ...)
end

function Util.Round(num, places)
    local mult = 10 ^ (places or 0)
    return math.floor(num * mult + 0.5) / mult
end

function Util.Table(t)
    local out = {}
    for k, v in pairs(t) do out[k] = v end
    return out
end
