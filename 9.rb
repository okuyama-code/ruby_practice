# 4文字の文字列を引数に取り、以下のルールに従って結果を返すメソッド analyze_string を作成してください：

# 入力条件：

# 入力は必ず4文字の英字（a-z または A-Z）でなければなりません。
# 大文字と小文字は区別しません。


# 返り値の条件：

# 入力が無効（4文字でない、または英字でない）の場合は "Invalid Input" を返します。
# 4文字全てが同じ場合: "-1" を返します。
# 3文字が同じで1文字が異なる場合: 異なる文字を返します。
# 前半2文字と後半2文字が同じ場合（例：AABB）: "Pair" を返します。
# 1文字目と3文字目、2文字目と4文字目がそれぞれ同じ場合（例：ABAB）: "Repeat" を返します。
# それ以外の場合: 最初の文字を返します。

def analyze_string(str)
  downstr = str.downcase
  if downstr.length != 4 || downstr.match?(/[^a-z]/)
    return "Invalid Input"
  elsif str.split('').uniq.join.length == 1
    return -1
  elsif str[0] == str[1] && str[1] == str[2] && str[2] != str[3]
    return str[3]
  elsif str[0] == str[1] && str[1] == str[3] && str[3] != str[2]
    return str[2]
  elsif str[0] == str[2] && str[2] == str[3] && str[3] != str[1]
    return str[1]
  elsif str[1] == str[2] && str[2] == str[3] && str[3] != str[0]
    return str[0]
  elsif str.slice(0) == str.slice(1) && str.slice(2) == str.slice(3)
    return "Pair"
  elsif str[0] == str[2] && str[1] == str[3]
    return "Repeat"
  else
    return str[0]
  end
end

# s = "aaaA"
# s = "aaAa"
# s = "aAaa"
# s = "Aaaa"
s = "abab"

p analyze_string(s)
