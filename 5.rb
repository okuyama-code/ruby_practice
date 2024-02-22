def check_alcohol(age)
  if age >= 20
    return 'OK'
  else
    return 'NG'
  end
end

p check_alcohol(20)
p check_alcohol(19)
p check_alcohol(100)
