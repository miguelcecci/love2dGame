local HealthBar = {}
HealthBar.__index = HealthBar 

ProgressBar = require('hud/ProgressBar')

function HealthBar.new(x,y,progress)
		width = 50
		local self = setmetatable(ProgressBar.new(x, y, width, 3, {1,0,0}, {0,1,0}, progress), HealthBar)
		return self
end

function HealthBar:update(x,y,progress)
		ProgressBar.update(self, x-self.w/2, y, progress)
end

function HealthBar:draw()
		if self.progress ~= 1 then
				ProgressBar.draw(self)
		end
end

return HealthBar
