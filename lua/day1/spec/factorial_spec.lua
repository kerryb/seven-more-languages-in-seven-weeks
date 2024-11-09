describe("factorial", function()
  factorial = require("factorial")

  it("calculates the factorial of 1", function()
    assert.equal(1, factorial.factorial(1))
  end)

  it("calculates the factorial of 10", function()
    assert.equal(3628800, factorial.factorial(10))
  end)
end)
