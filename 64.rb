# s = "Capitalized"
s = gets.chomp

# s[0]

# p s[1..]
# p s[..2]


def uppercase?(str)
  str == str.upcase
end

def downcase?(str)
  str == str.downcase
end

# p uppercase?(s[0])
# p downcase?(s[1..])

if uppercase?(s[0]) && downcase?(s[1..])
  puts "Yes"
else
  puts "No"
end
