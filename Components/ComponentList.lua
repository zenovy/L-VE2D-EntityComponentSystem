local Component = require "Base/Component"

local TranslationComponent = Component:newChildClass('TranslationComponent')

function TranslationComponent:new(x, y, vx, vy, ax, ay)
  local o = TranslationComponent.parentClass.new(self)
  o.x, o.y = x or 0, y or y
  o.vx, o.vy = vx or 0, vy or 0 
  o.ax, o.ay = ax or 0, ay or 0
  return o
end

local ComponentList = {
  PlayerControl = Component.createNewSimpleComponentType('PlayerControlComponent'),
  Render = Component.createNewSimpleComponentType('RenderComponent'),
  Translation = TranslationComponent,
}

return ComponentList
