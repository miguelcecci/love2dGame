local Atributable = {}
Atributable.__index = Atributable 

function Atributable.new()
		local self = setmetatable({}, Atributable)

		return self
end

return Atributable
