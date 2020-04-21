local Object = require "Base/Object"

local System = Object:newChildClass('System')

function System:new(requiredComponents, optionalComponents)
  local o = System.parentClass.new(self)
  o.requiredComponents = requiredComponents or {}
  o.optionalComponents = optionalComponents or {}
  return o
end

function System:update(entityList)
  local updateEntityList = {}
  for i = 1, #entityList do
    local entity = entityList[i]
    for j = 1, #self.requiredComponents do
      if entity.componentMap[requiredComponent[j]] then break end
    end
    table.insert(updateEntityList, entity)
  end
  if #updateEntityList then self:run(updateEntityList) end
end

function System:run(...)
  error(self.name .. "has not implemented System:run")
end

return System
