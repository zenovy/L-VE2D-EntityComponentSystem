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
  local entityList = self:getRegisteredEntities()
  for i = 1, #entityList do
    if self.timeElapsed > entityList[i]:getComponent(Components.Disappearing).timeToDisappear then
      self.entityManager:removeEntity(entityList[i])
    end
  end
end

return DissapearingSystem
