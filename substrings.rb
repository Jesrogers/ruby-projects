dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(phrase, dictionary)
  result = {}

  dictionary.each do |word|
    count = phrase.downcase.scan(word).length

    result[word] = count unless count == 0
  end

  result
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
