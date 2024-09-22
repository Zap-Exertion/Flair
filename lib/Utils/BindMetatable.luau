-- RETURNING >
return function(properties: {}, functions: {})
	return setmetatable(properties, {
		__index = function(tab, key)
			local method = functions[key]

			if method then
				-- If it's a method, return it
				return method
			end

			return rawget(tab, key) -- It might be a property then
		end,
	})
end
