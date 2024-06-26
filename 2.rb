# 1から100までの数字で、3の倍数かつ5の倍数の数を文字列として連結せよ

result = []

# p (1..100).to_a

(1..100).each do |num|
  if num % 3 == 0 && num % 5 == 0
    result << num.to_s
  end
end

p result.join
