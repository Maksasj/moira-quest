require "player"
require "dragon"
require "fireball"
require "background"
require "gui"
require "item"

tick = 0
game_over = 0
fireballs = {}
items = {}

game = {}
game.state = 0
game.pause = 0
game.difficulty = 1
-- 0 - Menu
-- 1 - Actual Game

function love.load()
    imageData = love.image.newImageData("icon.png")
    theme = love.audio.newSource("resources//sound//theme.mp3", "stream")
    theme:setVolume(0.1)

    button_sound = love.audio.newSource("resources//sound//button.wav", "static")

    main_font = love.graphics.newFont("resources//fonts//minecraft.ttf", 26)

    background.init()

    love.window.setVSync(1)
    love.window.setMode(480, 640, {resizable=false})
    love.window.setTitle("Moira Quest")
    love.window.setIcon(imageData)
    
    --Zagruzka muziki
    --music = love.audio.newSource("theme.mp3", "stream")

    --Zagruzka effectov
    --src1 = love.audio.newSource("bang.wav", "static")
    Dragon.Init(math.random(1,3))
    Player.Init()
    gui.Init()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "space" then
        button_sound:play()
        if game.state == 0 then game.state = 1 end
    end
end

function love.update(dt)
    if game.state == 0 then
        --Yes
    elseif game.state == 1 then 
        if game.pause == 0 then
            if not theme:isPlaying( ) then
                love.audio.play(theme)
            end

            Player.Movement()
            Player.Update()

            background.update_cloud(tick)
            Dragon.update(tick)
            Dragon.ShootFireball(tick)

            update_fireballs()
            
            check_collision()
            items_check_collision()
            
            if tick % 180 == 0 then
                game.difficulty = game.difficulty + 1
            end

            tick = tick + 1
        end
    end
end

function love.draw()
    if game.state == 0 then
        background.draw_splashscreen()
        background.draw_title()

        love.graphics.setColor(0.1,0.1,0.16,100)
        love.graphics.setFont(main_font)
	    love.graphics.print("Made by Maksasj", 6, 602)
        love.graphics.setColor(0.7,0.7,0.9,100)
        love.graphics.print("Made by Maksasj", 4, 600)

        love.graphics.setColor(0.1,0.1,0.16,0.5)
        love.graphics.setFont(main_font)
	    love.graphics.print("press space to begin", 102, 502)
        love.graphics.setColor(0.7,0.7,0.9,0.5)
        love.graphics.print("press space to begin", 100, 500)

        love.graphics.setColor(255,255,255,255)

        
    elseif game.state == 1 then   
        love.graphics.setColor(255,255,255,255)

        background.draw_grass()
        background.draw_cloud()
        Dragon.draw()

        background.draw_castle()
        draw_fireballs()
        draw_items()
        --FPS
        --love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
        --love.graphics.print(tostring(game_over), 10, 30)

        Player.draw()
        if game.pause ~= 2 then
            love.graphics.setColor(0.1,0.1,0.16,255)
            love.graphics.setFont(main_font)
            love.graphics.print("Difficulty "..tostring(game.difficulty), 6, 602)
            love.graphics.setColor(0.7,0.7,0.9,255)
            love.graphics.print("Difficulty "..tostring(game.difficulty), 4, 600)

            love.graphics.setColor(255,255,255,255)
        end

        
        gui.draw()
    end
end