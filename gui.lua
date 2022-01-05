gui = {}

function gui.Init()
    gui.bar = {}
    gui.bar.tex = love.graphics.newImage("resources//gui//bar.png")

    gui.pause = {}
    gui.pause.tex = love.graphics.newImage("resources//gui//pause.png")

    gui.death = {}
    gui.death.tex = love.graphics.newImage("resources//gui//death.png")
end

function love.mousepressed(x, y, button)
    if game.state == 0 then
        button_sound:play()
        game.state = 1
    elseif game.state == 1 then
        button_sound:play()
        if game.pause ~= 2 then
            if button == 1 then
                if game.pause == 0 then
                    game.pause = 1 
                else 
                    game.pause = 0
                end

            end
        else 
            if button == 1 then
                button_sound:play()
                kill_fireballs()
                kill_items()
                Player.Init()
                Dragon.Init(math.random(1,3))
                
                Player.speed = 3
                Player.shield = 0
                game.difficulty = 1
                game.pause = 0
            end
        end
    end
end

function gui:draw()
    if game.pause == 1 then

        love.graphics.draw(gui.pause.tex, 0,0)

        love.graphics.setColor(0.1,0.1,0.16,0.8)
        love.graphics.setFont(main_font)
	    love.graphics.print("press space to resume", 92, 302)
        love.graphics.setColor(0.9,0.9,0.9,0.8)
        love.graphics.print("press space to resume", 90, 300)

        love.graphics.setColor(255,255,255,255)
    elseif game.pause == 2 then 
        love.graphics.draw(gui.death.tex, 0,0)

        love.graphics.setColor(0.4,0.1,0.16,0.8)
        love.graphics.setFont(main_font)
	    love.graphics.print("press space to begin", 97, 502)
        love.graphics.setColor(0.8,0.44,0.44,0.8)
        love.graphics.print("press space to begin", 95, 500)

        love.graphics.setColor(0.4,0.1,0.16,0.8)
        love.graphics.setFont(main_font)
	    love.graphics.print("You Died !", 187, 302)
        love.graphics.setColor(0.8,0.44,0.44,0.8)
        love.graphics.print("You Died !", 185, 300)

        love.graphics.setColor(255,255,255,255)
    end
end