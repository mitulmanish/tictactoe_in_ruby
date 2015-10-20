require_relative ('lib/game')
def display
  puts "          ------------"
  puts "           1 | 2 | 3 "
  puts "          -----------"
  puts "           4 | 5 | 6 "
  puts "          -----------"
  puts "           7 | 8 | 9 "
  puts "          ------------"
end

puts display
puts "Enter the name of first palyer:"
@name1 = gets.chomp
puts "Enter the name of second palyer:"
@name2 = gets.chomp
players = [Player.new(@name1,"X"),Player.new(@name2,"O")]
Game.new(players,3)