arr = [1, "a", 2, "b", "c", 3, "4", "5", "6"]

new_arr = arr.select{ |v| v.to_s =~ /^[0-9]+$/ }

p new_arr
