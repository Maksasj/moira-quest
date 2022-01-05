Player = {}

function Player.Movement()
    Player.idle = true
    if love.keyboard.isDown("w") then
        Player.vel_y = -1
        Player.idle = false
    end
    if love.keyboard.isDown("s") then
        Player.vel_y = 1
        Player.idle = false
    end
    if love.keyboard.isDown("d") then
        Player.vel_x = 1
        Player.idle = false
    end
    if love.keyboard.isDown("a") then
        Player.vel_x = -1
        Player.idle = false
    end

    if (Player.x + (Player.vel_x * Player.speed)) > 0 and (Player.x + (Player.vel_x * Player.speed)) < 432 then 
        Player.x = Player.x + (Player.vel_x * Player.speed)
    else
        Player.vel_x = Player.vel_x * -1 
    end

    if (Player.y + (Player.vel_y * Player.speed)) > 185 and (Player.y + (Player.vel_y * Player.speed)) < 592 then 
        Player.y = Player.y + (Player.vel_y * Player.speed)
    else
        Player.vel_y = Player.vel_y * -1 
    end
   
    Player.vel_x = Player.vel_x * 0.8
    Player.vel_y = Player.vel_y * 0.8
end

function Player.Update() 
    if Player.tex.animation_frame.side + 1 > 10 then 
        Player.tex.animation_frame.side = 1
    else
        Player.tex.animation_frame.side = Player.tex.animation_frame.side + 1
    end

    if Player.tex.animation_frame.down + 1 > 14 then 
        Player.tex.animation_frame.down = 1
    else
        Player.tex.animation_frame.down = Player.tex.animation_frame.down + 1
    end

    if math.abs(Player.vel_x) > math.abs(Player.vel_y) then
        if Player.vel_x > 0 then
            Player.tex.active = 0
        else 
            Player.tex.active = 1
        end
    else
        if Player.vel_y > 0 then
            Player.tex.active = 2
        else 
            Player.tex.active = 3
        end 
    end
end

function Player.Init()
    Player.x = 240 - (48/2)
    Player.y = 320 - (48/2)
    Player.vel_x = 0
    Player.vel_y = 0
    Player.speed = 3
    Player.shield = 0

    Player.die_sound = love.audio.newSource("resources//sound//player_die.wav", "static")
    Player.shield_die = love.audio.newSource("resources//sound//shield_die.wav", "static")

    Player.tex = {}
    Player.tex.active = 0

    Player.tex.animation_frame = {}
    Player.tex.animation_frame.side = 1
    Player.tex.animation_frame.down = 1
    Player.idle = true


    
    Player.tex.idle = love.graphics.newImage("resources//player//player_idle.png")
    Player.tex.shadow = love.graphics.newImage("resources//player//player_shadow.png")
    Player.tex.shield = love.graphics.newImage("resources//player//player_shield.png")
    
    Player.tex.up = {
        [1] = love.graphics.newImage("resources//player//player_up//1.png"),
        [2] = love.graphics.newImage("resources//player//player_up//2.png"),
        [3] = love.graphics.newImage("resources//player//player_up//3.png"),
        [4] = love.graphics.newImage("resources//player//player_up//4.png"),
        [5] = love.graphics.newImage("resources//player//player_up//5.png"),
        [6] = love.graphics.newImage("resources//player//player_up//6.png"),
        [7] = love.graphics.newImage("resources//player//player_up//7.png"),
        [8] = love.graphics.newImage("resources//player//player_up//8.png"),
        [9] = love.graphics.newImage("resources//player//player_up//9.png"),
        [10] = love.graphics.newImage("resources//player//player_up//10.png")
     }
 

    Player.tex.down = {
        [1] = love.graphics.newImage("resources//player//player_down//1.png"),
        [2] = love.graphics.newImage("resources//player//player_down//2.png"),
        [3] = love.graphics.newImage("resources//player//player_down//3.png"),
        [4] = love.graphics.newImage("resources//player//player_down//4.png"),
        [5] = love.graphics.newImage("resources//player//player_down//5.png"),
        [6] = love.graphics.newImage("resources//player//player_down//6.png"),
        [7] = love.graphics.newImage("resources//player//player_down//7.png"),
        [8] = love.graphics.newImage("resources//player//player_down//8.png"),
        [9] = love.graphics.newImage("resources//player//player_down//9.png"),
        [10] = love.graphics.newImage("resources//player//player_down//10.png"),
        [11] = love.graphics.newImage("resources//player//player_down//11.png"),
        [12] = love.graphics.newImage("resources//player//player_down//12.png"),
        [13] = love.graphics.newImage("resources//player//player_down//13.png"),
        [14] = love.graphics.newImage("resources//player//player_down//14.png")
     }

    Player.tex.right = {
       [1] = love.graphics.newImage("resources//player//player_right//1.png"),
       [2] = love.graphics.newImage("resources//player//player_right//2.png"),
       [3] = love.graphics.newImage("resources//player//player_right//3.png"),
       [4] = love.graphics.newImage("resources//player//player_right//4.png"),
       [5] = love.graphics.newImage("resources//player//player_right//5.png"),
       [6] = love.graphics.newImage("resources//player//player_right//6.png"),
       [7] = love.graphics.newImage("resources//player//player_right//7.png"),
       [8] = love.graphics.newImage("resources//player//player_right//8.png"),
       [9] = love.graphics.newImage("resources//player//player_right//9.png"),
       [10] = love.graphics.newImage("resources//player//player_right//10.png")
    }

    Player.tex.left = {
        [1] = love.graphics.newImage("resources//player//player_left//1.png"),
        [2] = love.graphics.newImage("resources//player//player_left//2.png"),
        [3] = love.graphics.newImage("resources//player//player_left//3.png"),
        [4] = love.graphics.newImage("resources//player//player_left//4.png"),
        [5] = love.graphics.newImage("resources//player//player_left//5.png"),
        [6] = love.graphics.newImage("resources//player//player_left//6.png"),
        [7] = love.graphics.newImage("resources//player//player_left//7.png"),
        [8] = love.graphics.newImage("resources//player//player_left//8.png"),
        [9] = love.graphics.newImage("resources//player//player_left//9.png"),
        [10] = love.graphics.newImage("resources//player//player_left//10.png")
    }
end

function Player.draw() 
    
    if Player.idle == true then
        love.graphics.draw(Player.tex.shadow, Player.x+3, Player.y+32, 0, 1.3 , 1.3 , 1.3)
        love.graphics.draw(Player.tex.idle, Player.x, Player.y, 0, 0.8, 0.8, 0.8)
    else
        if Player.tex.active == 0 then
            love.graphics.draw(Player.tex.shadow, Player.x+12, Player.y+24, 0, 1.2 , 1.2 , 1.2)
            love.graphics.draw(Player.tex.right[Player.tex.animation_frame.side], Player.x, Player.y, 0, 0.8, 0.8, 0.8)
        elseif Player.tex.active == 1 then
            love.graphics.draw(Player.tex.shadow, Player.x+24, Player.y+24, 0, 1.2 , 1.2 , 1.2)
            love.graphics.draw(Player.tex.left[Player.tex.animation_frame.side], Player.x, Player.y, 0, 0.8, 0.8, 0.8)
        elseif Player.tex.active == 2 then
            love.graphics.draw(Player.tex.shadow, Player.x+8, Player.y+32, 0, 1.2 , 1.2 , 1.2)
            love.graphics.draw(Player.tex.down[Player.tex.animation_frame.down], Player.x-12, Player.y-8, 0, 0.8, 0.8, 0.8)
        elseif Player.tex.active == 3 then
            love.graphics.draw(Player.tex.shadow, Player.x+3, Player.y+32, 0, 1.3 , 1.3 , 1.3)
            love.graphics.draw(Player.tex.up[Player.tex.animation_frame.side], Player.x, Player.y, 0, 0.8, 0.8, 0.8)
        end
    end
    if Player.shield > 0 then
        love.graphics.draw(Player.tex.shield, Player.x-24, Player.y-12, 0, 1.55 , 1.55 , 1.55)
    end
end