require_relative 'word'
require_relative 'player'

class Hangman

  def initialize
    @word = Word.new
    @player = Player.new
  end

  def new_game
    setup_game
  end

  private def setup_game
    @word.setup_word
    game_loop
  end

  def game_loop
    loop do
      display_game_info
      break if game_over?

      @player.player_turn(@word)
      @word.update_obfuscated_word(@player.guessed_letters)
    end

    puts "The word was #{@word.word}"
  end

  private def game_over?
    @word.solved? || @player.life.zero?
  end

  private def display_game_info
    system 'clear'

    puts @word.obfuscated_word
    puts "Life: #{@player.life} | Guesses: #{@player.guessed_letters}"
  end
end
