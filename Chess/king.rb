require_relative "piece"

class King < Piece

  def inspect
    "K".colorize(@color)
  end
end
