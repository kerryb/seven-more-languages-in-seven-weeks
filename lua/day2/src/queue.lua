local Queue = {}

function Queue:new()
  local queue = {}
  setmetatable(queue, self)
  self.__index = self
  return queue
end

function Queue:remove()
end

return Queue
