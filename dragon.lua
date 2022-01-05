Dragon = {}

function Dragon.Init(drag)
    Dragon.x_offset = 0
    Dragon.y_offset = 0
    Dragon.ChangeDrag(drag)
    Dragon.win1_rot = 0
    Dragon.win2_rot = 0
end

function Dragon.draw()
    love.graphics.draw(Dragon.wing1, Dragon.x_offset, Dragon.y_offset, Dragon.win1_rot)
    love.graphics.draw(Dragon.wing2, Dragon.x_offset, Dragon.y_offset, Dragon.win2_rot)
    love.graphics.draw(Dragon.img, Dragon.x_offset, Dragon.y_offset, 0)
end

function Dragon.update(time)
    Dragon.x_offset = Dragon.x_offset + (math.cos(time/80))*0.1
    Dragon.win1_rot = (math.cos(time/80))*0.03
    Dragon.win2_rot = (math.cos(time/80))*0.03
end 

function Dragon.ChangeDrag(drag)
    Dragon.img = love.graphics.newImage("resources//dragon//body//"..tostring(drag)..".png")
    Dragon.wing1 = love.graphics.newImage("resources//dragon//left_wing//"..tostring(drag)..".png")
    Dragon.wing2 = love.graphics.newImage("resources//dragon//right_wing//"..tostring(drag)..".png")
end

function Dragon.ShootFireball(tick)
    if tick % (40 - game.difficulty) == 0 then
        local fireball_tmp = Fireball.new()
        table.insert(fireballs, fireball_tmp)
    end
end

