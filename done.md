1. 下記の関数を書いてください。
数字のa（aは1以上1000以下の正の整数）が引数として与えられます。
1以上、a以下の数で、3の倍数または3が含まれる数リストを返り値にするようにしてください。
例1：a = 10 の場合 -> [3,6,9]
例2：a = 31 の場合 -> [3,6,9,12,13,15,18,21,23,24,27,30,31]

2. 1から100までの数字で、3の倍数かつ5の倍数の数を文字列として連結せよ

3. 文字列の配列から、母音で始まる単語を抽出し、長さでソートせよ
words = ["apple", "banana", "elephant", "igloo", "umbrella", "octopus", "eagle"]

4. 1から100までの数字で、7の倍数または7を含む数の合計を計算せよ

5. ハッシュの値が偶数のキーのみを抽出し、キーを基準に降順でソートせよ
hash = { 'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6 }

6. 文字列の配列から、各要素の先頭と末尾の文字を取り出し、新しい文字列を作成せよ
words = ["hello", "world", "ruby", "programming", ""]

7. 2次元配列を平坦化し、重複を除去した後、降順にソートせよ
matrix = [[1, 2, 3], [4, 2, 1], [3, 5, 4], [1, 2, 5]]

8. 4文字の文字列を引数に取り、前半2文字と後半2文字が同じ場合は"True"を、それ以外は"False"を返すメソッドを作成してください。

-----------------------------------------------------------------------------------------

9. 文字の文字列を引数に取り、以下のルールに従って結果を返すメソッド analyze_string を作成してください：

返り値の条件：

入力が無効（4文字でない、または英字でない）の場合は "Invalid Input" を返します。
4文字全てが同じ場合: "-1" を返します。
3文字が同じで1文字が異なる場合: 異なる文字を返します。
前半2文字と後半2文字が同じ場合（例：AABB）: "Pair" を返します。
1文字目と3文字目、2文字目と4文字目がそれぞれ同じ場合（例：ABAB）: "Repeat" を返します。
それ以外の場合: 最初の文字を返します。


処理の流れ：

まず入力の妥当性を確認します。
次に、入力を小文字に変換します。
その後、上記の条件に従って適切な結果を返します。


テスト：

以下のテストケースで関数の動作を確認してください：
AAAA, AAAB, ABCD, ABAB, AABB, AAaa, ABC, A1B2

回答の例
```ruby
def analyze_string(s)
  # 入力の検証
  return "Invalid Input" unless s.is_a?(String) && s.length == 4 && s.match?(/^[a-zA-Z]+$/)

  # 小文字に変換
  s = s.downcase

  case
  when s.chars.uniq.length == 1
    "-1"
  when s.chars.uniq.length == 2
    s.chars.find { |char| s.count(char) == 1 }
  when s[0..1] == s[2..3]
    "Pair"
  when s[0] == s[2] && s[1] == s[3]
    "Repeat"
  else
    s[0]
  end
end

# テスト
test_cases = %w[AAAA AAAB ABCD ABAB AABB AAaa ABC A1B2]
test_cases.each do |case_str|
  puts "Input: #{case_str}, Result: #{analyze_string(case_str)}"
end
```

-----------------------------------

# 問題1: アナグラムグループ作成
# 与えられた単語のリストから、アナグラムのグループを作成してください。
# アナグラムとは、文字を並べ替えて別の単語を作ることができる単語のことです。

# ヒント:
# - Array#group_by: 配列の要素をブロックの結果でグループ化
# - String#chars: 文字列を文字の配列に変換
# - Array#sort: 配列を並べ替え
# - Array#join: 配列の要素を結合して文字列を作成

words = ["eat", "tea", "tan", "ate", "nat", "bat"]

# 期待される出力:
# [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]

--------------------------------------
文字列内の各単語の出現回数をカウントし、出現回数が 2 以上の単語のみを抽出せよ
text = "ruby is a great language ruby is fun to learn ruby programming is awesome"


--------------------------------------

# 問題2: URLパラメータのパース
# 与えられたURL文字列からクエリパラメータを抽出し、ハッシュに変換してください。

# ヒント:
# - String#split: 文字列を特定の区切り文字で分割
# - Array#map: 配列の各要素に対して処理を行い、新しい配列を作成
# - Hash[]: 2次元配列からハッシュを作成
# - URI.decode_www_form_component: URLエンコードされた文字列をデコード

url = "https://example.com/search?q=ruby&lang=ja&page=1"

# 期待される出力:
# {"q"=>"ruby", "lang"=>"ja", "page"=>"1"}