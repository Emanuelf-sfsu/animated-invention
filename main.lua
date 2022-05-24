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

-- Runs During games startup
function love.load()
    -- love.window.setMode(WINDOW_WIDTH,WINDOW_HEIGHT,{
    --     fullscreen = false,
    --     resizable = false,
    --     vsync = true
    -- })
    love.graphics.setDefaultFilter('nearest', 'nearest')
    -- Will instead use the push libary 
    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = false,
        vsync = true
    })
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


    love.graphics.printf('Hello Pong!', 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')

    -- end rendering at virtual resolution
    push:apply('end')
end


