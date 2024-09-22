-- DEPENDENCIES >
local IsPropertyCompatible = require(script.Parent.IsPropertyCompatible)

-- FUNCTIONS >
local function ApplyProperty(instance: Instance, propertyName: string, propertyValue: any)
	local InstancePropertyValue = (instance :: any)[propertyName]

	-- Sanity checks --
	local IsCompatible = IsPropertyCompatible(instance, propertyName, propertyValue)

	-- If the property types are compatible and the values aren't equal
	if IsCompatible and InstancePropertyValue ~= propertyValue then
		(instance :: any)[propertyName] = propertyValue -- Apply the property
	end
end

-- RETURNING >
return ApplyProperty
