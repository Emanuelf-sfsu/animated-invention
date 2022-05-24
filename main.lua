-- ---------------------------------------------------------
-- Emanuel Francis
-- Pong - Lecture 0 - CS50's Introduction to Game Development 2018
-- I am following this tutorial to give me an insight on one of the many different 
-- uses of C++.


-- Game frame
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- Runs During games startup
function love.load()
    love.window.setMode(WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.draw()
    love.graphics.printf(
        'Hello Pong!',
        0,
        WINDOW_HEIGHT/2 - 6,
        WINDOW_WIDTH,
        'center'
    )
end

