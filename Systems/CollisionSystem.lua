local System = require "Base/System"

local Components = require "../Components/ComponentList"

local CollisionSystem = System:newChildClass('CollisionSystem', {Components.BoxCollision})

function CollisionSystem:update(dt)
  local entityList = self:getRegisteredEntities()
  for i = 1, #entityList do
    local boxCollisionComponent = entityList[i]:getComponent(Components.BoxCollision)
    for j = i + 1, #entityList do
      local otherBoxCollisionComponent = entityList[j]:getComponent(Components.BoxCollision)
      local isCollision = checkBoxCollision(boxCollisionComponent, otherBoxCollisionComponent)
      boxCollisionComponent.isCollision = isCollision
      otherBoxCollisionComponent.isCollision = isCollision
    end
  end
end

function checkBoxCollision(box1, box2)
  return box1.x < box2.x + box2.width and box1.x + box1.width > box2.x and box1.y < box2.y + box2.height and box1.y + box1.height > box2.y
end

return CollisionSystem
