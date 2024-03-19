# str = '99,100,201,101,9999,2,5,6'

# arr = str.split(',')

# p arr

# new_arr = arr.map do |ar|
#   int_ar = ar.to_i
#   if int_ar > 100
#     int_ar.to_s
#   end

# end

# p new_arr.compact.sort!.reverse.join(" ")


str = '99,100,201,101,9999,2,5,6'

arr = str.split(',').map(&:to_i).select{ |num| num > 100 }.sort.reverse.join(' ')

p arr
