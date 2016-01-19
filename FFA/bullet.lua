function update_bullet (bullet,ppx,ppy,tiro,dt)
    local  bullet = bullet
    if tiro then
    bullet:move(1200*dt,0)
    else
    bullet:moveTo(ppx+40,ppy-64)
end

end

function enemy_bullet(Enemy2Bullet,turret,dt,HPinimigo2)
    local Enemy2Bullet = Enemy2Bullet
     local b2x,b2y = Enemy2Bullet:center()
 if turret then
    love.graphics.draw(missile,b2x,b2y)
 end
    if turret and HPinimigo2 > 0 then
    Enemy2Bullet:move(-150*dt,0)
    else
    Enemy2Bullet:moveTo(5824,96)
end

end