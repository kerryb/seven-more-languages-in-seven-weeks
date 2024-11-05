describe("ends_in_three", function()
  require("ends_in_three")

  it("is false for single digits below 3", function()
    assert.False(ends_in_three(2))
  end)

  it("is false for single digits above 3", function()
    assert.False(ends_in_three(4))
  end)

  it("is false for single digit multiples of 3 that aren’t 3", function()
    assert.False(ends_in_three(6))
  end)

  it("is true for 3", function()
    assert.True(ends_in_three(3))
  end)
end)
