def average(num1,num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    sum = 0.0
    arr.each do |num|
        sum += num
    end

    sum / arr.length
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    arr = str.split.map.with_index do |ele, idx| 
        if idx %2 == 0
            ele.upcase
        else
            ele.downcase
        end
    end
    arr.join(" ")
end