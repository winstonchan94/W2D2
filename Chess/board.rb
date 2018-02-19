class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
  end

  def populate
    @grid[1].each do |place|
      place = Pawn.new(black)
    end

    @grid[6].each do |place|
      place = Pawn.new(white)
    end

    @grid[2..5].each do |row|
      row.each {|space| space = NullPiece.new}
    end

    @grid[0] = special_pieces(black)
    @grid[7] = special_pieces(white)
    end

    def special_pieces(color)
      [Rook.new(color), Knight.new(color), Bishop.new(color),
         Queen.new(color), King.new(color), Bishop.new(color),
       Knight.new(color), Rook.new(color)]
    end

    def move_piece(start_pos, end_pos)
      if @grid[start_pos].is_a?(NullPiece) || !@grid[start_pos].valid_move(end_pos)
        raise ArgumentError.new("Invalid Move, choose again")
      end

      @grid[end_pos] = @grid[start_pos]
      @grid[start_pos] = NullPiece.new
    end
  end
