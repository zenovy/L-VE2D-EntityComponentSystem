local Object = require "Base/Object"

local System = Object:newChildClass('System')

function System:new()
  local o = System.parentClass.new(self)
  o.registeredEntities = {}
  return o
end

function System:newChildClass(type, requiredComponents)
  local o = System.parentClass.newChildClass(self, type)
  assert(type, "Failed to declare unknown System due to missing name")
  assert(requiredComponents, "Failed to declare System '" .. type .. "': missing requiredComponents list")
  o.requiredComponents = requiredComponents
  return o
end

function System:getRequiredComponents()
  return self.requiredComponents
end

function System:registerEntity(entity)
  self.registeredEntities[entity.id] = entity
end

-- System instances can handle these methods as they wish
function System:update() end
function System:draw() end

return System
