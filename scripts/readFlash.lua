local component = require(component)
local sides = require(sides)

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

return readFlash