local Component = require "Base/Component"

local MoveComponent = Component:newChildClass('MoveComponent')

function MoveComponent:new(vx, vy, ax, ay)
  local o = MoveComponent.parentClass.new(self)
  o.vx, o.vy, o.ax, o.ay = vx or 0, vy or 0, ax or 0, ay or 0
  return o
end

return MoveComponent
