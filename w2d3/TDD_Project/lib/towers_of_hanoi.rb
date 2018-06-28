class TowersOfHanoi
  attr_accessor :board
  def initialize
    @board = [[1,2,3],[],[]]
  end

  def move(start, finish)
    return nil if board[start].empty?
    if board[finish].empty?
      board[finish].unshift(board[start].shift)
    elsif board[start].first > board[finish].first
      return nil
    else
      board[finish].unshift(board[start].shift)
    end
    board
  end

  def won?
    board[1].size == 3 || board[2].size == 3
  end

  def play
    until won?
      puts "next move: "
      begin
        x, y = gets.chomp.split(",")
        unless (0..2).to_a.include?(x.to_i) && (0..2).to_a.include?(y.to_i)
          raise ArgumentError
        end
      rescue
        puts "invalid move, enter again"
        retry
      end
      move = move(x.to_i, y.to_i)
      unless move
        puts "invalid move"
        next
      end
      p move
    end
    puts "You won!"
  end

end
