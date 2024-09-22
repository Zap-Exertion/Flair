-- SERVICES >
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- FOLDERS >
local Packages = ReplicatedStorage.Packages

-- DEPENDENCIES >
local Flair = require(Packages.Flair)

-- TESTING >
local New = Flair.New
local Current = os.clock()
New "Part":Props {
	Name = "BluePart",
	Anchored = true,
	Position = Vector3.new(0, 5, 0),
	Size = Vector3.new(4, 4, 4),
	BrickColor = BrickColor.Blue(),

	Parent = workspace,
}:Children {
	randomStringValue = New "StringValue":Props {
		Value = "sup",
	},
}
print(os.clock() - Current)
