require './lib/connect_four'

describe ConnectFour do
  let(:game) { ConnectFour.new }

  describe '#initialize' do
    it "Should have a player named 'Player 1'" do
      expect(game.player1.name).to eql('Player 1')
    end

    it "Should have 'O' set as player 1's disc" do
      expect(game.player1.disc).to eql('O')
    end

    it "Should have a player named 'Player 2'" do
      expect(game.player2.name).to eql('Player 2')
    end

    it "Should have 'X' set as player 2's disc" do
      expect(game.player2.disc).to eql('X')
    end

    it 'Should have a board' do
      expect(game.board).to be_truthy
    end
  end
end
