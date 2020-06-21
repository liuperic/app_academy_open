# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "ByeBug"

def largest_prime_factor(num)
    factor = factors(num)   # array of factors
    return false if num < 2

    i = factor.length - 1
    while i >= 0
        return factor[i] if is_prime?(factor[i])
        i -= 1
    end
end

def factors(num)
    fact = []
    (2..num).each do |divisor|
        fact << divisor if num % divisor == 0
    end
    fact
end

def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end

    true
end

def unique_chars?(string)
    hash = Hash.new(0)

    string.each_char do |char|
        hash[char] += 1
    end

    if hash.values.max > 1
        return false
    else 
        return true
    end
end

def dupe_indices(array)
    hash = Hash.new { |hash, key| hash[key] = []}

    array.each_with_index { |char, idx| hash[char] << idx }
    
    hash.select { |key, arr| arr.length > 1 }
end

def ana_array(arr1, arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    arr1.each do |ele|
        hash1[ele] += 1
    end

    arr2.each do |ele|
        hash2[ele] += 1
    end
    
    return hash1==hash2
end
