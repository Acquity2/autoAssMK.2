local component = require('component')
local conf = require('conf')
local sides = require('sides')

transferItem = {}

function transferItem.main()
	for i = 1,16,1 do
		component.transposer.transferItem(sides.up,sides.down,64,i,1)
	end
end

return transferItem