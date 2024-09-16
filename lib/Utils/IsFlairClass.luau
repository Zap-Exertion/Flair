-- RETURNING >
return function(class: any)
	return (type(class) == "table" and class.Flair and class.ClassName and class.Value and class.Destroy) and true
		or false
end
