class TeamPlayer

  def name
    "Team"
  end

  def new_game(dictionary)
    @guessed = []
    @dictionary = dictionary
  end

  def take_turn(pattern)
    guess_word(pattern)
  end

  def guess_word(pattern)
    words = pattern.split("/")
    
    word_guesses = []
    
    words.each do |word|
      if word.include? "_"
        re = Regexp.new("^" + word.gsub("_",".") + "$")
        possible_words = @dictionary.select{ |word| word.match(re) }
        if possible_words.length == 1
          word_guesses << possible_words.first
        end
      end
    end
    
    if word_guesses.length == 1
      return word_guesses.first
    else
      return guess_letter
    end
  end

  def guess_letter
    guess = get_frequencies
    @guessed << guess
    guess
  end

  def get_frequencies
    frequencies = {}
    letters = @dictionary.map { |word| word.scan(/./) }.flatten - @guessed
    letters.each do |letter|
      frequencies[letter] ||= 0
      frequencies[letter] += 1
    end
    sorted = frequencies.sort_by{ |l,f| -f }
    sorted.first.first
  end

end