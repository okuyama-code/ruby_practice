s = gets.chomp

char_counts = Hash.new(0)

s.each_char { |c| char_counts[c] += 1 }

p char_counts

max_count = char_counts.values.max

result = char_counts.select { |k, v| v == max_count }.keys.max

p result
