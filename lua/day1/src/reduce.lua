local mod = {}

function mod.reduce(max, init, f)
  local acc = init
  local n = 1
  while n <= max do
    acc = f(n, acc)
    n = n + 1
  end
  return acc
end

return mod
