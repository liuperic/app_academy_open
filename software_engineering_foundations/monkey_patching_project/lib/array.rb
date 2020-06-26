# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array
    def span
        return nil if self.length == 0
        self.max - self.min
    end

    def average
        return nil if self.length == 0
        (self.sum).to_f / self.length
    end

    def median
        return nil if self.length == 0

        if self.length.odd?
            middle_num = self.length / 2
            self.sort[middle_num]
        else
            middle_num = self.length / 2
            sorted = self.sort
            (sorted[middle_num - 1] + sorted[middle_num]) / 2.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1
        end
        hash
    end
    
    def my_count(val)
        hash = self.counts
        hash[val]
    end

    def my_index(val)
        self.each_with_index do |num, idx|
            return idx if num == val
        end
        nil
    end

    def my_uniq
        hash = Hash.new(nil)
        self.each { |ele| hash[ele] = nil }
        hash.keys
    end

    def my_transpose
        new_arr = []

        (0...self.length).each do |row|
            new_row = []
            (0...self.length).each do |column|
                new_row << self[column][row]
            end
            new_arr << new_row
        end
        new_arr
    end
end
