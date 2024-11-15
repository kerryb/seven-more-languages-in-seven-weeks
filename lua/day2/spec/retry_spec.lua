local Retry = require("retry")

describe("Retry.retry", function()
  it("returns the function result if it succeeds (doesn’t yield) immediately", function()
    assert.equals(42, Retry.retry(3, function() return 42 end))
  end)

  it("fails after <count> attempts if the function keeps failing", function()
    local fun = function()
      while true do
        coroutine.yield("nope")
      end
    end

    assert.has_error(function() Retry.retry(3, fun) end, "nope")
  end)

  it("returns successfully if the function succeeds within <count> attempts", function()
    local count = 1
    local fun = function()
      while count < 3 do
        count = count + 1
        coroutine.yield("Not there yet!")
      end

      return "I’ve run " .. count .. " times!"
    end

    assert.equals("I’ve run 3 times!", Retry.retry(3, fun))
  end)
end)
