# https://atcoder.jp/contests/abc141/tasks/abc141_b

# タップダンスの踏みやすさを手チェックする関数
def is_easy_to_step(s)
  return false if s.length < 1 || s.length > 100

  return false unless s.match?(/^[LRUD]+$/)

  # 奇数番目のみの配列
  odd_chars = s.chars.select.with_index { |_, i| i.even? }

  # 偶数番目のみの配列
  even_chars = s.chars.select.with_index { |_, i| i.odd? }

  p even_chars

end



test_cases = [
  "RUDLUDR",
  "DULL",
  "UUUUUUUUUUUUUUU",
  "ULURU",
  "RDULULDURURLRDULRLR"
]

is_easy_to_step(test_cases[0])
