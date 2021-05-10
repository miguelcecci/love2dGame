local ProjectileEmissor = {}
ProjectileEmissor.__index = ProjectileEmissor

Projectile = require('damage/projectile')

function ProjectileEmissor.new(x,y,w,h,color,xv,yv,damage,lifetime,pierce,reusable,cooldown)
		local self = setmetatable({}, ProjectileEmissor)

		self.x = x
		self.y = y
		self.w = w
		self.h = h
		self.color = color
		self.xv = xv
		self.yv = yv
		self.damage = damage
		self.lifetime = lifetime
		self.pierce = pierce
		self.reusable = reusable
		self.cooldown = cooldown

		self.cooldowntimer = 0.0
		return self
end


function ProjectileEmissor:reposition(x, y)
		self.x = x
		self.y = y
end

function ProjectileEmissor:update(dt)
		self.cooldowntimer = self.cooldowntimer + dt
end

function ProjectileEmissor:emit()
		if self.cooldowntimer > self.cooldown then
				self.cooldowntimer = 0
				test_index = love.math.random(10, 1000000)
				globals.projetctilelist[#globals.projetctilelist+1]=Projectile.new(
						self.x,
						self.y,
						self.w,
						self.h,
						self.color,
						self.xv,
						self.yv,
						self.damage,
						self.lifetime,
						self.pierce,
						self.reusable,
						{object='projectile', global_index=test_index}
				)
		end
end

return ProjectileEmissor
