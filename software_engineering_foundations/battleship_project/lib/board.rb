class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(num)
        @grid = Array.new(num) {Array.new(num, :N)}
        @size = num * num
    end

    def [](position)
        row, column = position
        @grid[row][column]
    end

    def []=(position, value)
        row, column = position
        @grid[row][column] = value
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H 
            puts "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        amount_ships = @size * 0.25

        while self.num_ships < amount_ships
            rand_row = rand(0...@grid.length)
            rand_column = rand(0...@grid.length)
            pos = [rand_row, rand_column]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |sub_ele|
                if sub_ele == :S
                    :N 
                else
                    sub_ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
