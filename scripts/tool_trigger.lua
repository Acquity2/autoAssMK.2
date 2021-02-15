local main = require('main')
local os = require('os')
local component = require('component')
local sides = require('sides')
local event = require('event')

function trigger()
	local _table1 = component.me_controller.getItemsInNetwork()
	local _table2 = getInputItemList.main(sides.up)
	if _table2[1] ~= nil then
		if _table1.n ~= 0 then
			print('Item in InputBus,Terminated')
		else
			main.start()
		end
	end
end

os.execute('cls')
print('Start')
event.timer(1.5,trigger,math.huge)
