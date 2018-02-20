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

  def diagonal_dirs

  end

  def moves

  end

  def grow_unblocked_moves_in_dir(dx, dy)

  end

  def moves_dir

  end
end
