local Entity = require "Base/Entity"
local EntityManager = require "Base/EntityManager"

local RenderComponent = require "Components/RenderComponent"
local TranslationComponent = require "Components/TranslationComponent"
local PlayerControlledComponent = require "Components/PlayerControlledComponent"

local KinematicsSystem = require "Systems/KinematicsSystem"
local RenderSystem = require "Systems/RenderSystem"
local PlayerMovementSystem = require "Systems/PlayerMovementSystem"

local entityManager
function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end

  entityManager = EntityManager:new({KinematicsSystem:new(), RenderSystem:new(), PlayerMovementSystem:new()})

  for i = 1, 100 do
    local x, y = i, i
    entityManager:addEntity(
      Entity:new({
          TranslationComponent:new(x, y),
          RenderComponent:new(),
          PlayerControlledComponent:new(),
        })
      )
    entityManager:addEntity(
      Entity:new({
          TranslationComponent:new(x, y, 10, 5, -1, -1),
          RenderComponent:new(),
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
