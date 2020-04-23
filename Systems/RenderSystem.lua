local System = require "Base/System"

local Components = require "../Components/ComponentList"

local RenderSystem = System:newChildClass('RenderSystem', {Components.Translation, Components.Render})

function RenderSystem:draw()
  local entityList = self:getRegisteredEntities()
  for i = 1, #entityList do
    local renderComponent = entityList[i]:getComponent(Components.Render)
    if renderComponent.isShown then
      local translationComponent = entityList[i]:getComponent(Components.Translation)
      local rectangleComponent = entityList[i]:getComponent(Components.Rectangle)
      if rectangleComponent then
        local fill = entityList[i]:getComponent(Components.BoxCollision) and entityList[i]:getComponent(Components.BoxCollision).isCollision
        love.graphics.rectangle((fill and 'fill') or 'line', translationComponent.x, translationComponent.y, rectangleComponent.width, rectangleComponent.height)
      else
        love.graphics.points(translationComponent.x * 10, translationComponent.y * 10)
      end
    end
  end
end

return RenderSystem
