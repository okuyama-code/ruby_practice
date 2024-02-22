def cal(number)
  str = number.to_s
  str3 = str * 3
  str3_int = str3.to_i

  return number + str3_int
end

p cal(5)
