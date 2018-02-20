require_relative "piece"
require_relative "stepper_module"

class King < Piece
  include Stepper

  attr_reader :move_type

  def initialize(color, board)
    @move_type = :king
    super(color, board)
  end

  def inspect
    "K".colorize(@color)
  end
end
