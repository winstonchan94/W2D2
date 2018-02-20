require_relative "piece"
require_relative "sliders_modules"

class Bishop < Piece
include Slider
  def inspect
    "B".colorize(@color)
  end
end
