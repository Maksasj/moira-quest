Fireball = {}
Fireball.__index = Fireball

function  Fireball.new()
    local instance = setmetatable({}, Fireball)
    
    
    local tex_animation = {
        [1] = love.graphics.newImage("resources//fireball//1.png"),
        [2] = love.graphics.newImage("resources//fireball//2.png"),
        [3] = love.graphics.newImage("resources//fireball//3.png"),
        [4] = love.graphics.newImage("resources//fireball//4.png"),
        [5] = love.graphics.newImage("resources//fireball//5.png"),
        [6] = love.graphics.newImage("resources//fireball//6.png"),
        [7] = love.graphics.newImage("resources//fireball//7.png")
    }
    

    instance.tex = {}
    instance.tex.animation = tex_animation

    instance.tex.active = 0
    instance.animation_frame = 1

    instance.sound = love.audio.newSource("resources//sound//fireball_die.wav", "static")

    local fourth = math.random(0, 3) 
    if fourth == 0 then
        instance.x = 0
        instance.y = math.random(130, 640) 
        instance.vel_y = 0
        instance.vel_x = 1
    elseif fourth == 1 then
        instance.x = 480
        instance.y = math.random(130, 640) 
        instance.vel_y = 0
        instance.vel_x = -1
    elseif fourth == 2 then
        instance.x = math.random(0, 480) 
        instance.y = 0
        instance.vel_y = 1
        instance.vel_x = 0
    elseif fourth == 3 then
        instance.x = math.random(0, 480) 
        instance.y = 640
        instance.vel_y = -1
        instance.vel_x = 0
    end

    instance.speed = math.random(2, 6)
    return instance
end

function Fireball:draw() 
    if self.tex.active == 0 then
        love.graphics.draw(self.tex.animation[self.animation_frame], self.x - 32 , self.y + 44, 4.71, 1, 1, 1)
    elseif self.tex.active == 1 then
        love.graphics.draw(self.tex.animation[self.animation_frame], self.x + 64, self.y - 8, 1.57, 1, 1, 1)
    elseif self.tex.active == 2 then
        love.graphics.draw(self.tex.animation[self.animation_frame], self.x - 8, self.y - 32, 0, 1, 1, 1)
    elseif self.tex.active == 3 then
        love.graphics.draw(self.tex.animation[self.animation_frame], self.x + 40, self.y + 64, 3.14, 1, 1, 1)
    end 
end

function Fireball:update()
    if tick % 8 == 0 then
        if self.animation_frame + 1 > 7 then 
            self.animation_frame = 1
        else
            self.animation_frame = self.animation_frame + 1
        end
    end
    self.x = self.x + (self.vel_x * self.speed)
    self.y = self.y + (self.vel_y * self.speed)
    self.vel_x = self.vel_x * 0.99
    self.vel_y = self.vel_y * 0.99

    if math.abs(self.vel_x) > math.abs(self.vel_y) then
        if self.vel_x > 0 then
            self.tex.active = 0
        else 
            self.tex.active = 1
        end
    else
        if self.vel_y > 0 then
            self.tex.active = 2
        else 
            self.tex.active = 3
        end 
    end
end

function update_fireballs(tick)
    for key , fireball_tmp in pairs(fireballs) do
        fireball_tmp:update()
        if math.abs(fireball_tmp.vel_x + fireball_tmp.vel_y) < 0.3 then
            
            local rand = math.random( 1, 6)
            if rand == 1 then
                local item_tmp = Item.new(fireball_tmp.x , fireball_tmp.y)
                table.insert(items, item_tmp)
            end

            fireball_tmp.sound:play()
            fireballs[key] = nil
        end
    end
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
end

function kill_fireballs()
    for key , fireball_tmp in pairs(fireballs) do
        fireballs[key] = nil
    end
end

function check_collision()
    for key , fireball_tmp in pairs(fireballs) do
        fireball_tmp:update()
        if CheckCollision(Player.x+4, Player.y+6, 32, 48, fireball_tmp.x, fireball_tmp.y, 32, 32) then
            if Player.shield == 0 then
                Player.die_sound:play()
                game.pause = 2
                fireballs[key] = nil
            else
                Player.shield = Player.shield - 1
                Player.shield_die:play()
                fireballs[key] = nil
            end
        end
    end
end

function draw_fireballs()
    for key , fireball_tmp in pairs(fireballs) do
        fireball_tmp:draw()
    end
end