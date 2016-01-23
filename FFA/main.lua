--[[Este arquivo servirá somente para chamar funções implementadas em outros arquivos]]--
require "game"
require "menu"
require "player"
require "mapa"
require "nick"
require "bullet"
require "collision"
require "plataforma"
local loader = require "AdvTiledLoader/Loader"
-- set the path to the Tiled map files
loader.path = "maps/"
local HC = require "HardonCollider"
local shapes = require "hardoncollider.shapes"

function love.load()
  love.window.setMode(1280, 960, {resizable = true})
  legs = false
  game_load()
end
function love.update(dt)
  game_update(dt)
end
function love.draw()
  game_draw()
end
function love.keyreleased(key)
  game_keyreleased(key)
end
function love.keypressed(key)
  game_keypressed(key)
end