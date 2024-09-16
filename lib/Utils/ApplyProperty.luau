-- DEPENDENCIES >
local Debugger = require(script.Parent.Debugger)

-- FUNCTIONS >
local function ApplyProperty(instance: Instance, propertyName: string, propertyValue: any)
	local InstancePropertyValue = (instance :: any)[propertyName]

	-- Sanity checks --

	-- If type isn't same, then skip
	if typeof(InstancePropertyValue) ~= typeof(propertyValue) then
		-- Or if the current instance value is nil, then skip
		if InstancePropertyValue ~= nil then
			Debugger.Warn("TypeMismatch", typeof(InstancePropertyValue), typeof(propertyValue))
		end
	end

	-- If the values aren't equal
	if InstancePropertyValue ~= propertyValue then
		(instance :: any)[propertyName] = propertyValue -- Apply the property
	end
end

-- RETURNING >
return ApplyProperty
