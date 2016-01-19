local loader = require "AdvTiledLoader/Loader"
-- set the path to the Tiled map files
loader.path = "maps/"
local HC = require "HardonCollider"
local shapes = require "hardoncollider.shapes"
local victory = false
local player
local collider
local allSolidTiles
local tx, ty = 0, 0
local death = false
local escada = false
local dir = -1
local obj1 = false
local tiro = false
local HP = 2
local HPinimigo = 1

function nick_load()
    love.window.setTitle("Future Falls : Ascension")
    love.window.setMode(1280,960, {resizable=false})

    ---Load no Level a partir do arquivo .tmx
    map = loader.load("L1v1.tmx")
    
    ---Inicia o Collider do HC, num raio de 100
    collider = HC(100, on_collide)
  

    --HC:addToGroup("floor",floor1,floor2)

    -- ESPAÇO DESTINADO PARA ADIÇÃO DE COLLIDERS [Para Retangulos use a função add_rect_collider]------

    start = collider:addRectangle(0,448,256,64)

    floor1 = collider:addRectangle(0,832,2944,128)
    floor2 = collider:addRectangle(1344,768,192,64)
    floor3 = collider:addRectangle(1664,768,256,64)
    floor4 = collider:addRectangle(1728,704,128,64)
    floor5 = collider:addRectangle(2240,704,64,128)
    floor6 = collider:addRectangle(2304,768,64,64)


    floor7 = collider:addRectangle(2944,256,64,576)
    floor8 = collider:addRectangle(0,0,1,1)  --<<OUT
    floor10 = collider:addRectangle(3008,384,128,576)
    floor9 = collider:addRectangle(3200,768,128,64)
    floor11 = collider:addRectangle(3136,640,64,320)
    floor12 = collider:addRectangle(3328,512,64,576)
    floor13 = collider:addRectangle(3392,384,128,576)
    floor14 = collider:addRectangle(0,0,1,1) --<<OUT
    floor15 = collider:addRectangle(0,0,1,1) --<<OUT

    floor16 = collider:addRectangle(3520,256,64,576)
    floor17 = collider:addRectangle(4480,512,64,320)
    floor18 = collider:addRectangle(4544,832,704,128)
    floor19 = collider:addRectangle(5248,704,64,256)
    floor20 = collider:addRectangle(5312,576,384,128)
    floor21 = collider:addRectangle(5696,448,64,128)
    floor22 = collider:addRectangle(5504,320,64,64)
    floor23 = collider:addRectangle(5440,256,64,128)
    floor24 = collider:addRectangle(5696,128,640,64)
    floor25 = collider:addRectangle(6336,192,128,192)

    floor26 = collider:addRectangle(6464,320,128,640)
    floor27 = collider:addRectangle(7808,512,192,448)
    floor28 = collider:addRectangle(8000,384,384,128)
    floor29 = collider:addRectangle(8384,448,64,64)
    floor30 = collider:addRectangle(8448,512,64,64)
    floor31 = collider:addRectangle(8512,576,64,64)
    floor32 = collider:addRectangle(8576,640,64,64)
    floor33 = collider:addRectangle(8640,704,64,64)
    floor34 = collider:addRectangle(8704,768,64,64)
    floor34 = collider:addRectangle(8704,768,64,64)

    
    
    pit1 = collider:addRectangle(3584,948,896,12)
    pit2 = collider:addRectangle(6592,884,1216,12)
    -----------------------------------------------
    float1 = collider:addRectangle(1984,640,128,32)
    float2 = collider:addRectangle(2432,640,128,32)
    float3 = collider:addRectangle(2624,576,128,32)
    float4 = collider:addRectangle(3776,384,192,64) 
    float5 = collider:addRectangle(4160,512,128,64)

    float6 = collider:addRectangle(2816,512,128,32)
    float7 = collider:addRectangle(2624,448,128,32)
    float8 = collider:addRectangle(2816,384,128,32)
    float9 = collider:addRectangle(2624,320,128,32)
    float10 = collider:addRectangle(2816,256,128,32)
    -----------------------------------------------
    move1UP = collider:addRectangle(2752,256,192,20)
    move1DOWN = collider:addRectangle(2752,570,192,20)
    move1 = collider:addRectangle(2752,576,192,20)
    
    -----------------------------------------------
    tetoJ = collider:addRectangle(-10,576,512,32)
    -----------------------------------------------
    elevator = collider:addRectangle(8768,768,192,64)
    --------------------------------------------------
    obj1Hit = collider:addRectangle(3264,704,64,64)
    --------------------------------------------------
    bullet = collider:addRectangle (256,182,32,16)
    ------------------------------------------------
    Enemy1 = collider:addRectangle (5120,768,64,64)
    Enemy1S = collider:addRectangle (4544,768,576,32)
    --------------------------------------------------
    Enemy2 = collider:addRectangle (5824,64,64,64)
    Enemy2S = collider:addRectangle (5440,64,384,32)

    --escada1 = collider:addRectangle(256,512,64,320)









    --------------------------------------------------------------------------------------------   


    setupPlayer(128,246)

    local px, py = playerB:center()

    jump = false
   
    
    background3 = love.graphics.newImage("bg.png")
    obj1Img = love.graphics.newImage("obj1.png")
    bulletImg = love.graphics.newImage("bullet.png")
    inimigo1 = love.graphics.newImage("inimigo1.png") 

    love.graphics.setBackgroundColor(31,75,89)
    --allSolidTiles = findSolidTiles(map)
end
function nick_update(dt)
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

    if playerL:collidesWith(obj1Hit) then
      obj1 = true
    end
 
  

    local ppx,ppyold = playerB:center()
    local upx,upy = playerU:center()
 
    local ppy = ppyold +2

    update_bullet(bullet,ppx,ppy,tiro,dt)
    collision_bullet(bullet,playerB)
    update_camera(ppx,death,dt)

    --Move a caixa pra cima caso o player esteja em uma   Plaforma !!!

    update_tetoY(ppx)

    --Acerta a distancia entre playerU/PlayerB (os centros) caso ela fique maior que 124
    if ppy - upy > 124 then

      local distub = ppy - upy - 124

      playerU:move(0,distub)
      playerL:move(0,distub)

    end


    ----FUNÇOES COLISOES COM AS PLAFORMAS

    update_playerYSTART(playerB,start)


    update_playerYFLOOR1(playerB,floor1)
    update_playerYFLOOR2(playerB,floor2)
    update_playerYFLOOR3(playerB,floor3)
    update_playerYFLOOR4(playerB,floor4)
    update_playerYFLOOR5(playerB,floor5)
    update_playerYFLOOR6(playerB,floor6)

    update_playerYFLOOR7(playerB,floor7)
    update_playerYFLOOR10(playerB,floor10)
    update_playerYFLOOR9(playerB,floor9)
    update_playerYFLOOR11(playerB,floor11)
    update_playerYFLOOR12(playerB,floor12)
    update_playerYFLOOR13(playerB,floor13)

    update_playerYFLOOR16(playerB,floor16)
    update_playerYFLOOR17(playerB,floor17)
    update_playerYFLOOR18(playerB,floor18)
    update_playerYFLOOR19(playerB,floor19)
    update_playerYFLOOR20(playerB,floor20)
    update_playerYFLOOR21(playerB,floor21)
    update_playerYFLOOR22(playerB,floor22)
    update_playerYFLOOR23(playerB,floor23)
    update_playerYFLOOR24(playerB,floor24)
    update_playerYFLOOR25(playerB,floor25)


    update_playerYFLOAT1(playerB,float1)
    update_playerYFLOAT2(playerB,float2)
    update_playerYFLOAT3(playerB,float3)
    update_playerYFLOAT4(playerB,float4)
    update_playerYFLOAT5(playerB,float5)

    update_playerYFLOAT6(playerB,float6)
    update_playerYFLOAT7(playerB,float7)
    update_playerYFLOAT8(playerB,float8)
    update_playerYFLOAT9(playerB,float9)
    update_playerYFLOAT10(playerB,float10)
  --update_playerYMOVE1(playerB,move1,dt,move1UP,move1DOWN,dir)

    if playerB:collidesWith(pit1) then
      death = true
    end
    
    if obj1 then
      legs = true
    end
    
    if death then
      if not obj1 then
        movePlayerTo(128,320)
        moveTeto(0,220)
        update_camera(ppx,death,dt)
        HP = HP + 2
        obj1 = false
        tiro = false
        death = false     
      end 
      if obj1 then 
        movePlayerTo(3264,704)
        update_camera(ppx,death,dt)
        tiro = false
        death = false 
      end
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
    if love.keyboard.isDown("z") then
      tiro = true
    end

    if HP == 0 then
      death = true
    end

    if bullet:collidesWith(Enemy1) and tiro then
      HPinimigo = HPinimigo -1
    end

    if HPinimigo > 0 and HP > 0 then
      if playerR:collidesWith(Enemy1) then
      death = true
    end
  end

  if playerR:collidesWith(Enemy1S) then
    Enemy1:move(-40*dt,0)
  end
end
function nick_draw()
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
    floor7:draw("line")
    --floor8:draw("line")
    floor9:draw("line")
    floor10:draw("line")
    floor11:draw("line")
    floor12:draw("fill")
    floor13:draw("line")
    --floor14:draw("line")
    --floor15:draw("line")
    
    floor16:draw("line")
    floor17:draw("line")
    floor18:draw("line")
    floor19:draw("line")
    floor20:draw("line")  

    float1:draw("line")
    float2:draw("line")
    float3:draw("line")
    float4:draw("line")
    float5:draw("line")

    float6:draw("line")
    float7:draw("line")
    float8:draw("line")
    float9:draw("line")
    float10:draw("line")
    

    --move1UP:draw("fill")
    --move1:draw("fill")
    --move1DOWN:draw("fill")


    playerL:draw("line")
    playerR:draw("line")
    playerU:draw("line")
    playerB:draw("line")

    tetoJ:draw("line")
    --escada1:draw("line")

    obj1Hit:draw("line")

    pit1:draw("line")
    Enemy1:draw("line")
    Enemy1S:draw("line")

    Enemy2:draw("line")
    Enemy2S:draw("line")

    --bullet:draw("line")
    
    

    local px,py = playerB:center()
    love.graphics.print(px,px,10)
    love.graphics.print(py+2,px,20)
    love.graphics.print(tx,px,30)
    love.graphics.print(tostring(obj1),px,40)
    love.graphics.print(tostring(tiro),px,50)
    local obx,oby = obj1Hit:center()
   love.graphics.draw(obj1Img,obx-32,oby-32)

   local bx, by = bullet:center()
   if tiro then
   love.graphics.draw(bulletImg,bx+16,by-8,1.413716694115)
   end

   local i1x,i1y = Enemy1:center()
   if HPinimigo > 0 then
    love.graphics.draw(inimigo1,i1x-32,i1y-32)
  end
end
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
function check_bottom_collide(playerB)
    local player_shape = playerB
    if playerB:collidesWith(floor1) or playerB:collidesWith(floor2) or playerB:collidesWith(floor3) or playerB:collidesWith(floor4) or playerB:collidesWith(float1) or playerB:collidesWith(floor5) or playerB:collidesWith(floor6)
    or playerB:collidesWith(float2) or playerB:collidesWith(float3) or playerB:collidesWith(floor7) or playerB:collidesWith(float6) or playerB:collidesWith(float7) or playerB:collidesWith(float8) or playerB:collidesWith(float9)
    or playerB:collidesWith(float10) or playerB:collidesWith(floor9)or playerB:collidesWith(floor10) or playerB:collidesWith(floor11) or playerB:collidesWith(floor12) or playerB:collidesWith(floor13) or playerB:collidesWith(floor14)
    or playerB:collidesWith(floor16) or playerB:collidesWith(floor17)or playerB:collidesWith(floor18) or playerB:collidesWith(floor19) or playerB:collidesWith(floor20) or playerB:collidesWith(floor21) or playerB:collidesWith(floor22)
    or playerB:collidesWith(floor23) or playerB:collidesWith(floor24)or playerB:collidesWith(floor24) or playerB:collidesWith(float4) or playerB:collidesWith(float5)
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
    if playerL:collidesWith(floor1) or playerL:collidesWith(floor2) or playerL:collidesWith(floor3) or playerL:collidesWith(floor4) or playerL:collidesWith(floor5) or playerL:collidesWith(floor6) or playerL:collidesWith(floor7) 
    or playerL:collidesWith(floor8) or playerL:collidesWith(floor9) or playerL:collidesWith(floor10) or playerL:collidesWith(floor11) or playerL:collidesWith(floor12) or playerL:collidesWith(floor13) or playerL:collidesWith(floor14) 
    or playerL:collidesWith(floor15) or playerL:collidesWith(floor16) or playerL:collidesWith(floor17) or playerL:collidesWith(floor18) or playerL:collidesWith(floor19) or playerL:collidesWith(floor20) or playerL:collidesWith(floor21)
    or playerL:collidesWith(floor22) or playerL:collidesWith(floor23) or playerL:collidesWith(floor24) or playerL:collidesWith(floor25) or playerL:collidesWith(floor26) or playerL:collidesWith(floor27) or playerL:collidesWith(floor28) 
    or playerL:collidesWith(floor29) or playerL:collidesWith(floor30) or playerL:collidesWith(floor31) or playerL:collidesWith(floor32) or playerL:collidesWith(floor32) or playerL:collidesWith(floor33) or playerL:collidesWith(floor34)  

      then
    return true
else
    return false
end
end

function check_right_collide(playerR)
    local player_shape = playerR
    if playerR:collidesWith(floor1) or playerR:collidesWith(floor2) or playerR:collidesWith(floor3) or playerR:collidesWith(floor4) or playerR:collidesWith(floor5) or playerR:collidesWith(floor6) or playerR:collidesWith(floor7) 
    or playerR:collidesWith(floor8) or playerR:collidesWith(floor9) or playerR:collidesWith(floor10) or playerR:collidesWith(floor11) or playerR:collidesWith(floor12) or playerR:collidesWith(floor13) or playerR:collidesWith(floor14) 
    or playerR:collidesWith(floor15) or playerR:collidesWith(floor16) or playerR:collidesWith(floor17) or playerR:collidesWith(floor18) or playerR:collidesWith(floor19) or playerR:collidesWith(floor20) or playerR:collidesWith(floor21)
    or playerR:collidesWith(floor22) or playerR:collidesWith(floor23) or playerR:collidesWith(floor24) or playerR:collidesWith(floor25) or playerR:collidesWith(floor26) or playerR:collidesWith(floor27) or playerR:collidesWith(floor28) 
    or playerR:collidesWith(floor29) or playerR:collidesWith(floor30) or playerR:collidesWith(floor31) or playerR:collidesWith(floor32) or playerR:collidesWith(floor32) or playerR:collidesWith(floor33) or playerR:collidesWith(floor34)
    
    then
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
        playerR:move(-player_speedL*dt,0)
        playerL:move(-player_speedL*dt,0)
        playerU:move(-player_speedL*dt,0)
        playerB:move(-player_speedL*dt,0)
   end
   if love.keyboard.isDown("right") and not check_right_collide(playerR) then
      playerR:move(player_speedR*dt,0)
      playerL:move(player_speedR*dt,0)
      playerU:move(player_speedR*dt,0)
      playerB:move(player_speedR*dt,0)
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
      if not obj1 then
      tx = 0
    end
      if obj1 then
      tx = -2800
    end   
    end
end

function collision_bullet(bullet,playerB)
  local bullet = bullet
  local playerB = playerB
  if bullet:collidesWith(floor2) or bullet:collidesWith(floor1) or bullet:collidesWith(floor2) or bullet:collidesWith(floor3) or bullet:collidesWith(floor4) or bullet:collidesWith(floor5) or bullet:collidesWith(floor6) or bullet:collidesWith(floor7) 
    or bullet:collidesWith(floor8) or bullet:collidesWith(floor9) or bullet:collidesWith(floor10) or bullet:collidesWith(floor11) or bullet:collidesWith(floor12) or bullet:collidesWith(floor13) or bullet:collidesWith(floor14) 
    or bullet:collidesWith(floor15) or bullet:collidesWith(floor16) or bullet:collidesWith(floor17) or bullet:collidesWith(floor18) or bullet:collidesWith(floor19) or bullet:collidesWith(floor20) or bullet:collidesWith(floor21)
    or bullet:collidesWith(floor22) or bullet:collidesWith(floor23) or bullet:collidesWith(floor24) or bullet:collidesWith(floor25) or bullet:collidesWith(floor26) or bullet:collidesWith(floor27) or bullet:collidesWith(floor28) 
    or bullet:collidesWith(floor29) or bullet:collidesWith(floor30) or bullet:collidesWith(floor31) or bullet:collidesWith(floor32) or bullet:collidesWith(floor32) or bullet:collidesWith(floor33) or bullet:collidesWith(floor34)  
 then
    tiro = false
  end
 local bx,by = bullet:center()
 local ppx,ppy = playerB:center()
 if bx-ppx > 1280 then
  tiro = false
 end

end

function update_tetoY(playerx)
  local playerx = playerx
  ---CONTA PARA DETERMINAR A ALTURA DO TETO : Posição do Chão - 128(Player Height) - Jump Height - 32
  local pulo64 = -224
  local pulo128 = -288

  if playerx > 0  and playerB:collidesWith(floor1) then
    moveTeto(playerx,832+pulo64)
  end
  if playerx > 1344 and playerB:collidesWith(floor2) then 
    moveTeto(playerx,768+pulo64)
  end
  if playerx > 1664 and playerx < 1920 and playerB:collidesWith(floor3) then
    moveTeto(playerx,768+pulo64)
  end
  if playerx > 1728 and playerx < 1856 and playerB:collidesWith(floor4) then
    moveTeto(playerx,704+pulo64)
  end
  if playerx > 1984 and playerx < 2112 and playerB:collidesWith(float1) then
    moveTeto(playerx,640+pulo64)
  end
  if playerx > 2240 and playerx < 2304 and playerB:collidesWith(floor5) then
    moveTeto(playerx,704+pulo64)
  end
  if playerx > 2304 and playerx < 2368 and playerB:collidesWith(floor6) then
    moveTeto(playerx,768+pulo64)
  end
  if playerx > 2432 and playerx < 2560 and playerB:collidesWith(float2) then
    moveTeto(playerx,640+pulo64)
  end
  if playerx > 2624 and playerx < 2752 and playerB:collidesWith(float3) then
    moveTeto(playerx,576+pulo64)
  end
  if playerx > 2816 and playerx < 2944 and playerB:collidesWith(float6) then
    moveTeto(playerx,512+pulo64)
  end
  if playerx > 2624 and playerx < 2752 and playerB:collidesWith(float7) then
    moveTeto(playerx,448+pulo64)
  end
  if playerx > 2816 and playerx < 2944 and playerB:collidesWith(float8) then
    moveTeto(playerx,384+pulo64)
  end
  if playerx > 2624 and playerx < 2752 and playerB:collidesWith(float9) then
    moveTeto(playerx,320+pulo64)
  end
  if playerx > 2816 and playerx < 2944 and playerB:collidesWith(float10) then
    moveTeto(playerx,256+pulo64)
  end
  if playerx > 2944 and playerB:collidesWith(floor7) then
    moveTeto(playerx,256+pulo64)
  end
  if playerx > 3008 and playerB:collidesWith(floor10) then
    moveTeto(playerx,384+pulo64)
  end
  if playerx > 3136 and playerB:collidesWith(floor11) and not obj1 then
    moveTeto(playerx,640+pulo64)
  end
  if playerx > 3136 and playerB:collidesWith(floor11) and obj1 then
    moveTeto(playerx,640+pulo128)
  end
  if playerx > 3200 and playerB:collidesWith(floor9) and not obj1 then
    moveTeto(playerx,768+pulo64)
  end
  if playerx > 3200 and playerB:collidesWith(floor9) and obj1 then
    moveTeto(playerx,768+pulo128)
  end
  if playerx > 3328 and playerB:collidesWith(floor12) and not obj1 then
    moveTeto(playerx,512+pulo64)
  end
  if playerx > 3328 and playerB:collidesWith(floor12) and obj1 then
    moveTeto(playerx,512+pulo128)
  end
  if playerx > 3392 and playerB:collidesWith(floor13) then
    moveTeto(playerx,384+pulo128)
  end
  if playerx > 3520 and playerB:collidesWith(floor16) then
    moveTeto(playerx,256+pulo128)
  end
  if playerx > 3520 and playerB:collidesWith(float4) then
    moveTeto(playerx,384+pulo128)
  end
  if playerx > 4160 and playerB:collidesWith(float5) then
    moveTeto(playerx,512+pulo128)
  end
  if playerx > 4480 and playerB:collidesWith(floor17) then
    moveTeto(playerx,512+pulo128)
  end
  if playerx > 4544 and playerB:collidesWith(floor18) then
    moveTeto(playerx,832+pulo128)
  end
  if playerx > 5248 and playerB:collidesWith(floor19) then
    moveTeto(playerx,704+pulo128)
  end
  if playerx > 5312 and playerB:collidesWith(floor20) then
    moveTeto(playerx,576+pulo128)
  end
  if playerx > 5696 and playerB:collidesWith(floor21) then
    moveTeto(playerx,448+pulo128)
  end
  if playerx > 5504 and playerB:collidesWith(floor22) then
    moveTeto(playerx,320+pulo128)
  end
  if playerx > 5440 and playerB:collidesWith(floor23) then
    moveTeto(playerx,256+pulo128)
  end
  if playerx > 5696 and playerB:collidesWith(floor24) then
    moveTeto(playerx,128+pulo128)
  end
 if playerx > 6336 and playerB:collidesWith(floor25) then
    moveTeto(playerx,192+pulo128)
  end





  --[[

    floor26 = collider:addRectangle(6464,320,128,640)
    floor27 = collider:addRectangle(7808,512,192,448)
    floor28 = collider:addRectangle(8000,384,384,128)
    floor29 = collider:addRectangle(8384,448,64,64)
    floor30 = collider:addRectangle(8448,512,64,64)
    floor31 = collider:addRectangle(8512,576,64,64)
    floor32 = collider:addRectangle(8576,640,64,64)
    floor33 = collider:addRectangle(8640,704,64,64)
    floor34 = collider:addRectangle(8704,768,64,64)
    floor34 = collider:addRectangle(8704,768,64,64) ]]--

end