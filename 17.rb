# 1 < N < 100000 入力
#
numbers = gets.to_i

power = 1

for num in 1..numbers do
  # p "#{num} 回目のトレーニングを終えると、パワーは#{num} 倍され#{power * num} になります"
  power = power * num
end

p power % (10**9 + 7)
