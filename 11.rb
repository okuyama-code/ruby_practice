# 文字列内の各単語の出現回数をカウントし、出現回数が 2 以上の単語のみを抽出せよ
text = "ruby is a great language ruby is fun to learn ruby programming is awesome"

new_arr = text.split(" ")

p new_arr.select { |e| new_arr.count(e) > 1 }.uniq

