local Object = {}

function Object:newChildClass(type)
  assert(type, "Failed to instantiate unknown class due to missing type name")
  self.__index = self
  return
    setmetatable({
      type = type,
      parentClass = self,
      __tostring = self.__tostring
    }, self)
end

function Object:new()
   self.__index = self
   return setmetatable({}, self)
end

return Object
