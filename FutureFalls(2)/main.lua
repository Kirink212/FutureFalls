--require "camera"
require "player"
require "collision"
local loader = require "AdvTiledLoader/Loader"
-- set the path to the Tiled map files
loader.path = "maps/"

--local music = love.audio.newSource("Crazy_Motorcycle_Chase_-_Final_Fantasy_VII_Music_Extended.mp3")

local HC = require "HardonCollider"
local shapes = require "hardoncollider.shapes"

local victory = false
local player
local collider
local allSolidTiles

------------------------------------

local player_dir = 1
local player_anim_time = 0
local player_anim_frame = 0
local tileQuads = {}
local tilesetImage
local tileSize = 64

function animation(dt, anim_time, each_frame_time, anim_frame, number_frame)
  anim_time = anim_time + dt -- incrementa o tempo usando dt
  if anim_time > each_frame_time then -- quando acumular mais de 0.1
    anim_frame = anim_frame + 1 -- avança para proximo frame
    if anim_frame > number_frame then
      anim_frame = 0
    end
    anim_time = 0 -- reinicializa a contagem do tempo
  end
end

function LoadTiles(filename, nx, ny)
  tilesetImage = love.graphics.newImage(filename)
  local count = 0
  for i = 0, nx, 1 do
    for j = 0, ny, 1 do
      tileQuads[count] = love.graphics.newQuad(j * tileSize ,i * tileSize, tileSize, 2*tileSize,tilesetImage:getWidth(),tilesetImage:getHeight())
      count = count + 1
    end
  end
end

------------------------------------

local tx, ty = 0, 0
local death = false
local escada = false
local dir = -1


function love.load()

     LoadTiles("animeplayer.png", 0, 7)
  
  
    --music:play()
  
    gravity = 600;
    love.window.setTitle("Future Falls : Ascension")
    love.window.setMode(1280,960, {resizable=false})

    ---Load no Level a partir do arquivo .tmx
    map = loader.load("L1v1.tmx")
    
    ---Inicia o Collider do HC, num raio de 100
    collider = HC(100, on_collide)
  

    --HC:addToGroup("floor",floor1,floor2)

    -- ESPAÇO DESTINADO PARA ADIÇÃO DE COLLIDERS [Para Retangulos use a função add_rect_collider]------

    floor1 = collider:addRectangle(0,832,5888,128)
    floor2 = collider:addRectangle(1344,768,192,64)
    floor3 = collider:addRectangle(1664,768,256,64)
    floor4 = collider:addRectangle(1728,704,128,64)
    floor5 = collider:addRectangle(2240,704,64,128)
    floor6 = collider:addRectangle(2304,768,64,64)
    
    floor16 = collider:addRectangle(3520,256,64,576)
    floor17 = collider:addRectangle(4480,512,64,320)
    floor18 = collider:addRectangle(4544,832,704,128)
    floor19 = collider:addRectangle(5248,704,64,256)
    floor20 = collider:addRectangle(5312,576,384,128)
    
    
    pit1 = collider:addRectangle(3584,884,896,12)
    -----------------------------------------------
    float1 = collider:addRectangle(1984,640,128,32)
    float2 = collider:addRectangle(2432,640,128,32)
    float3 = collider:addRectangle(2624,576,128,32)
    float4 = collider:addRectangle(3776,384,192,64) 
    float5 = collider:addRectangle(4160,512,128,64)
    -----------------------------------------------
    move1UP = collider:addRectangle(2752,256,192,20)
    move1 = collider:addRectangle(2752,576,192,20)
    move1DOWN = collider:addRectangle(2752,570,192,20)
    -----------------------------------------------
    tetoJ = collider:addRectangle(-10,576,512,32)

    --escada1 = collider:addRectangle(256,512,64,320)









    --------------------------------------------------------------------------------------------   


    setupPlayer(128,320)

    local px, py = playerB:center()
    jump = false
   
    
    background3 = love.graphics.newImage("bg.png")
  
  
    love.graphics.setBackgroundColor(31,75,89)
    --allSolidTiles = findSolidTiles(map)
end

function love.update(dt)




  collider:update(dt)
  if not victory then
  playerInput(dt)
  end
 
  updatePlayerRL(dt)
  updatePlayerUB(dt)
  --[[if playerU:collidesWith(escada1) then
    escada = true
  else
    escada = false
  end
  ]]--


  local tx,ty = tetoJ:center()
  --local ox, oy = objB:center()

  --update_teto(tx,0,dt)

 
  

  local ppx,ppyold = playerB:center()
  local upx,upy = playerU:center()
 
  local ppy = ppyold +2

  update_camera(ppx,death,dt)

  --Move a caixa pra cima caso o player esteja em uma Plaforma !!!

  update_tetoY(ppx)

 --Acerta a distancia entre playerU/PlayerB (os centros) caso ela fique maior que 124
  if ppy - upy > 124 then

    local distub = ppy - upy - 124

    playerU:move(0,distub)
    playerL:move(0,distub)

  end


  ----FUNÇOES COLISOES COM AS PLAFORMAS

  update_playerYFLOOR1(playerB,floor1)
  update_playerYFLOOR2(playerB,floor2)
  update_playerYFLOOR3(playerB,floor3)
  update_playerYFLOOR4(playerB,floor4)
  update_playerYFLOOR5(playerB,floor5)
  update_playerYFLOOR6(playerB,floor6)

  update_playerYFLOAT1(playerB,float1)
  update_playerYFLOAT2(playerB,float2)
  update_playerYFLOAT3(playerB,float3)
 
  --update_playerYMOVE1(playerB,move1,dt,move1UP,move1DOWN,dir)


  if death then
    
    movePlayerTo(128,320)
    moveTeto(0,220)
    update_camera(ppx,death,dt)
    death = false 
  
  end

-----Movimentação lateral, trava se playerL/playerR batem em algo

  if check_left_collide(playerL) then
    player_speedL = 0
   else
    player_speedL = 600
  end

  if check_right_collide(playerR) then
    player_speedR = 0
   else
    player_speedR = 600
  end

------Se playerU bate em algo, muda-se a gravidade
if check_up_collide(playerU) then    
    jump = false
end


if jump == true then
 gravity = -600
else if jump == false then
  gravity = 600
end
end

---Reset da fase para debugging
if love.keyboard.isDown("r") then
  death = true
  victory = false
end



function love.keypressed(key)
   if key == "up" and check_bottom_collide(playerB) and not escada then

    jump = true
  else 
    jump = false
  end

end
end
function love.draw()

    love.graphics.draw(background3,0,0,0)
    -- Apply the translation
    love.graphics.translate( math.floor(tx), math.floor(ty) )
    -- Set the draw range. Setting this will significantly increase drawing performance.
    map:autoDrawRange( math.floor(tx), math.floor(ty), 1, pad)
    -- Desenha o mapa carregado no love.load
    map:draw()

    ---Area para desenhar todas as Hitbox

    floor1:draw("line")
    floor2:draw("line")
    floor3:draw("line")
    floor4:draw("line")
    floor5:draw("line")
    floor6:draw("line")
    
    floor16:draw("line")
    floor17:draw("line")
    floor18:draw("line")
    floor19:draw("line")
    floor20:draw("line")  

    float1:draw("line")
    float2:draw("line")
    float3:draw("line")
    float4:draw("fill")
    float5:draw("line")

    move1UP:draw("fill")
    move1:draw("fill")
    move1DOWN:draw("fill")


    playerL:draw("line")
    playerR:draw("line")
    playerU:draw("line")
    playerB:draw("line")

    tetoJ:draw("line")
    --escada1:draw("line")
    
    

    local px,py = playerB:center()
    love.graphics.print(px,px,10)
    love.graphics.print(py+2,px,20)
    love.graphics.print(tx,px,30)
    --love.graphics.draw(playerImage,px-40,py-140,0,1.3,1.5)
    
    --Desenhando o personagem principal
    if player_dir == 1 then
      love.graphics.draw(tilesetImage,tileQuads[player_anim_frame], px,py-60,0,player_dir,1, 32, 64)
    elseif player_dir == -1 then
      love.graphics.draw(tilesetImage,tileQuads[player_anim_frame], px,py-60,0,player_dir,1, 32, 64)
    end
    
    --local ox, oy = objB:center()
    
    --desenhando o logo da vitória, aquela vaca
    --[[ if not victory then
    love.graphics.draw(obj1,ox-16,oy-16)
    end
    if victory then
      love.graphics.draw(victoryImg,px-900,py-900)
    end
    ]]--
    
    
end
function check_bottom_collide(playerB)
    local player_shape = playerB
    if playerB:collidesWith(floor1) or playerB:collidesWith(floor2) or playerB:collidesWith(floor3) or playerB:collidesWith(floor4) or playerB:collidesWith(float1) or playerB:collidesWith(floor5) or playerB:collidesWith(floor6)
    or playerB:collidesWith(float2) or playerB:collidesWith(float3)
   then
        return true
    else
        return false
    end
end

function check_up_collide(playerU)
   local player_shape = playerU
   if playerU:collidesWith(tetoJ) then
       return true
    else
      return false
    end
end

function update_teto(tx,y,dt)
    if love.keyboard.isDown("left") and player_speedL > 0 then
    tetoJ:move(-player_speedL*dt,0)
end
    if love.keyboard.isDown("right") and player_speedR > 0 then
    tetoJ:move(player_speedR*dt,0)   
    end 
end

function moveTeto(x,y)
    tetoJ:moveTo(x,y)
end

function check_left_collide(playerL)
    local player_shape = playerL
    if playerL:collidesWith(floor1) or playerL:collidesWith(floor2) or playerL:collidesWith(floor3) or playerL:collidesWith(floor4) or playerL:collidesWith(floor5) or playerL:collidesWith(floor6) then
    return true
else
    return false
end
end

function check_right_collide(playerR)
    local player_shape = playerR
    if playerR:collidesWith(floor1) or playerR:collidesWith(floor2) or playerR:collidesWith(floor3) or playerR:collidesWith(floor4) or playerR:collidesWith(floor5) or playerR:collidesWith(floor6) then
    return true
else
    return false
end
end

function update_tetoY(tx,y)
    local tx = tx 
    if tx > 960 then
        tetoJ:move(0,y)
    end
end

function playerInput(dt)
  local ppx,ppy = playerB:center()
   if love.keyboard.isDown("left") and not check_left_collide(playerL) and ppx > 0 then
      player_dir = -1
      player_anim_time = player_anim_time + dt -- incrementa o tempo usando dt
      if player_anim_time > 0.1 then -- quando acumular mais de 0.1
        player_anim_frame = player_anim_frame + 1 -- avança para proximo frame
        if player_anim_frame > 7 then
          player_anim_frame = 0
        end
        player_anim_time = 0 -- reinicializa a contagem do tempo
      end
        playerR:move(-player_speedL*dt,0)
        playerL:move(-player_speedL*dt,0)
        playerU:move(-player_speedL*dt,0)
        playerB:move(-player_speedL*dt,0)
   end
   if love.keyboard.isDown("right") and not check_right_collide(playerR) then
      --animation(dt, player_anim_time, 0.1, player_anim_frame, 7)
      player_dir = 1
      player_anim_time = player_anim_time + dt -- incrementa o tempo usando dt
      if player_anim_time > 0.1 then -- quando acumular mais de 0.1
        player_anim_frame = player_anim_frame + 1 -- avança para proximo frame
        if player_anim_frame > 7 then
          player_anim_frame = 0
        end
        player_anim_time = 0 -- reinicializa a contagem do tempo
      end
      playerR:move(player_speedR*dt,0)
      playerL:move(player_speedR*dt,0)
      playerU:move(player_speedR*dt,0)
      playerB:move(player_speedR*dt,0)
   end
end
function love.keyreleased(key)
  if(key == "right" or key == "left") then
    player_anim_frame = 0 -- pedir para os artistas uma animação dela parada
  end
end
function update_camera(ppx,death,dt)

    local death = death
    --if love.keyboard.isDown("up") then ty = ty + 250*dt end
    --if love.keyboard.isDown("down") then ty = ty - 250*dt end
    if love.keyboard.isDown("right") and not check_right_collide(playerR) then
       tx = tx - 550*dt
    end
    if love.keyboard.isDown("left") and (ppx < 1000 or ppx > 1000) and not check_left_collide(playerL) then 
      tx = tx + 550*dt 
    end
  if tx < -6000 then
    tx = -6000
   end 
  if tx > 0 then
    tx = 0
    end
  
    if death == true then
      tx = 0
    end   
end

function update_tetoY(playerx)
  local playerx = playerx
  ---CONTA PARA DETERMINAR A ALTURA DO TETO : Posição do Chão - 128(Player Height) - Jump Height - 32

  if playerx > 0  and playerB:collidesWith(floor1) then
    moveTeto(playerx,608)
  end
  if playerx > 1344 and playerB:collidesWith(floor2) then 
    moveTeto(playerx,544)
  end
  if playerx > 1664 and playerx < 1920 and playerB:collidesWith(floor3) then
    moveTeto(playerx,544)
  end
  if playerx > 1728 and playerx < 1856 and playerB:collidesWith(floor4) then
    moveTeto(playerx,480)
  end
  if playerx > 1984 and playerx < 2112 and playerB:collidesWith(float1) then
    moveTeto(playerx,416)
  end
  if playerx > 2240 and playerx < 2304 and playerB:collidesWith(floor5) then
    moveTeto(playerx,480)
  end
  if playerx > 2304 and playerx < 2368 and playerB:collidesWith(floor6) then
    moveTeto(playerx,544)
  end
  if playerx > 2432 and playerx < 2560 and playerB:collidesWith(float2) then
    moveTeto(playerx,416)
  end
  if playerx > 2624 and playerx < 2752 and playerB:collidesWith(float3) then
    moveTeto(playerx,352)
  end
end