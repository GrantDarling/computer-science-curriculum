# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
   All_My_Pieces = [rotations([[0, 0], [1, 0], [0, 1], [1,1], [2,1]]), # square-bump
                    rotations([[0, 0], [1, 0], [0, 1], [0,1]]),        # nuby
                    [[[0, 0], [-1, 0], [1, 0], [2, 0],[-2, 0]],        # long (only needs two)
                    [[0, 0], [0, -1], [0, 1], [0, 2],[0, -2]]],   
                    [[[0, 0], [1, 0], [0, 1], [1, 1]]],                # square (only needs one)
                    rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]),     # T
                    [[[0, 0], [-1, 0], [1, 0], [2, 0]],                # long (only needs two)
                    [[0, 0], [0, -1], [0, 1], [0, 2]]],
                    rotations([[0, 0], [0, -1], [0, 1], [1, 1]]),      # L
                    rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]),     # inverted L
                    rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]),    # S
                    rotations([[0, 0], [1, 0], [0, -1], [-1, -1]])]    # Z 

  def self.next_piece (board)
    MyPiece.new(All_My_Pieces.sample, board)
  end
end

class MyBoard < Board
  def initialize (game)
    @grid = Array.new(num_rows) {Array.new(num_columns)}
    @current_block = MyPiece.next_piece(self)
    @score = 0
    @game = game
    @delay = 500
  end

  def rotate_one_eighty
    if !game_over? and @game.is_running?
      @current_block.move(0, 0, 2)
    end
    draw
  end

 def next_piece
    @current_block = MyPiece.next_piece(self)
    @current_pos = nil
  end

  def cheat 
     if @score > 10
        @score = @score - 10
        @current_pos.each{|block| block.remove}
        @current_block = MyPiece.new([[[0, 0], [0, 0], [0, 0], [0, 0]]], self)
        puts @current_block
     end
  end

end

class MyTetris < Tetris
  def key_bindings
    super
    @root.bind('u', proc {@board.rotate_one_eighty})
    @root.bind('c', proc {@board.cheat})
  end

  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end
end
