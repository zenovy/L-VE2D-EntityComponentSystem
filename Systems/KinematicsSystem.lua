local System = require "Base/System"
local PositionComponent = require "../Components/PositionComponent"

local KinematicsSystem = System:newChildClass('KinematicsSystem')

function KinematicsSystem:run(entityList)
  local sum = {0, 0}
  for i = 1, #entityList do
    local component = entityList[i]:getComponent(PositionComponent.type)
    print('Entity #' .. tostring(entityList[i].id) .. ' Position = (' .. tostring(component.x) .. ', ' .. tostring(component.y) .. ')')
    sum[1] = sum[1] + component.x
    sum[2] = sum[2] + component.y
  end
  if #entityList > 0 then
    sum[1] = sum[1] / #entityList
    sum[2] = sum[2] / #entityList
    print('Average position: (' .. tostring(sum[1]) .. ', ' .. tostring(sum[2]) .. ')')
  end
end

return KinematicsSystem
