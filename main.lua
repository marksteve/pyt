flux = require "flux"

function love.load()
  touches = {}
end

function love.update(dt)
  flux.update(dt)
end

function drawtouch(i, touch)
  love.graphics.circle("fill", touch.x, touch.y, 100)
end

function love.draw()
  table.foreach(touches, drawtouch)
end

function love.touchpressed(id, x, y)
  touches[id] = {x=x, y=y}
end

function love.touchmoved(id, x, y)
  flux.to(touches[id], 0.2, {x=x, y=y})
end

function love.touchreleased(id, x, y)
  touches[id] = nil
end
