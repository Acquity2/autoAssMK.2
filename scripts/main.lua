local compare = require('compare')
local component = require('component')
local sides = require('sides')
local io = require('io')
local os = require('os')
local getTableDiff = require('getTableDiff')
local conf = require('conf')
local readFlash = require('readFlash')



main = {}

function main.start()
	print('Progress Start!')
	local a = compare.main()
	if a = nil then
		print('No matched Flash Drive,Exiting')
		break
	else
		local _text = readFlash.getOutput(sides.down,a)
		print('Found matched Flash Drive NO.'..a)
		print('Output:'.._text)
	end
	print('Start Transfer Fluid')
	local _fluidTable = readFlash.getInputFluids(sides.down,a)
	
	
	