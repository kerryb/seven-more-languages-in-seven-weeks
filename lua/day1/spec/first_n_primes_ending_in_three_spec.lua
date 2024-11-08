describe("first_n_primes_ending_in_3", function()
  it("prints the … well, you can probably guess", function()
    local f = io.popen("lua src/first_n_primes_ending_in_3.lua 10")
    output = f:read("*all")
    f:close()
    assert.are.equal([[
3
13
23
43
53
73
83
103
113
163
]], output)
  end)
end)
