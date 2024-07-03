# 問題1: アナグラムグループ作成
# 与えられた単語のリストから、アナグラムのグループを作成してください。
# アナグラムとは、文字を並べ替えて別の単語を作ることができる単語のことです。

# ヒント:
# - Array#group_by: 配列の要素をブロックの結果でグループ化
# - String#chars: 文字列を文字の配列に変換
# - Array#sort: 配列を並べ替え
# - Array#join: 配列の要素を結合して文字列を作成

words = ["eat", "tea", "tan", "ate", "nat", "bat"]

def sample(words)
  grouped = words.group_by do |word|
    word.chars.sort.join
  end

  return grouped.values
end

p sample(words)

# 期待される出力:
# [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
