require 'colorize'

class Piece
  attr_reader :color

  def initialize(color)
    @color = color
  end

end

class NullPiece < Piece
  def initialize

  end

  def inspect
    " "
  end
end

class Pawn < Piece

  def inspect
    "P".colorize(@color)
  end
end

class Rook < Piece

  def inspect
    "R".colorize(@color)
  end
end

class Knight < Piece

  def inspect
    "N".colorize(@color)
  end
end

class Bishop < Piece

  def inspect
    "B".colorize(@color)
  end
end

class Queen < Piece

  def inspect
    "Q".colorize(@color)
  end
end

class King < Piece

  def inspect
    "K".colorize(@color)
  end
end
