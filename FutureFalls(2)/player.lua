local HC = require "HardonCollider"
local shapes = require "hardoncollider.shapes"
collider = HC(100, on_collide)
local player_dir = 1
local player_anim_time = 0
local player_anim_frame = 0

function setupPlayer(x,y)
    
    playerR = collider:addRectangle(x+28,y-50,4,100)
    playerL = collider:addRectangle(x-32,y-50,4,100)
    playerU = collider:addRectangle(x-28,y-64,56,4)
    playerB = collider:addRectangle(x-16,y+60,36,4)
    player_speedR = 400
    player_speedL = 400

end
function updatePlayerUB(dt)
  
  playerU:move(0,gravity*dt)  
  playerB:move(0,gravity*dt)
  
end

function updatePlayerRL(dt)

    playerL:move(0,gravity*dt)
    playerR:move(0,gravity*dt)
end

function movePlayerY(y)
  
  playerR:move(0,y)
  playerL:move(0,y-2)
  playerU:move(0,y-2)
  playerB:move(0,y)
  
end
  

function movePlayerTo(x,y)
  
  playerR:moveTo(x+30,y-2)
  playerL:moveTo(x-30,y-2)
  playerU:moveTo(x,y-64)
  playerB:moveTo(x,y+60)
  
end