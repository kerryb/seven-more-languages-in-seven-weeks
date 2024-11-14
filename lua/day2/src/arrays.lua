local Arrays = {}

local function append(destination, source)
  for index = 1, #source do
    destination[#destination + 1] = source[index]
  end
end

function Arrays.concatenate(array_1, array_2)
  local result = {}

  append(result, array_1)
  append(result, array_2)

  return result
end

local function is_array(value)
  return type(value) == "table" and #value > 0 and value[#value + 1] == nil
end

-- set metatable for new global tables as they’re created (inspiration from
-- https://charlieharvey.org.uk/page/seven_more_languages_lua_day2)
local function set_table_metatable(table, key, value)
  if is_array(value) then
    setmetatable(value, {__add = Arrays.concatenate})
  end
  rawset(table, key, value)
end

setmetatable(_G, {__newindex = set_table_metatable})

return Arrays
