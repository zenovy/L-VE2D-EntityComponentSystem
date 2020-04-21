local Object = require "Base/Object"

local Component = Object:newChildClass('Component')

Component.createNewSimpleComponentType = function(type, ...)
  local newComponentType = Component:newChildClass(type)
  -- TODO needs to support passing in default values
  local requiredArgs = {...}
  newComponentType.new = function(self, ...)
    local newInstance = newComponentType.parentClass.new(self)
    for k, v in pairs(requiredArgs) do
      local args = {...}
      assert(args[k], "Argument '" .. v .. "' is missing from '" .. type .. "' constructor.")
      newInstance[v] = args[k]
    end
    return newInstance
  end
  return newComponentType
end

return Component