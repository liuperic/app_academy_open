def partition(array, num)
    arr = Array.new(2) { Array.new() }
    array.each do |ele|
        if ele < num
            arr[0] << ele
        else
            arr[1] << ele
        end
    end
    arr
end

def merge(hash_1, hash_2)
    merge_hash = {}
    hash_1.each { |k,v| merge_hash[k] = v }
    hash_2.each { |k,v| merge_hash[k] = v }
    merge_hash
end

def censor(sentence, curse_arr)
   vowels = "aeiou"
   sent_arr = sentence.split
   downcased = sent_arr.map(&:downcase)

    curse_arr.map! do |c_word| 
        c_word.each_char.with_index do |char, idx|
            if downcased.include?(c_word)
                curseidx = downcased.index(c_word)
                if vowels.include?(char)
                    sent_arr[curseidx][idx] = "*"
                    # sent_arr[curseidx] = c_word
                end
            end
        end
    end
    sent_arr.join(" ")
end   

def power_of_two?(num)
    two_expo = 0
    i = 0
    while two_expo <= num
        if 2**i == num
            return true
        end
        two_expo = 2**i
        i += 1
    end
    false
end
    