  ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

local SetDisplay = false

RegisterCommand("data", function(source, args)
  TriggerServerEvent("getir:admin")
end)

RegisterNetEvent('client:open')
AddEventHandler('client:open', function()
  SetDisplay(true, true)
  checkUsers()
end)

RegisterNetEvent('client:bilgiler')
AddEventHandler('client:bilgiler', function(c,a,b,g,i,j,f)
  SendNUIMessage({
    identifier = c,
    id = a, 
    accounts = b,
    group = g,
    inventory = i,
    name = j,
    lastname = f,
    action = "fivemac"
})
end)

function checkUsers()
	ESX.TriggerServerCallback('getir:users', function(result)
	end)
end


function SetDisplay(bool)
  display = bool
  SetNuiFocus(bool, bool)
  SendNUIMessage({
      type = "ui",
      status = bool,
  })
end

RegisterNUICallback('close', function()
  SetNuiFocus(false, false)
end)
