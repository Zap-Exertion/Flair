-- FOLDERS >
local Root = script.Parent.Parent
local Utils = Root.Utils

-- DEPENDENCIES >
local ApplyProperties = require(Utils.ApplyProperties)
local ApplyChildren = require(Utils.ApplyChildren)
local Debugger = require(Utils.Debugger)
local Types = require(Root.Types)

-- FUNCTIONS >
local function New(
	className: string,
	propertyTable: Types.PropertyTable?,
	childrenTable: Types.ChildrenTable?
): Instance
	local Success, Result = pcall(Instance.new, className)

	if not Success then
		Debugger.Error("InvalidInstance", className)
	end

	if propertyTable then
		for propertyName, propertyValue in propertyTable do
			ApplyProperties(Result, propertyName, propertyValue)

			if propertyName == "Parent" then
				continue
			end
		end
	end

	if childrenTable then
		ApplyChildren(Result, childrenTable)
	end

	-- Parent the instance at the end, it's always a good practice
	if propertyTable and propertyTable.Parent then
		Result.Parent = ApplyProperties(Result, "Parent", propertyTable.Parent)
	end

	return Result
end

-- RETURNING >
return New
