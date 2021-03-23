class Player
  attr_reader :player_guess, :guessed_letters, :life
  attr_accessor :guessed_letters

  def initialize
    @life = 8
    @player_guess = ""
    @guessed_letters = []
  end

  def player_turn(word)
    input = player_input

    @guessed_letters.push(input)
    compare_guess_to_word(input, word.word)
  end

  private def player_input
    puts "Enter a letter to guess, or 'save' to save and quit."

    loop do
      input = gets.chomp

      if input.match(/^[a-z]$|^save$/) && !@guessed_letters.include?(input)
        return input
      else
        puts "Please enter a letter 'a-z' that hasn't been guessed yet."
      end
    end
  end

  private def compare_guess_to_word(letter, word)
    @life -= 1 unless word.include? letter
  end
end
