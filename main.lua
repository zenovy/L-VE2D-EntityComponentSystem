local Entity = require "Base/Entity"
local EntityManager = require "Base/EntityManager"

local RenderComponent = require "Components/RenderComponent"
local PositionComponent = require "Components/PositionComponent"
local MoveComponent = require "Components/MoveComponent"
local KinematicsSystem = require "Systems/KinematicsSystem"
local RenderSystem = require "Systems/RenderSystem"

local entityManager
function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end

  entityManager = EntityManager:new({KinematicsSystem:new(), RenderSystem:new()})

  for i = 1, 100 do
    local x, y = i, i
    entityManager:addEntity(
      Entity:new({
          PositionComponent:new(x, y),
          RenderComponent:new(),
        })
      )
    entityManager:addEntity(
      Entity:new({
          PositionComponent:new(x, y),
          RenderComponent:new(),
          MoveComponent:new(10, 5, -1, -1),
        })
      )
  end
end

function love.update(dt)
  entityManager:update(dt)
end

function love.draw()
  entityManager:draw()
end
