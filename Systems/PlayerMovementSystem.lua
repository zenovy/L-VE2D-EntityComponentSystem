local System = require "Base/System"

local Components = require "../Components/ComponentList"

local PlayerMovementSystem = System:newChildClass('PlayerMovementSystem', {Components.Translation, Components.PlayerControl})

function PlayerMovementSystem:update(dt)
  local entityList = self:getRegisteredEntities()
  for i = 1, #entityList do
    local translationComponent = entityList[i]:getComponent(Components.Translation)
    if love.keyboard.isDown('right') then
      translationComponent.x = translationComponent.x + dt
    elseif love.keyboard.isDown('left') then
      translationComponent.x = translationComponent.x - dt
    elseif love.keyboard.isDown('up') then
      translationComponent.y = translationComponent.y - dt
    elseif love.keyboard.isDown('down') then
      translationComponent.y = translationComponent.y + dt
    end
  end
end

return PlayerMovementSystem
