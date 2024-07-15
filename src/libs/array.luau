local arrayClass = {}
arrayClass.__index = arrayClass

--function arrayClass:__len()
--	return self.n
--end

function arrayClass:unpack()
	return table.unpack(self,1,self.n)
end

return function(...)
	return setmetatable(table.pack(...),arrayClass)
end
