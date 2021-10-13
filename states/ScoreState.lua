--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]

local GOLD_IMAGE = love.graphics.newImage('gold.png')
local SILVER_IMAGE = love.graphics.newImage('silver.png')
local BRONZE_IMAGE = love.graphics.newImage('bronze.png')

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Placar: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if self.score <= 10 then
        love.graphics.printf('Poxa! Voce foi humilhado!', 0, 64, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(BRONZE_IMAGE, VIRTUAL_WIDTH / 2 - 16, 120)
    elseif self.score <= 20 then
        love.graphics.printf('Hm... Nada mal!', 0, 64, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(SILVER_IMAGE, VIRTUAL_WIDTH / 2 - 16, 120)
    else
        love.graphics.printf('Parabens.', 0, 64, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(GOLD_IMAGE, VIRTUAL_WIDTH / 2 - 16, 120)
    end

    love.graphics.printf('Pressione Enter para Jogar Novamente!', 0, 160, VIRTUAL_WIDTH, 'center')
end