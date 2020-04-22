local Object = require "Base/Object"

local EntityManager = Object:newChildClass("EntityManager")

function EntityManager:new(systemClassList)
  assert(systemClassList and #systemClassList > 0, "EntityManager instantiated with no systems!")

  local o = EntityManager.parentClass.new(self)
  o.entityList = {}
  local systemList = {}
  for i = 1, #systemClassList do
    local system = systemClassList[i]:new()
    table.insert(systemList, system)
    system.entityManager = o
  end
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

function EntityManager:removeEntity(entity)
  for i = 1, #self.systemList do
    local system = self.systemList[i]
    if system.registeredEntities[entity.id] then system.registeredEntities[entity.id] = nil end
  end
end

function EntityManager:update(dt)
  for i = 1, #self.systemList do
    local system = self.systemList[i]
    system:update(dt)
  end
end

function EntityManager:draw()
  for i = 1, #self.systemList do
    local system = self.systemList[i]
    system:draw()
  end
end

return EntityManager
