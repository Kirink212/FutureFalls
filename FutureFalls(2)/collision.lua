function update_playerYFLOOR1(playerB,floor1)

  --Usando a função center e somando com a altura de cada objeto e generalizando o 
  --valor abs para a altura de cada hitbox essa função poderia ser automatica 


  local playerB = playerB
  local floor1 = floor1
  

  local ppx,ppyold = playerB:center()
 
  local ppy = ppyold +2

  if playerB:collidesWith(floor1) then 
    gravity = 0
    local abs = ppy-832
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR2(playerB,floor2)

  --Usando a função center e somando com a altura de cada objeto e generalizando o 
  --valor abs para a altura de cada hitbox essa função poderia ser automatica 


  local playerB = playerB
  local floor2 = floor2
  

  local ppx,ppyold = playerB:center()
 
  local ppy = ppyold +2

  if playerB:collidesWith(floor2) then 
    gravity = 0
    local abs = ppy-768
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end


function update_playerYBOX(playerB,box)
  local playerB = playerB
  local box = box

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold +2

  if playerB:collidesWith(box) then
    gravity = 0
    local abs = ppy-602
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR3(playerB,floor3)
  local playerB = playerB
  local floor3 = floor3

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold +2

  if playerB:collidesWith(floor3) then
    gravity = 0
    local abs = ppy-768
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR4(playerB,floor4)
  local playerB = playerB
  local floor4 = floor4
 

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold +2

  if playerB:collidesWith(floor4) then
    gravity = 0
    local abs = ppy-704
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR5(playerB,floor5)
  local playerB = playerB
  local floor5 = floor5
 

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold +2

  if playerB:collidesWith(floor5) then
    gravity = 0
    local abs = ppy-704
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR6(playerB,floor6)
  local playerB = playerB
  local floor6 = floor6

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor6) then
    gravity = 0
    local abs = ppy-768
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end


function update_playerYFLOOR7(playerB,floor7)
  local playerB = playerB
  local floor7 = floor7

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor7) then
    gravity = 0
    local abs = ppy-128
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end



function update_playerYFLOAT1(playerB,float1)
  local playerB = playerB
  local float1 = float1

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float1) then
    gravity = 0
    local abs = ppy-640
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT2(playerB,float2)
  local playerB = playerB
  local float2 = float2

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float2) then
    gravity = 0
    local abs = ppy-640
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT3(playerB,float3)
  local playerB = playerB
  local float3 = float3

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float3) then
    gravity = 0
    local abs = ppy-576
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR8(playerB,floor8)
  local playerB = playerB
  local floor8 = floor8

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor8) then
    gravity = 0
    local abs = ppy-832
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

--[[function update_playerYMOVE1(playerB,move1,dt,move1UP,move1DOWN,dir)
  local playerB = playerB
  local move1 = move1
  local move1UP = move1UP
  local move1DOWN = move1DOWN

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  local m1x,m1y = move1:center()
  local rm1y = m1y-10

  local dirUp =   

  
  
  
  if move1:collidesWith(move1UP) then
    move1:move(0,dirDown*35*dt)
  end
  if move1:collidesWith(move1DOWN) then
    move1:move(0,dirUp*35*dt)
  end

  



  if playerB:collidesWith(move1) then
    gravity = 0
    local abs = ppy-576
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end
]]--