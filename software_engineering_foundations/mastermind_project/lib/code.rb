class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(guesses)
    guesses.all? { |guess| POSSIBLE_PEGS.keys.include?(guess.upcase) }
  end    

  def self.random(num)
    random_pegs = []
    num.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end
    
  def self.from_string(string)
    Code.new(string.split(""))
  end

  def initialize(guesses)
    if Code.valid_pegs?(guesses)
      @pegs = guesses.map(&:upcase)
    else
      raise "Guesses contain invalid pegs"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_guess)
    count = 0

    code_guess.pegs.each_with_index do |char, idx|
      count += 1 if self[idx] == char
    end

    count
  end

  def num_near_matches(code_guess)
    count = 0

    code_guess.pegs.each_with_index do |char, idx|
      count += 1 if self[idx] != char && self.pegs.include?(char)
    end

    count
  end
  
  def ==(code_guess)
    self.pegs == code_guess.pegs
  end
  
end
