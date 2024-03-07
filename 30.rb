arr = ["090-1111-22223", "090-1111-22224", "090-1111-22225"]

new_arr = arr.map do |ar|
  ar.delete("-")
end

p new_arr