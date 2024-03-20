arr_people = [
  { name: 'Taro_1', age: 20, height: 180, weight: 60, country: 'Japan' },
  { name: 'Taro_2', age: 30, height: 170, weight: 70 },
  { name: 'Taro_3', age: 40, height: 190, weight: 65, country: 'Taiwan' },
  { name: 'Taro_4', age: 50, height: 150, weight: 75, country: 'Japan' },
]

# japan_people = []

# arr_people.each do |arr|
#   if arr.key?(:country)  && arr[:country] == 'Japan'
#     japan_people << arr
#   end
# end

# p arr_people[0][:country]
# p arr_people[0].key?(:country)

# p japan_people

country_people = []

arr_people.map do |person|
  country_people << person if person.has_value?('Japan')
end

p country_people
