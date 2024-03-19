# val = []
# 1.upto(20) do
#   val << rand(1..10)
# end

# p val

# p val.uniq!.sort!

# val = []

# 1.upto(20) do
#   rand_val = rand(1..10)
#   unless val.include?(rand_val)
#     val << rand_val
#   end
# end

# p val.size
# p val.sort!

require 'set'
set_v = Set[]
1.upto(20) do
  set_v << rand(1..10)
end

p set_v.to_a.sort!
