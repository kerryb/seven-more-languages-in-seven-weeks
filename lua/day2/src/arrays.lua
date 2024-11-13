local arrays = {}

local function append(destination, source)
  for index = 1, #source do
    destination[#destination + 1] = source[index]
  end
end

function arrays.concatenate(array_1, array_2)
  local result = {}

  append(result, array_1)
  append(result, array_2)

  return result
end

return arrays
