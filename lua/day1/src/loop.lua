local mod = {}

function mod.for_loop(a, b, f)
  local n = a
  while n <= b do
    f(n)
    n = n + 1
  end
end

return mod
