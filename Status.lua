local Status = {}
Status.__index = Atributable 

function Status.new()
		local self = setmetatable({}, Status)

		return self
end

return Status
