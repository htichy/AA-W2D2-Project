require_relative 'display'
require_relative 'player'
require_relative 'board'

require 'byebug'

class Game
  
  def initialize(board, display, players, current_player)
    @board = board
    @display = display
  end
end