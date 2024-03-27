arr = [
  { name: 'Taro_1', age: 20, height: 180, weight: 60 },
  { name: 'Taro_2', age: 40, height: 160, weight: 70 },
  { name: 'Taro_3', age: 50, height: 150, weight: 75 },
]

def show_status(person)
  puts "name #{person[:name]}, age: #{person[:age]}"
end

def bmi(person)
  h = person[:height].to_f
  w = person[:weight]
  bmi = w / (h /100) ** 2
  puts "BMI: #{bmi}"
end


arr.each do |person|
  show_status(person)
  bmi(person)
end
