dofile("ends_in_three.lua")
dofile("is_prime.lua")

function print_primes_ending_in_three(n)
  local number_found = 0
  local candidate = 2

  while number_found < n do
    if is_prime(candidate) and ends_in_three(candidate) then
      print(candidate)
      number_found = number_found + 1
    end
    candidate = candidate + 1
  end
end

print_primes_ending_in_three(10)
