arr = ["Ms.  Tanaka", "Mr.   Suzuki", "Ms.   Akagi", "Mrs.Yoko"]

new_arr = arr.select{ |v| v.start_with?("Ms.") }
new_arr2 = arr.select{ |v| v.end_with?("i") }

p new_arr
p new_arr2
