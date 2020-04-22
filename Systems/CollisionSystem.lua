local System = require "Base/System"

local Components = require "../Components/ComponentList"

local CollisionSystem = System:newChildClass('CollisionSystem', {Components.Translation})

function CollisionSystem:update(dt)
  local entityList = self:getRegisteredEntities()
  for i = 1, #entityList do
    local translationComponent = entityList[i]:getComponent(Components.Translation)
    translationComponent.vx, translationComponent.vy = translationComponent.vx + translationComponent.ax * dt, translationComponent.vy + translationComponent.ay * dt
    translationComponent.x, translationComponent.y = translationComponent.x + translationComponent.vx * dt, translationComponent.y + translationComponent.vy * dt
  end
end

return CollisionSystem
