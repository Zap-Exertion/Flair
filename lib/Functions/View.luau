-- RETURNING >
return function(object: any): any
	local Type = typeof(object)

	if Type == "table" and object.Flair and object.Value then
		return object.Value
	end

	return object
end
