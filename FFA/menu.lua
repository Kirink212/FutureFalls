function menu_load()
  menu_music = love.audio.newSource("FFA_-_Título.mp3", "static")
  bg_img = love.graphics.newImage("menu/menu.png")
  start_button = love.graphics.newImage("menu/play.png")
  start_button2 = love.graphics.newImage("menu/play2.png")
  options_button = love.graphics.newImage("menu/option.png")
  options_button2 = love.graphics.newImage("menu/option2.png")
  quit_button = love.graphics.newImage("menu/quit.png")
  quit_button2 = love.graphics.newImage("menu/quit2.png")
  pause = love.graphics.newImage("pause.png")  
end

function menu_draw()
    love.graphics.draw(bg_img, 0, 0)
    love.graphics.draw(start_button, 150, 600)
    love.graphics.draw(options_button, 450, 650)
    love.graphics.draw(quit_button, 900, 650)
    if pressionado == 1 then
      love.graphics.draw(start_button2, 150, 600)
    elseif pressionado == 2 then
      love.graphics.draw(options_button2, 450, 650)
    elseif pressionado == 3 then
      love.graphics.draw(quit_button2, 900, 650)
    end
    love.graphics.print(tostring(pressionado), 2, 2)
end