def save_last_vowels(str)
    new_str = []
    vowels = ["a", "e", "i", "o", "u"]
    idx = []
    arr = str.split(" ")
    arr.each do |word|
        word.each_char.with_index do |char, i|
            if vowels.include?(char)
                idx << i
            end
        end
        remove = idx.shift
        word.each_char.with_index do |char, i|
            if remove.include?(i)
                 word.delete char
            end
        end
        new_str << word
    end
    new_str
end

p save_last_vowels("proper") #=> "prper"
p save_last_vowels("proper tonic panther") #=> "prper tnic pnther"
p save_last_vowels("bootcamp prep") #=> "btcamp prep"
p save_last_vowels("towel flicker banana") #=> "twel flcker bnna"
p save_last_vowels("runner anaconda") #=> "rnner ncnda"
p save_last_vowels("turtle cheeseburger fries") #=> "trtle chsbrger fres"

