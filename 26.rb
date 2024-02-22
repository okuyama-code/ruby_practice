#  型を確認し真偽値を返す方法
# https://prograshi.com/language/ruby/is_a-kind_of-instance_of/

# selectメソッドは、先述したように条件にマッチした要素を返した配列を作るメソッド

arr = [1, "a", 2, "b", "c", 3]

new_arr = arr.select { |a| a.is_a?(Integer) }


p new_arr


# arr = [1, "a", 2, "b", "c", 3]

# new_arr = arr.find_all { |a| a.is_a?(Integer) }

# p new_arr
