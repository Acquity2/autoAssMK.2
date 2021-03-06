local component = require('component')
local conf = require('conf')
local sides = require('sides')
local databaseAdr = component.database.address
local fluidDatabase = require('fluidDatabase')

fluid = {}

function fluid.getDBNum(_label)
	local _result = nil
	for i = 1,81,1 do
		local _table = component.database.get(i)
		if _table ~= nil then 
			local _type = _table.label
			if fluidDatabase[_type] ~= nil then
				_type = fluidDatabase[_type]
			end
			local X = string.find(_type,_label,1,true)
			if X ~= nil then
				_result = i
				break
			end
		end
	end
	if _result == nil then 
		print('No matched fluid in database')
	end
	return _result
end

function fluid.setOutput(_label,_number)
	local _Fsetter = component.proxy(conf.fluidSetter[_number])
	local _dbNum = fluid.getDBNum(_label)
	local _result = _Fsetter.setFluidInterfaceConfiguration(sides.up,databaseAdr,_dbNum)
	return _result
end

function fluid.transfer(_amount,_number)
	local _Ftransposer = component.proxy(conf.fluidTransposer[_number])
	local _result = _Ftransposer.transferFluid(sides.down,sides.up,_amount)
	return _result
end

function fluid.Info(_side,_number)
	local _Ftransposer = component.proxy(conf.fluidTransposer[_number])
	local _table = _Ftransposer.getFluidInTank(_side)
	local _amount = _table[1].amount
	local _label = _table[1].label
	return _amount,_label
	end
	
	
return fluid