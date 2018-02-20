require_relative "piece"
require_relative "sliders_modules"
class Rook < Piece
  include Slider
  def inspect
    "R".colorize(@color)
  end


  def get_moves
    self.moves("horizontal")
  end
end
