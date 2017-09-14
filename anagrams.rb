require "benchmark"

def first_anagram?(str1,str2)
  letters = str1.split("")
  possib = letters.permutation.to_a
  possib.include?(str2.split(""))
end

puts Benchmark.measure{20.times {first_anagram?("gizmotime", "mogiztime")}}
p first_anagram?("gizmotime", "mogiztime")
puts "\n"

def second_anagram?(str1,str2)
  result1 = str1.chars.reject { |char| str2.chars.include?(char) }
  result2 = str2.chars.reject { |char| str1.chars.include?(char) }
  result = result1 + result2
  result == []
end

puts Benchmark.measure{20.times {second_anagram?("gizmotime", "mogiztime")}}
p second_anagram?("gizmotime", "mogiztime")
puts "\n"

def third_anagram?(str1,str2)
  str1.chars.sort == str2.chars.sort
end

puts Benchmark.measure{20.times {third_anagram?("gizmotime", "mogiztime")}}
p third_anagram?("gizmotime", "mogiztime")

def fourth_anagram?(str1,str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.chars.each do |char|
    hash1[char] += 1
  end
  str2.chars.each do |char|
    hash2[char] += 1
  end

  # p hash1.object_id
  # p hash2.object_id
  hash1 == hash2

end

def fourth_anagram_cool?(str1,str2)
  hash1 = Hash.new(0)
  str1.chars.each do |char|
    hash1[char] += 1
  end
  str2.chars.each do |char|
    hash1[char] -= 1
  end
  hash1.values.all? { |n| n == 0 }
end




puts Benchmark.measure{20.times {fourth_anagram?("gizmotime", "mogiztime")}}
p fourth_anagram?("gizmotime", "mogiztime")


puts Benchmark.measure{20.times {fourth_anagram_cool?("gizmotime", "mogiztime")}}
p fourth_anagram?("gizmotime", "mogiztime")
