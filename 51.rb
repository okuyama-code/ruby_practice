def display_number
  (1..5).each do |num|
    puts num
  end
end

display_number

def sum_number
  v = 0

  (1..5).each do |num|
    v += num
  end
  puts v
end

sum_number

def multiply_number
  v = 1

  (1..5).each do |num|
    v *= num
  end
  puts v
end

multiply_number
