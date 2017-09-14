require 'benchmark'
require 'byebug'

def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |el,i|
    j = i+1
    while j < arr.length
      return true if el + arr[j] == target_sum
      j+=1
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  arr.sort.each_with_index do |el,i|
    j = i+1
    while j < arr.length
      return true if el + arr[j] == target_sum
      j+=1
    end
  end
  false
end

def hash_two_sum?(arr, target_sum)
  hash = Hash.new
  arr.each_with_index do |el,i|
    remainder = target_sum - el
    if remainder == target_sum && hash[0]
      next
    elsif hash[remainder] && remainder != el
      return true
    end
    hash[el] = true
  end
  false
end

# arr = [1, 5, 7, 9]
# p hash_two_sum?(arr, 6)
# p hash_two_sum?(arr, 10)
#
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false
# puts "\n"
# puts Benchmark.measure{2000.times {bad_two_sum?(arr, 6)}}
# puts "\n"
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false
# puts Benchmark.measure{2000.times {okay_two_sum?(arr, 6)}}
