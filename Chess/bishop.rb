require_relative "piece"
require_relative "sliders_modules"

class Bishop < Piece
include Slider
attr_reader :move_type

  def initialize(color, board)
    @move_type = :bishop
    super(color, board)
  end

  def inspect
    "B".colorize(@color)
  end

end
