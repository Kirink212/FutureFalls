--[[ Este arquivo será utilizado somente para coisas que tiverem relação com o game em si, ou seja,
todas as funções gerais do jogo, todas as funções relacionadas com gamestate "playing" e talz estarão aqui !!]]--
local mapa={}
local tileQuadsMapa = {}
local tileSize = 64

function LoadMap(filename) 
  local file = io.open(filename) 
  local i = 0 
  for line in file:lines() do 
    mapa[i] = {} 
    for j=0, #line, 1 do 
      mapa[i][j] = line:sub(j,j) 
    end 
    i = i + 1 
  end 
  file:close() 
end
function loadTileQuadsMap(tileset, nx, ny, tileQuads)
  local count = 0
  for i = 0, nx, 1 do
    for j = 0, ny, 1 do
      tileQuads[count] = love.graphics.newQuad(j * tileSize ,i * tileSize, tileSize, tileSize,tileset:getWidth(),tileset:getHeight())
      count = count + 1
    end
  end
end
function game_animation(dt, anim_time, each_frame_time, anim_frame, number_frame)
  anim_time = anim_time + dt -- incrementa o tempo usando dt
  if anim_time > each_frame_time then -- quando acumular mais de 0.1
    anim_frame = anim_frame + 1 -- avança para proximo frame
    if anim_frame > number_frame then
      anim_frame = 0
    end
    anim_time = 0 -- reinicializa a contagem do tempo
  end
end
function game_load()
  pausado = 0
  gamestate = 0
  pressionado = 0
  playing_music = love.audio.newSource("FFA_-_Música_de_Fase.mp3", "static")
  menu_load()
  mapa_load()
  player_load()
  --nick_load()
  --plat_load()
end
function game_update(dt)
  if gamestate == 0 then
    menu_music:play()
    if love.keyboard.isDown('return') and pressionado == 1 then
      gamestate = 1
    elseif love.keyboard.isDown('return') and pressionado == 3 then
      love.event.quit()
    end
  end
  if gamestate == 1 and pausado == 0 then
    playing_music:play()
    menu_music:stop()
    player_update(dt)
    --nick_update(dt)
    --plat_update(dt)
  end
end
function game_draw()
  --local px,py = playerB:center()
  if gamestate == 1 then
    --nick_draw()
    --plat_draw()
    player_draw()
    mapa_draw()
    if pausado == 1 then
      love.graphics.setColor(0,0,0, 100)
      love.graphics.rectangle("fill", 0, 0, 12800, 960)
      love.graphics.setColor(255,255,255)
      love.graphics.draw(pause, player.x + 300, 200, 0, 3, 3)
      --love.graphics.print(tostring(pausado), 400, 500)
    end
  elseif gamestate == 0 then
    menu_draw()
  end
end
function game_keypressed(key)
  --pausando o jogo
  if gamestate == 1 then
    player_keypressed(key)
    if key == "return" then
      if pausado == 1 then
        pausado = 0
      else
        pausado = 1
      end
    end
  end
  -- interatividade dos botões de menu do jogo
  if gamestate == 0 then
    if key == "down" or key == "right" then
      if pressionado == 0 then
        pressionado = 1
      elseif pressionado == 1 then
        pressionado = 2
      elseif pressionado == 2 then
        pressionado = 3
      else
        pressionado = 1
      end
    end
    if key == "left" then
      if pressionado == 1 then
        pressionado = 3
      elseif pressionado == 3 then
        pressionado = 2
      else
        pressionado = 1
      end
    end
  end
end
function game_keyreleased(key)
  player_keyreleased(key)
end
