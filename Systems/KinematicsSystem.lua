local System = require "Base/System"

local MoveComponent = require "../Components/MoveComponent"
local PositionComponent = require "../Components/PositionComponent"

local KinematicsSystem = System:newChildClass('KinematicsSystem', {PositionComponent, MoveComponent})

function KinematicsSystem:update(dt)
  local entityList = self.registeredEntities
  for i = 1, #entityList do
    local moveComponent = entityList[i]:getComponent(MoveComponent.type)
    local positionComponent = entityList[i]:getComponent(PositionComponent.type)
    moveComponent.vx, moveComponent.vy = moveComponent.vx + moveComponent.ax * dt, moveComponent.vy + moveComponent.ay * dt
    positionComponent.x, positionComponent.y = positionComponent.x + moveComponent.vx * dt, positionComponent.y + moveComponent.vy * dt
  end
end

return KinematicsSystem
