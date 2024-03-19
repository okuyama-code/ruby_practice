require 'set'
v_1 = [1,2,3,4,5,8,9]
v_2 = [9,7,6,5,4]

set_v1 = Set[*v_1]
set_v2 = Set[*v_2]

anser =  set_v1 ^ set_v2

p anser.to_a.sort!

# p v_1 ^ v_2
