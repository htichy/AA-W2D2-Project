class Piece 
  attr_reader :grid, :cursor_pos
  def initialize(color, grid, pos)
    @color = color
    @grid = grid
    @cursor_pos = cursor_pos
    @pos = pos
  end
  
  def moves
    moves = []
    @grid.grid.each_with_index do |row, i|
     row.each_with_index do |cell, j|
       moves << [i, j]
     end
    end
  
    moves
  end
  
  def valid_moves
    
  end 
end 

module SlidingPieces
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

  def diagonal_moves

    DIAGONAL_DIRS
  end
  
  def straight_moves
    
    HORIZONTAL_DIRS
  end 
end 

class Queen < Piece
  include SlidingPieces
  
  def symbol
    
  end  
  
  protected
  def moves
    tot_moves = super
    q_moves = []
    dirs = SlidingPieces.diagonal_moves + SlidingPieces.straight_moves
    
    dirs.each do |dir|
      scale = 1

      8.times do
        new_pos = self.pos + dir * scale
        q_moves << new_pos if tot_moves.include?(new_pos)
        scale += 1
      end
    end
    
    q_moves
  end
end 

class Bishop < Piece
  include SlidingPieces

  
  def symbol
      
  end
  
  protected
  def moves
    tot_moves = super
    b_moves = []
    dirs = SlidingPieces.diagonal_moves
    
    dirs.each do |dir|
      scale = 1

      8.times do
        new_pos = self.pos + dir * scale
        b_moves << new_pos if tot_moves.include?(new_pos)
        scale += 1
      end
    end
    
    b_moves
  end
end 

class Rook < Piece
  include SlidingPieces
  
  def symbol
      
  end

  protected
  def moves
    tot_moves = super
    r_moves = []
    dirs = SlidingPieces.straight_moves

    dirs.each do |dir|
      scale = 1

      8.times do
        new_pos = self.pos + dir * scale
        r_moves << new_pos if tot_moves.include?(new_pos)
        scale += 1
      end
    end
    
    r_moves
  end

end

module SteppingPieces
  DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  LDIRS = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]
  
  def king_moves
    DIRS
  end
  
  def knight_moves
    LDIRS
  end
end 

class Knight < Piece 
  include SteppingPieces
  
  def symbol
    
  end
  
  protected  
  def moves
    tot_moves = super
    kn_moves = []
    dirs = SteppingPieces.knight_moves
    
    dirs.each do |dir|
      new_pos = self.pos + dir
      kn_moves << new_pos if tot_moves.include?(new_pos)
    end
    
    kn_moves
  end

end

class King < Piece 
  include SteppingPieces

  def symbol
    
  end  

  protected

  def moves
    tot_moves = super
    ki_moves = []
    dirs = SteppingPieces.king_moves
    
    dirs.each do |dir|
      new_pos = self.pos + dir
      ki_moves << new_pos if tot_moves.include?(new_pos)
    end
    
    ki_moves
  end

end 

# class NullPieces < Piece 
#   attr_reader :color, :symbol
# 
#   include Singleton 
# 
#   def initialize
#   end
# 
# end 

class Pawns < Piece
  def symbol
    
  end
  
  def move
    
  end
  
  private
  def at_start_row?
    return true if self.color == white && self.pos[0] == 1
    return true if self.color == black && self.pos[0] == 6
    false
  end
  
  def forward_dir
    return -1 if self.color == white
    return 1 if self.color == black
  end
  
  def forward_steps
    if self.color == white
      if self.at_start_row?
        [[self.pos[0] - 1, self.pos[1]], [self.pos[0] - 2, self.pos[1]]]
      else
        [self.pos[0] - 1, self.pos[1]
      end
    else
      if self.at_start_row?
        [[self.pos[0] + 1, self.pos[1]], [self.pos[0] + 2, self.pos[1]]]
      else
        [self.pos[0] + 1, self.pos[1]
      end
    end  
  end
  
  def side_attacks
    if self.color == white
      attack_dirs = [[-1, 1], [-1, -1]]
      attacks = []
      
      attack_dirs.each do |dir|
        attack_pos = [self.pos[0] + dir[0], self.pos[1] + dir[1]]
        attacks << attack_pos unless grid[attack_pos].nil? || grid[attack_pos].color == white
      end
    elsif self.color == black
      attack_dirs = [[1, 1], [1, -1]]
      attacks = []
      
      attack_dirs.each do |dir|
        attack_pos = [self.pos[0] + dir[0], self.pos[1] + dir[1]]
        attacks << attack_pos unless grid[attack_pos].nil? || grid[attack_pos].color == black
      end
    end
    
    attacks
  end
end 

