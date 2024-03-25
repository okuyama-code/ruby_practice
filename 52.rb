def loop(&block)
  puts "start"
  (1..5).each do |v|
    block.call v
  end

  puts "end"
end

def display_number
  loop do |num|
    puts num
  end
end

display_number

def sum
  puts "start"
  v = 0
  loop do |num|
    v += num
    puts "debug val = #{v}"
  end
  puts "end"
  puts v
end

sum

def mul
  v = 1
  loop do |num|
    v *= num
    puts "debug val = #{v}"
  end
  puts v
end

mul
