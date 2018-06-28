require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  describe "#move" do


    # it 'user input cannot be outside of range'
    #move(1,2)->[[3,2],[1],[]] / nil
    before(:each) do
      game.board = [[2,3], [1], []]
    end

    it 'return a array of 3 arrays' do
      expect(game.move(0,2).size).to eq(3)
    end
    it 'returns nil if move from empty spot' do
      expect(game.move(2,0)).to eq(nil)
    end
    it 'returns nil if move to a spot with a smaller piece' do
      expect(game.move(0,1)).to eq(nil)
    end
    it 'move the piece to the right spot' do
      expect(game.move(0,2)).to eq([[3],[1],[2]])
    end
  end

  describe "#won?" do
    it 'does not win if you do not make a stack' do
      game.board = [[2,3], [1], []]
      expect(game.won?).to eq(false)
    end
    it 'does not win if you make the stack at the starting position' do
      game.board = [[1,2,3], [], []]
      expect(game.won?).to eq(false)
    end
    it 'wins if you make a stack at the right location' do
      game.board = [[], [1,2,3], []]
      expect(game.won?).to eq(true)
    end
  end
end


# load "lib/towers_of_hanoi.rb"
# game = TowersOfHanoi.new
# game.play
# game.board = [[2,3], [1], []]
# board[finish].unshift(board[start].shift)
