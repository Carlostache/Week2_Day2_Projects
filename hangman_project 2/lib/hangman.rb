class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize 
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    return @guess_word
  end

  def attempted_chars
    return @attempted_chars
  end

  def remaining_incorrect_guesses
    return @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else 
      return false
    end
  end

  def get_matching_indices(arg)
    matching_indices = []
    @secret_word.each_char.with_index do |sec_char, i|
      if @secret_word[i] == arg
        matching_indices << i
      end
    end
    matching_indices
  end

  def fill_indices(arg, arr_idx)
    arr_idx.each do |el|
      @guess_word[el] = arg
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << char

    match = get_matching_indices(char)
    self.fill_indices(char, match)

    if match == []
      @remaining_incorrect_guesses -= 1
    end

    true
  end

  def ask_user_for_guess
    p "Enter a char:"
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if @guess_word.join == @secret_word
      print "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    else
      return false
     end
  end

  def game_over?
      if self.win? == true && self.lose? == false
        print @secret_word
        self.win?
        return true
      elsif self.win? == false && self.lose? == true
        print @secret_word
        self.lose?
        return true
      else false
      end
  end

end
