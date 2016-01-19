function update_playerYSTART(playerB,start)

  --Usando a função center e somando com a altura de cada objeto e generalizando o 
  --valor abs para a altura de cada hitbox essa função poderia ser automatica 


  local playerB = playerB
  local start = start
  

  local ppx,ppyold = playerB:center()
 
  local ppy = ppyold +2

  if playerB:collidesWith(start) then 
    gravity = 0
    local abs = ppy-448
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

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
    local abs = ppy-256
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

function update_playerYFLOAT6(playerB,float6)
  local playerB = playerB
  local float6 = float6

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float6) then
    gravity = 0
    local abs = ppy-512
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT7(playerB,float7)
  local playerB = playerB
  local float7 = float7

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float7) then
    gravity = 0
    local abs = ppy-448
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT8(playerB,float8)
  local playerB = playerB
  local float8 = float8

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float8) then
    gravity = 0
    local abs = ppy-384
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT9(playerB,float9)
  local playerB = playerB
  local float9 = float9

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float9) then
    gravity = 0
    local abs = ppy-320
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT10(playerB,float10)
  local playerB = playerB
  local float10 = float10

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float10) then
    gravity = 0
    local abs = ppy-256
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR10(playerB,floor10)
  local playerB = playerB
  local floor10 = floor10

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor10) then
    gravity = 0
    local abs = ppy-384
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR11(playerB,floor11)
  local playerB = playerB
  local floor11 = floor11

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor11) then
    gravity = 0
    local abs = ppy-640
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR12(playerB,floor12)
  local playerB = playerB
  local floor12 = floor12

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor12) then
    gravity = 0
    local abs = ppy-512
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR13(playerB,floor13)
  local playerB = playerB
  local floor13 = floor13

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor13) then
    gravity = 0
    local abs = ppy-384
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR9(playerB,floor9)
  local playerB = playerB
  local floor9 = floor9

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor9) then
    gravity = 0
    local abs = ppy-768
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR16(playerB,floor16)
  local playerB = playerB
  local floor16 = floor16

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor16) then
    gravity = 0
    local abs = ppy-256
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR17(playerB,floor17)
  local playerB = playerB
  local floor17 = floor17

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor17) then
    gravity = 0
    local abs = ppy-512
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR18(playerB,floor18)
  local playerB = playerB
  local floor18 = floor18

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor18) then
    gravity = 0
    local abs = ppy-832
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR19(playerB,floor19)
  local playerB = playerB
  local floor19 = floor19

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor19) then
    gravity = 0
    local abs = ppy-704
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR20(playerB,floor20)
  local playerB = playerB
  local floor20 = floor20

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor20) then
    gravity = 0
    local abs = ppy-576
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR21(playerB,floor21)
  local playerB = playerB
  local floor21 = floor21

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor21) then
    gravity = 0
    local abs = ppy-448
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR22(playerB,floor22)
  local playerB = playerB
  local floor22 = floor22

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor22) then
    gravity = 0
    local abs = ppy-320
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR23(playerB,floor23)
  local playerB = playerB
  local floor23 = floor23

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor23) then
    gravity = 0
    local abs = ppy-256
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR24(playerB,floor24)
  local playerB = playerB
  local floor24 = floor24

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor24) then
    gravity = 0
    local abs = ppy-128
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR25(playerB,floor25)
  local playerB = playerB
  local floor25 = floor25

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor25) then
    gravity = 0
    local abs = ppy-192
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT4(playerB,float4)
  local playerB = playerB
  local float4 = float4

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float4) then
    gravity = 0
    local abs = ppy-384
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT5(playerB,float5)
  local playerB = playerB
  local float5 = float5

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float5) then
    gravity = 0
    local abs = ppy-512
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR26(playerB,floor26)
  local playerB = playerB
  local floor26 = floor26

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor26) then
    gravity = 0
    local abs = ppy-320
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR27(playerB,floor27)
  local playerB = playerB
  local floor27 = floor27

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor27) then
    gravity = 0
    local abs = ppy-512
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR28(playerB,floor28)
  local playerB = playerB
  local floor28 = floor28

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor28) then
    gravity = 0
    local abs = ppy-384
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR29(playerB,floor29)
  local playerB = playerB
  local floor29 = floor29

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor29) then
    gravity = 0
    local abs = ppy-448
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR30(playerB,floor30)
  local playerB = playerB
  local floor30 = floor30

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor30) then
    gravity = 0
    local abs = ppy-512
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR31(playerB,floor31)
  local playerB = playerB
  local floor31 = floor31

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor31) then
    gravity = 0
    local abs = ppy-576
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end


function update_playerYFLOOR32(playerB,floor32)
  local playerB = playerB
  local floor32 = floor32

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor32) then
    gravity = 0
    local abs = ppy-640
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end


function update_playerYFLOOR33(playerB,floor33)
  local playerB = playerB
  local floor33 = floor33

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor33) then
    gravity = 0
    local abs = ppy-704
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOOR34(playerB,floor34)
  local playerB = playerB
  local floor34 = floor34

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(floor34) then
    gravity = 0
    local abs = ppy-768
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT11(playerB,float11)
  local playerB = playerB
  local float11 = float11

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float11) then
    gravity = 0
    local abs = ppy-256
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT12(playerB,float12)
  local playerB = playerB
  local float12 = float12

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float12) then
    gravity = 0
    local abs = ppy-320
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT13(playerB,float13)
  local playerB = playerB
  local float13 = float13

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float13) then
    gravity = 0
    local abs = ppy-256
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFLOAT14(playerB,float14)
  local playerB = playerB
  local float14 = float14

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(float14) then
    gravity = 0
    local abs = ppy-256
    if abs > 0 then
      movePlayerY(-abs)
    end
  else
    gravity = 600
  end
end

function update_playerYFIM(playerB,elevator)
  local playerB = playerB
  local elevator = elevator

  local ppx,ppyold = playerB:center() 
  local ppy = ppyold + 2

  if playerB:collidesWith(elevator) then
    gravity = 0
    local abs = ppy-768
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