local component = require('component')
local sides = require('sides')
local getInputItemList = require('getInputItemList')
local readFlash = require('readFlash')

compare = {}

function compare.table_leng(t)
	local leng=0
	for k, v in pairs(t) do
		leng=leng+1
	end
	return leng;
end

local list1,list2 = {} --list1为读取闪存中list，list2为输入箱子中物品列表
function compare.listCompare(list1,list2)
	local _leng1 = compare.table_leng(list1)
	local _leng2 = compare.table_leng(list2)
	if _leng1 ~= _leng2 then 
		goto BRE
	end
	local _table = {}
	for i = 1,_leng1,1 do
		local _Bool = list1[i][1] == list2[i][1] and list1[i][2] == list2[i][2]
		_Bool = not _Bool
		if _Bool then
			goto BRE
		end
	end
	return true
	goto BRE1
	::BRE::
	return false
	::BRE1::
end

function compare.main()
	local _num = readFlash.count(sides.down)
	local _itemList = getInputItemList.main(sides.up)
	local _inputList = {}
	for i = 1,_num,1 do
		local _inputList = readFlash.getInputItems(sides.down,i)
		if compare.listCompare(_inputList,_itemList) then
			return i
			goto BRE2
		end
	end
	return nil
	::BRE2::
end


	