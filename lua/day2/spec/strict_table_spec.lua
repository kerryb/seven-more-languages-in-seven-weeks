StrictTable = require("strict_table")

describe("StrictTable read access", function()

  it("returns the value if the key exists", function()
    local table = StrictTable.new({foo = 42})
    assert.equals(42, table.foo)
  end)

  it("errors if the key does not exist", function()
    local table = StrictTable.new({foo = 42})
    assert.has_error(function() return table.bar end, "Invalid key: bar")
  end)
end)

describe("StrictTable write access", function()

  it("stores the value if the key does not already exist", function()
    local table = StrictTable.new()
    table.foo = 42
    assert.equals(42, table.foo)
  end)

  it("errors if the key already exists", function()
    local table = StrictTable.new({foo = 42})
    assert.has_error(function() table.foo = 0 end, "Duplicate key: foo")
  end)
end)
