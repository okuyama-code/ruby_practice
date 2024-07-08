# 問題3: 文章の単語出現頻度カウント
# 与えられた文章内の各単語の出現頻度をカウントし、出現回数が多い順にソートしてください。

# ヒント:
# - String#downcase: 文字列を小文字に変換
# - String#scan: 正規表現にマッチする部分を全て取得
# - Enumerable#tally: 要素の出現回数をカウント
# - Hash#sort_by: ハッシュをキーまたは値でソート

text = "Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write."

p word_frequency = text.downcase.scan(/\w+/).tally.sort_by { |word, count| [-count, word ] }

# 期待される出力:
# [["a", 2], ["and", 2], ["is", 2], ["to", 2], ["an", 1], ["dynamic", 1], ["easy", 1], ["elegant", 1], ["focus", 1], ["has", 1], ["it", 1], ["language", 1], ["natural", 1], ["on", 1], ["open", 1], ["productivity", 1], ["programming", 1], ["read", 1], ["ruby", 1], ["simplicity", 1], ["source", 1], ["syntax", 1], ["that", 1], ["with", 1], ["write", 1]]
