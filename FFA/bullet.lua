function update_bullet (bullet,ppx,ppy,tiro,dt)
    local  bullet = bullet
    if tiro then
    bullet:move(1200*dt,0)
    else
    bullet:moveTo(ppx+40,ppy-64)
end

end