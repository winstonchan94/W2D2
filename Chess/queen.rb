require_relative "piece"
require_relative "sliders_modules"

class Queen < Piece
  include Slider

  attr_reader :move_type

  def initialize(color, board)
    @move_type = :queen
    super(color, board)
  end

  def inspect
    "Q".colorize(@color)
  end

end
