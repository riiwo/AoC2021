@input = File.open("#{File.dirname(__FILE__)}/input.txt").readlines.map(&:to_i)

def first
  larger = 0
  previous = nil

  @input.each.with_index do |current, index|
    if index != 0
      larger += 1 if current > previous
    end
    previous = current
  end

  larger
end

def second
  larger = 0
  previous = nil

  @input.each_cons(3).with_index do |current, index|
    sum = current.sum
    if index != 0
      larger += 1 if sum > previous
    end
    previous = sum
  end

  larger
end

puts "First: #{first}"
puts "Second: #{second}"
