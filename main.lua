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
          Components.Translation:new(x, y),
          Components.Render:new(true),
          Components.PlayerControl:new(),
          Components.Disappearing:new({timeToDisappear = 1})
        })
      )
    entityManager:addEntity(
      Entity:new({
          Components.Translation:new(x, y, 10, 5, -1, -1),
          Components.Render:new(true),
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
