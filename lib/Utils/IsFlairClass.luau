-- RETURNING >
return function(class: any, className: string?): boolean
	if type(class) == "table" and class.Flair and class.ClassName and class.Value then
		if className and class.ClassName ~= className then
			return false
		end

		return true
	end

	return false
end
