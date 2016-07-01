##TicTacToe Game

To run the script ,please navigate to the root of the folder.
- Run “ bundle install “ to install the dependencies
- Run “ ruby run.rb” to run the program
- Run “ rspec spec/board_spec.rb “ to run the board test script
- Run “ rspec spec/player_spec.rb “ to run the player test script

# tictactoe_in_ruby
TicTacToe (Simple 3 X 3 board game)

## tic-tac-toe

Using a language of your choosing, you will need to create a slightly simplified nxn tic-tac-toe game.

Your initial 'board' is a grid of nxn squares. As game play progresses,
each square can get filled by an 'X', 'O', or remain empty - just like normal
tic-tac-toe.  The game is won with three in a row of 'X' or 'O' in any
direction, _not_ including diagonals (that's the simplification).

You will have one 'board', through which the players will play.

Here's an example of how the board might be used to play through a game (in Ruby):

    def playgame

      board = Board.new(3)

      board.square_is(1, 1, 'X')
      board.square_is(1, 0, 'O')
      board.square_is(0, 1, 'X')
      board.square_is(2, 1, 'O')
      board.square_is(0, 2, 'X')
      board.square_is(2, 0, 'O')

      # check for a winner - won't find one.

      board.square_is(0, 0, 'X')

      # check for a winner - X has won.

    end
