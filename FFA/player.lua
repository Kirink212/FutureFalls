local tileQuadsWalk = {}
local tileQuadsWalkLegs = {}
local tileQuadsIdle = {}
local tileSize = 64

player = {
    x = 40,
    y = 400,
    speed = 600,
    speedy = 200,
    width = 64,
    height = 128,
    dir = 1,
    anim_frame = 0,
    anim_time = 0,
    jump = false,
    isMoving = false,
    tipo = 0
  }
function loadTileQuads(tileset, nx, ny, tileQuads)
  local count = 0
  for i = 0, nx, 1 do
    for j = 0, ny, 1 do
      tileQuads[count] = love.graphics.newQuad(j * tileSize ,i * tileSize, tileSize, 2*tileSize,tileset:getWidth(),tileset:getHeight())
      count = count + 1
    end
  end
end
function player_load()
  gravity = 1000
  tilesetLegs = love.graphics.newImage("anim_player_legs.png")
  tilesetIdle = love.graphics.newImage("idle_player.png")
  tilesetImage = love.graphics.newImage("anim_player.jpg")
  loadTileQuads(tilesetLegs, 0, 7, tileQuadsWalkLegs)
  loadTileQuads(tilesetImage, 0, 7, tileQuadsWalk)
  loadTileQuads(tilesetIdle, 0, 2, tileQuadsIdle)
end
function player_update(dt)
  --py = py + player.speedy*dt+(gravity*(dt)*dt)/2
  --player.speedy = player.speedy + gravity*dt
  player.anim_time = player.anim_time + dt -- incrementa o tempo usando dt
  if player.anim_time > 0.5 then -- quando acumular mais de 0.9
    player.anim_frame = player.anim_frame + 1 -- avança para proximo frame
    if player.anim_frame > 2 then
      player.anim_frame = 0
    end
    player.anim_time = 0 -- reinicializa a contagem do tempo
  end
  if love.keyboard.isDown("right") then
    player.isMoving = true
    player.dir = 1
    player.x = player.x + player.speed*dt
    player.anim_time = player.anim_time + dt -- incrementa o tempo usando dt
    if player.anim_time > 0.1 then -- quando acumular mais de 0.1
      player.anim_frame = player.anim_frame + 1 -- avança para proximo frame
      if player.anim_frame > 7 then
        player.anim_frame = 0
      end
      player.anim_time = 0 -- reinicializa a contagem do tempo
    end
  elseif love.keyboard.isDown("left") then
    player.isMoving = true
    player.dir = -1
    player.x = player.x - player.speed*dt
    player.anim_time = player.anim_time + dt -- incrementa o tempo usando dt
    if player.anim_time > 0.1 then -- quando acumular mais de 0.1
      player.anim_frame = player.anim_frame + 1 -- avança para proximo frame
      if player.anim_frame > 7 then
        player.anim_frame = 0
      end
      player.anim_time = 0 -- reinicializa a contagem do tempo
    end
  end
  if legs then
    player.tipo = 1
  end
  --[[if py > 70 - (player.height)/2 then
    py = 700 - (player.height)/2
  end
  --if player.jump then
    --py = py - player.speedy*dt +(gravity*dt*dt)/2
  --else
  --end]]--
end
function player_draw()
  local px,py = playerB:center()
  --Desenhando o personagem principal
  if player.dir == 1 and player.isMoving then
    if player.tipo == 0 then
      love.graphics.draw(tilesetImage,tileQuadsWalk[player.anim_frame], px,py-60,0,player.dir, 1, 32, 64)
    elseif player.tipo == 1 then
      love.graphics.draw(tilesetLegs,tileQuadsWalkLegs[player.anim_frame], px,py-60,0,player.dir, 1, 32, 64)
    end
  elseif player.dir == -1 and player.isMoving then
    if player.tipo == 0 then
      love.graphics.draw(tilesetImage,tileQuadsWalk[player.anim_frame], px,py-60,0,player.dir, 1, 32, 64)
    elseif player.tipo == 1 then
      love.graphics.draw(tilesetLegs,tileQuadsWalkLegs[player.anim_frame], px,py-60,0,player.dir, 1, 32, 64)
    end
  end
  if player.isMoving == false then
    love.graphics.draw(tilesetIdle,tileQuadsIdle[player.anim_frame], px,py-60,0,player.dir,1, 32, 64)
  end
  --love.graphics.print(tostring(obj1),px,80)
  --love.graphics.print(tostring(player.tipo),px,90)
  --love.graphics.print(tostring(legs),px,100)
end
function player_keypressed(key)
  if key == "up" and check_bottom_collide(playerB) then
    jump = true
  else 
    jump = false
  end
end
function player_keyreleased(key)
  if(key == 'right' or key == 'left') then
    player.isMoving = false
    player.anim_frame = 0
  end
end