# 文字列の配列から、各要素の先頭と末尾の文字を取り出し、新しい文字列を作成せよ
words = ["hello", "world", "ruby", "programming", ""]

new_words = words.map { |word| word.empty? ? '' : word[0] + word[-1] }

puts new_words.join("")


# join メソッドは配列の要素を連結して1つの文字列にするメソッドです。引数を使うことで、要素間に区切り文字を挿入することができます。
