# (1..25).each { |num| puts num if num % 5 == 0 }

1.upto(25) do |num|
  if num % 5 == 0
    puts num
  end
end
