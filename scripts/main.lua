local compare = require('compare')
local component = require('component')
local sides = require('sides')
local io = require('io')
local os = require('os')
local getTableDiff = require('getTableDiff')
local conf = require('conf')
local readFlash = require('readFlash')
local transferItem = require('transferItem')


main = {}

function main.start()
	print('Progress Start!')
	local a = compare.main()
	local _result = {}
	local R = true
	local _result1 = true
	
	if a == nil then
		print('No matched Flash Drive,Exiting')
		break
	else
		local _text = readFlash.getOutput(sides.down,a)
		print('Found matched Flash Drive NO.'..a)
		print('Output:'.._text)
	end
	print('Start Set Fluid Output')
	local _fluidTable = readFlash.getInputFluids(sides.down,a)
	_fluidTable['n'] = nil
	for k,v in pairs(_fluidTable) do
		local _label = v[1]
		fluid.setOutput(_label,k)
	end
	print('Set Output Complete')
	print('Start Exam Fluid')
	for k,v in pairs(_fluidTable) do
		local _existAmount ,_existType = fluid.Info(sides.down,k)
		if _existType == v[1] and _existAmount > v[2] then
			_result[k] = true
		else
			_result[k] = false
		end
	end
	for k,v in pairs(_result) do
		R = R and v
	end
	if R == false then
		print('Fluid Exam Failed')
		break
	end	
	print('Start Transfer Fluid')
	
	for k,v in pairs(_fluidTable) do 
		fluid.transfer(v[2],k)
	end
	--[[
	for k,v in pairs(_fluidTable) do
		local _existAmount ,_existType = fluid.Info(sides.up,k)
		if _existType == v[1] and _existAmount = v[2] then
			_result1 = _result1 and true
		else
			_result1 = _result1 and false
		end
	end
	--]]
	
	print('start Item Transfer')
	transferItem.main()
	print('Item Transfer Complete')
end
	
	
	
	
	
	
	