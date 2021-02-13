local component = require('component')
local sides = require('sides')
local getInputItemList = require('getInputItemList')
local readFlash = require('readFlash')
local chipDatabase = require('chipDatabase')

compare = {}

--[[ 
function compare.table_leng(t)
	local leng=0
	for k, v in pairs(t) do
		leng=leng+1
	end
	return leng;
end
--]] 
--获取string长度函数

function compare.item(item1,item2)
 local _result = false
	if chipDatabase.item2 == nil then 
		if item1 == item2 then 
			_result = true
		else
			_result = false
		end
	else
		if chipDatabase[item1] == chipDatabase[item2] then
			_result = true
		else
			_result = false
		end
	end
	return _result
end


function compare.listCompare(list1,list2) --list1为读取闪存中list，list2为输入箱子中物品列表
	local _table = {}
	local _result = false
	if list1.n ~= list2.n then 
		_result = false
		goto BRE
	end
	for i = 1,list1.n,1 do
		_table[i] = compare.item(list1[i][1],list2[i][1]) and list1[i][2] == list2[i][2]
	end
	_result = true
	for i = 1,list1.n,1 do
		_result = _result and _table[i]
	end
	::BRE::
	return _result
end

function compare.main()
	local _num = readFlash.count(sides.down)
	local _itemList = getInputItemList.main(sides.up)
	local _inputList = {}
	local _result = nil
	for i = 1,_num,1 do
		local _inputList = readFlash.getInputItems(sides.down,i)
		if compare.listCompare(_inputList,_itemList) then
			_result = i
		end
	end
	return _result
end

return compare
