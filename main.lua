local Entity = require "Base/Entity"
local EntityManager = require "Base/EntityManager"

local Components = require "Components/ComponentList"

local KinematicsSystem = require "Systems/KinematicsSystem"
local RenderSystem = require "Systems/RenderSystem"
local PlayerMovementSystem = require "Systems/PlayerMovementSystem"
local DissapearingSystem = require "Systems/DissapearingSystem"

local entityManager
function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end

  entityManager = EntityManager:new({DissapearingSystem, KinematicsSystem, RenderSystem, PlayerMovementSystem})

  for i = 1, 100 do
    local x, y = i, i
    entityManager:addEntity(
      Entity:new({
          Components.Translation:new({x = x, y = y}),
          Components.Render:new({isShown = true}),
          Components.PlayerControl:new(),
        })
      )
    entityManager:addEntity(
      Entity:new({
          Components.Translation:new({x = x, y = y, vx = 10, vy = 5, ax = -1, ay = -1}),
          Components.Render:new({isShown = true}),
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
