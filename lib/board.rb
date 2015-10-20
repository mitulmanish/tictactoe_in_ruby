require 'matrix'
class Board
=begin
  This is the virtual playing area defined with a 3 X 3 matrix
=end

  attr_accessor :grid,:size

  def initialize size
    # Board object is initialized with matrix size and initially populated with numbers for numbers 1 to 9 .
    @grid = Array.new(size) { Array.new(size) }
    @size = @grid.size
    populate
    print_grid
  end

  def get_cell a,b
    # gives the value at a particular cell
    grid[a][b]
  end

  def set_cell(x, y, value)
    # set the value for a particular cell
    if grid[x][y].include?"X" or grid[x][y].include?"O"
      puts "Already taken"
    else
      grid[x][y] = value
    end
  end

  def check_cell x, y
    #checks whether the cell is already occupied with player values
    return 0 if grid[x][y].include?"X" or grid[x][y].include?"O"
    return 1
  end

  def populate
    # inserts the number from 1 to 9 in the grid and acts a visual guide
    puts "Loading ..."
    index = 1
    grid.each_index do |i|
      subarray = grid[i]
      subarray.each_index do |x|
        grid[i][x] = index.to_s
        index = index+1
      end
    end
  end

  def display_positions
    # initial board for players
    puts "------------"
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts "------------"
  end

  def print_grid
    # prints the board on the screen with the updated values in the cells

    puts "          " +"-------------------"
    grid.each do |row|
      #puts row.map { |cell| !cell.nil? ? "|"+cell+"|" : "|"+"  |"  }.join("")
      puts "          " + row.map { |cell| cell.nil? ? "_" : "| "+cell+" |" }.join("  ")
      puts "          " +"-------------------"
    end
  end

  def decide_winner
    #holds the algorithmn for deciding the winner by checking row
    #columns  and diagonals for equality

    diagonal_1 = Matrix.rows(grid).each(:diagonal).to_a
    diagonal_2 = Matrix.rows(grid.reverse).each(:diagonal).to_a

    if grid.any? { |row| row.uniq.count == 1 }
      return 1
    elsif grid.transpose.any? { |row| row.uniq.count == 1 }
      return 1
    elsif diagonal_1.uniq.size ==1
      return 1
    elsif diagonal_2.uniq.size ==1
      return 1
    else
      return 0
    end
  end
end

