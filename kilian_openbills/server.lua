-- Get the ESX shared object
ESX = exports["es_extended"]:getSharedObject()

-- Callback to retrieve all players who currently have bills
ESX.RegisterServerCallback('kilian_policebills:getPlayersWithBills', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    -- Only police officers can access this data
    if xPlayer.job.name ~= 'police' then
        cb({})
        return
    end

    -- Query the database for users who have at least one bill
    MySQL.query([[
        SELECT users.firstname, users.lastname, users.identifier
        FROM billing
        JOIN users ON users.identifier = billing.identifier
        GROUP BY users.identifier
    ]], {}, function(result)
        cb(result)
    end)
end)

-- Callback to retrieve all bills for a specific player by identifier
ESX.RegisterServerCallback('kilian_policebills:getBillsForPlayer', function(source, cb, identifier)
    MySQL.query("SELECT id, label, amount FROM billing WHERE identifier = ?", {
        identifier
    }, function(bills)
        cb(bills)
    end)
end)
