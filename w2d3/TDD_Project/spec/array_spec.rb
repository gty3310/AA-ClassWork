require 'Array'
require 'rspec'

describe Array do
  describe '#my_uniq' do
    subject(:arr){[1, 2, 1, 3, 3]}

    it 'returns unique string from a given string' do
      expect(arr.my_uniq).to eq([1,2,3])
    end
    it 'returns new array' do
      expect(arr.my_uniq).to_not be(arr)
    end
  end

  describe '#two_sum' do
    subject(:arr){[-1,0,2,-2,1]}

    it 'finds pairs of positions where the elements sum to zero' do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end

    it 'returns empty array if no elements sum to zero' do
      expect([1,2].two_sum).to eq([])
    end
  end

end

describe '#my_transpose' do
  subject(:rows){[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [9, 10, 11]
    ]}
  let(:cols){[
    [0, 3, 6 ,9],
    [1, 4, 7, 10],
    [2, 5, 8, 11]
    ]}
  it 'it returns an array with correct length' do
    expect(my_transpose(rows)[0].length).to eq(4)
  end
  it 'return the correct array' do
    expect(my_transpose(rows)).to eq(cols)
  end
end

describe '#stock_picker' do
  subject(:stock){[1,2,3,4,5,6,1]}
  let(:days){[0,5]}
  it 'returns a pair of numbers' do
    expect(stock_picker(stock).size).to eq(2)
  end

  it 'return days within the range' do
    day1, day2 = stock_picker(stock)
    range = (0..6).to_a
    expect(range.include?(day1) && range.include?(day2)).to eq(true)
  end

  it 'returns correct largest range' do
    expect(stock_picker(stock)).to eq(days)
  end

  it 'returns nil if only trades for one day' do
    expect(stock_picker([1])).to eq(nil)
  end
end
