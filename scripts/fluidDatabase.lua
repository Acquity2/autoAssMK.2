fluidDatabase = {}
fluidDatabaseMetaTable = {}

fluidDatabase['熔融量子单元'] = '熔融量子锭'
fluidDatabase['熔融Naquadria单元'] = '熔融超能硅岩'
fluidDatabase['fluid.molten.solderingalloy'] = 'gt.metaitem.99.314.name'
fluidDatabase['fluid.lubrican'] = 'gt.metaitem.01.30724.name'
fluidDatabase['fluid.molten.styrenebutadienerubber'] = 'gt.metaitem.99.635.name'
fluidDatabase['IC2 Coolant'] = 'Coolant Cell'

for k,v in pairs(fluidDatabase)do
	fluidDatabaseMetaTable[v] = k
end

fluidDatabase = setmetatable(fluidDatabase,fluidDatabaseMetaTable)

return fluidDatabase