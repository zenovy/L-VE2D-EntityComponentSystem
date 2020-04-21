local System = require "Base/System"
local PositionComponent = require "../Components/PositionComponent"

local KinematicsSystem = System:newChildClass('KinematicsSystem', {PositionComponent})

function KinematicsSystem:update(dt)
  local entityList = self.registeredEntities
  for i = 1, #entityList do
    local positionComponent = entityList[i]:getComponent(PositionComponent.type)
    if positionComponent.isMove then
      positionComponent.x = positionComponent.x + positionComponent.dx * dt
    end
  end
end

return KinematicsSystem
