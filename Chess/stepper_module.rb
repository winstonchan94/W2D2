module Stepper
  KNIGHT_DIRS = [[1, 2], [1, -2], [-1, 2], [-1, -2],
                [2, 1], [2, -1], [-2, 1], [-2, -1]]
  KING_DIRS = [[0, 1], [1, 0], [0, -1], [-1, 0],
              [1, 1], [-1, 1], [1, -1], [-1, -1]]


  def knight_dirs(pos)
    new_dirs = []
    new_pos = pos.dup
    KNIGHT_DIRS.each do |dir|
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

  def king_dirs(pos)
    new_dirs = []
    new_pos = pos.dup
    KING_DIRS.each do |dir|
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

  def moves
    current_pos = self.pos

    case self.move_type
    when :king
      king_dirs(current_pos).select do |move|
        self.board[move].color != self.color
      end
    when :knight
      knight_dirs(current_pos).select do |move|
        self.board[move].color != self.color
      end
    end

  end
end
