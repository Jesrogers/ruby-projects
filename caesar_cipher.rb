word = 'What a string!'
shift = 5

# lowercase range = 97 - 122
# uppercase range = 65 - 90

def caesar_cipher(word, shift)
  result = ''

  word.each_char do |char|
    base_ord = char.ord > 91 ? 97 : 65

    result += if (97..122).include?(char.ord) || (65..90).include?(char.ord)
                shift_char(char, shift, base_ord)
              else
                char
              end
  end

  result
end

def shift_char(char, shift, base_ord)
  shifted_ord = (((char.ord - base_ord) + shift) % 26) + base_ord
  shifted_ord.chr
end

puts caesar_cipher(word, shift)
