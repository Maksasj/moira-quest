Item = {}
Item.__index = Item

function  Item.new(x, y)
    local instance = setmetatable({}, Item)
    
    local rand = math.random(1,2)

    if rand == 1 then -- Shiled
        instance.buff = 1
        instance.tex = love.graphics.newImage("resources//player//shield.png")
    else -- Speed
        instance.buff = 2
        instance.tex = love.graphics.newImage("resources//player//speed_buf.png")
    end
    
    instance.sound = love.audio.newSource("resources//sound//powerup.wav", "static")
    instance.x = x
    instance.y = y
    return instance
end

function Item:draw() 
    love.graphics.draw(self.tex, self.x, self.y, 0, 1, 1, 1)
end


function items_check_collision()
    for key , item_tmp in pairs(items) do
        if CheckCollision(Player.x+4, Player.y+6, 32, 48, item_tmp.x, item_tmp.y, 32, 32) then
            item_tmp.sound:play()

            if item_tmp.buff == 2 then
                Player.speed = Player.speed + 0.5
            end

            if item_tmp.buff == 1 then
                Player.shield = Player.shield + 1
            end

            items[key] = nil
        end
    end
end

function draw_items()
    for key , item_tmp in pairs(items) do
        item_tmp:draw()
    end
end

function kill_items()
    for key , item_tmp in pairs(items) do
        items[key] = nil
    end
end