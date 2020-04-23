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

function Entity:getComponent(component)
  if not component then return end
  return self.componentMap[component.type]
end

return Entity
