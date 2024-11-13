local StrictTable = {}

-- Used as an opaque key to access the table’s actual contents
local index = {}

local strict_read = function(table, key)
  value = table[index][key]
  if value == nil then
    error("Invalid key: " .. key)
  else
    return value
  end
end

local strict_write = function(table, key, value)
  if value ~= nil and table[index][key] ~= nil then
    error("Duplicate key: " .. key)
  else
    table[index][key] = value
  end
end

local mt = {
  __index = strict_read,
  __newindex = strict_write
}

StrictTable.new = function(table)
  return setmetatable({[index] = table or {}}, mt)
end

return StrictTable
