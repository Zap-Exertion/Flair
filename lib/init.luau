-- VARIABLES >
local Types = require(script.Types)
local Flair = {
	New = require(script.Constructors.New),
	View = require(script.Functions.View),
}

-- EXPORTING >
export type FlairObject = Types.FlairObject

return table.freeze(Flair)
