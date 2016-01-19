function update_bullet (bullet,ppx,ppy,tiro,dt,obj2)
    local  bullet = bullet
    if tiro and obj2 then
    bullet:move(1200*dt,0)
    else
    bullet:moveTo(ppx+40,ppy-64)
end

end

function enemy_bullet(Enemy2Bullet,turret,dt,HPinimigo2)
    local Enemy2Bullet = Enemy2Bullet
    if turret and HPinimigo2 > 0 then
    Enemy2Bullet:move(-150*dt,0)
    else
    Enemy2Bullet:moveTo(5824,90)
end

end