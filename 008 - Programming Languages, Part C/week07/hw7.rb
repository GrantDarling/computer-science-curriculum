# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
   # square-bump
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

  # your enhancements here
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
    @cheated = false
  end

  def score=(score)
    @score = score
  end

  def current_pos
    @current_pos
  end

  def current_block=(current_block)
    @current_block = current_block
  end

  def cheated
    @cheated
  end

  def cheated=(cheated)
    @cheated = cheated
  end

  # rotates the current piece 180 degrees
  def rotate_one_eighty
    if !game_over? and @game.is_running?
      @current_block.move(0, 0, 2)
    end
    draw
  end

 def next_piece
    @current_block = MyPiece.next_piece(self)
    @current_pos = nil
    @cheated = false
  end

end

class MyTetrisRect < TetrisRect
    def initialize(wrapped_canvas, a, b, c, d, color)
        super
  end

end

class MyTetris < Tetris
  # your enhancements here
  def initialize
    super 
    #@cheated = true
  end

  def key_bindings
    super
    @root.bind('u', proc {@board.rotate_one_eighty})
    @root.bind('c', proc {cheat})
  end

  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end

  def cheat 
     if @board.score > 10 && @board.cheated == false
        @board.cheated = true
        @board.score = @board.score - 10
        @board.current_pos.each{|block| block.remove}
        @board.current_block = MyPiece.new(([[[0, 0], [0, 0], [0, 0], [0, 0]]]), @board)
       #MyPiece.new(([[0, 0], [0, 0], [0, 0], [0, 0]]), @board)
     else 
        puts "score is under 10 or has cheated"
     end
  end
end