local Queue = {}

function Queue:new()
  local queue = {}
  setmetatable(queue, self)
  self.__index = self
  return queue
end

function Queue:add(item)
  self.item = item
end

function Queue:remove()
  item = self.item
  self.item = nil
  return item
end

return Queue
