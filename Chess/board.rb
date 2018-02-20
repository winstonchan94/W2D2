require_relative "piece.rb"

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    self.populate
  end

  def populate
    @grid[1].map! {|el| Pawn.new(:blue)}

    @grid[6].map! {|el| Pawn.new(:red)}

    @grid[2..5].each do |row|
      row.map! {|place| NullPiece.new}
    end

    @grid[0] = special_pieces(:blue)
    @grid[7] = special_pieces(:red)
    end

    def special_pieces(color)
      [Rook.new(color), Knight.new(color), Bishop.new(color),
         Queen.new(color), King.new(color), Bishop.new(color),
       Knight.new(color), Rook.new(color)]
    end

    def move_piece(start_pos, end_pos)
      if self[start_pos].is_a?(NullPiece)
       # || !@grid[start_pos].valid_move(end_pos)
        raise ArgumentError.new("Invalid Move, choose again")
      end

      self[end_pos] = self[start_pos]
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
