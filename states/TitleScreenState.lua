--[[
    TitleScreenState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The TitleScreenState is the starting screen of the game, shown on startup. It should
    display "Press Enter" and also our highest score.
]]

TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:update(dt)
    -- transition to countdown when enter/return are pressed

    if love.keyboard.wasPressed('1') then
        sounds['music']:stop()
        sounds['music'] = sounds['romeo']
        sounds['music']:play()
    elseif love.keyboard.wasPressed('2') then
        sounds['music']:stop()
        sounds['music'] = sounds['sand']
        sounds['music']:play()
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function TitleScreenState:render()
    -- simple UI code
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Flappy Capi', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Pressione Enter', 0, 100, VIRTUAL_WIDTH, 'center')
end