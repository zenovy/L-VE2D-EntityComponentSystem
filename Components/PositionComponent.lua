local Component = require "Base/Component"

local PositionComponent = Component:newChildClass('PositionComponent')

function PositionComponent:new(x, y)
  local o = PositionComponent.parentClass.new(self)
  o.x, o.y = x, y
  return o
end

return PositionComponent
