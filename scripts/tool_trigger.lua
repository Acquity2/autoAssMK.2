local main = require('main')
local os = require('os')
local component = require('component')
local sides = require('sides')
local event = require('event')
local compare = require('compare')
local _round = 1

function pulse(_sides)
	component.redstone.setOutput(_sides,15)
	os.sleep(0.1)
	component.redstone.setOutput(_sides,0)
end

function trigger()
	os.execute('cls')
	print('Start round '.._round)
	local _table1 = component.me_controller.getItemsInNetwork()
	local _table2 = getInputItemList.main(sides.up)
	if _table2[1] ~= nil then
		component.redstone.setOutput(sides.down,15)
		if _table1.n ~= 0 then
			print('Item in InputBus,Terminated')
		else
			main.start()
			pulse(sides.north)
		end
	end
	_table1 = component.me_controller.getItemsInNetwork()
	if _table1[1] ~= nil then
		component.redstone.setOutput(sides.down,15)
		for i = 1,3,1 do
			if compare.HDTlib[_table1[i].label] ~= nil then 
				pulse(sides.south)
				print('Detected Rocket Plate Recipe!!')
				os.sleep(0.5)
			end
		end
		pulse(sides.north)
	end
	if _table2[1] == nil and _table1[1] == nil then
		component.redstone.setOutput(sides.down,0)
	end
	_round = _round + 1
end

os.execute('cls')
event.timer(1.8,trigger,math.huge)
