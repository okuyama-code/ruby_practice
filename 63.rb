# ここからatCoder A or B

a, b = gets.chomp.split.map(&:to_i)

sum = a + b


result = (0..9).find { |num| sum != num }


p result
