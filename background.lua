background = {}

function background.init()
    background.splashscreen = love.graphics.newImage("resources//background//splashscreen.png")

    background.castle = love.graphics.newImage("resources//background//castle.png")
    background.grass = love.graphics.newImage("resources//background//grass.png")
    
    background.cloud = love.graphics.newImage("resources//background//cloud.png")
    background.cloud_offset = 0

    background.title = love.graphics.newImage("resources//background//title.png")
    background.title_offset = 0
end

function background:draw_splashscreen()
    love.graphics.draw(background.splashscreen, 0,0)
end

function background:draw_castle()
    love.graphics.draw(background.castle, 0, 0)
end

function background:draw_grass()
    love.graphics.draw(background.grass, 0, 0)
end

function background:draw_cloud()
    love.graphics.draw(background.cloud, 0, background.cloud_offset - 10)
end

function background.update_cloud(time)
    background.cloud_offset = background.cloud_offset + (math.cos(time/80))*0.1
end

function background:draw_title()
    love.graphics.draw(background.title, 0, background.title_offset - 10)
end