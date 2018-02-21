require 'colorize'
require 'byebug'

class Piece
  attr_reader :color
  attr_reader :board
  attr_reader :pos
  def initialize(color, board)

    @color = color
    @board = board
    @pos = []
  end

  def position(arr)
    @pos = arr
  end

end

class NullPiece < Piece
  # include Singleton
  def initialize

  end

  def inspect
    " "
  end
end
