@input = File.open("#{File.dirname(__FILE__)}/input.txt").readlines

def first
  gamma = ''
  epsilon = ''
  arr = @input.map do |binary_line|
    binary_line.split('').select { |x| ['1', '0'].include?(x) }
  end.transpose.each do |arr|
    if most_common(arr) == '1'
      gamma += '1'
      epsilon += '0'
    else
      gamma += '0'
      epsilon += '1'
    end
  end
  gamma.to_i(2) * epsilon.to_i(2)
end

def second
  gamma = ''
  epsilon = ''
  starting_arr = @input.map do |binary_line|
    binary_line.split('').select { |x| ['1', '0'].include?(x) }
  end

  starting_arr_cache = starting_arr
  iterator = 0
  while starting_arr.size > 1 do
    transposed_array = starting_arr.transpose
    starting_arr = starting_arr.filter do |arr|
      arr[iterator] == most_common(transposed_array[iterator])
    end
    iterator = iterator == transposed_array.size ? 0 : iterator + 1
  end
  first = starting_arr[0].join

  starting_arr = starting_arr_cache
  iterator = 0
  while starting_arr.size > 1 do
    transposed_array = starting_arr.transpose
    starting_arr = starting_arr.filter do |arr|
      arr[iterator] != most_common(transposed_array[iterator])
    end
    iterator = iterator == transposed_array.size ? 0 : iterator + 1
  end
  second = starting_arr[0].join

  first.to_i(2) * second.to_i(2)
end

def most_common(arr)
  ones = 0
  zeros = 0

  arr.each do |item|
    if item == '1'
      ones += 1
    else
      zeros += 1
    end
  end

  ones >= zeros ? '1' : '0'
end

puts "First: #{first}"
puts "Second: #{second}"
