require 'yaml'

LANGUAGE = 'en'

MESSAGES = YAML.load_file('reorganizing.yml')

def messages(message,lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i != 0
end

def operation_to_message(op)
  word = case op
    when '1' then 'Adding'
    when '2' then 'Subtracting'
    when '3' then 'Multiplying'
    when '4' then 'Dividing'
    end

  word
end

# prompt("Welcome to Calculator!")
prompt(messages('welcome', 'es'))

name = ''
loop do
# prompt("What's your name?")
  prompt(messages('name', 'es'))
  name = Kernel.gets().chomp()
  if name.empty?()
# prompt("Please enter a valid name..can be anything you like:")
  prompt(messages('valid_name', 'es'))
  else
    break
  end
end

prompt("Hello #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt("Hmmm... that doesn't look like a valid number.")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt("Hmmm... that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
  1. Add
  2. Subtract
  3. Multiply
  4. Divide
  MSG

  prompt(operator_prompt)

  # prompt("What operation? 1 Add, 2 Subtract, 3 Multiople, 4 Divide")

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers ...")

  result =  case operator
            when '1' then number1.to_i() + number2.to_i()
            when '2' then number1.to_i() - number2.to_i()
            when '3' then number1.to_i() * number2.to_i()
            when '4' then number1.to_f() / number2.to_f()
            end

  prompt("The result is #{result}.")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing with calculator! Good bye!")
