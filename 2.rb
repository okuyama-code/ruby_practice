result = []

# p (1..100).to_a

(1..100).each do |num|
  if num % 3 == 0 && num % 5 == 0
    result << num.to_s
  end
end

p result.join
