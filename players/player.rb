class LesPlayer
  def name
    "Leverage Enterprise Synergies"
  end
  
  def new_game(dictionary)
    @dictionary = dictionary
    @remaining_guesses = ("a".."z").to_a
    @last_guess = nil
  end
  
  def take_turn(game_state)
    remove_words_from_dictionary_if_failed_last_guess(game_state)
    
    word_state = game_state.split('/')
    
    phrase_guess = []
    word_state.each_with_index do |state_word, index|
      remaining_dictionary = @dictionary.clone
      state_word.chars.each_with_index do |letter, index|
        remaining_dictionary.select! { |word| word[index] == letter } unless letter == '_'
      end
      phrase_guess[index] = remaining_dictionary[0] if remaining_dictionary.count == 1
    end
    
    #if the phrase guess is complete, go with that, otherwise go with the best letter
    if phrase_guess.count == word_state.count
      @last_guess =  phrase_guess * " "
    else
      form_best_remaining_guesses
      @last_guess = @remaining_guesses.pop
    end
      
      return @last_guess
  end
  
  private 
    def form_best_remaining_guesses
      word_count = Hash.new
      @remaining_guesses.each do |letter|
        @dictionary.each do |word|
          letters_in_word = word.chars.to_a.uniq
          if letters_in_word.include?(letter)
            if word_count.has_key?(letter)
              word_count[letter] = word_count[letter] + 1
            else
              word_count[letter] = 1
            end
          end
        end
      end
      
      guess_array = word_count.sort_by { |l,f| -f }
      @remaining_guesses = guess_array.collect { |elem| elem[0] }
    end
    
    def remove_words_from_dictionary_if_failed_last_guess(game_state)
      unless game_state.chars.to_a.include?(@last_guess)
        @dictionary.reject! { |dict_word| dict_word.chars.to_a.include?(@last_guess)}
      end
    end

end