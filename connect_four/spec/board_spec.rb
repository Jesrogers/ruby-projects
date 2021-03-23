require './lib/board'

describe Board do
  describe '#initialize' do
    board = Board.new

    it 'should contain an array of length 7' do
      expect(board.grid.length).to eq(7)
    end

    it 'should contain 7 empty arrays of size 6' do
      expect(board.grid.all? { |column| column.length == 6 }).to be_truthy
    end
  end
end
