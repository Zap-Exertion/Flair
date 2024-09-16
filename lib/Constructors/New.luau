-- FOLDERS >
local Root = script.Parent.Parent
local Utils = Root.Utils

-- DEPENDENCIES >
local BindMetatable = require(Utils.BindMetatable)
local ApplyProperty = require(Utils.ApplyProperty)
local ApplyChildren = require(Utils.ApplyChildren)
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

function Class.Tag(self: Types.FlairObject, tagName: string | { string }): Types.FlairObject
	local Type = type(tagName)

	if Type == "string" then
		self.Value:AddTag(tagName :: string)
	elseif Type == "table" then
		for _, tag in tagName :: { string } do
			self.Value:AddTag(tag)
		end
	end

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
--[[
## `New`
Constructs a new instance.

---

### Parameters
- **className:** `string`

---

### Returns
- `Flair.Object`

---

### Usage
```luau
local MenuGui = New("ScreenGui") -> FlairObject
```
]]
return function(className: string): Types.FlairObject
	local Success, Result = pcall(Instance.new, className)

	if not Success then
		Debugger.Error("InvalidInstance", className)
	end

	local self: Types.FlairObject = BindMetatable(Class) :: any

	self.Flair = true
	self.ClassName = "New"
	self.Value = Result

	return self
end
