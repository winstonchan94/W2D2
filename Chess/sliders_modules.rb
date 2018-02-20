module Slider
  require 'byebug'
  HORIZONTAL_DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, 1], [1, -1]]

  def horizontal_dirs(pos)
    new_dirs = []
    new_pos = pos.dup
    HORIZONTAL_DIRS.each do |dir|
      new_pos = [new_pos[0] + dir[0], new_pos[1] + dir[1]]
      if (new_pos[0] >= 8 || new_pos[0] < 0) || (new_pos[1] >= 8 || new_pos[1] < 0)
        new_pos = pos.dup
        next
      else
        new_dirs << new_pos
        new_pos = pos.dup
      end
    end

    new_dirs
  end

  def diagonal_dirs(pos)
    new_dirs = []
    new_pos = pos.dup
    DIAGONAL_DIRS.each do |dir|
      new_pos = [new_pos[0] + dir[0], new_pos[1] + dir[1]]
      if (new_pos[0] >= 8 || new_pos[0] < 0) || (new_pos[1] >= 8 || new_pos[1] < 0)
        new_pos = pos.dup
        next
      else
        new_dirs << new_pos
        new_pos = pos.dup
      end
    end

    new_dirs
  end

  def moves(move_type)
    current_pos = self.position
    possible_moves = []

    case move_type
    when "horizontal"
      horizontal_dirs(current_pos).each do |pos|
        possible_moves += grow_unblocked_moves_in_dir(pos[0], pos[1])
      end
    when "diagonal"
      diagonal_dirs(current_pos).each do |pos|
        possible_moves += grow_unblocked_moves_in_dir(pos[0], pos[1])
      end
    when "both"
      (horizontal_dirs(current_pos) + diagonal_dirs(current_pos)).each do |pos|
        possible_moves += grow_unblocked_moves_in_dir(pos[0], pos[1])
      end
    end

    possible_moves
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    new_pos = [self.position[0] + dx, self.position[1] + dy]

    results = []

    until (new_pos[0] >= 8 || new_pos[0] < 0) || (new_pos[1] >= 8 || new_pos[1] < 0)
      || self.board[[new_pos]].color != self.color
      if self.board[[new_pos]].class != NullPiece
        results << new_pos
        break
      else
        results << new_pos
        new_pos = [new_pos[0] + dx, new_pos[1] + dy]
      end

    end

    results
  end

  def moves_dir

  end
end
