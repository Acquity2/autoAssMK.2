local component = require('component')
local sides = require('sides')

getInputItemList = {}

function getInputItemList.main(side)
	local _table = component.transposer.getAllStacks(side)
	_table = _table.getAll()
	local _itemList = {n = nil}
	for k,v in pairs(_table) do
		if v.label == nil then break end
		local a = tonumber(k)	
		local _key = a + 1
		local _itemLabel = v.label
		local _amount = v.size
		_itemList[_key] = {}
		_itemList[_key][1] = _itemLabel
		_itemList[_key][2] = _amount
		_itemList.n = _key
	end
	return _itemList
end

return getInputItemList