local Object = require "Base/Object"

local Component = Object:newChildClass('Component')

Component.createNewSimpleComponentType = function(type, ...)
  local newComponentType = Component:newChildClass(type)
  local requiredArgs = {...}
  newComponentType.new = function(...)
    local self = newComponentType
    local newInstance = newComponentType.parentClass.new(self)
    for k, v in pairs(requiredArgs) do
      local args = {...}
      assert(args[k], "Argument '" .. v .. "' is missing from '" .. type .. "' constructor.")
      newInstance[k] = args[k]
    end
    return newInstance
  end
  return newComponentType
end

return Component