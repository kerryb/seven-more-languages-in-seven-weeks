local arrays = {}

function arrays.concatenate(array_1, array_2)
  local result = array_1

  for index = 1, #array_2 do
    result[#result + 1] = array_2[index]
  end

  return result
end

return arrays
