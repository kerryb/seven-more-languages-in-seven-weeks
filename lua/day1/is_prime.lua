function is_prime(n)
  local prime = true
  for i = 2, n/2 do
    if n % i == 0 then
      prime = false
      break
    end
  end
  return prime
end

print(is_prime(42))
print(is_prime(17))
