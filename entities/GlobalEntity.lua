
local GlobalEntity = {}
GlobalEntity.__index = GlobalEntity 

function GlobalEntity.new(child)
		local self = setmetatable({}, GlobalEntity)

		self.child = child 

		return self
end

function GlobalEntity:update()
		self.child:update()
end

function GlobalEntity:draw()
		self.child:draw()
end

return GlobalEntity 
