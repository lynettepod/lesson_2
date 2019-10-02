def prompt(message)
  puts ">> #{message}"
end

def integer?(num_string)
  num_string.to_i.to_s == num_string
end

def float?(num_string)
  num_string.to_f.to_s == num_string || num_string.to_f.floor == num_string.to_i
end

loop do
  prompt("Enter first number:")
  number1 = gets.chomp
  if number1.empty?
    prompt("Oh no, you didn't enter anything, please try again")
  elsif integer?(number1) && float?(number1)
    break
  elsif prompt("Hmmm...that's not a valid number, please try again:")
  end
end

prompt("Got er done")
