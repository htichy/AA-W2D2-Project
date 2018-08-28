class Piece 
  
  def moves
     
  end 

  
end 

module SlidingPieces 
end 

class Queen < Piece
  include SlidingPieces
end 

class Bishop < Piece
  include SlidingPieces
end 

class Rook < Piece
  include SlidingPieces
end

module SteppingPieces 
end 

class Knight < Piece 
  include SteppingPieces
end

class King < Piece 
  include SteppingPieces
end 

class NullPieces < Piece 
end 

class Pawns < Piece 
end 

