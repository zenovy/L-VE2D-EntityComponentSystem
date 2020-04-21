local System = require "Base/System"

local Components = require "../Components/ComponentList"

local KinematicsSystem = System:newChildClass('KinematicsSystem', {Components.Translation})

function KinematicsSystem:update(dt)
  local entityList = self.registeredEntities
  for i = 1, #entityList do
    local translationComponent = entityList[i]:getComponent(Components.Translation)
    translationComponent.vx, translationComponent.vy = translationComponent.vx + translationComponent.ax * dt, translationComponent.vy + translationComponent.ay * dt
    translationComponent.x, translationComponent.y = translationComponent.x + translationComponent.vx * dt, translationComponent.y + translationComponent.vy * dt
  end
end

return KinematicsSystem
