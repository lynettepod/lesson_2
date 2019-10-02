# Given a collection of integers
# Determine which number is greatest in a collection
# Input: Array of numbers
# Output: An single number, integer
# Pseudo:
# 1. Sort array, lowest to highest
# 2. Select last number in the array
# 3. Print the largest number



def greatest_number(num_array)
   num_array.sort.pop
end

p greatest_number([1,8,2,5])
p greatest_number([20, 6, -3, 100, 2])

