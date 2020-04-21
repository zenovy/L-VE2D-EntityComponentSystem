local Component = require "Base/Component"

local PositionComponent = Component:newChildClass('PositionComponent')

function PositionComponent:new(x, y, dx, isMove)
  local o = PositionComponent.parentClass.new(self)
  o.x, o.y, o.dx, o.isMove = x, y, dx, isMove
  return o
end

return PositionComponent
