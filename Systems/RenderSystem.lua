local System = require "Base/System"
local PositionComponent = require "../Components/PositionComponent"

local RenderSystem = System:newChildClass('RenderSystem', {PositionComponent, RenderComponent})

function RenderSystem:draw()
  local entityList = self.registeredEntities
  for i = 1, #entityList do
    local positionComponent = entityList[i]:getComponent('PositionComponent')
    love.graphics.points(positionComponent.x * 100, positionComponent.y * 100)
  end
end

return RenderSystem
