flux = require "flux"

function love.load()
  touches = {}
  effect = love.graphics.newShader [[
      extern number time;
      vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords)
      {
          return vec4((1.0+sin(time))/2.0, abs(cos(time)), abs(sin(time)), 1.0);
      }
  ]]
end

function drawtouch(i, touch)
  love.graphics.circle("fill", touch.x, touch.y, 100)
end

function love.draw()
  love.graphics.setShader(effect)
  table.foreach(touches, drawtouch)
end

local t = 0
function love.update(dt)
  flux.update(dt)
  t = t + dt
  effect:send("time", t)
end

function love.touchpressed(id, x, y)
  touches[id] = {x=x, y=y}
end

function love.touchmoved(id, x, y)
  touches[id].x = x
  touches[id].y = y
end

function love.touchreleased(id, x, y)
  touches[id] = nil
end
