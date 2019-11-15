def anti_prime?(num)
    # Take num get its divisors (maybe a helper method for divisors)
    # Get all divisors of all numbers lower than num.
    # Compare the amount of divisors, checking to see if num's divisors are greater than and lower number's divisors

    hash = Hash.new(0) #{ |hash, k| hash[k] = []}
    i = num
    count = 0
    while i > 0
        hash[i] = get_divisors_length(i) 
        i -= 1
    end
    
    hash.each do |k, v|
        if hash[num] > v
            count += 1
        end
    end
    # p count
    if count == (num - 1)
        return true
    else
        return false
    end
    
end
def get_divisors_length(num)
    arr = []
    (1..num).each do |i|
        if num % i == 0
            arr << i
        end
    end
    length = arr.length
    length
end

p anti_prime?(6) # => true
p anti_prime?(12) # => true
p anti_prime?(24) # => true
p anti_prime?(48) # => true


p anti_prime?(7) # => false
p anti_prime?(16) # => false
p anti_prime?(45) # => false
p anti_prime?(72) # => false