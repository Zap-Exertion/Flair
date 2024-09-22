-- FOLDERS >
local Root = script.Parent.Parent
local Utils = Root.Utils

-- DEPENDENCIES >
local ApplyProperty = require(Utils.ApplyProperty)
local ApplyChildren = require(Utils.ApplyChildren)
local BindMetatable = require(Utils.BindMetatable)
local Debugger = require(Utils.Debugger)
local Types = require(Root.Types)

-- VARIABLES >
local Class = {} :: Types.FlairObjectFuncs

-- FUNCTIONS >
function Class.Props(self: Types.FlairObject, propertyTable: Types.PropertyTable): Types.FlairObject
	for propertyName, propertyValue in propertyTable do
		if propertyName == "Parent" then
			continue
		end

		ApplyProperty(self.Value, propertyName, propertyValue)
	end

	-- Parent the instance at the end, it's always a good practice
	if propertyTable.Parent then
		ApplyProperty(self.Value, "Parent", propertyTable.Parent)
	end

	return self
end

function Class.Children(self: Types.FlairObject, childrenTable: Types.ChildrenTable): Types.FlairObject
	ApplyChildren(self.Value, childrenTable)
	return self
end

function Class.Release(self: Types.FlairObject): Instance
	local ReleasedInstance = self.Value

	table.clear(self :: any)
	setmetatable(self :: any, nil)

	return ReleasedInstance
end

function Class.Destroy(self: Types.FlairObject): ()
	local ReleasedInstance = self.Value

	table.clear(self :: any)
	setmetatable(self :: any, nil)

	ReleasedInstance:Destroy()
end

-- RETURNING >
--[=[
## `New`
Constructs a new instance.

@param className: `string`
@return `FlairObject`

#### Usage
```luau
local MenuGui = New("ScreenGui") -> FlairObject
```
]=]
return function(className: string): Types.FlairObject
	local Success, Result = pcall(Instance.new, className)

	if not Success then
		Debugger.Error("InvalidInstance", className)
	end

	return BindMetatable({
		Flair = true,
		ClassName = "New",
		Value = Result,
	}, Class) :: any
end
