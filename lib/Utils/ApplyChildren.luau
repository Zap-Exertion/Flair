-- FOLDERS >
local Root = script.Parent.Parent

-- DEPENDENCIES >
local IsFlairClass = require(Root.Utils.IsFlairClass)
local Debugger = require(Root.Utils.Debugger)
local View = require(Root.Functions.View)
local Types = require(Root.Types)

-- FUNCTIONS >
local function ApplyChildren(instance: Instance, childrenTable: Types.ChildrenTable)
	local Returned = View(childrenTable)

	if typeof(Returned) == "Instance" then
		Returned.Parent = instance
	elseif type(Returned) == "table" then
		if IsFlairClass(Returned) == true then
			(Returned :: Types.FlairObject):Release().Parent = instance
		else
			for _, object in Returned do
				(View(object) :: Instance).Parent = instance
			end
		end
	else
		Debugger.Warn("TypeMismatch", "Instance | FlairObject | { Instance | FlairObject }", typeof(childrenTable))
	end
end

-- RETURNING >
return ApplyChildren
