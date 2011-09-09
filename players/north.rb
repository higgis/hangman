class NorthPlayer
  
  def name 
    "North"
  end
  
  def new_game(dictionary)
    @dictionary = dictionary
    @sorted_letters = Hash[("a".."z").zip([0]*26)]
    letters = @dictionary.map{ |word| word.scan(/./)}.flatten.each do |letter|
      @sorted_letters[letter] += 1
    end
    @sorted_letters = @sorted_letters.sort_by{ |l,f| -f }
    @word_patterns = []
    @matched_words = []
  end
  
  def take_turn(guess)
    
    # Set initial patterns
    if @word_patterns.empty?
      @word_patterns = guess.split('/')
    end
    
    matched_words = []
        
    # Try to match words to pattern
    @word_patterns.each do |word_pattern|
      matched_word = guess_word(word_pattern,guess)
      if matched_word
        matched_words << matched_word
      end
    end
    
    if matched_words.length == @word_patterns.length
      return matched_words.join("/")
    elsif matched_words.length > 0
      return matched_words.first
    end
    
    # Guess letter
    letter_guess = @sorted_letters[0]
    @sorted_letters.delete(letter_guess)
    return letter_guess[0]
    
  end
  
  def guess_word(word_pattern,guess)
    re = Regexp.new("^" + word_pattern.gsub("_", ".") + "$")
    matches = @dictionary.select{ |word| word.match(re) }
    
    matches.count == 1 ? matches[0] : false    
  end
  
  def phrase
    
  end
  
end