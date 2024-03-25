# def check_3_5_multiple_1(number)
#   if number % 3 == 0 || number % 5 == 0
#     true
#   else
#     false
#   end
# end

# p check_3_5_multiple_1(9)

def check_3_5_multiple_1(number)
  if number % 3 != 0 && number % 5 != 0
    false
  else
    true
  end
end

p check_3_5_multiple_1(9)
