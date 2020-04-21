local Entity = require "Base/Entity"
local EntityManager = require "Base/EntityManager"

local PositionComponent = require "Components/PositionComponent"
local KinematicsSystem = require "Systems/KinematicsSystem"

local kinematicsSystem = KinematicsSystem:new(PositionComponent)
local entityManager = EntityManager:new({kinematicsSystem})

for i = 1, 1000 do
  local x, y = math.random(), math.random()
  local position = PositionComponent:new(x, y)
  entityManager:addEntity(Entity:new({position}))
end

kinematicsSystem:update()
