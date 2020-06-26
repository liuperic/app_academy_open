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
   @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    index_match = []
    @secret_word.each_char.with_index do |ele, idx|
      index_match << idx if ele == char
    end
    index_match
  end

  def fill_indices(char, array)
    array.each do |idx|
      @guess_word[idx] = char
    end
  end 

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << char
    self.fill_indices(char, self.get_matching_indices(char))

    @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)

    true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    guess = gets.chomp
    self.try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if self.win?
      puts @secret_word
      return true
    elsif self.lose?
      puts @secret_word
      return true
    else
      false
    end
  end

end
