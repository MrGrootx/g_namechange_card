ESX = exports["es_extended"]:getSharedObject()

local ox_inventory = exports.ox_inventory

function mainFnc()
   Citizen.CreateThread(function()
      local input = lib.inputDialog('Name Change Menu', {
         {
            type = 'input',
            label = 'FirstName',
            placeholder = 'Enter Your FirstName',
            icon = 'fa-solid fa-note-sticky',
            required = true,
            default = "ex: justgroot",
            min = 2,
            max = 16,
         }, {
         type = 'input',
         label = 'LastName',
         placeholder = 'Enter Your LastName',
         icon = 'fa-solid fa-note-sticky',
         required = true,
         min = 2,
         max = 16,
      },
         {
            type = 'checkbox',
            label = 'Are you sure..!',
            required = true
         },
      })

      if input then
         local fName = input[1]
         local lName = input[2]
         -- print(json.encode(input, { indent = true }))
         TriggerServerEvent('mg_namechange_card:event', fName, lName)
      end
   end)
end

exports('namechangecard', function(data, slot)   
   lib.progressBar({
      duration = 5000,
      label = "Using Name Change card",
      useWhileDead = false,
      canCancel = true,
      disable = {
         car = true,
      },

   })
   -- TriggerEvent('g_mainevent')
end)

RegisterNetEvent("g_mainevent")
AddEventHandler("g_mainevent", function()
   mainFnc()
end)
