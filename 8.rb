# 4文字の文字列を引数に取り、前半2文字と後半2文字が同じ場合は"True"を、それ以外は"False"を返すメソッドを作成してください。

def check(s)
  if s.slice(0..1) == s.slice(2..3)
    return true
  else
    return false
  end
end

string = "aabb"
s = "aaaa"
a = "sasa"
b = "saas"

p check(string)
p check(s)
p check(a)
p check(b)


p a.slice(0)
p a.slice(1)
p a.slice(2)
p a.slice(3)
