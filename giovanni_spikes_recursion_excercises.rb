require "byebug"

def range(start_num, end_num)
    return [] if end_num < start_num || start_num == end_num

    arr = [start_num]
    return arr if start_num == end_num - 1

    arr + range(start_num + 1, end_num)
end

def range_iterative(start_num, end_num)
    arr = []

    (start_num...end_num).each do |i|
        arr << i
    end

    arr
end

# p range_iterative(1, 1) # => []
# p range_iterative(1, 2) # => [1]
# p range_iterative(1, 3) # => [1, 2]
# p range_iterative(1, 4) # => [1, 2, 3]


def exponent(base, power)
    return 1 if power == 0
    base * exponent(base, power -1)
end

# p exponent(2, 3) # => 2*2*2*1 = 8
# p exponent(2, 2)
# p exponent(2, 1)
# p exponent(2, 0)

def exponent2(base, power) 
    return 1 if power == 0
    return base if power == 1
    if power.even?
        exponent2(base, power / 2) ** 2 
    else
        base *(exponent2(base, (power - 1)/ 2) **2 )
    end
end

# p exponent2(2, 2)
# p exponent2(2, 3)
# p exponent2(3, 6)

def deep_dup(two_dim_array)
    arr = []
    if two_dim_array.is_a? Array
        two_dim_array.each do |ele|
            if ele.is_a? Array
                new_el = deep_dup(ele)
                arr << new_el
            else
                arr << ele
            end
        end
    else
        arr << two_dim_array
    end
    arr
end

# p deep_dup([[1, 2, 3], [4, 5, 6]])
# p deep_dup([1, [2], [3, [4]]])

def fib(n) 
    return [] if n == 0
    return [1] if n == 1
    return [1, 1] if n == 2

    fib(n-1) << fib(n-1)[-1] + fib(n-1)[-2]
end

# p fib(3)
# p fib(5)
# p fib(10)

def bsearch(array, target)
    middle_ele = array[array.length / 2]
    return array.find_index(target) if target == middle_ele

    if target < middle_ele
        bsearch(array[0...array.find_index(middle_ele)])
    else
        recursion over [mid ele..array.length - 1]

end
#target compared to the middle element in the sorted array
#target.value == middle ele.value  index returned and search ends  [1, 2, 3], 1 = 2
# target.value < middle ele.value then search lower half of array
# target.value > middle ele.value then search lower half of array

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil