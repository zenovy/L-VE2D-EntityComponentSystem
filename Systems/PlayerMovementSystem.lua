local System = require "Base/System"

local Components = require "../Components/ComponentList"

local PlayerMovementSystem = System:newChildClass('PlayerMovementSystem', {Components.Translation, Components.PlayerControl})

function PlayerMovementSystem:update(dt)
  local entityList = self:getRegisteredEntities()
  for i = 1, #entityList do
    local translationComponent = entityList[i]:getComponent(Components.Translation)
    local playerControlComponent = entityList[i]:getComponent(Components.PlayerControl)
    local inputSensitivity = playerControlComponent.inputSensitivity
    if love.keyboard.isDown('right') then
      translationComponent.x = translationComponent.x + dt * inputSensitivity
    elseif love.keyboard.isDown('left') then
      translationComponent.x = translationComponent.x - dt * inputSensitivity
    elseif love.keyboard.isDown('up') then
      translationComponent.y = translationComponent.y - dt * inputSensitivity
    elseif love.keyboard.isDown('down') then
      translationComponent.y = translationComponent.y + dt * inputSensitivity
    end
  end
end

return PlayerMovementSystem
