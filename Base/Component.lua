local Object = require "Base/Object"

local Component = Object:newChildClass('Component')

-- requiredFields: a list of fields that are required for the component to work
  -- e.g. {x = 0, y = 0}
-- optionalFields: a list of fields that are optional for the component
  -- e.g. {'dx', 'dy'}
Component.createNewSimpleComponentType = function(typeName, requiredFields, optionalFields)
  requiredFields, optionalFields = requiredFields or {}, optionalFields or {}
  local newComponentType = Component:newChildClass(typeName)
  newComponentType.new = function(self, ...)
    local newInstance = newComponentType.parentClass.new(self)
    local funcArgs = {...}
    local args = funcArgs[1] or {}

    -- TODO optional fields should have defaults? Not sure...
    for k, v in pairs(requiredFields) do
      -- Add fields with defaults
      if not (type(k) == 'number') then
        newInstance[k] = args[k] or v
      end
    end
    for k, v in ipairs(requiredFields) do
      -- Add fields without defaults from instantiating args
      assert(args[v], "Failed to instantiate component '" .. typeName .. "': missing argument '" .. v .. "'.")
      newInstance[v] = args[v]
    end

    return newInstance
  end
  return newComponentType
end

return Component