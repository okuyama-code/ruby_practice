# sample_arr = []
# while true do
#   1.upto(10) do
#     sample_arr << rand(1..30)
#   end
#   break if sample_arr.find{ |v| v % 11 == 0 }

#   sample_arr = []
# end

# p sample_arr

# 空の配列 sample_arr を初期化します
sample_arr = []

# 11で割り切れる要素が含まれるまで繰り返します
loop do
  # ランダムな数値を10個生成し、sample_arr に追加します
  10.times do
    sample_arr << rand(1..30)
  end

  # 11で割り切れる要素が含まれるかをチェックします
  # 含まれていれば、ループを抜けます
  break if sample_arr.any? { |v| v % 11 == 0 }

  # 11で割り切れる要素が含まれない場合、sample_arr をクリアします
  sample_arr.clear
end

# 最終的な sample_arr を出力します
p sample_arr
