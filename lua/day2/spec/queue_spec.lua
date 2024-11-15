local Queue = require("queue")

describe("Queue", function()
  it ("returns nil when removing from an empty queue", function()
    local queue = Queue:new()
    assert.is_nil(queue:remove())
  end)
end)
