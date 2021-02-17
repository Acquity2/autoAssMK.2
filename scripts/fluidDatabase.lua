fluidDatabase = {}
fluidDatabaseMetaTable = {}

fluidDatabase['熔融量子单元'] = '熔融量子锭'
fluidDatabase['熔融Naquadria单元'] = '熔融超能硅岩'
fluidDatabase['fluid.molten.solderingalloy'] = 'gt.metaitem.99.314.name'
fluidDatabase['fluid.lubricant'] = 'gt.metaitem.01.30724.name'
fluidDatabase['fluid.molten.styrenebutadienerubber'] = 'gt.metaitem.99.635.name'
fluidDatabase['IC2 Coolant'] = 'Coolant Cell'
fluidDatabase['Hydrogen Gas'] = 'gt.metaitem.01.30001.name'

for k,v in pairs(fluidDatabase)do
	fluidDatabaseMetaTable[v] = k
end

fluidDatabase = setmetatable(fluidDatabase,{__index = fluidDatabaseMetaTable})

return fluidDatabase