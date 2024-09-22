-- DEPENDENCIES >
local Debugger = require(script.Parent.Debugger)
local IsFlairClass = require(script.Parent.IsFlairClass)

-- RETURNING >
return function(instance: Instance, propertyName: string, propertyValue: any): (boolean, string, string)
	local Property = (instance :: any)[propertyName] or nil
	local TypeOfProperty, TypeOfValue = typeof(Property), typeof(propertyValue)
	local IsOk = false

	-- If the types are same, then the properties are compatible.
	if TypeOfProperty == TypeOfValue then
		IsOk = true
	end

	--[[
	! SPECIAL CASE: `nil` and `Instance` type values are only set for those properties that can accept either
	! a `nil` type or an `Instance` type, no pcall compatibility check needed.
	]]

	if TypeOfProperty == "nil" then
		if TypeOfValue == "Instance" then
			IsOk = true
		elseif IsFlairClass(propertyValue, "New") then
			TypeOfValue = "FlairObject"
			IsOk = true
		end
	elseif TypeOfProperty == "Instance" and TypeOfValue == "nil" then
		IsOk = true
	end

	if not IsOk then
		Debugger.Warn("TypeMismatch", TypeOfProperty, TypeOfValue)
	end

	return IsOk, TypeOfProperty, TypeOfValue
end
