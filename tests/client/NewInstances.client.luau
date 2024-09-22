-- SERVICES >
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- DEPENDENCIES >
local Flair = require(ReplicatedStorage.Packages.Flair)

-- VARIABLES >
local New = Flair.New
local Player = Players.LocalPlayer

-- UI >
--[[
New "ScreenGui"
	:Props {
		IgnoreGuiInset = true,
		Parent = Player:WaitForChild("PlayerGui"),
	}
	:Children {
		Frame = New "Frame":Props { Size = UDim2.fromScale(0.5, 0.5) },
	}
	:Tag { "GUI", "VisibleAtIntermission" }
]]
