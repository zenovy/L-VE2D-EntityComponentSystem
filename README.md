# LOVE2D-EntityComponentSystem
EntityComponentSystem Implementation for LÖVE2D

This is an implementation of the Entity-Component-System paradigm that I decided to take a crack at on a sick day.

I'm still iterating on what works best, and the sample code in main.lua will likely be more up-to-date than this README, but here's the general idea:

## Components
```lua
-- Create a simple component with no fields (tag)
Component.createNewSimpleComponentType('PlayerControlComponent')

-- Create a simple component with required fields (e.g. x and y)
Component.createNewSimpleComponentType('PlayerControlComponent', 'x', 'y)
```

## Systems
```lua
-- Inherit from base System class and use required components to restrict Entities
--   e.g. PlayerMovementSystem will only move Entities with the PlayerControl component
local requiredComponents = {Components.Translation, Components.PlayerControl}
local PlayerMovementSystem = System:newChildClass('PlayerMovementSystem', requiredComponents)

-- Inherit System methods :update, :draw, or both to run on the corresponding callback
function PlayerMovementSystem:update(dt, entityList)
  for i = 1, #entityList do
    local translationComponent = entityList[i]:getComponent(Components.Translation)
    if love.keyboard.isDown('right') then
      translationComponent.x = translationComponent.x + dt
    end
  end
end
```

## Game
```lua
-- Instantiate entityManager and initial entities in love.load callback
function love.load()
  -- Pass in the relevant systems
  entityManager = EntityManager:new({KinematicsSystem, RenderSystem, PlayerMovementSystem})
  -- Create initial entities
  entityManager:addEntity(Entity:new({
    Components.Translation:new(0, 0),
    Components.Render:new({sprite = 'myHero.png'}),
  }))
end
```
