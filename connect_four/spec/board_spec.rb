require './lib/board'

describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'should contain an array of length 7' do
      expect(board.grid.length).to eq(7)
    end

    it 'should contain 7 empty arrays of size 6' do
      expect(board.grid.all? { |column| column.length == 6 }).to be true
    end
  end

  describe '#full?' do
    it 'should return false when empty' do
      expect(board.full?).to be false
    end

    it 'should return true when full' do
      board.grid = Array.new(7) { Array.new(6, 'X') }
      expect(board.full?).to be true
    end
  end

  describe '#drop_piece' do
    context 'when all columns are empty' do
      it 'should set the first item of the selected column to the disc' do
        board.drop_piece(5, 'X')
        expect(board.grid[4][0]).to eql('X')
      end

      it 'should not affect any other items in the selected column\'s array' do
        board.drop_piece(5, 'X')
        expect(board.grid[4][1]).to be_nil
      end

      it 'should not affect any other columns aside from the selected column' do
        board.drop_piece(5, 'X')
        expect(board.grid[6][0]).to be_nil
      end
    end

    context 'when a column has a disc in it' do
      it 'should drop a disc in the second position of the selected array' do
        board.grid[4][0] = 'X'
        board.drop_piece(5, 'X')
        expect(board.grid[4][1]).to eql('X')
      end

      it 'should not affect any other columns aside from the selected column' do
        board.grid[4][0] = 'X'
        board.drop_piece(5, 'X')
        expect(board.grid[6][0]).to be_nil
      end
    end
  end

  describe '#column_full?' do
    it 'should return false when the column is not full' do
      expect(board.column_full?(5)).to be false
    end

    it 'should return true when the column is full' do
      board.grid[4] = Array.new(6, 'X')
      expect(board.column_full?(5)).to be true
    end
  end

  describe 'full?' do
    it 'should return false if the board is not full' do
      board.grid[0][0] = 'X'
      expect(board.full?).to be false
    end

    it 'should return true if the board is full' do
      board.grid = Array.new(7) { Array.new(6) {'X'} }
      expect(board.full?).to be true
    end
  end

  describe '#winning_combination?' do
    it 'should return false if the board is empty' do
      expect(board.winning_combination?).to be false   
    end

    it 'should return true if there are four adjacent discs in a row' do
      board.drop_piece(1, 'X')
      board.drop_piece(2, 'X')
      board.drop_piece(3, 'X')
      board.drop_piece(4, 'X')
      expect(board.winning_combination?).to be true
    end

    it 'should return false if there are not four adjacent discs in a row' do
      board.drop_piece(1, 'X')
      board.drop_piece(2, 'X')
      board.drop_piece(4, 'X')
      board.drop_piece(5, 'X')
      expect(board.winning_combination?).to be false 
    end
    
    it 'should return true if there are four adjacent discs in a column' do
      board.drop_piece(1, 'X')
      board.drop_piece(1, 'X')
      board.drop_piece(1, 'X')
      board.drop_piece(1, 'X')
      expect(board.winning_combination?).to be true
    end

    it 'should return true if there are four adjacent pieces diagonally' do
      board.grid[0][0] = 'X'
      board.grid[1][1] = 'X'
      board.grid[2][2] = 'X'
      board.grid[3][3] = 'X'
      expect(board.winning_combination?).to be true
    end
  end
end
