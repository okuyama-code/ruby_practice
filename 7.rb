# 2 次元配列を平坦化し、重複を除去した後、降順にソートせよ
matrix = [[1, 2, 3], [4, 2, 1], [3, 5, 4], [1, 2, 5]]

result = []

matrix.each do |arr|
  arr.each do |ar|
    result << ar
  end
end

p result.uniq.sort { |a, b| b <=> a}
