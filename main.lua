local PositionComponent = require "Components/PositionComponent"
local KinematicsSystem = require "Systems/KinematicsSystem"
local Entity = require "Base/Entity"

local kinematicsSystem = KinematicsSystem:new(PositionComponent)

local entityList = {}
for i = 1, 1000 do
  local x, y = math.random(), math.random()
  local position = PositionComponent:new(x, y)
  table.insert(entityList, Entity:new({position}))
end

kinematicsSystem:update(entityList)
