require_relative "piece"
require_relative "sliders_modules"

class Queen < Piece
  include Slider
  def inspect
    "Q".colorize(@color)
  end
end
