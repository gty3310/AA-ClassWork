class Array
  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    (0..size - 2).each do |x|
      (x + 1..size - 1).each do |y|
        result << [x,y] if self[x] + self[y] == 0
      end
    end
    result
  end
end

def my_transpose(array)
  result = Array.new(array[0].length) {[]}
  array.each.with_index do |row, x|
    row.each.with_index do |val, y|
      result[y][x] = val
    end
  end
  result
end

def stock_picker(stock)
  return nil if stock.length <= 1
  result = [0,1]
  (0..stock.size - 2).each do |x|
    (x + 1..stock.size - 1).each do |y|
      result = [x,y] if stock[y] - stock[x] > result.last - result.first
    end
  end
  result
end
