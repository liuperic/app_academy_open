def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    arr = sentence.split
    arr.map! { |word| prc.call(word) }
    arr.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) >= prc2.call(num)
        return prc1.call(num)
    else
        return prc2.call(num)
    end
end 

def and_selector(arr, prc1, prc2)
    arr.select! { |num| prc1.call(num) && prc2.call(num) }
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = arr.each_with_index.map do |num, idx|
        if idx % 2 == 0
            prc1.call(num)
        else
            prc2.call(num)
        end
    end
    new_arr
end