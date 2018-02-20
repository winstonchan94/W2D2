require_relative "piece"
require_relative "sliders_modules"
class Rook < Piece
  include Slider

  attr_reader :move_type

  def initialize(color, board)
    @move_type = :rook
    super(color, board)
  end

  def inspect
    "R".colorize(@color)
  end

end
