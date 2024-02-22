def modules(mod)
  if mod > 25
    return false
  end

  (1..25).each { | number | p number if number % mod == 0 }
end

# modules(2)
modules(27)

def modulus(mod)
  return false if mod > 25

  1.upto(25) do |number|
    puts number if number % mod == 0
  end
end

modulus(4)

