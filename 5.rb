# ハッシュの値が偶数のキーのみを抽出し、キーを基準に降順でソートせよ
hash = { 'a' => 16, 'b' => 2, 'c' => 3, 'l' => 80, 'd' => 4, 'e' => 5, 'f' => 6 }

# result = hash.select { |k, v| v.even? }.sort_by { |k, v| k }.reverse.to_h

result = hash.select { |k, v| v.even? }.sort_by { |k, v| -v }.to_h

p result


# 偶数　奇数　素数
def even_numbers(hash)
  hash.select { |k, v| v.even? }
end

def odd_numbers(hash)
  hash.select { |k, v| v.odd? }
end

require 'prime'
def prime_numbers(hash)
  hash.select { |k, v| v.prime? }
end


puts "偶数："
p even_numbers(hash)

puts "奇数："
p odd_numbers(hash)

puts "素数："
p prime_numbers(hash)
