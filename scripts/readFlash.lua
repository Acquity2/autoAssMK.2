local component = require('component')
local sides = require('sides')

readFlash = {}

function readFlash.getInputItems(side,n)
	local _table = component.inventory_controller.getStackInSlot(sides.down,n)
	local _inputItems = _table.inputItems
	return _inputItems
end

function readFlash.getInputFluids(side,n)
	local _table = component.inventory_controller.getStackInSlot(sides.down,n)
	local _inputFluids = _table.inputFluids
	return _inputFluids
end

function readFlash.getOutput(side,n)
	local _table = component.inventory_controller.getStackInSlot(sides.down,n)
	local _output = _table.output
	return _output
end

function readFlash.count(side)
	local _size = component.inventory_controller.getInventorySize(side)
	_size = _size - 1
	local _table = component.inventory_controller.getAllStacks(side)
	local a = _table.getAll()
	local N = 0
	for i = 0,_size,1 do
		if a[i].label ~= nil then N = N + 1 end
	end
	return N
end

	


return readFlash