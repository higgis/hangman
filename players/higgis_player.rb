class  HiggisPlayer
  def name
    "higgis"
  end

  def new_game(dictionary)
    # A new game has started, do any clean up from a previous game and initialise for this one. 
    # The dictionary passed is the full set of words that the phrase is selected from and is passed in as a string array: ["apple", "bear", "cat"]
  end

  def take_turn(pattern)
    # It's your turn. Return a guess (string) which can either be a letter, word or whole phrase.
    # The current state of your pattern is passed in the format "s_rr__/r____s_s" 
    # The pattern is made up from: underscore = missing letter, forward slash = space, letter = correctly placed
  end

  # If your player needs supporting classes, you can nest them inside your player class.
  # This is to keep things simple for the player loader and also to avoid clashes between players.
  class MySupportingClass
    # ...
  end
end