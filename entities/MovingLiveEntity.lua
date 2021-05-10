local MovingLiveEntity = {}
MovingLiveEntity.__index = MovingLiveEntity

LiveEntity = require('entities/LiveEntity')

function MovingLiveEntity.new(x,y,h,w,color,max_hp,regeneration,speed,controlled)
		local self = setmetatable(LiveEntity.new(x,y,h,w,color,max_hp,regeneration), MovingLiveEntity)

		self.speed = speed
		self.controlled = controlled

		return self
end

function MovingLiveEntity:update(dt)
		LiveEntity.update(self, dt)
		vec_x = 0
		vec_y = 0
		if love.keyboard.isDown('w') then
				vec_y = vec_y-1
		end
		if love.keyboard.isDown('s') then
				vec_y = vec_y+1
		end
		if love.keyboard.isDown('a') then
				vec_x = vec_x-1
		end
		if love.keyboard.isDown('d') then
				vec_x = vec_x+1
		end
		self.body:setLinearVelocity(self.speed*vec_x,self.speed*vec_y)
end

function MovingLiveEntity:damage(value)
		LiveEntity.damage(self, value)
end

function MovingLiveEntity:draw()
		LiveEntity.draw(self)
end

return MovingLiveEntity
