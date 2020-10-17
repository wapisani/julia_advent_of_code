
using StatsBase

"""
Returns all vowels as an array of a word input as a string
"""
function vowel_checker(word::String)
    vowels = []
    for character in word
        if character in "aeiou"
            push!(vowels,character)
        end
    end
    return vowels
end

"""
Returns an array of double letters, empty if no double letters
"""
function double_letter_checker(word::String)
    double_letter_list = []
    previous_character = word[1]
    for character in word[2:end]
        if character == previous_character
            push!(double_letter_list,string(previous_character,character))
        else
            previous_character = character
        end
    end
    return double_letter_list
end

"""
Returns true if the word contains a naughty substring, false if not
"""
function naughty_string_checker(word::String)
    naughty_strings = ["ab","cd","pq","xy"]
    for naughty_string in naughty_strings
        if occursin(naughty_string,word) == true
            return true
        end
    end
    return false
end

# Open Input
cd(raw"/Users/wapisani/Documents/Programming/Julia/Advent_of_Code/")
open("AoC_2015_5.input") do f
    global words_list = split(read(f,String),'\n')
end

nice_list = []
naughty_list = []
# words_list = ["dvszwmarrgswjxmb"]

for word in words_list
    # Convert substring into string
    word = String(word)
    condition_counter = 0
    vowels = vowel_checker(word)
    if length(vowels) >= 3
        condition_counter += 1
    end

    double_letters = double_letter_checker(word)
    if length(double_letters) >= 1
        condition_counter += 1
    end

    if naughty_string_checker(word) == true
        push!(naughty_list,word)
        continue
    else
        condition_counter += 1
    end

    if condition_counter == 3
        push!(nice_list,word)
    else
        push!(naughty_list,word)
    end

end

num_nice_words = length(nice_list)
println("According to Santa's first set of rules, there are $num_nice_words nice words in Santa's list")

"""
Returns true if the word input as a String contains at least one letter which repeats with exactly one letter between them, false if not
"""
function every_other_letter(word::String)
    for i=2:length(word)-1
        if word[i-1] == word[i+1]
            return true
        end
    end
    return false
end

nice_list_2 = []
# words_list = ["aaa"]
for word in words_list
    word = String(word)
    condition_counter = 0

    double_regex = r"([a-z][a-z]).*\1"
    if occursin(double_regex,word) == true
        condition_counter += 1
    end

    every_other_letter_condition = every_other_letter(word)
    if every_other_letter_condition == true
        condition_counter += 1
    end

    if condition_counter == 2
        push!(nice_list_2,word)
    end
end

num_nice_words_2 = length(nice_list_2)
println("According to Santa's second set of rules, there are $num_nice_words_2 nice words in Santa's list")