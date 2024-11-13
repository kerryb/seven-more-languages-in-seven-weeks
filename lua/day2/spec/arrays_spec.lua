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

  it("does not mutate the first array argument", function()
    local array = {"foo", 42}
    arrays.concatenate(array, {"baz", 0})
    assert.same({"foo", 42}, array)
  end)

  it("does not mutate the second array argument", function()
    local array = {"foo", 42}
    arrays.concatenate({"baz", 0}, array)
    assert.same({"foo", 42}, array)
  end)
end)
