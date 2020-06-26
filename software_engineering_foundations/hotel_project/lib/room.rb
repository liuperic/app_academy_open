class Room
    def initialize(number)
        @capacity = number
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        if @occupants.length < @capacity
            false
        else
            true
        end
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        if full?
            return false
        else
            @occupants << name
            return true
        end
    end
end
