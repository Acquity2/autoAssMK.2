local component = require('component')
local conf = require('conf')
local sides = require('sides')
local _transposer = component.proxy(conf.transposer)

transferItem = {}

function transferItem.main()
	for i = 1,16,1 do
		_transposer.transferItem(sides.up,sides.down,64,i,1)
	end
end

return transferItem