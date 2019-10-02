# mortgage_calculator.rb
# Mortgage Calculator - calculates monthly loan payment
# student: Lynette Podkranic

require 'yaml'

LANGUAGE = 'en'

MESSAGES_FILE = YAML.load_file('mortgage_msgs.yml')

def clear_screen
  system("clear") || system("cls")
end

def messages(message, lang="en")
  MESSAGES_FILE[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts ">>#{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num || num.to_f.floor == num.to_i
end

def positive?(num)
  num.to_i > 0 || num.to_f > 0.0
end

def zero?(num)
  num == "0" || num == "0.0" # || num.to_f.round == 0
end

def number?(num)
  (integer?(num) || float?(num)) && positive?(num)
end

def retrieve_loan_amt
  loan_amt = ''
  loop do
    prompt("retrieve_amt")
    loan_amt = gets.chomp
    break if number?(loan_amt)
    if zero?(loan_amt) || loan_amt.empty?
      prompt("error1")
    else prompt("error_general")
    end
  end
  loan_amt
end

def retrieve_apr
  annual_rate = ''
  loop do
    prompt("retrieve_apr")
    annual_rate = gets.chomp
    break if number?(annual_rate)
    break if zero?(annual_rate)
    if annual_rate.empty?
      prompt("error2")
    else
      prompt("error_general")
    end
  end
  annual_rate
end

def retrieve_loan_yrs
  loan_yrs = ''
  loop do
    prompt("retrieve_yrs")
    loan_yrs = gets.chomp
    if loan_yrs.empty?
      prompt("error2")
    elsif loan_yrs.to_f != loan_yrs.to_i
      prompt("error_whole")
    elsif integer?(loan_yrs) && positive?(loan_yrs)
      break
    elsif zero?(loan_yrs) then prompt("error_payback")
    else prompt("error_general")
    end
  end
  loan_yrs
end

def monthly_pymt(loan_amt, annual_rate, loan_yrs)
  rate = ((annual_rate.to_f / 100) / 12)
  payments = (loan_yrs.to_i * 12)
  (loan_amt.to_i * (rate / (1 - (1 + rate)**(-payments))))
end

clear_screen

loop do
  prompt("welcome")
  loan_amt = retrieve_loan_amt
  annual_rate = retrieve_apr
  loan_yrs = retrieve_loan_yrs
  payments = loan_yrs.to_i * 12

  if zero?(annual_rate)
    zero_apr_result = loan_amt.to_i / payments
    puts "Approx. monthly payment would be: $#{zero_apr_result.round(2)}"
  else
    result = monthly_pymt(loan_amt, annual_rate, loan_yrs)
    puts "Your approx. monthly payment would be: $#{result.round(2)}"
  end

  display_results = <<-MSG
  From Your Answers:
    -> Loan Amount................$#{loan_amt}
    -> Annual Percentage Rate.....#{annual_rate}%
    -> Loan Number of Years.......#{loan_yrs}
  MSG

  puts display_results

  puts "********************************************************************"
  prompt("go_again")
  go_again = gets.chomp
  clear_screen
  break unless go_again.downcase.start_with?('y')
end

prompt("goodbye")
