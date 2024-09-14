-- DEPENDENCIES >
local Types = require(script.Parent.Parent.Types)
local Debugger = require(script.Parent.Debugger)

-- FUNCTIONS >
local function ApplyChildren(instance: Instance, childrenTable: Types.ChildrenTable)
	if type(childrenTable) == "table" then
		for name, value in childrenTable do
			value.Name = name
			value.Parent = instance
		end
	elseif typeof(childrenTable) == "Instance" then
		childrenTable.Parent = instance
	else
		Debugger.Warn("TypeMismatch", "{ Instance } | Instance", type(childrenTable))
	end
end

-- RETURNING >
return ApplyChildren
