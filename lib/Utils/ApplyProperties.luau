-- DEPENDENCIES >
local Debugger = require(script.Parent.Debugger)

-- FUNCTIONS >
local function ApplyProperties(instance: Instance, propertyName: string, propertyValue: any)
	print(propertyName)
	local InstancePropertyValue = (instance :: any)[propertyName]

	-- Sanity checks --

	-- If type isn't same, then skip
	if typeof(InstancePropertyValue) ~= typeof(propertyValue) then
		-- Or if the current instance value is nil, then skip
		if InstancePropertyValue ~= nil then
			Debugger.Warn("TypeMismatch", typeof(InstancePropertyValue), typeof(propertyValue))
			return
		end
	end

	if InstancePropertyValue == propertyValue then
		return
	end

	(instance :: any)[propertyName] = propertyValue -- Applying the property
end

-- RETURNING >
return ApplyProperties
