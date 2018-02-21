require_relative "piece"

class Pawn < Piece
  def initialize(color, board)

    case color
    when :red
      @forward_dir = -1
    when :blue
      @forward_dir = 1
    end
    super(color, board)
  end

  def moves
    results = []
    forward = forward_steps
    attacks = side_attacks

    results += forward.reject do |move|
      move.any? {|el| el < 0 || el > 7} ||
      board[move].class != NullPiece
    end

    results += attacks.reject do |move|
      move.any? {|el| el < 0 || el > 7} ||
      board[move].class == NullPiece
    end

    results
  end

  def forward_steps
    current_pos = self.pos
    steps = [[current_pos[0] + @forward_dir, current_pos[1]]]

    if current_pos[0] == 1 || current_pos[0] == 6
      steps << [current_pos[0] + (@forward_dir * 2), current_pos[1]]
    end

    steps
  end

  def side_attacks
    current_pos = self.pos
    attacks = [
    [current_pos[0] + @forward_dir, current_pos[1] - 1],
    [current_pos[0] + @forward_dir, current_pos[1] + 1]
  ]
  end

  def inspect
    "P".colorize(@color)
  end
end
