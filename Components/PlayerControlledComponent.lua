local Component = require "Base/Component"

local PlayerControlledComponent = Component:newChildClass('PlayerControlledComponent')

function PlayerControlledComponent:new(x, y)
  local o = PlayerControlledComponent.parentClass.new(self)
  o.x, o.y = x, y
  return o
end

return PlayerControlledComponent
