local Object = require "Base/Object"

local Entity = Object:newChildClass('Entity')

local getNewEntityId = coroutine.create(function(startIndex)
  local entityIdCounter = startIndex or 1
  while true do
    coroutine.yield(entityIdCounter)
    entityIdCounter = entityIdCounter + 1
  end
end)

function Entity:new(componentList)
  componentList = componentList or {}
  local componentMap = {}
  for i = 1, #componentList do
    local component = componentList[i]
    componentMap[component.type] = component
  end

  setmetatable({}, self)
  self.__index = self
  local _, id = coroutine.resume(getNewEntityId)
  return setmetatable({
      id = id,
      componentMap = componentMap,
      }, self)
end

function Entity:getComponent(type)
  return self.componentMap[type]
end

return Entity