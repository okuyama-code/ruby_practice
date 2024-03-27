def loop_1_to_5(&block)
  puts "start"
  (1..5).each do |v|
    yield v
  end
  puts "end"
end

def display
  loop_1_to_5 do |num|
    puts num
  end
end

display

def sum
  val = 0
  loop_1_to_5 do |num|
    val += num
    puts "debug val = #{val}"
  end
end

sum

def multiply
  val = 1
  loop_1_to_5 do |num|
    val *= num
    puts "debug val = #{val}"
  end
  puts val
end

multiply
