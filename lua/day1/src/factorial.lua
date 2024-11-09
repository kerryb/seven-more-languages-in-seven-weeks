local mod = {}
local reduce = require("reduce")

function mod.factorial(n)
  return reduce.reduce(n, 1, function(a, b) return a * b end)
end

return mod
