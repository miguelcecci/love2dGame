world = love.physics.newWorld(0, 0, true)
Entity = require('entities/Entity')
LiveEntity = require('entities/LiveEntity')
MovingLiveEntity = require('entities/MovingLiveEntity')

ProjectileEmissor = require('damage/ProjectileEmissor')

globals = {}
globals.window = {}

globals.window.size = {}
globals.window.size.x = 400
globals.window.size.y = 400

globals.entitylist = {}
globals.projetctilelist = {}

emissor_test = {}

selected = {}
function love.load()
  love.physics.setMeter(64)
  love.graphics.setBackgroundColor(0.0, 0.0, 0.0)
  love.window.setMode(globals.window.size.y, globals.window.size.x)
		world:setCallbacks(beginContact)
		selected = MovingLiveEntity.new(10, 10, 20, 20, {1,1,1}, 100, 1, 95, true)
		emissor_test = ProjectileEmissor.new(400,15,10,3,{1,0.4,1},-800,0,10,1,false,false, 0.2)

		selected.fixture:setUserData({object='person', global_index=10})
end

function love.update(dt)
  world:update(dt)
		selected:update(dt)
		emissor_test:update(dt)
		for i in ipairs(globals.projetctilelist) do
				globals.projetctilelist[i]:update(dt)
				if globals.projetctilelist[i].destroy then
						globals.projetctilelist[i].entity.body:destroy()
						globals.projetctilelist[i] = nil
				end
		end
		if love.keyboard.isDown('i') then
				emissor_test:emit()
		end
end

function love.draw()
		selected:draw()
		for i, j in ipairs(globals.projetctilelist) do
				globals.projetctilelist[i]:draw()
		end
end

function beginContact(a, b, coll)

		damage_value = 0
		for j, i in pairs({a, b}) do
				if i:getUserData().object == 'projectile' then
						aux=getprojectilebyglobalindex(i:getUserData().global_index)
						print(aux)
						damage_value = globals.projetctilelist[aux].damage
				end
		end
		for j, i in pairs({a, b}) do
				if i:getUserData().object == 'projectile' then
						destroyprojectile(i:getUserData().global_index)
				end
				if i:getUserData().object == 'person' then
						applyDamage(i:getUserData().global_index, damage_value)
				end
		end
end

function applyDamage(global_index, damage)
		selected:damage(damage)
end

function destroyprojectile(projectile_index)
		i = getprojectilebyglobalindex(projectile_index)
		globals.projetctilelist[i].entity.body:destroy()
		globals.projetctilelist[i] = nil
end

function getprojectilebyglobalindex(projectile_index)
		for i, j in ipairs(globals.projetctilelist) do
				if j.entity.fixture:getUserData().global_index == projectile_index then
						return i
				end
		end
end
