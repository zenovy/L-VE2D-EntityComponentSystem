local Object = require "Base/Object"

local Component = Object:newChildClass('Component')

-- requiredFields: a list of fields that are required for the component to work
  -- e.g. {'x', 'y'}
-- optionalFields: a list of fields that are optional for the component
  -- e.g. {'dx', 'dy'}
-- defaults: an associative array of field names -> default values, if the component is not instantiated with them
  -- e.g. {'x': 0, 'y': 0}
Component.createNewSimpleComponentType = function(type, requiredFields, optionalFields, defaults)
  requiredFields, optionalFields, defaults = requiredFields or {}, optionalFields or {}, defaults or {}
  local newComponentType = Component:newChildClass(type)
  newComponentType.new = function(self, ...)
    local newInstance = newComponentType.parentClass.new(self)
    local args = {...}

    local argCoverage = {}
    for k, v in pairs(defaults) do argCoverage[k] = v end
    for k, v in pairs(args) do argCoverage[k] = v end
    for i = 1, #requiredFields do
      local requiredField = requiredFields[i]
      assert(argCoverage[requiredField], "Failed to instantiate component '" .. type .. "': missing argument '" .. requiredField .. "'.")
      newInstance[requiredField] = argCoverage[requiredField]
    end

    return newInstance
  end
  return newComponentType
end

return Component