require 'colorize'
require_relative 'cursor'
require_relative 'board.rb'

class Display
  attr_reader :grid

  def initialize(grid)
    @grid = grid
    @cursor = Cursor.new([0, 0], grid)
  end
  
  def render
    @grid.each do |row, i|
      row.each do |cell, j|
        if cursor.cursor_pos = [i, j]
          puts cell.val.colorize(:red)
        else
          puts cell.val
        end
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  render
end