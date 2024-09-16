-- EXTRA >
export type PropertyTable = { [string]: any }
export type ChildrenTable = Instance | FlairObject | { Instance | FlairObject }

-- FLAIR OBJECT >
export type FlairObjectProps = {
	Flair: true,
	ClassName: "New",
	Value: Instance,
}

export type FlairObjectFuncs = {
	--[[
	## `:Props`
	Applies the properties passed to this method.

	---
	### Parameters
	- **propertyTable:** `Types.PropertyTable`

	---
	### Returns
	- `FlairObject`

	---
	### Usage
	```luau
	local MenuGui = New("ScreenGui"):Props {
		Name = "MenuGui",
		IgnoreGuiInset = true,
		Parent = Player:WaitForChild("PlayerGui"),
	}
	```

	]]
	Props: (self: FlairObject, propertyTable: PropertyTable) -> FlairObject,

	--[[
	## `:Children`
	Applies the children passed to this method.

	---
	### Parameters
	- **childrenTable:** `Types.ChildrenTable`

	---
	### Returns
	- `FlairObject`

	---
	### Usage
	```luau
	local MenuGui = New("ScreenGui"):Children {
		Background = New("Frame"):Props {
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			Size = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
		}
	}
	```
	]]
	Children: (self: FlairObject, childrenTable: ChildrenTable) -> FlairObject,

	--[[
	## `:Tag`
	Applies the given tags to the instance.

	---
	### Parameters
	- **tagName:** `string | { string }`

	---
	### Returns
	- `FlairObject`

	---
	### Usage
	```luau
	local MenuGui = New("ScreenGui"):Tag { "GUI", "Visible" }
	```
	]]
	Tag: (self: FlairObject, tagName: string | { string }) -> FlairObject,

	--[[
	## `:Release`
	Releases the instance from the chain and destroys the chain.

	---
	### Returns
	- `Instance`

	---
	### Usage
	```luau
	local MenuGui = New("ScreenGui"):Release() -> ScreenGui
	```
	]]
	Release: (self: FlairObject) -> Instance,

	--[[
	## `:Destroy`
	Destroys the FlairObject.

	---
	### Returns
	- `nil`

	---
	### Usage
	```luau
	local MenuGui = New("ScreenGui"):Destroy() -> nil
	```
	]]
	Destroy: (self: FlairObject) -> (),
}

export type FlairObject = typeof(setmetatable({} :: FlairObjectProps, {} :: { __index: FlairObjectFuncs }))

return {}
