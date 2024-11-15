local Retry = require("retry")

describe("Retry.retry", function()
  it("returns the function result if it succeeds (doesn’t yield) immediately", function()
    assert.equals(42, Retry.retry(3, function() return 42 end))
  end)
end)
