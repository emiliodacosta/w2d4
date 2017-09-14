require 'byebug'
def my_min(arr)

  min = arr[0]
  arr.each do |el|
    arr.each do |el2|
      next if el == el2
      min = el if el < el2 && el < min
    end
  end
  return min
end

def my_min_better(arr)
  min = arr.first
  arr[0...-1].each_with_index do |el, i|
      min = el if el < arr[i+1] && el < min
  end
  min
end

# arr = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(arr)
# p my_min_better(arr)


def largest_contiguous_subsum(list)
  arr=[]
  list.each_with_index do |el,i|
    arr << el
    j = i+1
    while j < list.length
      arr << list[i..j].reduce(:+)
      j+=1
    end
  end
  arr.max
end

def largest_contiguous_subsum_better(list)
  running_total = list.first
  max = list.first
  (list.length-1).times do |i|
    running_total += list[i+1]
    running_total = 0 if running_total < 1
    max = running_total if running_total > max
  end
  max
end



# list = [5, 3, -7]
# p largest_contiguous_subsum(list)
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum_better(list)
