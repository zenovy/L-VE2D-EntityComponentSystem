local Component = require "Base/Component"

local CollisionComponent = Component:newChildClass('CollisionComponent')

local BOX_COLLIDER_REQUIRED_FIELDS = {'x', 'y', 'width', 'height'}

function CollisionComponent:new(type, size)
  size = size or {}
  local o = CollisionComponent.parentClass.new(self)
  if type == 'BoxCollider' then
    for i = 1, #BOX_COLLIDER_REQUIRED_FIELDS do
      local requiredField = BOX_COLLIDER_REQUIRED_FIELDS[i]
      assert(size[requiredField], "BoxCollider instantiated with no " .. requiredField)
    end
  end
  o.type = type
  o.size = size
  return o
end

return CollisionComponent