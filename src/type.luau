--[[
	Contains markers for annotating objects with types.

	To set the type of an object, use `Type` as a key and the actual marker as
	the value:

		local foo = {
			[Type] = Type.Foo,
		}
]]

local Symbol = require(script.Parent.symbol)

local Type = newproxy(true)

local TypeInternal = {}

local function addType(name)
	TypeInternal[name] = Symbol.named("Koact" .. name)
end

addType("Context")
addType("Element")
addType("Localization")
addType("Fragment")

function TypeInternal.of(value)
	if typeof(value) ~= "table" then
		return nil
	end

	return value[Type]
end

getmetatable(Type).__index = TypeInternal

getmetatable(Type).__tostring = function()
	return "KoactType"
end

return Type
