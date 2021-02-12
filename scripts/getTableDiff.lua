
getTableDiff = {}

function getTableDiff.main(_tb1,_tb2)
	if type(_tb1) ~= 'table' or next(_tb1) == nil then
		return nil
	end
	
	if type(_tb2) ~= 'table' or next(_tb2) == nil then
		return _tb1
	end
	
	local _tb3 = {}
	for k,v in pairs(_tb1) do
		for k,vv in pairs(_tb2) do
			if v == vv then 
				v = nil
				break
			end
		end
		
		if v ~= nil then
			table.insert(_tb3,k,v)
		end
	end
	
	table.sort(_tb3)
	return _tb3
end

return getTableDiff