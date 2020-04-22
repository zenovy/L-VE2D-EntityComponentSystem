local Object = require "Base/Object"

local Component = Object:newChildClass('Component')

-- requiredFields: a list of fields that are required for the component to work
  -- e.g. {'x', 'y'}
-- optionalFields: a list of fields that are optional for the component
  -- e.g. {'dx', 'dy'}
-- defaults: an associative array of field names -> default values, if the component is not instantiated with them
  -- e.g. {'x': 0, 'y': 0}
Component.createNewSimpleComponentType = function(typeName, requiredFields, optionalFields)
  requiredFields, optionalFields, defaults = requiredFields or {}, optionalFields or {}, defaults or {}
  local newComponentType = Component:newChildClass(typeName)
  newComponentType.new = function(self, ...)
    local newInstance = newComponentType.parentClass.new(self)
    local funcArgs = {...}
    local args = funcArgs[1]

    for k, v in pairs(requiredFields) do
      -- Add fields with defaults
      if not (type(k) == 'number') then newInstance[k] = v end
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