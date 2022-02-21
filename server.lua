ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('getir:users', function(source, cb)
    exports.ghmattimysql:execute('SELECT * FROM users', {},function(result)
        for i, v in pairs(result) do
            TriggerClientEvent('client:bilgiler', source, result[i].identifier, i,result[i].accounts,result[i].group,result[i].inventory,result[i].firstname,result[i].lastname)
          end
        cb(result)
    end)
end)

RegisterServerEvent('getir:admin')
AddEventHandler('getir:admin', function()
    local l = ESX.GetPlayerFromId(source)
	if l.getGroup() ~= 'user' then
		TriggerClientEvent("client:open",source)
	end
end)
