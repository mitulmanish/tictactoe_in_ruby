require 'Board'

describe 'Board' do

  it "allows for checking the size of the board row" do
    board = Board.new(3)
    board.grid.each do |row|
      expect(row.size).to eq(3)
    end
  end

  it "allows for checking the value of the particular grid" do
    board = Board.new(3)
    expect(board.get_cell(2,2)).to eq('9')
  end

  it "allow for checking that a particular grid is set to a prescribed value" do
    board = Board.new(3)
    expect(board.get_cell(0,0)).to eq('1')
  end

  it "allow for checking that a particular grid is not set  to a wrong value" do
    board = Board.new(3)
    expect(board.get_cell(0,1)).not_to eq('7')
  end

  it "allows for checking that user input is accepted correctly" do
    board = Board.new(3)
    board.set_cell(0,0,"X")
    expect(board.get_cell(0,0)).to eq('X')
  end

  it "allows for checking that user input is fetched correctly" do
    board = Board.new(3)
    board.set_cell(0,1,'X')
    expect(board.get_cell(0,1)).not_to eq('O')
  end
  it "allows for checking row matching scenario " do
    board = Board.new(3)
    board.set_cell(0,0,'X')
    board.set_cell(0,1,'X')
    board.set_cell(0,2,'X')
    expect(board.decide_winner).to eq(1)
  end

  it "allows for checking column matching scenario " do
    board = Board.new(3)
    board.set_cell(0,0,'O')
    board.set_cell(1,0,'O')
    board.set_cell(2,0,'O')
    expect(board.decide_winner).to eq(1)
  end

  it "allows for checking diagonal matching scenario " do
    board = Board.new(3)
    board.set_cell(0,0,'O')
    board.set_cell(1,1,'O')
    board.set_cell(2,2,'O')
    expect(board.decide_winner).to eq(1)
  end

  it "allows for checking consisteny of winning algorithm " do
    board = Board.new(3)
    board.set_cell(0,0,'O')
    board.set_cell(1,1,'X')
    board.set_cell(2,2,'O')
    expect(board.decide_winner).to eq(0)
  end
  it "allows for checking consisteny of winning algorithm wrt row" do
    board = Board.new(3)
    board.set_cell(0,0,'O')
    board.set_cell(0,1,'X')
    board.set_cell(0,2,'O')
    expect(board.decide_winner).to eq(0)
  end

  it "allows for checking consisteny of winning algorithm wrt column" do
    board = Board.new(3)
    board.set_cell(0,0,'O')
    board.set_cell(1,0,'X')
    expect(board.decide_winner).to eq(0)
  end

  it "allows for checking the full game draw scenario" do
    board = Board.new(3)
    board.set_cell(0,0,'O')
    board.set_cell(0,1,'X')
    board.set_cell(0,2,'O')
    board.set_cell(1,0,'O')
    board.set_cell(1,1,'X')
    board.set_cell(1,2,'O')
    board.set_cell(2,0,'X')
    board.set_cell(2,1,'O')
    board.set_cell(2,2,'X')
    expect(board.decide_winner).to eq(0)
  end
end