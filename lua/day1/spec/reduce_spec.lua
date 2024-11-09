describe("reduce", function()
  reduce = require("reduce")

  it("reduces over n in 1..max, starting with init, with function f(n, acc)", function()
    local function add(a, b)
      return a + b
    end

    assert.equal(15, reduce.reduce(5, 0, add))
  end)
end)
