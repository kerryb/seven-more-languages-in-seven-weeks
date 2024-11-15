local Queue = {}

function Queue:new()
  -- OK, it’ll overflow after 2^1024 items, but that’s probably fine.
  local queue = {first = 1, last = 0}
  setmetatable(queue, self)
  self.__index = self
  return queue
end

function Queue:add(item)
  self[self.last + 1] = item
  self.last = self.last + 1
end

function Queue:remove()
  self.first = self.first + 1
  return self[self.first - 1]
end

return Queue
