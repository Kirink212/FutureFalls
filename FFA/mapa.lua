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
  love.graphics.print("Piroca", 200, 300)
  local count = 0
  for i = 0, nx, 1 do
    for j = 0, ny, 1 do
      tileQuads[count] = love.graphics.newQuad(j * tileSize ,i * tileSize, tileSize, tileSize,tileset:getWidth(),tileset:getHeight())
      count = count + 1
    end
  end
end
function mapa_load()
  tilesetMapa = love.graphics.newImage("maps/Tileset2.png")
  LoadMap("fase1.txt")
  loadTileQuadsMap(tilesetMapa, 2, 2, tileQuadsMapa)
end
function mapa_draw()
  for i=0, 10, 1 do
    --Percorre a matriz e desenha quadrados imagens
    for j=0, 14, 1 do
      if (mapa[i][j] == "F") then
        --love.graphics.draw(tileset,tileQuads[1],(j * tileSize), (i * tileSize))
      elseif (mapa[i][j] == "C") then
        love.graphics.draw(tilesetMapa,tileQuadsMapa[1],(i * tileSize), (j * tileSize))
      elseif (mapa[i][j] == "E") then
        --love.graphics.draw(tileset,tileQuads[0],(j * tileSize), (i * tileSize))
      end
    end
  end
end
