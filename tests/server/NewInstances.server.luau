-- SERVICES >
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- FOLDERS >
local Packages = ReplicatedStorage.Packages

-- DEPENDENCIES >
local Flair = require(Packages.Flair)

-- TESTING >
local New = Flair.New

New("ScreenGui"):Release()
