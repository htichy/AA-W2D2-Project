require 'colorize'
require_relative 'cursor'
require_relative 'board.rb'
require 'byebug'

class Display
  attr_reader :grid

  def initialize(grid)
    @grid = grid
    @cursor = Cursor.new([0, 0], grid)
  end
  
  def render
    @grid.grid.each_with_index do |row, i|  
      puts "------------------"
      row.each_with_index do |cell, j|
        if @cursor.cursor_pos == [i, j]
          print "|#{cell.colorize(:red)}"
        else
          print "|#{cell.colorize(:blue)}"
        end
      end
      print "|\n"
    end
    puts "------------------"
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.render
end