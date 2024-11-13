describe("arrays.concatenate", function()
  arrays = require("arrays")

  it("returns an empty array when given two empty arrays", function()
    assert.same({}, arrays.concatenate({}, {}))
  end)

  it("returns an unchanged array when appending an empty array to it", function()
    assert.same({"foo", 42, "bar"}, arrays.concatenate({"foo", 42, "bar"}, {}))
  end)

  it("returns an unchanged array when appending it to an empty array", function()
    assert.same({"foo", 42, "bar"}, arrays.concatenate({}, {"foo", 42, "bar"}))
  end)

  it("concatenates two non-empty arrays", function()
    assert.same({"foo", 42, "bar", "baz", 0}, arrays.concatenate({"foo", 42, "bar"}, {"baz", 0}))
  end)
end)
