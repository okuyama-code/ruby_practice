arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] # 合計は55
total = 0

# sum = arr.inject(0){|i, j| i += j}

# p sum

# arr.each do |a|
#   total += a
# end

# puts total

# total = arr.sum
# puts total

# total = arr.inject{ |init, v| init += v; init }
# puts total




# injectメソッドは、ブロックまたはシンボルを使用して、
# 配列の要素に対して操作を適用します。
# :+ は、足し算を行うシンボルです。

total = arr.inject(:+)

# ここで、inject(:+)は、配列の各要素を足し合わせることを意味します。
# この結果をtotal変数に格納します。

puts total
