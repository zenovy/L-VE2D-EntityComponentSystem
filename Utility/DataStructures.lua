local Set = {}

function Set:new(items)
  local o = {}
  items = items or {}
  itemMap = {}
  for i, v in ipairs(items) do
    itemMap[v] = true
  end
  o.itemMap = itemMap
  return setmetatable(o, {__index = self})
end

function Set:has(item)
  return self.itemMap[item] ~= nil
end

function Set:add(item)
  self.itemMap[item] = true
end

function Set:remove(item)
  self.itemMap[item] = nil
end

function Set:each()
  return pairs(self.itemMap)
end

return {
  Set = Set,
}
