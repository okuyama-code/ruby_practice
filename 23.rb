arr = [1,2,3,4,5]

# new_arr = arr.map do |a|
#   a * 2
# end

# p new_arr

# arr.map! do |a|
#   a * 2
# end

# p arr

new_arr = arr.map{ |v| v * 2 }

p new_arr

arr.map!{ |v| v*2 }
p arr
