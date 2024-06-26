# 下記の関数を書いてください。

# 数字のa（aは1以上1000以下の正の整数）が引数として与えられます。
# 1以上、a以下の数で、3の倍数または3が含まれる数リストを返り値にするようにしてください。

# 例1：a = 10 の場合 -> [3,6,9]
# 例2：a = 31 の場合 -> [3,6,9,12,13,15,18,21,23,24,27,30,31]

# ファイルを作成し、得意な言語で書いてください。

# 非効率な点は、配列を複数回走査していることと、不要な中間配列を作成している
# def collect_threes_and_multiples(number)
#   arr = []
#   number.times do |i|
#     arr << i + 1
#   end

#   new_arr1 = arr.select { |num| num % 3 == 0  }
#   new_arr2 = arr.select { |num| num.to_s.include?("3")}
#   new_arr = (new_arr1 + new_arr2).sort.uniq
#   return new_arr
# end

# こっちが計算量の効率がいいコード
def collect_threes_and_multiples(max_number)
  result = []
  (1..max_number).each do |num|
    if num % 3 == 0 || num.to_s.include?('3')
      result << num
    end
  end
  result
end

a = 10

b = 31
p collect_threes_and_multiples(a)
p collect_threes_and_multiples(b)
