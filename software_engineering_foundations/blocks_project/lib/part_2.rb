def all_words_capitalized?(arr)
    arr.all? { |word| word == word.capitalize }
end

def no_valid_url?(arr)
    url = [ ".com", ".net", ".io", ".org" ]
    arr.none? do |address|
        url.any? { |ending| address.end_with?(ending) }
    end
end

def any_passing_students?(students_arr)
    students_arr.any? { |student| average(student[:grades]) >= 75 }
end

def average(arr)
    arr.sum / arr.size.to_f
end
