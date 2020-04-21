local Object = {}

function Object:newChildClass(type)
   self.__index = self
   return
      setmetatable({
         type = type or "none",
         parentClass = self,
         __tostring = self.__tostring
      }, self)
end

function Object:new()
   self.__index = self
   return setmetatable({}, self)
end

return Object