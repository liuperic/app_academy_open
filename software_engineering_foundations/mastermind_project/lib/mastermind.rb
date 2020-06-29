require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_guess)
        matches = @secret_code.num_exact_matches(code_guess)
        puts "exact matches: #{matches}"

        near_matches = @secret_code.num_near_matches(code_guess)
        puts "near matches: #{near_matches}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        guess = gets.chomp
        code_guess = (Code.from_string(guess))
        print_matches(code_guess)
        @secret_code == code_guess
    end

end
