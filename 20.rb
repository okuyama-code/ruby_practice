line  = gets.split(' ').map(&:to_i)

a_arr = (1..line[0]).select { |i| line[0] % i == 0 }
b_arr = (1..line[1]).select { |i| line[1] % i == 0 }

result = (a_arr & b_arr).reverse

puts result[line[2] - 1]

