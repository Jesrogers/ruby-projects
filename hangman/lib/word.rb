class Word
  attr_reader :word, :obfuscated_word

  def initialize
    @word = ''
    @obfuscated_word = ''
  end

  def setup_word
    word_array = File.readlines('5desk.txt')
    cleaned_array = clean_words(word_array)

    @word = choose_word(cleaned_array)
    @obfuscated_word = "-" * @word.length
  end

  def update_obfuscated_word(guessed_letters)
    @obfuscated_word = obfuscate_word(@word, guessed_letters)
  end

  def solved?
    @word == @obfuscated_word
  end

  private def clean_words(words)
    stripped_words = words.map(&:strip)
    filtered_words = stripped_words.filter { |word| word.length >= 5 && word.length <= 12 }
  end

  private def choose_word(words)
    chosen_word = words.sample.downcase
  end

  private def obfuscate_word(word, guessed_letters)
    letters = word.split('')
    @obfuscated_word = ''

    letters.each do |letter|
      @obfuscated_word += if guessed_letters.include? letter
                            letter
                          else
                            '-'
                          end
    end

    @obfuscated_word
  end
end
