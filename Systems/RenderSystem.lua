local System = require "Base/System"
local TranslationComponent = require "../Components/TranslationComponent"
local RenderComponent = require "../Components/RenderComponent"

local RenderSystem = System:newChildClass('RenderSystem', {TranslationComponent, RenderComponent})

function RenderSystem:draw()
  local entityList = self.registeredEntities
  for i = 1, #entityList do
    local translationComponent = entityList[i]:getComponent('TranslationComponent')
    love.graphics.points(translationComponent.x * 10, translationComponent.y * 10)
  end
end

return RenderSystem
