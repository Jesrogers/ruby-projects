require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :player1, :player2, :board, :current_player

  def initialize
    @player1 = Player.new('', 'X')
    @player2 = Player.new('', 'O')
    @current_player
    @board = Board.new
    @turn = 1
  end

  def start_game
    player_setup
    game_loop
  end

  private def player_setup
    puts 'Hi Player 1, what is your name?'
    @player1.name = gets.chomp

    puts 'Hi Player 2, what is your name?'
    @player2.name = gets.chomp
  end

  private def game_loop
    loop do
      @current_player = choose_player

      @board.display_board
      player_turn

      break if game_over?

      @turn += 1
    end
  end

  private def choose_player
    @turn.odd? ? @player1 : @player2
  end

  private def player_turn
    puts "Turn #{@turn}: #{@current_player.name}'s turn, which cell would you like to choose?"

    loop do
      chosen_cell = @current_player.choose_cell
      chosen_cell_index = chosen_cell - 1

      if @current_player.valid_cell?(chosen_cell) && @board.available_cell?(chosen_cell_index)
        return @board.update_board(chosen_cell_index, @current_player.marker)
      end
    end
  end

  private def game_over?
    win_check || draw_check
  end

  private def win_check
    if @board.winning_combination?(@current_player.marker)
      puts "Player #{@current_player.name} has won!"
      true
    end
  end

  private def draw_check
    if @board.full?
      puts 'Draw!'
      true
    end
  end
end
