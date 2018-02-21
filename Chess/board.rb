require_relative "queen"
require_relative "bishop"
require_relative "king"
require_relative "knight"
require_relative "rook"
require_relative "pawn"

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    self.populate

    @grid.each_index do |row|
      @grid[row].each_index do |col|
        (self[[row, col]]).position([row, col])
      end
    end

  end

  def inspect
    nil
  end

  def populate

    @grid[1].map! {|el| Pawn.new(:blue, self)}

    @grid[6].map! {|el| Pawn.new(:red, self)}

    @grid[2..5].each do |row|
      row.map! {|place| NullPiece.new}
    end

    @grid[0] = special_pieces(:blue, self)
    @grid[7] = special_pieces(:red, self)
    end

    def special_pieces(color, board)
      [Rook.new(color, board), Knight.new(color, board), Bishop.new(color, board),
         Queen.new(color, board), King.new(color, board), Bishop.new(color, board),
       Knight.new(color, board), Rook.new(color, board)]
    end

    def move_piece(start_pos, end_pos)
      if self[start_pos].is_a?(NullPiece) || !self[start_pos].moves.include?(end_pos)
        raise ArgumentError.new("Invalid Move, choose again")
      end

      self[end_pos] = self[start_pos]
      self[end_pos].position(end_pos)
      self[start_pos] = NullPiece.new
    end

    def [](pos)
      row, col = pos
      @grid[row][col]
    end

    def []=(pos, val)
      row, col = pos
      @grid[row][col] = val
    end
  end
