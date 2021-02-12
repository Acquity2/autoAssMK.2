local component = require('component')
local io = require('io')
local os = require('os')
local getTableDiff = require('getTableDiff')

function countComponent()
	local _list = component.list()
	local _num = 0
	for k,v in pairs(_list) do 
		_num = _num + 1
	end
	return _num
end

function generateConfig(ta1,ta2,ta3,ta4,ma1,ma2,ma3,ma4)
	local file = io.open('conf.lua','w')
	file:write('conf = {}\n')
	file:write('conf.fluidSetter,conf.fluidTransposer = {},{}\n')
	file:write('	--流体接口下适配器uuid\n')
	file:write('conf.fluidSetter[1] = '..ta1..'\n')
	file:write('conf.fluidSetter[2] = '..ta2..'\n')
	file:write('conf.fluidSetter[3] = '..ta3..'\n')
	file:write('conf.fluidSetter[4] = '..ta4..'\n\n')
	file:write('	--流体用转运器uuid\n')
	file:write('conf.fluidTransposer[1] = '..ma1..'\n')
	file:write('conf.fluidTransposer[2] = '..ma2..'\n')
	file:write('conf.fluidTransposer[3] = '..ma3..'\n')
	file:write('conf.fluidTransposer[4] = '..ma4..'\n\n')	
	file:write('return conf')
	file:close()
	return
end

local _tA,_mA,_numList,_componentList,i = {},{},{},{},{}

i[1],i[2] = 1,1
_numList[1] = countComponent()
_componentList[1] = component.list()

while true do
	local _tb = {}
	_numList[2] = countComponent()
	_componentList[2] = component.list()
	if _numList[2] ~= _numList[1] then
		_tb = getTableDiff.main(_componentList[2],_componentList[1])
		if _tb['transposer'] ~= nil then
			_tA[i[1]] = _tb['transposer']
			i[1] = i[1] + 1
		end
		if _tb['me_interface'] ~= nil then
			_mA[i[2]] = _tb['me_interface']
			i[2] = i[2] + 1
		end
	end
	if i[1] == 5 and i[2] == 5 then 
		print('All address got!')
		break
	end
	os.sleep(0.1)
end	

generateConfig(_tA[1],_tA[2],_tA[3],_tA[4],_mA[1],_mA[2],_mA[3],	_mA[4])



