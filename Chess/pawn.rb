require_relative "piece"

class Pawn < Piece

  def inspect
    "P".colorize(@color)
  end
end
