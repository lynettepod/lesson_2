# Build a command line calculator that does the following:
# Input: 1. Asks for two numbers
# 2. Asks for the type of operation to perform: add, subtract, multiply, divide
# Output: Displays the result

# Use the Kernel.gets() method to retrieve user input, and use Kernel.puts()
# method to display output. Remember that Kernel.gets() includes the newline,
# so you have to call chomp() to remove it: Kernel.gets().chomp().

# From the Video:
# ask the user for two numbers
# ask the user for an operation to perform
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("Welcome to Calculator!")

prompt("What's the first number?")
number1 = Kernel.gets().chomp()

prompt("What's the second number?")
number2 = Kernel.gets().chomp()

prompt("What operation would you like to perform? 1 Add, 2 Subtract, 3 Multiply, 4 Divide")
operator = Kernel.gets().chomp()

# if operator == '1'
#   result = number1.to_i() + number2.to_i()
# elsif operator == '2'
#   result = number1.to_i() - number2.to_i()
# elsif operator == '3'
#   result = number1.to_i() * number2.to_i()
# else operator = '4'
#   result = number1.to_f() / number2.to_f()
# end

result = case operator
        when '1'
          number1.to_i() + number2.to_i()
        when '2'
          number1.to_i() - number2.to_i()
        when '3'
          number1.to_i() * number2.to_i()
        when '4'
          number1.to_f() / number2.to_f()
end


prompt("The result is #{result}.")















