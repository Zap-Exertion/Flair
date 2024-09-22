-- EXTRA >
export type PropertyTable = { [string]: unknown }
export type ChildrenTable = Instance | FlairObject | { Instance | FlairObject }

-- FLAIR OBJECT >
export type Props = {
	Flair: true,
	ClassName: "New",
	Value: Instance,
}

export type Funcs = {
	--[[
	### `FlairObject:Props`
	Applies the passed table of properties to the instance.

	@param propertyTable: `Types.PropertyTable`
	@return FlairObject

	#### Usage
	```luau
	local MenuGui = New("ScreenGui"):Props {
		Name = "MenuGui",
		IgnoreGuiInset = true,
		Parent = PlayerGui,
	}
	```
	]]
	Props: (self: FlairObject, propertyTable: PropertyTable) -> FlairObject,

	--[[
	### `FlairObject:Children`
	Parents the passed table of children to the main Instance.

	@param childrenTable: `Types.ChildrenTable`
	@return FlairObject

	#### Usage
	```luau
	local MenuGui = New "ScreenGui" :Children (
		New "Frame" :Props {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		}
	)
	```
	]]
	Children: (self: FlairObject, propertyTable: ChildrenTable) -> FlairObject,

	--[[
	#### `FlairObject:Release`
	Releases the instance from the chain and destroys the chain.

	@return Instance

	#### Usage
	```luau
	local MenuGui = New("ScreenGui"):Release() -> ScreenGui
	```
	]]
	Release: (self: FlairObject) -> Instance,

	--[[
	### `FlairObject:Destroy`
	Destroys the FlairObject.

	@return nil
	#### Usage
	```luau
	local MenuGui = New("ScreenGui"):Destroy() -> nil
	```
	]]
	Destroy: (self: FlairObject) -> (),
}

export type FlairObject = typeof(setmetatable({} :: Props, {} :: { __index: Funcs }))

return {}
