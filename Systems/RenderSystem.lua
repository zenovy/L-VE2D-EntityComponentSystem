local System = require "Base/System"

local Components = require "../Components/ComponentList"

local RenderSystem = System:newChildClass('RenderSystem', {Components.Translation, Components.Render})

function RenderSystem:draw()
  local entityList = self:getRegisteredEntities()
  for i = 1, #entityList do
    local renderComponent = entityList[i]:getComponent(Components.Render)
    if renderComponent.isShown then
      local translationComponent = entityList[i]:getComponent(Components.Translation)
      love.graphics.points(translationComponent.x * 10, translationComponent.y * 10)
    end
  end
end

return RenderSystem
