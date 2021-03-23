require_relative 'text_display'

class Board
  include TextDisplay
  attr_reader :grid

  def initialize
    @grid = Array.new(7) { Array.new(6) }
  end

  def display_board
    rowline = "__________________________________________________" 
    puts `clear`
    5.downto(0) do |row|
        puts rowline
        puts "\n"

        0.upto(6) do |column|
            print_cell(column, row)
        end
    end
      puts rowline
      puts "\n"
      print "   1      2      3      4      5      6      7   "
      puts "\n"
      puts "\n"
  end

  def drop_piece(column_number, disc)
    column_index = column_number_to_index(column_number)
    selected_column = @grid[column_index]
    nil_count = selected_column.count(nil)

    selected_column[selected_column.length - nil_count] = disc
  end

  def column_full?(column_number)
    column_index = column_number_to_index(column_number)
    
    @grid[column_index].count(nil).zero?
  end

  def winning_combination? 
    row_win?
  end

  def full? 
    full = true
    @grid.each do |column|
        full = false if column.any?(&:nil?)
    end
    display_board
    board_full_message
    full
  end
  
  private

  def print_cell(column, row)
    @grid[column][row].nil? ? (print "|      ") : (print "|  #{@grid[column][row]}   ")
    if column == 6
      print "|" if column == 6 
      print "\n" if column == 6 
    end
  end

  def column_number_to_index(number)
    number.to_i - 1
  end

end
