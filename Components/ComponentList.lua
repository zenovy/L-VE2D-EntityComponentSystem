local Component = require "Base/Component"

local ComponentList = {
  BoxCollision = Component.createNewSimpleComponentType('BoxCollisionComponent', {'x', 'y', 'width', 'height'}),
  Disappearing = Component.createNewSimpleComponentType('DisappearingComponent', {'timeToDisappear'}),
  PlayerControl = Component.createNewSimpleComponentType('PlayerControlComponent', {inputSensitivity = 1, isControllable = true}),
  Rectangle = Component.createNewSimpleComponentType('RectangleComponent', {'width', 'height'}),
  Render = Component.createNewSimpleComponentType('RenderComponent', {isShown = true}),
  Translation = Component.createNewSimpleComponentType('TranslationComponent', {x = 0, y = 0, vx = 0, vy = 0, ax = 0, ay = 0}),
}

return ComponentList
