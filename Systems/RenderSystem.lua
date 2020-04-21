local System = require "Base/System"

local Components = require "../Components/ComponentList"

local RenderSystem = System:newChildClass('RenderSystem', {Components.Translation, Components.Render})

function RenderSystem:draw()
  local entityList = self.registeredEntities
  for i = 1, #entityList do
    local translationComponent = entityList[i]:getComponent(Components.Translation)
    love.graphics.points(translationComponent.x * 10, translationComponent.y * 10)
  end
end

return RenderSystem
