local System = require "Base/System"
local TranslationComponent = require "../Components/TranslationComponent"
local PlayerControlledComponent = require "../Components/PlayerControlledComponent"

local PlayerMovementSystem = System:newChildClass('PlayerMovementSystem', {TranslationComponent, PlayerControlledComponent})

function PlayerMovementSystem:update(dt)
  local entityList = self.registeredEntities
  for i = 1, #entityList do
    local translationComponent = entityList[i]:getComponent(TranslationComponent.type)
    if love.keyboard.isDown('right') then
      translationComponent.x = translationComponent.x + dt
    end
  end
end

return PlayerMovementSystem
