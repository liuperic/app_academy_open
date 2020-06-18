def palindrome?(string)
    backwards = ""
    i = string.length - 1

    while i >= 0
        backwards += string[i]
        i -= 1
    end

    backwards == string
end

def substrings(string)
    subarr = []
    string.each_char.with_index do |char, idx|
        substring = char
        subarr << substring
        subidx = idx + 1
        while subidx < string.length
            substring += string[subidx]
            subarr << substring
            subidx += 1
        end
    end
    subarr
end

def palindrome_substrings(string)
    sub_str = substrings(string)
    sub_str.select! { |substring| palindrome?(substring) && substring.length > 1 }
end
