arr = ["1", "12", "12", "13", "2", "3", "4", "5", "6", "7", "8", "9", "10", "5", "4", "3"]

# new_arr = arr.map do |item|
#   item.to_i
# end

# new_arr.sort! { |a, b| a <=> b }

# new_arr_string = new_arr.map do |item|
#   item.to_s
# end

# p new_arr_string

# arr.sort! { |a, b| a <=> b }

# p arr

# 答え

# new_arr = arr.sort_by{ |v| v.to_i}
# p new_arr

# new_arr2 = arr.sort

# p new_arr2


# ソート前の文字列の配列
arr = %w(10 3 20 5)

# 数値としてソートしたい場合、文字列のままでは望み通りにソートされません。
# そのため、文字列を数値に変換してからソートする必要があります。

# 新しい配列を作成し、数値としてソートする
new_arr = arr.sort_by { |v| v.to_i }

# sort_by メソッドは、ブロックの戻り値に基づいて要素をソートします。
# ここでは、各要素（文字列で表された数値）を数値に変換しています。

# ソート後の配列を出力する
p new_arr # ["3", "5", "10", "20"]
