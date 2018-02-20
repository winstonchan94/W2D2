class Piece

  def initialize(color)
    @color = color
  end

end

class NullPiece < Piece
  def initialize

  end

  def inspect
    "| |"
  end
end

class Pawn < Piece
  def initialize(color)
    super(color)
  end

  def inspect
    "P"
  end
end

class Rook < Piece
  def initialize(color)
    super(color)

  end

  def inspect
    "R"
  end
end

class Knight < Piece
  def initialize(color)
    super(color)

  end
  def inspect
    "K"
  end
end

class Bishop < Piece
  def initialize(color)
    super(color)

  end

  def inspect
    "B"
  end
end

class Queen < Piece
  def initialize(color)
    super(color)

  end

  def inspect
    "Q"
  end
end

class King < Piece
  def initialize(color)
    super(color)

  end

  def inspect
    "Kg"
  end
end
