# bonus_final.rb
# Rock-Paper-Scissors-Lizard-Spock Game

VALID_CHOICES = %w(r p sc l sp)
GRAND_WINNER_SCORE = 5

scores = {
  "player_score" => 0,
  "computer_score" => 0,
  "tie_score" => 0
}

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

def display_game_intro
  prompt("This is Rock-Paper-Scissors-Lizard_Spock!")
  prompt("First to score #{GRAND_WINNER_SCORE} will be match GRAND WINNER!")
  puts "*************************************************"
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

def update_scores(choice, computer_choice, scores)
  if win?(choice, computer_choice)
    scores["player_score"] += 1
  elsif win?(computer_choice, choice)
    scores["computer_score"] += 1
  else scores["tie_score"] += 1
  end
end

def display_scoreboard(scores)
  puts " "
  puts("SCOREBOARD:")
  puts "=> Your Score: #{scores['player_score']}"
  puts "=> Computer's Score: #{scores['computer_score']}"
  puts "=> Ties: #{scores['tie_score']}"
  puts " "
end

def play_again?
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
end

def determine_grand_winner(scores)
  if scores["player_score"] > scores["computer_score"]
    "GRAND WINNER decided -- Congratulations, It's YOU!"
  else
    "GRAND WINNER decided -- Shucks...it's the computer!"
  end
end

def display_grand_winner(scores)
  puts determine_grand_winner(scores)
end

round_number = 0
clear_screen

loop do
  display_game_intro
  puts "Round: #{round_number += 1}"

  choice = retrieve_choice
  computer_choice = VALID_CHOICES.sample

  display_players_choices(choice, computer_choice)

  display_results(choice, computer_choice)

  update_scores(choice, computer_choice, scores)

  display_scoreboard(scores)

  break if  (scores["player_score"] == GRAND_WINNER_SCORE) ||
            (scores["computer_score"] == GRAND_WINNER_SCORE)

  play_again?
  clear_screen
end

display_grand_winner(scores)
