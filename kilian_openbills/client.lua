-- Get the ESX shared object
ESX = exports["es_extended"]:getSharedObject()

-- Register the '/bills' command 
RegisterCommand("bills", function()
    -- Trigger server callback to get all players with outstanding bills
    ESX.TriggerServerCallback('kilian_policebills:getPlayersWithBills', function(players)
        if #players == 0 then
            ESX.ShowNotification("There are no players with outstanding bills.")
            return
        end

        local elements = {}
        for _, player in ipairs(players) do
            table.insert(elements, {
                label = player.firstname .. " " .. player.lastname,
                value = player.identifier
            })
        end

        -- Open menu to select a player with bills
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing_players', {
            title    = 'Outstanding Bills',
            align    = 'top-left',
            elements = elements
        }, function(data, menu)
            local identifier = data.current.value

            -- Fetch bills for selected player
            ESX.TriggerServerCallback('kilian_policebills:getBillsForPlayer', function(bills)
                local billElements = {}

                for _, bill in ipairs(bills) do
                    table.insert(billElements, {
                        label = bill.label .. " - " .. bill.amount .. "$",
                        value = bill.id
                    })
                end

                -- Open menu to show list of bills
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing_list', {
                    title    = 'Bills',
                    align    = 'top-left',
                    elements = billElements
                }, function(data2, menu2)
                    -- Placeholder: You could add bill management options here
                end, function(data2, menu2)
                    menu2.close()
                end)
            end, identifier)

        end, function(data, menu)
            menu.close()
        end)
    end)
end, false)
