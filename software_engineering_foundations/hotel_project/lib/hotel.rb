require_relative "room"

class Hotel
    def initialize(name, room_hash)
        @name = name
        @rooms = {}
        
        room_hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.keys.include?(room_name)
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.any? { |key, value| !@rooms[key].full? }
    end

    def list_rooms
        @rooms.keys.each do |room|
            puts "#{room} : #{@rooms[room].available_space}"
        end
    end
end
