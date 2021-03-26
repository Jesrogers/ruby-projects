require './lib/player'

describe Player do
  let(:player) { Player.new('Player 1', 'O') }

  describe '#initialize' do
    it 'creates a player with a given name' do
      expect(player.name).to eql('Player 1')
    end

    it 'creates a player with a given mark' do
      expect(player.disc).to eql('O')
    end
  end
end
