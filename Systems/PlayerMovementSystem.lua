local System = require "Base/System"

local Components = require "../Components/ComponentList"

local PlayerMovementSystem = System:newChildClass('PlayerMovementSystem', {Components.Translation, Components.PlayerControl})

function PlayerMovementSystem:update(dt, entityList)
  for i = 1, #entityList do
    local translationComponent = entityList[i]:getComponent(Components.Translation)
    if love.keyboard.isDown('right') then
      translationComponent.x = translationComponent.x + dt
    end
  end
end

return PlayerMovementSystem
