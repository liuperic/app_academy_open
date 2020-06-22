def select_even_nums(num_arr)
    num_arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(twodarr)
    twodarr.count { |arr| arr.sum > 0 }
end

def aba_translate(str)
    vowels = "aeiou"
    arr = str.split("")
    arr.map! do |char| 
        if vowels.include?(char)
            char + "b" + char 
        else
            char
        end
    end
    arr.join("")
end

def aba_array(array)
    array.map { |word| aba_translate(word)}
end


