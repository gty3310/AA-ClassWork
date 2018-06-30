def my_min(arr)
  arr.each_with_index do |num1,i1|
    smallest = true
    arr.each_with_index do |num2,i2|
      next if i1 == i2
      smallest = false if num2 < num1
    end
    return num1 if smallest
  end
end
# O(n^2)

def my_min2(arr)
  smallest = arr.first
  arr.each do |num|
    if smallest>num
      smallest = num
    end
  end
  smallest
end
# O(n)

def contiguous_sum(arr)
  sub_arr = []
  (0...arr.length).each do |idx1|
    (idx1...arr.length).each do |idx2|
      sub_arr << arr[idx1..idx2]
    end
  end
  sub_arr.map { |el|  el.reduce(:+)}.max
end
#O(n)

def contiguous_sum2(arr)
  max = arr.first
  sum = 0
  arr.each do |value|
    sum += value
    sum = 0 if sum < 0 
    max = sum if sum > max
  end
  max
end

def contiguous_sum3(arr) # most correct version 
  max = arr.first
  sum = 0
  arr.each do |value|
    sum += value
    max = [max, sum, value].max
    sum = max
    sum = 0 if max == value
  end
  max
end
  
