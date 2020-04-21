local System = require "Base/System"

local TranslationComponent = require "../Components/TranslationComponent"

local KinematicsSystem = System:newChildClass('KinematicsSystem', {TranslationComponent, MoveComponent})

function KinematicsSystem:update(dt)
  local entityList = self.registeredEntities
  for i = 1, #entityList do
    local translationComponent = entityList[i]:getComponent(TranslationComponent.type)
    translationComponent.vx, translationComponent.vy = translationComponent.vx + translationComponent.ax * dt, translationComponent.vy + translationComponent.ay * dt
    translationComponent.x, translationComponent.y = translationComponent.x + translationComponent.vx * dt, translationComponent.y + translationComponent.vy * dt
  end
end

return KinematicsSystem
