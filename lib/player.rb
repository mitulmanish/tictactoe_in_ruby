class Player
=begin
  Player class stores the b]name of the player and the value of the move
=end
  attr_accessor :name,:value
  def initialize(name,value)
    @name = name.capitalize
    @value = value
  end
end