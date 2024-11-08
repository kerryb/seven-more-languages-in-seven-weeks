describe("is_prime", function()
  mod = require("is_prime")

  it("is false for 0", function()
    assert.False(mod.is_prime(0))
  end)

  it("is false for 1", function()
    assert.False(mod.is_prime(1))
  end)

  it("is true for 2", function()
    assert.True(mod.is_prime(2))
  end)

  it("is true for 3", function()
    assert.True(mod.is_prime(3))
  end)

  it("is false for 4", function()
    assert.False(mod.is_prime(4))
  end)

  it("is true for 5", function()
    assert.True(mod.is_prime(5))
  end)

  it("is false for 10", function()
    assert.False(mod.is_prime(10))
  end)

  it("is true for 11", function()
    assert.True(mod.is_prime(11))
  end)

  it("is false for 2^31", function()
    assert.False(mod.is_prime(2 ^ 31))
  end)

  it("is true for 2^31 - 1", function()
    assert.True(mod.is_prime(2 ^ 31 - 1))
  end)
end)
