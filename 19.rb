arr = %w(ruby php python java) # ["ruby", "php", "python", "java"]

# arr2 = arr.map do |a|
#   a.capitalize
# end

# p arr #["ruby", "php", "python", "java"]
# p arr2 # ["Ruby", "Php", "Python", "Java"]

# new_arr = []
# arr.each do |lang|
#   new_arr << lang.capitalize
# end

# p new_arr

# 指定された obj を自身の末尾に破壊的に追加します。

# 例

# ary = [1]
# ary << 2
# p ary      # [1, 2]
# ary = [1]
# ary << 2
# p ary      # [1, 2]

# またこのメソッドは self を返すので、以下のように連続して書くことができます。

# 例

# ary = [1]
# ary << 2 << 3 << 4
# p ary   #=> [1, 2, 3, 4]

# mapメソッドは、配列の要素の数だけブロック内で処理を繰り返して、新しい配列を返します。

# cap_arr = arr.map { |name| name.capitalize}

# p cap_arr


