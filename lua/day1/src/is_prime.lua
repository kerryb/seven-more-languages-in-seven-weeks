local mod = {}

local has_no_odd_factor_in_range
has_no_odd_factor_in_range = function(number, range_start, range_end)
  if range_start > range_end then
    return true
  elseif number % range_start == 0 then
    return false
  else
    return has_no_odd_factor_in_range(number, range_start + 2, range_end)
  end
end

function mod.is_prime(number)
  return number == 2 or number > 2 and number % 2 > 0 and has_no_odd_factor_in_range(number, 3, number ^ 0.5)
end

return mod
