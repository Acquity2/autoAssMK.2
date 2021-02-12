
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
		if v ~= _tb2[k] then
			_tb3[v] = k
		end
	end
	table.sort(_tb3)
	return _tb3
end

return getTableDiff