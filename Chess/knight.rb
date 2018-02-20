require_relative "stepper_module"
class Knight < Piece
include Stepper

attr_reader :move_type

  def initialize(color, board)
    @move_type = :knight
    super(color, board)
  end

  def inspect
    "N".colorize(@color)
  end


end
