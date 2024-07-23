arr = [3,2,1,1,2,3]

def func(arr)
  i = 0
  if arr[1] 
  arr[1], arr[2] = arr[2], arr[1]

  return arr
end

p func(arr)
