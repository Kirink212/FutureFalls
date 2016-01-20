local HC = require "HardonCollider"
local shapes = require "hardoncollider.shapes"

function plat_load()
  plat = {
    x = 4160,
    y = 512, 
    dir = -1,
    image = love.graphics.newImage("maps/plataforma1.png"),
    collides = false
  }
  collider = HC(100, on_collide)
  plat_col = collider:addRectangle(plat.x,plat.y,100,20)
  pos_tempy = player.y
end
function plat_update(dt)
  if plat.y <  pos_tempy - 256 then
    plat.dir = 1
  end
  if plat.y > pos_tempy + 192 then
    plat.dir = -1
  end
  plat.y = plat.y + 100*plat.dir*dt
  plat_col:move(0,100*plat.dir*dt)
end
function plat_draw()
  love.graphics.draw(plat.image, plat.x, plat.y)
  love.graphics.setColor(255, 255, 255)
  plat_col:draw("line")
end