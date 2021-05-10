local Entity = {}
Entity.__index = Entity

function Entity.new(x, y, w, h, color)
		local self = setmetatable({}, Entity)

		self.color = color
		self.width = w
		self.height = h
		self.x = x
		self.y = y

		self.body = love.physics.newBody(world, x, y, "dynamic")
		self.shape = love.physics.newRectangleShape(0, 0, self.width, self.height)
		self.fixture = love.physics.newFixture(self.body, self.shape, 1.0)

		self.body:setFixedRotation(true)
		self.fixture:setRestitution(0.9)

		return self
end

function Entity:draw()
		love.graphics.setColor(self.color)
		love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
end

return Entity
