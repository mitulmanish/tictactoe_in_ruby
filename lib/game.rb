require_relative '../lib/board'
require_relative '../lib/player'


class Game
=begin
  This is the controller class which runs the game

=end
  attr_accessor :player_list,:board,:current,:other
  def initialize (players,size)
    # the object of the game class  is initialized with players and the board size
    @player_list = players
    @current,@other = @player_list.shuffle
    @board = Board.new(size)
    @max_count = size * size
    @count = 0
    puts current.name + " will play first"
    play_game
  end

  def play_game
    #
    while @count < @max_count
      message
      if board.decide_winner == 0
        puts "No match"
        change_players
        puts current.name.capitalize + " will play Now"
        board.print_grid
      else
        puts "Game over"
        puts String(other.name)+ " you lost "
        puts String(current.name)+ " beat you in "+ String(@count)+ " chances"
        exit(0)
      end
      @count += 1
    end
    puts "Whooa The Game ended in a draw.Try harder next time"
  end

  def message
    # prompts the user for input
    puts "#{current.name} Your symbol is : #{current.value}"
    begin
      puts "enter the position".capitalize
      user_input  = get_value
      move = map(user_input.to_s)
    rescue ArgumentError
      puts "Please enter a Integer value"
      retry
    end
    if board.check_cell(move[0],move[1]) == 0
      puts "position occupied"
      message
    end
    board.set_cell(move[0],move[1],current.value)
  end

  def change_players
    #swaps the players after every turn
    @current,@other = @other,@current
  end

  def map chance
    #provides the co-ordinates of the board according to the keys provided
    mapping = {
        "1" => [0,0],
        "2" => [0,1],
        "3" => [0,2],
        "4" => [1,0],
        "5" => [1,1],
        "6" => [1,2],
        "7" => [2,0],
        "8" => [2,1],
        "9" => [2,2]
    }
    mapping[chance]
  end

  def get_value
    #checks that number is in the specified range
    while(num = Integer(gets.chomp))
      next  puts "enter a valid number between 1 and 9" if num < 1 or num > 9
      return num
    end
  end

end