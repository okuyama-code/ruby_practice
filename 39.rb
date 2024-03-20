arr_people = [
  { name: 'Taro_1', age: 20, height: 180, weight: 60, country: 'Japan' },
  { name: 'Taro_2', age: 30, height: 170, weight: 70 },
  { name: 'Taro_3', age: 40, height: 190, weight: 65, country: 'Taiwan' },
  { name: 'Taro_4', age: 50, height: 150, weight: 75, country: 'Japan' },
]

# p arr_people[0][:age]

# age_people = []

# arr_people.map do |people|
#   if people[:age] > 30
#     age_people << people
#   end
# end

# p age_people

age_people = arr_people.select{ |person| person[:age] > 30 }

p age_people
