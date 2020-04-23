local System = require "Base/System"

local Components = require "../Components/ComponentList"

local CollisionSystem = System:newChildClass('CollisionSystem', {Components.BoxCollision, Components.Translation})

function CollisionSystem:update(dt)
  local entityList = self:getRegisteredEntities()
  for i = 1, #entityList do
    local boxTranslationComponent = entityList[i]:getComponent(Components.Translation)
    local boxCollisionComponent = entityList[i]:getComponent(Components.BoxCollision)
    local boundingBox = generateBoundingBox(boxTranslationComponent.x + boxCollisionComponent.x, boxTranslationComponent.y + boxCollisionComponent.y, boxCollisionComponent.width, boxCollisionComponent.height)
    for j = i + 1, #entityList do
      local otherBoxTranslationComponent = entityList[j]:getComponent(Components.Translation)
      local otherBoxCollisionComponent = entityList[j]:getComponent(Components.BoxCollision)
      local otherBoundingBox = generateBoundingBox(otherBoxTranslationComponent.x + otherBoxCollisionComponent.x, otherBoxTranslationComponent.y + otherBoxCollisionComponent.y, otherBoxCollisionComponent.width, otherBoxCollisionComponent.height)

      local isCollision = checkBoxCollision(boundingBox, otherBoundingBox)
      boxCollisionComponent.isCollision = isCollision
      otherBoxCollisionComponent.isCollision = isCollision
    end
  end
end

function generateBoundingBox(x, y, width, height)
  return {x = x, y = y, width = width, height = height}
end

function checkBoxCollision(box1, box2)
  return box1.x < box2.x + box2.width and box1.x + box1.width > box2.x and box1.y < box2.y + box2.height and box1.y + box1.height > box2.y
end

return CollisionSystem
