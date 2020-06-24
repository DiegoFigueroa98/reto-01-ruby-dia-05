class GameOfLife
  attr_accessor :board, :neighborhood

  def initialize(size)
    @board = Array.new(size){Array.new(size)} 
    @neighborhood  = Array.new(size){Array.new(size)}
  end

  def create_board_randomly
    for row in 0..board.size-1
      for col in 0..board.size-1
        board[row][col] = ['_', '1'].sample
        neighborhood[row][col] = 0
      end
    end
  end

  def show_board
    board.each { |elem| puts "#{elem}" }
  end

  def show_neighborhood
    neighborhood.each { |elem| puts "#{elem}" }
  end

  def next_state
    for row in 1..board.size-2
      for col in 1..board.size-2
        counter = 0
        counter += 1 unless board[row-1][col] == '_'
        counter += 1 unless board[row-1][col-1] == '_'
        counter += 1 unless board[row-1][col+1] == '_'
        counter += 1 unless board[row][col-1] == '_'
        counter += 1 unless board[row][col+1] == '_'
        counter += 1 unless board[row+1][col-1] == '_'
        counter += 1 unless board[row+1][col+1] == '_'
        counter += 1 unless board[row+1][col] == '_'

        neighborhood[row][col] = counter
      end   
    end
  end 

  def find_life
    for row in 1..board.size-2      
      for col in 1..board.size-2
        board[row][col] = (neighborhood[row][col] == 2 || neighborhood[row][col] == 3) ? '1' : '_' 
      end
    end  
  end 
end 

game = GameOfLife.new(10)
puts "\nFirst board state"
game.create_board_randomly
game.show_board
game.next_state

puts "\nNumber of neighbors of each cell"
game.show_neighborhood

puts "\nNext board state"
game.find_life
game.show_board