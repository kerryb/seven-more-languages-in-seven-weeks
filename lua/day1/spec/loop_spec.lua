describe("for_loop", function()
  loop = require("loop")

  it("calls a function for each integer in a range", function()
    local number = 2
    loop.for_loop(6, 10, function(n)
      number = number + n
    end)
    assert.equal(42, number)
  end)
end)
