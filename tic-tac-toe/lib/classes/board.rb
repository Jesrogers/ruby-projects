class Board
  attr_accessor :grid

  def initialize
    @grid = %w[1 2 3 4 5 6 7 8 9]
  end

  def display_board
    separator = '-------------'

    puts "  #{@grid[0]} | #{@grid[1]} | #{@grid[2]}   "
    puts separator
    puts "  #{@grid[3]} | #{@grid[4]} | #{@grid[5]}   "
    puts separator
    puts "  #{@grid[6]} | #{@grid[7]} | #{@grid[8]}   "
  end

  def update_board(cell, marker)
    @grid[cell] = marker
  end

  def winning_combination?(marker)
    winning_horizontal?(marker) ||
      winning_vertical?(marker) ||
      winning_diagonal?(marker)
  end

  def available_cell?(cell)
    if @grid[cell] != 'X' && @grid[cell] != 'O'
      true
    else
      puts 'That cell is already taken'
    end
  end

  def full?
    @grid.all? { |cell| %w[X O].include?(cell) }
  end

  private def winning_horizontal?(marker)
    get_horizontals.any? do |row|
      row.all? { |cell| cell == marker }
    end
  end

  private def winning_vertical?(marker)
    get_verticals.any? do |column|
      column.all? { |cell| cell == marker }
    end
  end

  private def winning_diagonal?(marker)
    get_diagonals.any? do |diagonal|
      diagonal.all? { |cell| cell == marker }
    end
  end

  private def get_horizontals
    [[@grid[0], @grid[1], @grid[2]], [@grid[3], @grid[4], @grid[5]], [@grid[6], @grid[7], @grid[8]]]
  end

  private def get_verticals
    [[@grid[0], @grid[3], @grid[6]], [@grid[1], @grid[4], @grid[7]], [@grid[2], @grid[5], @grid[8]]]
  end

  private def get_diagonals
    [[@grid[0], @grid[4], @grid[8]], [@grid[2], @grid[4], @grid[6]]]
  end
end
