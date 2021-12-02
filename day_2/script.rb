@input = File.open("#{File.dirname(__FILE__)}/input.txt").readlines

def first
  depth = 0
  forward = 0

  @input.each do |current|
    command, x = current.split(' ')
    x = x.to_i

    case command
    when 'forward'
      forward += x
    when 'up'
      depth -= x
    when 'down'
      depth += x
    end
  end

  forward * depth
end

def second
  depth = 0
  forward = 0
  aim = 0

  @input.each do |current|
    command, x = current.split(' ')
    x = x.to_i

    case command
    when 'forward'
      forward += x
      depth += x * aim
    when 'up'
      aim -= x
    when 'down'
      aim += x
    end
  end

  forward * depth
end

puts "First: #{first}"
puts "Second: #{second}"
