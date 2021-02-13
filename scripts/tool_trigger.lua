local main = require('main')
local os = require('os')

while true do
	local _table = component.me_controller.getItemsInNetwork()
	if _table.n ~= 0 then
		print('Item in InputBus,Terminated')
	else
		main.start()
	end
	os.sleep(0.5)
end
