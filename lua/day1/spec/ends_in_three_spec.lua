describe("ends_in_three", function()
  require("ends_in_three")

  it("is false for single digits below 3", function()
    assert.False(ends_in_three(2))
  end)
end)
