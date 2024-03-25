fruits = [
  {apple: 100, orange: 50, mango: 30},
  {apple: 200, orange: 250, mango: 230},
  {apple: 300, orange: 300, mango: 330},
]

p fruits[0].key(50)

# total = 0

# fruits.each do |fruit|
#   total += fruit[:apple]
# end

# p total

total = fruits.inject(0) {|init, h| init + h[:apple]}
p total
