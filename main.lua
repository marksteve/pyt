flux = require "flux"

function love.load()
  t = 0
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
  love.graphics.circle("line", touch.x, touch.y, touch.r)
end

function love.draw()
  love.graphics.setShader(effect)
  table.foreach(touches, drawtouch)
end

function settouchradius(i, touch)
  touch.r = 100 + 10 * math.cos(t * 10)
end

function love.update(dt)
  flux.update(dt)
  t = t + dt
  effect:send("time", t)
  table.foreach(touches, settouchradius)
end

function love.touchpressed(id, x, y)
  touches[id] = {x=x, y=y, r=0}
end

function love.touchmoved(id, x, y)
  touches[id].x = x
  touches[id].y = y
end

function love.touchreleased(id, x, y)
  touches[id] = nil
end
