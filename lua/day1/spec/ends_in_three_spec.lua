describe("ends_in_three", function()
  mod = require("ends_in_three")

  it("is false for single digits below 3", function()
    assert.False(mod.ends_in_three(2))
  end)

  it("is false for single digits above 3", function()
    assert.False(mod.ends_in_three(4))
  end)

  it("is false for single digit multiples of 3 that aren’t 3", function()
    assert.False(mod.ends_in_three(6))
  end)

  it("is false for two-digit numbers that don’t end in 3", function()
    assert.False(mod.ends_in_three(42))
  end)

  it("is false for long numbers that don’t end in 3", function()
    assert.False(mod.ends_in_three(123456))
  end)

  it("is true for 3", function()
    assert.True(mod.ends_in_three(3))
  end)

  it("is true for two-digit numbers that end in 3", function()
    assert.True(mod.ends_in_three(43))
  end)

  it("is true for long numbers that end in 3", function()
    assert.True(mod.ends_in_three(1234553))
  end)
end)
