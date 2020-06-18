def hipsterfy(str)
    vowels = "aeiou"
    vowel_idx = nil
    new_str = str.each_char.with_index do |char, idx|
        vowel_idx = idx if vowels.include?(char)
    end

    if vowel_idx != nil
        new_str.slice!(vowel_idx)
    end
    new_str     
end

def vowel_counts(str)
    hash = Hash.new(0)
    vowels = "aeiouAEIOU"
    str.each_char.with_index do |char, idx|
        if vowels.include?(char)
            hash[char.downcase] += 1
        end
    end
    hash
end

def caesar_cipher(message, n)
    alphabet = ('a'..'z').to_a
    message.each_char.with_index do |char, idx|
        if alphabet.include?(char)
            convert = ( (alphabet.index(char) + n) % 26 )
            message[idx] = alphabet[convert]
        end
    end
    message
end
