is_prime = require("src/is_prime")
ends_in_three = require("src/ends_in_three")

local remaining = tonumber(arg[1])
local candidate = 3

while remaining > 0 do
  if is_prime.is_prime(candidate) and ends_in_three.ends_in_three(candidate) then
    print(candidate)
    remaining = remaining - 1
  end
  -- Obviously we could just add ten and remove the “ends in three” check, but
  -- that feels like cheating.
  candidate = candidate + 1
end
