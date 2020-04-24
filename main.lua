local Entity = require "Base/Entity"
local EntityManager = require "Base/EntityManager"

local Components = require "Components/ComponentList"

local KinematicsSystem = require "Systems/KinematicsSystem"
local RenderSystem = require "Systems/RenderSystem"
local PlayerMovementSystem = require "Systems/PlayerMovementSystem"
local DissapearingSystem = require "Systems/DissapearingSystem"
local CollisionSystem = require "Systems/CollisionSystem"

local entityManager
function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end

  entityManager = EntityManager:new({CollisionSystem, DissapearingSystem, KinematicsSystem, RenderSystem, PlayerMovementSystem})

  entityManager:addEntity(
    Entity:new({
      Components.Translation:new({x = 10, y = 10}),
      Components.Render:new(),
      Components.Rectangle:new({width = 20, height = 20}),
      Components.PlayerControl:new({inputSensitivity = 50}),
      Components.BoxCollision:new({x = 0, y = 0, width = 20, height = 20}),
    }))
  entityManager:addEntity(
    Entity:new({
      Components.Translation:new({x = 50, y = 50}),
      Components.Render:new(),
      Components.Rectangle:new({width = 20, height = 20}),
      Components.BoxCollision:new({x = -15, y = -15, width = 50, height = 50}),
    }))
  entityManager:addEntity(
    Entity:new({
      Components.Translation:new({x = 100, y = 100}),
      Components.Render:new(),
      Components.Rectangle:new({width = 20, height = 20}),
      Components.BoxCollision:new({x = 0, y = 0, width = 20, height = 20}),
    }))
--  for i = 1, 100 do
--    local x, y = i, i
--    entityManager:addEntity(
--      Entity:new({
--          Components.Translation:new({x = x, y = y}),
--          Components.Render:new(),
--          Components.PlayerControl:new(),
--        })
--      )
--    entityManager:addEntity(
--      Entity:new({
--          Components.Translation:new({x = x, y = y, vx = 10, vy = 5, ax = -1, ay = -1}),
--          Components.Render:new(),
--        })
--      )
--  end
end

function love.update(dt)
  entityManager:update(dt)
end

function love.draw()
  entityManager:draw()
end
