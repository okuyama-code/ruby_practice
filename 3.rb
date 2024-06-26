# 文字列の配列から、母音で始まる単語を抽出し、長さでソートせよ
# words = ["apple", "banana", "elephant", "igloo", "umbrella", "octopus", "eagle"]

# boin = ['a', 'i', 'u', 'e', 'o']

# new_arr = words.select { |word| boin.include?(word[0]) }

# sort_arr = new_arr.sort_by { |st| st.length }
# p sort_arr


# words = ["apple", "banana", "elephant", "igloo", "umbrella", "octopus", "eagle"]
# vowel_words = words.select { |word| word.downcase.start_with?('a', 'e', 'i', 'o', 'u') }
#                    .sort_by(&:length)

# p vowel_words

words = ["apple", "banana", "elephant", "igloo", "umbrella", "octopus", "eagle"]
boin = ['a', 'i', 'u', 'e', 'o']

new_arr = words.select { |word| boin.include?(word[0]) }

sort_arr = new_arr.sort { |a, b| a.length <=> b.length }

p sort_arr
