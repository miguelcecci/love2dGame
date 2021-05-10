local LiveEntity = {}
LiveEntity.__index = LiveEntity

Entity = require('entities/Entity')
HealthBar = require('hud/HealthBar')

function LiveEntity.new(x,y,h,w,color,max_hp,regeneration)
		
		local self = setmetatable(Entity.new(x,y,h,w,color), LiveEntity)
		
		self.max_hp = max_hp
		self.hp = self.max_hp
		self.regeneration = regeneration
		self.alive = true
		
		self.timer = 0.0
		self.healthBar = HealthBar.new(self.x, self.y+20, self.hp/self.max_hp)

		return self
end

function LiveEntity:update(dt)
		self.healthBar:update(self.body:getX(), self.body:getY()+20, self.hp/self.max_hp)
		self.timer=self.timer+dt
		if self.timer > 1 then
				self.hp = self.hp + self.regeneration
				if self.hp > self.max_hp then
						self.hp = self.max_hp
				end
				self.timer = 0
		end
		if self.hp <= 0 then
				self.alive = false
				self.hp = 0
		end
end

function LiveEntity:damage(value)
		self.hp = self.hp - value
end

function LiveEntity:draw()
		self.healthBar:draw()
		Entity.draw(self)
end

return LiveEntity
