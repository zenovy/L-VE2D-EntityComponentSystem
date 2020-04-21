local Object = require "Base/Object"

local EntityManager = Object:newChildClass("EntityManager")

function EntityManager:new(systemClassList)
  assert(systemClassList and #systemClassList > 0, "EntityManager instantiated with no systems!")
  local systemList = {}
  for i = 1, #systemClassList do
    table.insert(systemList, systemClassList[i]:new())
  end

  local o = EntityManager.parentClass.new(self)
  o.entityList = {}
  o.systemList = systemList
  return o
end

function EntityManager:addEntity(entity)
  for i = 1, #self.systemList do
    local system = self.systemList[i]
    local systemRequiredComponents = system.requiredComponents

    local hasAllRequiredComponents = true
    for i = 1, #systemRequiredComponents do
      local requiredComponent = systemRequiredComponents[i]
      if not entity:getComponent(requiredComponent) then
        hasAllRequiredComponents = false
        break
      end
    end
    if hasAllRequiredComponents then
      system:registerEntity(entity)
    end
  end
end

function EntityManager:update(dt)
  for i = 1, #self.systemList do self.systemList[i]:update(dt) end
end

function EntityManager:draw()
  for i = 1, #self.systemList do self.systemList[i]:draw() end
end

return EntityManager
