# mortgage_calculator.rb
# Lynette Podkranic

require 'yaml'

LANGUAGE = 'en'

MESSAGES = YAML.load_file('mortgage_msgs.yml')

def messages(message,lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num || num.to_f.floor == num.to_i
end

def positive_num?(num)
  num.to_i > 0 || num.to_f > 0
end

def prompt(message)
  puts ">> #{message}"
end

def clear_screen
  system("clear") || system("cls")
end

clear_screen

loop do
  prompt("HELLO ~ This is Mortgage Calculator!")
  loan_amt = ''
  loop do
    prompt("Please enter a dollar amount you wish to borrow:")
    loan_amt = gets.chomp
    if integer?(loan_amt) && float?(loan_amt) && positive_num?(loan_amt)
      break
    elsif loan_amt == "0"
      prompt("Congratulations - you don't need a loan!")
      break
    elsif loan_amt.empty?
      prompt("Oh no, you didn't enter anything, please try again")
    else
      prompt("Oh no, that's not valid.")
    end
  end

  apr = ''
  loop do
    break if loan_amt == "0"
    prompt("What is the annual percentage rate (APR)? (e.g. 4.5% enter 4.5)")
    apr = gets.chomp
    if apr.empty?
      prompt("Oh no, you didn't enter anything, please try again")
    elsif positive_num?(apr) && (integer?(apr) || float?(apr))
      break
    elsif apr == "0"
      break
    else
      prompt("Please enter a value APR, for example 2.5 for 2.5%")
    end
  end

  loan_time_yrs = ''
  loop do
    break if loan_amt == "0"
    prompt("How many YEARS do you want to pay off the loan?")
    loan_time_yrs = gets.chomp
    if loan_time_yrs.empty?
      prompt("Oh no, you didn't enter anything, please try again")
    elsif loan_time_yrs.to_f != loan_time_yrs.to_i
      prompt("Hmmm...please enter number of year(s) only, such as 1, 2, 10")
    elsif integer?(loan_time_yrs) && positive_num?(loan_time_yrs)
      break
    elsif loan_time_yrs == "0"
      prompt("Hmm...if that's true, you owe ALL money back ASAP!")
    else
      prompt("Hmmm...please enter number of year(s) only, such as 1, 2, 10")
    end
  end

  p = loan_amt.to_i
  n = loan_time_yrs.to_i * 12
  j = (apr.to_f / 100) / 12

  # monthly payments formula
  m = (p * (j / (1 - (1 + j)**(-n)))).to_f.round(2)

  loop do
    if loan_amt == "0"
      break
    elsif apr == "0"
      prompt("Your approx. monthly mortgage payment would be: $#{p / n}")
      break
    else
      prompt("Your approx. monthly mortage payment would be: $#{m}")
    end
    break
  end

  prompt("********************************************************************")
  prompt("Would you like another calculation? Enter Y to continue")
  go_again = gets.chomp
  clear_screen
  break unless go_again.downcase.start_with?('y')
end

prompt("Thanks for using Mortgage Calculator! Good Bye :)")
