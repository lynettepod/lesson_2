# bonus_final.rb
# Rock-Paper-Scissors-Lizard-Spock Game

VALID_CHOICES = %w(r p sc l sp)
GRAND_WINNER_SCORE = 5

def display_legend
  legend = <<-MSG
  Rock......r     Lizard.....l
  Paper.....p     Spock......sp
  Scissors..sc
  MSG
  puts legend
end

def clear_screen
  system("clear") || system("cls")
end

def prompt(message)
  puts("=> #{message}")
end

def retrieve_choice
  choice = ''
  loop do
    prompt("To play choose from the legend: #{VALID_CHOICES.join(', ')}")
    display_legend
    choice = gets.chomp.downcase
    if VALID_CHOICES.include?(choice)
      break
    else prompt("That's not a valid choice - try again")
    end
  end
  choice
end

def win?(first, second)
  winners = {
    "sc" => ["p", "l"],
    "r" => ["sc", "l"],
    "p" => ["sp", "r"],
    "l" => ["sp", "p"],
    "sp" => ["r", "sc"]
  }
  winners[first].include?(second)
end

def display_players_choices(choice, computer_choice)
  chart = {
    "r" => "rock",
    "p" => "paper",
    "sc" => "scissors",
    "l" => "lizard",
    "sp" => "Spock"
  }
  prompt("You chose: #{chart[choice]}")
  prompt("Computer chose: #{chart[computer_choice]}")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else prompt("It's a tie!")
  end
end

def display_game_intro
  prompt("This is Rock-Paper-Scissors-Lizard_Spock")
  prompt("First to score #{GRAND_WINNER_SCORE} will be match GRAND WINNER!")
  prompt("Game will track each round and keep score - good luck!")
  puts "*************************************************"
end

def display_scoreboard(player_score, computer_score, tie_score)
  puts " "
  puts("SCOREBOARD:")
  puts "=> Your Score: #{player_score}"
  puts "=> Computer's Score: #{computer_score}"
  puts "=> Ties: #{tie_score}"
  puts " "
end

answer = ''
def play_again?(answer)
  loop do
    prompt("Do you want to keep playing for GRAND WINNER? Enter Y or N")
    answer = gets.chomp.downcase
    if answer == "n" || answer == "no"
      clear_screen
      prompt("Thanks for playing - goodbye!")
      exit
    elsif answer == "y" || answer == "yes"
      break
    else prompt("That's not valid, please try again")
    end
  end
  answer
end

def determine_grand_winner(player_score, computer_score)
  if player_score > computer_score
    "GRAND WINNER decided -- Congratuations, It's YOU!"
  else
    "GRAND WINNER decided -- Shucks...it's the computer!"
  end
end

def display_grand_winner(player_score, computer_score)
  puts determine_grand_winner(player_score, computer_score)
end

clear_screen
round_number = 0
player_score = 0
computer_score = 0
tie_score = 0

loop do
  display_game_intro
  puts "Round: #{round_number += 1}"

  choice = retrieve_choice
  computer_choice = VALID_CHOICES.sample

  display_players_choices(choice, computer_choice)

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  else tie_score += 1
  end

  display_scoreboard(player_score, computer_score, tie_score)

  break if  (player_score == GRAND_WINNER_SCORE) ||
            (computer_score == GRAND_WINNER_SCORE)

  play_again?(answer)
  clear_screen
end

display_grand_winner(player_score, computer_score)
