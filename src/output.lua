local module = {}
local data = {}
local reversed = {}

function module.reverse(k,v)
	reversed[k] = v
	data[k] = v
end

local meta = {}

function meta:__index(k)
	return data[k]
end

function meta:__newindex(k,v)
	local reverse = reversed[k]
	data[k] = reverse or v
end

return setmetatable(module,meta)
