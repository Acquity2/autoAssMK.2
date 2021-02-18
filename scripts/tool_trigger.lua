local main = require('main')
local os = require('os')
local component = require('component')
local sides = require('sides')
local event = require('event')
local compare = require('compare')
local _round = 1

function pulse(_sides)
	component.redstone.setoutput(_sides,15)
	os.sleep(0.1)
	component.redstone.setoutput(_sides,0)
end

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
	if compare.HDTlib[_table1[1].label] ~= nil then pulse(sides.south) end
	_round = _round + 1
end

os.execute('cls')
event.timer(2,trigger,math.huge)
