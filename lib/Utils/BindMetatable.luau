-- RETURNING >
return function(functions: {})
	return setmetatable({}, {
		__index = function(_, functionName)
			local FoundMethod = functions[functionName] or nil

			return function(...)
				if FoundMethod then
					FoundMethod(...)
				end
			end
		end,
	})
end
