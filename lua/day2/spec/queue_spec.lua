local Queue = require("queue")

describe("Queue", function()
  it ("returns nil when removing from an empty queue", function()
    local queue = Queue:new()
    assert.is_nil(queue:remove())
  end)

  it ("returns an item that was added", function()
    local queue = Queue:new()
    queue:add(42)
    assert.equals(42, queue:remove())
  end)
end)
