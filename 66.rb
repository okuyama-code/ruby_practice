i, postage_amount, postage  = gets.chomp.split.map(&:to_i)

# i 種類
# 一個p円
# 個数 9個
#送料　s円で無料　それ以下ならk円

# puts postage_amount
# puts postage

sub_total = 0
total = 0

i.times do
  amount, number_of_pieces = gets.chomp.split.map(&:to_i)

  item_amount = amount * number_of_pieces

  sub_total += item_amount
  
end

if sub_total < postage_amount
  total = sub_total + postage
else
  total = sub_total
end

puts total
