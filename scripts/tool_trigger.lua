local main = require('main')
local os = require('os')
local component = require('component')
local sides = require('sides')
local event = require('event')
local _round = 1

function trigger()
	os.execute('cls')
	print('Start round '.._round)
	local _table1 = component.me_controller.getItemsInNetwork()
	local _table2 = getInputItemList.main(sides.up)
	if _table2[1] ~= nil then
		if _table1.n ~= 0 then
			print('Item in InputBus,Terminated')
			os.sleep(0.5)
		else
			main.start()
		end
	end
	_round = _round + 1
end

os.execute('cls')
event.timer(2,trigger,math.huge)
