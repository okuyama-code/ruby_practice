arr = ["ruby", "php", "python", "javaScript"]

# new_arr = arr.sort_by{ |lang| lang.length }

# p new_arr

# 破壊的メソッドを使うとき
arr.sort_by!{ |lang| lang.length }

p arr
