def compare_arr(arr_1, arr_2)
  arr_1 & arr_2
end

arr1 = ["banana", "apple", "orange"]
arr2 =  ["banana", "apple"]

arr3 = ["banana", "apple", "orange"]
arr4 = ["banana", "ringo"]

p(compare_arr(arr1, arr2))
p(compare_arr(arr3, arr4))
