-- SERVICES >
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- DEPENDENCIES >
local Flair = require(ReplicatedStorage.Packages.Flair)

-- VARIABLES >
local New = Flair.New
local Player = Players.LocalPlayer

-- UI >
New("ScreenGui", {
	Name = "hi wo",
	Parent = Player:WaitForChild("PlayerGui"),
	IgnoreGuiInset = "fdssdf",
	dsa = "dsa",
}, {
	frame = New("Frame", {}),
})
