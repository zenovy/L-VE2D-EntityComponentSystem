local Object = require "Base/Object"

local System = Object:newChildClass('System')

function System:new(requiredComponents, optionalComponents)
  local o = System.parentClass.new(self)
  o.requiredComponents = requiredComponents or {}
  o.optionalComponents = optionalComponents or {}
  o.registeredEntities = {}
  return o
end

function System:getRequiredComponents()
  return self.requiredComponents
end

function System:registerEntity(entity)
  table.insert(self.registeredEntities, entity)
end

function System:update()
  error(self.name .. "has not implemented System:update")
end

return System
