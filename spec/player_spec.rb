require 'player'

describe 'Player' do
  describe '#name' do
    it "allows reading for :name" do
      player1 = Player.new("Mitul","X")
      expect(player1.name).to eq("Mitul")
    end
    it "name is not equal to string of a different name" do
      player2 = Player.new("Tim","X")
      expect(player2.name).not_to eq("Mitul")
    end

  end

  describe '#value' do
    it "allows reading for :value" do
      player3 = Player.new("Mitul","O")
      expect(player3.value).to eq("O")
    end

    it "value is not equal to some different value" do
      player4 = Player.new("Sarah","X")
      expect(player4.value).not_to eq("O")
    end

  end
end