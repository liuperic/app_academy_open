class Player
    def get_move
        puts "enter a position with coordinates separated with a space like '4 7"
        guess = gets.chomp
        pos = []
        guess.split.each { |ele| pos << ele.to_i }
        pos
    end
end
