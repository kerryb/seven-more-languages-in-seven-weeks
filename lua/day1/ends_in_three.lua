function ends_in_three(n)
  if n % 10 == 3 then
    return true
  else
    return false
  end
end

print(ends_in_three(0))
print(ends_in_three(3))
print(ends_in_three(123))
print(ends_in_three(999))
