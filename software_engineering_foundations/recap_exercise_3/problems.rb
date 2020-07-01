def no_dupes?(arr)
    counter = Hash.new(0)

    arr.each do |ele|
        counter[ele] += 1
    end

    no_repeat_idx = counter.select { |key, val| val == 1 }
    no_repeat_idx.keys
end

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i+1]
    end

    true
end

def char_indices(str)
    hash_indices = Hash.new { |h, k| h[k] = [] }

    str.each_char.with_index do |char, idx|
        hash_indices[char] << idx
    end
    hash_indices
end

def longest_streak(str)
    longest_str = ""

    str.each_char.with_index do |char, idx|
        current_str = str[idx]
        i = idx
        while str[i] == str[i+1]
            current_str += str[i+1]

            i += 1
        end
        longest_str = current_str if current_str.length >= longest_str.length
    end
    longest_str
end


def bi_prime?(num)
    prime_facts = prime_factors(num)
    (0...prime_facts.length).each do |factor|
        (factor...prime_facts.length).each do |factor2|
            return true if prime_facts[factor] * prime_facts[factor2] == num
        end
    end
    false
end

def is_prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0 } 
end

def prime_factors(num)
    (2...num).select { |i| num % i == 0 && is_prime?(i) }
end

def vigenere_cipher(message, key)
    alphabet = ("a".."z").to_a

    current_key = 0
    i = 0
    while i < message.length
        current_key = i % key.length
        current_position = alphabet.index(message[i])
        new_position = (current_position + key[current_key]) % 26
        message[i] = alphabet[new_position]
        i += 1
    end
    message
end

def vowel_rotate(str)
    vowels = "aeiou"
    new_str = ""

    str.split("").each_with_index do |char, idx|
        if vowels.include?(char)
            i = 1
            while i < str.length
                if vowels.include?(str[idx - i])
                    new_str += str[idx - i]
                    break
                end
                i += 1
            end
        else
            new_str += char
        end
    end
    new_str
end

class String
    def select(&prc)
        return "" if prc.nil?

        str = ""
        self.each_char do |char|
            str += char if prc.call(char)
        end

        str
    end

    def map!(&prc)
        self.each_char.with_index do |char, idx|
            self[idx] = prc.call(char, idx) 
        end
        self
    end

end

def multiply(a, b)
    return 0 if b == 0

    if b < 0
        -(a + multiply(a, (-b) - 1))
    else
        a + multiply(a, b - 1)
    end
end


def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2, 1] if length == 2

    sequence = lucas_sequence(length - 1)
    sequence << sequence[-1] + sequence[-2]
    sequence
end


def prime_factorization(num)
    (2...num).each do |fact|
        if (num % fact == 0)
            otherFact = num / fact
            return [ *prime_factorization(fact), *prime_factorization(otherFact) ]
        end
    end

    [num]
end
