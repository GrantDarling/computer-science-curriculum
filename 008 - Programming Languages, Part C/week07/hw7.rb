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
    puts "this"
    puts All_My_Pieces.sample
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
  end

end

class MyTetrisRect < TetrisRect
    def initialize(wrapped_canvas, a, b, c, d, color)
        super
  end

end

class MyTetris < Tetris
  # your enhancements here
  def key_bindings
    super
    @root.bind('u', proc {@board.rotate_one_eighty})
  end

  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end

  def draw_piece (piece, old=nil)
    if old != nil and piece.moved
      old.each{|block| block.remove}
    end
    size = @board.block_size
    blocks = piece.current_rotation
    start = piece.position
    blocks.map{|block| 
    MyTetrisRect.new(@canvas, start[0]*size + block[0]*size + 3, 
                       start[1]*size + block[1]*size,
                       start[0]*size + size + block[0]*size + 3, 
                       start[1]*size + size + block[1]*size, 
                       piece.color)}
  end


end