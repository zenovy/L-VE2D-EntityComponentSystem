local System = require "Base/System"

local Components = require "../Components/ComponentList"

local DissapearingSystem = System:newChildClass('DissapearingSystem', {Components.Disappearing})

function DissapearingSystem:new(timeElapsed)
  local o = DissapearingSystem.parentClass.new(self)
  o.timeElapsed = 0
  return o
end

function DissapearingSystem:update(dt)
  self.timeElapsed = self.timeElapsed + dt
  if self.timeElapsed > 1 then
    local entityList = self:getRegisteredEntities()
    for i = 1, #entityList do
      self.entityManager:removeEntity(entityList[i])
    end
  end
end

return DissapearingSystem
