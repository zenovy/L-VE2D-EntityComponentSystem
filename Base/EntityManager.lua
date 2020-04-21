local Object = require "Base/Object"

local EntityManager = Object:newChildClass("EntityManager")

function EntityManager:new(systemList)
  if not systemList or #systemList == 0 then
    error("EntityManager instantiated with no systems!")
  end

  local o = EntityManager.parentClass.new(self)
  o.entityList = {}
  o.systemList = systemList
  return o
end

function EntityManager:addEntity(entity)
  for i = 1, #self.systemList do
    local system = self.systemList[i]
    local systemRequiredComponents = system:getRequiredComponents()

    local hasAllRequiredComponents = true
    for i = 1, #systemRequiredComponents do
      if not entity:getComponent(systemRequiredComponents[i]) then
        hasAllRequiredComponents = false
        break
      end
    end
    if hasAllRequiredComponents then
      system:registerEntity(entity)
    end
  end
end

function EntityManager.addSystem(system)
  
end

return EntityManager