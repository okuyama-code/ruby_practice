# def check(words)
#   words_array = words.chars
#   element_number = words_array.uniq.length
#   case element_number

#   when 1
#   -1
#   when 2
#   word_a_num =  words_array.count(words_array.uniq[0])
#   word_b_num = words_array.count(words_array.uniq[1])
#   word_a_num > word_b_num ?  words_array.uniq[1] :  words_array.uniq[0]
#   when 3
#   words_array.sample
#   end
#   end

#   words = gets.chomp
#   p check(words)

def uniq_check(str)
  index =  str.index(str[-1])
  if index == 1
    str[0]
  elsif index == 2
    str[0] == str[1] ? str[2] : str[0]
  elsif index == 0
    str[0] == str[1] ? -1 : str[1]
  end
end

a = "abc"
b = "bbc"
c = "cdc"
d = "add"
e = "aaa"

p uniq_check(a)
p uniq_check(b)
p uniq_check(c)
p uniq_check(d)
p uniq_check(e)
