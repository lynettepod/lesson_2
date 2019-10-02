# Given a collection of integers
# Determine which number is greatest in a collection
# Input: Array of numbers
# Output: An single number, integer
# Pseudo:
# Iterate through the collection one-by-one
# - Save the first value as the starting value
# - For each iteration, compare the saved value with the current value
# - If the saved value is greater, or it's the same
#     - Move to the next value in the collection
# - Otherwise
#     - Reassign the saved value as the current value

def greatest_number(num_array)
  saved_number = num_array[0]

  num_array.each do |num|

    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end


# def greatest_number(num_array)
#   num_array.sort.pop
# end

p greatest_number([1,8,2,5])
p greatest_number([20, 6, -3, 100, 2])

