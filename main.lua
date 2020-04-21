local Entity = require "Base/Entity"
local EntityManager = require "Base/EntityManager"

local RenderComponent = require "Components/RenderComponent"
local PositionComponent = require "Components/PositionComponent"
local KinematicsSystem = require "Systems/KinematicsSystem"
local RenderSystem = require "Systems/RenderSystem"

local entityManager = EntityManager:new({KinematicsSystem:new(), RenderSystem:new()})

for i = 1, 100 do
  local x, y = math.random(), math.random()
  entityManager:addEntity(
    Entity:new({
        PositionComponent:new(x, y, 1, i < 50),
        RenderComponent:new(),
      })
    )
end

function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end
end

function love.update(dt)
  entityManager:update(dt)
end

function love.draw()
  entityManager:draw()
end
