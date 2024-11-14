Arrays = require("arrays")

describe("Arrays.concatenate", function()
  it("returns an empty array when given two empty Arrays", function()
    assert.same({}, Arrays.concatenate({}, {}))
  end)

  it("returns an unchanged array when appending an empty array to it", function()
    assert.same({"foo", 42, "bar"}, Arrays.concatenate({"foo", 42, "bar"}, {}))
  end)

  it("returns an unchanged array when appending it to an empty array", function()
    assert.same({"foo", 42, "bar"}, Arrays.concatenate({}, {"foo", 42, "bar"}))
  end)

  it("concatenates two non-empty Arrays", function()
    assert.same({"foo", 42, "bar", "baz", 0}, Arrays.concatenate({"foo", 42, "bar"}, {"baz", 0}))
  end)

  it("does not mutate the first array argument", function()
    local array = {"foo", 42}
    Arrays.concatenate(array, {"baz", 0})
    assert.same({"foo", 42}, array)
  end)

  it("does not mutate the second array argument", function()
    local array = {"foo", 42}
    Arrays.concatenate({"baz", 0}, array)
    assert.same({"foo", 42}, array)
  end)
end)

describe("Arrays, when loaded/required", function()
  it("allows two arrays to be concatenated using the + operator", function()
    -- Busted isolates globals, so force them into the actual _G table.This is
    -- all very unpleasant.
    _G.array_1 = {"foo", 42, "bar"}
    _G.array_2 = {"baz", 0}
    assert.same({"foo", 42, "bar", "baz", 0}, array_1 + array_2)
  end)

  it("does not interfere with numeric addition", function()
    assert.equals(4, 2 + 2)
  end)

  it("does not attempt to concatenate tables if the first one is not an array", function()
    -- Busted isolates globals, so force them into the actual _G table.This is
    -- all very unpleasant.
    _G.table_1 = {foo = 42}
    _G.array_1 = {"baz", 0}
    assert.has_error(function() return table_1 + array_1 end, "attempt to perform arithmetic on a table value (global 'table_1')")
  end)

  it("does not attempt to concatenate tables if the second one is not an array", function()
    -- Busted isolates globals, so force them into the actual _G table.This is
    -- all very unpleasant.
    _G.table_1 = {foo = 42}
    _G.array_1 = {"baz", 0}
    assert.has_error(function() return array_1 + table_1 end, "attempt to perform arithmetic on a table value (global 'array_1')")
  end)
end)
