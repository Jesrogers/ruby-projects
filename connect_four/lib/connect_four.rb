require_relative 'player'
require_relative 'board'
require_relative 'text_display'

class ConnectFour
  include TextDisplay
  attr_reader :player1, :player2, :board

  def initialize
    @player1 = Player.new('Player 1', 'O')
    @player2 = Player.new('Player 2', 'X')
    @board = Board.new
    @current_player = @player1
  end

  def new_game
    game_loop
  end

  private

  def game_loop
    loop do
      @board.display_board
      player_turn_prompt(@current_player)
      column_number = choose_column

      @board.drop_piece(column_number, @current_player.disc)
      break if game_over?

      switch_player
    end
  end

  def choose_column
    loop do
      column_choice = gets.chomp

      return column_choice if column_choice.match(/^[1-7]$/) && !@board.column_full?(column_choice)

      player_input_error
    end
  end

  def game_over?
    if @board.winning_combination? 
      @board.display_board
      player_win_message(@current_player)
      true
    elsif @board.full?
      @board.display_board
      board_full_message
      true
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end
