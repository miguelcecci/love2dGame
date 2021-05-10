local Projectile = {}
Projectile.__index = Projectile

function Projectile.new(x,y,w,h,color,xv,yv,damage,lifetime,pierce,reusable, userdata)
		local self = setmetatable({}, Projectile)
		self.entity = Entity.new(x, y, w, h, color)

		self.lifetime = lifetime
		self.damage = damage
		self.pierce = pierce
		self.reusable = reusable

		self.entity.fixture:setUserData(userdata)
		self.destroy = false
		self.timer = 0
		self.entity.body:setLinearVelocity(xv, yv)
		return self
end

function Projectile:update(dt)
		self.timer=self.timer+dt
		if self.timer > self.lifetime then
				self.destroy = true
		end
end

function Projectile:draw()
		self.entity:draw()
end

return Projectile
