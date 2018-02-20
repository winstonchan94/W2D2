require "colorize"
require_relative "board"
require_relative "cursor"

class Display

  attr_reader :board

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    cursor_col = @cursor.cursor_pos[1]
    selected_space = @cursor.cursor_pos

    @board.grid.each_with_index do |row, idx|
      row.each_with_index do |space, col|
        if [idx, col] == selected_space
          print "|*#{space.inspect}*|"
        else
          print "| #{space.inspect} |"
        end
      end
      print "\n"
      puts "________________________________________"
    end

    nil
  end





end
