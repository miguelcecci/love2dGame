local ProgressBar = {}
ProgressBar.__index = ProgressBar 


function ProgressBar.new(x,y,w,h,color1, color2, progress)
		local self = setmetatable({}, ProgressBar)

		self.x = x
		self.y = y
		self.h = h
		self.w = w
		self.color1=color1
		self.color2=color2
		self.progress=progress
		return self
end

function ProgressBar:update(x, y, progress)
		self.x = x
		self.y = y
		self.progress = progress
end

function ProgressBar:draw()
		love.graphics.setColor(self.color1)
		love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
		love.graphics.setColor(self.color2)
		love.graphics.rectangle("fill", self.x, self.y, self.w*self.progress, self.h)
end

return ProgressBar
