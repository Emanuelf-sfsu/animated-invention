-- ---------------------------------------------------------
-- Emanuel Francis
-- Pong - Lecture 0 - CS50's Introduction to Game Development 2018
-- I am following this tutorial to give me an insight on one of the many different 
-- uses of C++.

-- https://github.com/Ulydev/push
push = require 'push'

-- Game frame
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- Paddle movement speed
PADDLE_SPEED = 200

-- Runs During games startup
function love.load()

    love.graphics.setDefaultFilter('nearest' ,'nearest')

    -- seed the RNG so that calls to random are always random
    -- using the time because it will always be different
    math.randomseed(os.time())

    -- font to better replicate the retro version of pong
    smallFont = love.graphics.newFont('font.ttf', 8)

    -- larger font for score
    scoreFont = love.graphics.newFont('font.ttf',32)

    -- set LOVE2D to active font
    love.graphics.setFont(smallFont)

    -- Will instead use the push libary 
    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    -- initializing the scores
    player1Score = 0
    player2Score = 0

    -- paddle positions on the Y axis (they can only move up or down)
    player1Y = 30
    player2Y = VIRTUAL_HEIGHT - 50

    -- velocity and position variables for the ball
    ballX = VIRTUAL_WIDTH / 2 - 2
    ballY = VIRTUAL_HEIGHT / 2 - 2

    ballDX = math.random(2) == 1 and 100 or -100
    ballDY = math.random(-50,50)

    -- game state variable used to transition from different parts of 
    -- the game
    gameState = 'start'
end

function love.update(dt)
    -- player1 movement
    if love.keyboard.isDown('w') then
        -- add negative paddle speed 
        -- math.max returns the greater of 2 values
        -- bottom of the edge minus paddle height so player1 won't go above it
        player1Y = math.max(0, player1Y + -PADDLE_SPEED * dt)

    elseif love.keyboard.isDown('s') then
        -- add positive  paddle speed 
        -- math.min finds the lesser of 2 values
        player1Y = math.min(VIRTUAL_HEIGHT - 20,player1Y + PADDLE_SPEED * dt)
    end

    -- player 2 movement
    if love.keyboard.isDown('up') then
        -- add negative paddle speed  
        player2Y =  math.max(0, player2Y + -PADDLE_SPEED * dt)
        
    elseif love.keyboard.isDown('down') then
        -- add positive 
        player2Y =  math.min(VIRTUAL_HEIGHT - 20, player2Y + PADDLE_SPEED * dt)

    end

    -- updating ball depending on DX and DY only if we are in play state
    if gameState == ballX + ballDX *dt
        ballX = ballX + ballDX * dt
        ballY = ballY + ballDY * dt
    end
end



function love.keypressed(key)
    -- key can be called by name
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    -- begin rendering at virtual resolution
    push:apply('start')

    -- clear the screen with specific color
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)    
    -- welcome screen
    love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

    -- draw score on the left and right of the screen
    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)

    
    -- render first paddle (left)
    love.graphics.rectangle('fill', 10, player1Y, 5, 20)

    -- render second paddle (right)
    love.graphics.rectangle('fill',VIRTUAL_WIDTH - 10, player2Y - 50, 5, 20)

    -- render ball (center)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4 )

    -- end rendering at virtual resolution
    push:apply('end')
end


