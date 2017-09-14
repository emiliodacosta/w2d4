require 'byebug'

def windowed_max_range(arr, w)
  max_range = 0

  arr.each_with_index do |el, i|
    if (i+w) <= arr.length
      win_max = el
      win_min = el
      arr[i...i+w].each do |el2|
        if el2 > win_max
          win_max = el2
        elsif el2 < win_min
          win_min = el2
        end
      end
      current_max_range = win_max - win_min
      if current_max_range > max_range
        max_range = current_max_range
      end
    end
  end
  max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) # 3, 2, 5, 4, 8
